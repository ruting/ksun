package khronosun

import org.springframework.dao.DataIntegrityViolationException

class MailToFriendController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "create", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [mailToFriendInstanceList: MailToFriend.list(params), mailToFriendInstanceTotal: MailToFriend.count()]
    }

    def create() {
        [mailToFriendInstance: new MailToFriend(params)]
    }

    def save() {
        def mailToFriendInstance = new MailToFriend(params)
        if (!mailToFriendInstance.save(flush: true)) {
            render(view: "create", model: [mailToFriendInstance: mailToFriendInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'mailToFriend.label', default: 'MailToFriend'), mailToFriendInstance.id])
        redirect(action: "create", id: mailToFriendInstance.id)
        sendMail {
            to params.friendEmail
            from " khronosun@gmail.com"
            subject "khonosUN newsletter 2012 "
            html g.render(template:"template1")
        }
    }

    def show() {
        def mailToFriendInstance = MailToFriend.get(params.id)
        if (!mailToFriendInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mailToFriend.label', default: 'MailToFriend'), params.id])
            redirect(action: "list")
            return
        }

        [mailToFriendInstance: mailToFriendInstance]
    }

    def edit() {
        def mailToFriendInstance = MailToFriend.get(params.id)
        if (!mailToFriendInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mailToFriend.label', default: 'MailToFriend'), params.id])
            redirect(action: "list")
            return
        }

        [mailToFriendInstance: mailToFriendInstance]
    }

    def update() {
        def mailToFriendInstance = MailToFriend.get(params.id)
        if (!mailToFriendInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mailToFriend.label', default: 'MailToFriend'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (mailToFriendInstance.version > version) {
                mailToFriendInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'mailToFriend.label', default: 'MailToFriend')] as Object[],
                          "Another user has updated this MailToFriend while you were editing")
                render(view: "edit", model: [mailToFriendInstance: mailToFriendInstance])
                return
            }
        }

        mailToFriendInstance.properties = params

        if (!mailToFriendInstance.save(flush: true)) {
            render(view: "edit", model: [mailToFriendInstance: mailToFriendInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'mailToFriend.label', default: 'MailToFriend'), mailToFriendInstance.id])
        redirect(action: "show", id: mailToFriendInstance.id)
    }

    def delete() {
        def mailToFriendInstance = MailToFriend.get(params.id)
        if (!mailToFriendInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mailToFriend.label', default: 'MailToFriend'), params.id])
            redirect(action: "list")
            return
        }

        try {
            mailToFriendInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'mailToFriend.label', default: 'MailToFriend'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mailToFriend.label', default: 'MailToFriend'), params.id])
            redirect(action: "show", id: params.id)
        }
    }


    def mail(){
        sendMail {
            //send mail to multiple users stored in the database
            to MailToFriend.list().friendEmail.toArray()
            from "khronosun@gmail.com"
            subject "khonosUN newsletter 2012 "

            html 'hi, your friend has requsted us to send you a newsletter which you might be interested in'
            html g.render(template:"template1")
        }
        flash.message = "Send All!"
        redirect(action: 'list')
    }

    def unsubscriptionFriend() {

    }

    def unsubscribe(){

        String friendEmailkey = params['friendEmail']
        def mailToFriendInstance = MailToFriend.findWhere(friendEmail:friendEmailkey)
        println friendEmailkey
        println mailToFriendInstance
        if(mailToFriendInstance){
            mailToFriendInstance.delete(flush: true)
            flash.message = "Successfully unsubscribe from newsletter!"
            redirect(action: "unsubscriptionFriend")
        }else{
            flash.message= "Email does not exist in database."
            redirect(action: "unsubscriptionFriend")
        }

    }

}
