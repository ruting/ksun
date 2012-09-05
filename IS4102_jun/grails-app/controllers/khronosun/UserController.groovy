package khronosun

import khronosun.ItemComment
import com.megatome.grails.RecaptchaService
import org.springframework.dao.DataIntegrityViolationException
import org.apache.commons.lang.RandomStringUtils
import org.springframework.http.HttpStatus
import grails.converters.JSON
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.MultipartFile
import java.awt.image.BufferedImage
import javax.imageio.ImageIO
class UserController {

    //declare variable to use therecaptcha plugin
    RecaptchaService recaptchaService
    //declare variable to use the spring security plugin
    def springSecurityService
    //declare variable to use the random plugin
    def randomService
    //declare variable to use the session
    def sessionFactory


    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {

        render(view:'../index')

    }

    def diy() {

    }

    def login = {

        if (request.method == 'POST') {
            // def passwordHashed = params.password
            def u = User.findByEmailAndPassword(params.email, springSecurityService.encodePassword(params.password, params.email))

            if (u) {
                // username and password match -> log in
                session.user = u

                if(u.usertype.equals("user")){
                    //if the usertype is user.... redirect to user profile page
                    redirect(action: "showProfile", id: u.id)
                    return
                }
                else if (u.usertype.equals("admin")){
                    //if the usertype is admin... redirect to admin index page
                    redirect(action:'showAdminProfile')
                    return
                }

            } else {
                //if the username and password does not match -> redirect to index page to login again
                render(view: "login")
                flash.message = "Invalid username or password."
            }
        }

    } // end login method

    def logout = {

        session.user = null
        redirect(uri:'/')

    } //end logout method

    def forgetPassword(){

    } // end forgetPassword method

    def forgetPasswordProcess(){

        def userInstance = User.findWhere(email:params['email'])
        if(userInstance){
            String userEmail = userInstance.email;
            String securityQns = userInstance.securityQns;
            redirect(action:'securityQns',params:[email: userEmail,question:securityQns])
        }else{
            flash.message= "Email does not exist or you have enter an invalid Security Question and Answer!"
            redirect(view: "forgetPassword")
        }

    } // end forgetPasswordProcess method

    def securityQns(){

    } // end securityQns

    def resetPassword(){

        def userInstance = User.findWhere(email:params['email'],securityQns:params['qns'],securityAns:params['ans'])
        if(userInstance){
            String charset = (('A'..'Z') + ('0'..'9')).join()
            Integer length = 15
            String randomString = RandomStringUtils.random(length, charset.toCharArray())
            userInstance.password = randomString
            sendMail {
                to "${userInstance.email}"
                from "khonosun"
                subject "Hello ${userInstance.firstName} ${userInstance.lastName} "
                body userInstance.password
            }
            userInstance.password =  springSecurityService.encodePassword(userInstance.password, userInstance.email)
            userInstance.save()
            flash.message= "Password have been reset and send to your Email."
            redirect(view: "index")
        }else{
            flash.message= "Email does not exist or you have enter an invalid Security Question and Answer!"
            redirect(view: "securityQns", params:[email:"${userInstance.email}",question:"${userInstance.question}"])
        }

    } // end resetPassword method

    def verify(){

    } // end verify method

    def verifyProcess(){

        String emailpass = params['email']
        String code = params['code']
        println "the email key is " + emailpass
        println "the code key is " + code
        def userInstance = User.findWhere(email:emailpass,verifyCode:code)
        if(userInstance){
            userInstance.accountStatus = "active"
            userInstance.save()
            flash.message= "Your account is Activated"
            redirect(view: "login")
        }else{
            flash.message= "Verification Code and Email mismatch. Please ensure you have input the correct Verification code."
            redirect(action: "verify")
        }

    } // end verifyProcess method

    
    /*-------------------- Search -------------------------*/

    def searchAJAX = {

        def users = User.findAllByEmailLike("%${params.query}%")

        //Create XML response
        render(contentType: "text/xml") {
	    results() {
	        users.each { user ->
		    result(){
		        name(user.email)
                        //Optional id which will be available in onItemSelect
                        id(user.id)
		    }
		}
            }
        }
    }

    /*-------------------- Admin -------------------------*/

    def list() {

        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def show() {

        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }
        [userInstance: userInstance]

    }

    def update() {

        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)

    }

    def edit() {

        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }
        [userInstance: userInstance]

    }

    def delete() {

        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "show", id: params.id)
        }

    } // end delete method

    def create() {

        [userInstance: new User(params)]

    }

    def save() {

        // save method is used by admin to create account for user/admin
        def userInstance = new User(params)
        //generate a random verifycode using uncommon maths
        userInstance.verifyCode = randomService.nextLong();
        println "the password strength " + params.strength
        println "the verify key is " + userInstance.verifyCode
        //Encrypting Passwords using the spring security
        userInstance.password =  springSecurityService.encodePassword(params.password, userInstance.email)
        params.confirmPassword =  springSecurityService.encodePassword(params.confirmPassword, userInstance.email)

        // check if the recaptcha input by user is correct
        def recaptchaOK = true

        if (!recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params)) {
            recaptchaOK = false
        }

        if(!userInstance.hasErrors() && recaptchaOK && userInstance.password.equals(params.confirmPassword) && userInstance.save()) {
            recaptchaService.cleanUp(session)
            flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
            redirect(action: "show", id: userInstance.id)
            return
        }
        else if (!recaptchaOK) {
            flash.message = message(code: 'khronosun.recaptcha.invalid')
            render(view:'create',model:[userInstance:userInstance])
            return
        }
        else if (!userInstance.password.equals(params.confirmPassword)){
            flash.message = message(code: 'khronosun.confirmPassword.does.not.match')
            render(view:'create',model:[userInstance:userInstance])
            return
        }
        else{
            render(view:'create',model:[userInstance:userInstance])
        }

        //send email to the user after registeration
        /*
        sendMail {
        to "neojunjie87@gmail.com"
        from "john@g2one.com"
        subject "Hello John"
        body 'this is some text'
        }
         */

    } //end save method
    /*-------------------- User -------------------------*/

    def checkEmail = {

        /* declare flag as variable to check for email's availability
        if flag is 1, the email is already used by others
        if flag is 2, the email is free to use
        if flag is 3, the user has not enter input yet
        this method is used when user is registering for account
         */

        def flag
        if (params.emailcheck != null){
            if(User.findByEmail(params.emailcheck)){
                flag = 1
            }
            else{
                flag = 2
            }
        }
        else{
            flag = 3
        }
        render(template:"checkEmail", model:[flag:flag])

    } // end checkEmail method

    def register () {

        [userInstance: new User(params)]

    } // end register method

    def saveUser() {

        def userInstance = new User(params)
        //generate a random verifycode using uncommon maths
        userInstance.verifyCode = randomService.nextLong();
        println "the password strength " + params.strength
        println "the verify key is " + userInstance.verifyCode
        //Encrypting Passwords using the spring security
        userInstance.password =  springSecurityService.encodePassword(params.password, userInstance.email)
        params.confirmPassword =  springSecurityService.encodePassword(params.confirmPassword, userInstance.email)

        // check if the recaptcha input by user is correct
        def recaptchaOK = true

        if (!recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params)) {
            recaptchaOK = false
        }

        if(!userInstance.hasErrors() && recaptchaOK && userInstance.password.equals(params.confirmPassword) && userInstance.save()) {
            recaptchaService.cleanUp(session)

            //send email to the user after registeration
            sendMail {
                to "${userInstance.email}"
                from "khronosun@gmail.com"
                subject "Hello ${userInstance.firstName} ${userInstance.lastName} "
                html "http://localhost:8080/IS4102/user/verifyProcess?email=${userInstance.email}&code=${userInstance.verifyCode}"

            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
            redirect(action: "showProfile", id: userInstance.id)
            return
        }
        else if (!recaptchaOK) {
            flash.message = message(code: 'khronosun.recaptcha.invalid')
            render(view:'register',model:[userInstance:userInstance])
            return
        }
        else if (!userInstance.password.equals(params.confirmPassword)){
            flash.message = message(code: 'khronosun.confirmPassword.does.not.match')
            render(view:'register',model:[userInstance:userInstance])
            return
        }
        else{
            render(view:'register',model:[userInstance:userInstance])
        }

    } //end saveUser method

    def showProfile() {
        if(session.user){
            def userInstance = User.get(params.id)
            if (!userInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect(action: "list")
                return
            }
            [userInstance: userInstance]
        }else{
            redirect(action: "login")
        }
    }// end showProfile method

    def editProfile() {

        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }
        [userInstance: userInstance]

    } // end editProfit method

    def updateProfile() {

        def userInstance = User.get(params.id)
        def f = request.getFile('userImage')  // List of OK mime-types
        userInstance.userImage = f.getBytes()
        userInstance.imageType = f.getContentType()

        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "editProfile", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "editProfile", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "showProfile", id: userInstance.id)

    } // end updateProfile method

    def changePassword(){

        // if the user has not login , redirect them to login page
        if(session.user == null){
            redirect(action: 'login')
            return
        }

    } // end changePassword method

    def changePasswordProcess (){

        if(session.user == null){
            redirect(action: 'login')
            return
        }
        def userInstance = User.get(session.user.id)

        if(userInstance == null){
            redirect(action: "login")
            return
        }
        else{
            if(!userInstance.password.equals(springSecurityService.encodePassword(params.password, userInstance.email))){
                flash.message = "Please enter the correct old password"
                redirect(action: "changePassword")
                return
            }
            else if(!params.newPassword.equals(params.newPassword1)){
                flash.message = "Please ensure that you new password and new password is the same"
                redirect(action: "changePassword")
                return
            }
            else{
                userInstance.password = springSecurityService.encodePassword(params.newPassword, userInstance.email)
                if(userInstance.save(flush: true)){
                    flash.message = "Your password has been changed"
                    redirect(action: "changePassword")
                    return
                }
                else{
                    flash.message = "Unexpected error!"
                    redirect(action: "changePassword")
                    return
                }
            }
        }

    }   // end changePasswordProcess method

    /*-------------------- Image -------------------------*/

    def imageTest(){

    }

    def displayImage(){

        //pass the user information back to view page to diplay image
        def userInstance = User.get(session.user.id)
        return [userInstance: userInstance]

    }// end display image

    def uploadImage = {

        if(session.user == null){
            redirect(action: 'login')
        }

        def user = User.get(params.id)
        // or however you select the current user  // Get the avatar file from the multi-part request
        def f = request.getFile('userImage')  // List of OK mime-types

        user.userImage = f.getBytes()
        user.imageType = f.getContentType()

        //log.info("File uploaded: " + user.imageType)  // Validation works, will check if the image is too big
        if (!user.save()) {
            flash.message = "Error, image is not saved"
            println "why cannot"
            render(view:'uploadPic', model:[user:user])
            return;
        }
        flash.message = "Avatar (${user.imageType}, ${user.userImage.size()}bytes) uploaded."
        redirect(action:'displayImage')

    }//end upload image

    def loadImage = {

        def avatar = User.get(params.id)
        response.setContentType(avatar.imageType)
        response.setContentLength(avatar.userImage.size())
        OutputStream out = response.getOutputStream();
        out.write(avatar.userImage);
        out.close();

    }//end user Image

    /*-------------------- Reported Comment -------------------------*/

    def loadComment(){

        def commentInstance = ItemComment.findAll("from ItemComment as ic where ic.status=:status",
            [status: '2'])
        println commentInstance
        if (!commentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "index")
            return
        }
        [commentInstance: commentInstance]
    }

    /*-------------------- Miscellaneous -------------------------*/

    def privacyPolicy() {
    }

    def termsOfService() {
    }

    def aboutUs() {
    }

    def salesAndRefunds() {
    }

    def help() {
    }

    def siteMap() {
    }
    
}
