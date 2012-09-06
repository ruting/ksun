package khronosun

import org.springframework.dao.DataIntegrityViolationException

class SubscriptionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "create", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [subscriptionInstanceList: Subscription.list(params), subscriptionInstanceTotal: Subscription.count()]
    }

    def create() {
        [subscriptionInstance: new Subscription(params)]
    }

    def save() {
        def subscriptionInstance = new Subscription(params)
        if (!subscriptionInstance.save(flush: true)) {
         render(view: "/index", model: [subscriptionInstance: subscriptionInstance])

            return
        }
     	flash.message = message(code: 'default.created.message', args: [message(code: 'subscription.label', default: 'Subscription'), subscriptionInstance.email])
        redirect(uri:'/', id: subscriptionInstance.id)
        sendMail {
            to params.email
            from " khronosun@gmail.com"
            subject "khonosUN newsletter 2012 "
            //body "This is the newsletter."
            html g.render(template:"template1")
        }
    }

    def show() {
        def subscriptionInstance = Subscription.get(params.id)
        if (!subscriptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscription.label', default: 'Subscription'), subscriptionInstance.email])
            redirect(action: "list")
            return
        }
        [subscriptionInstance: subscriptionInstance]
    }

    def delete() {
        def subscriptionInstance = Subscription.get(params.id)
        if (!subscriptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscription.label', default: 'Subscription'), subscriptionInstance.email])
            redirect(action: "list")
            return
        }
        try {
            subscriptionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subscription.label', default: 'Subscription'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subscription.label', default: 'Subscription'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def template1() {
    }

    def unsubscription() {
    }

    def unsubscribe(){

        String emailkey = params['email']
        println "the email key is " + emailkey
        def subscriptionInstance = Subscription.findWhere(email:emailkey)
        println subscriptionInstance
        if(subscriptionInstance){
            subscriptionInstance.delete(flush: true)
            flash.message = "Successfully unsubscribe from newsletter!"
            redirect(action: "unsubscription")
        }else{
            flash.message= "Email does not exist in database."
            redirect(action: "unsubscription")
        }

    }


    /*-------------------- Admin -------------------------*/

    def mail(){
        sendMail {
            //send mail to multiple users stored in the database
            to Subscription.list().email.toArray()
            from " khronosun@gmail.com"
            subject "khonosUN newsletter 2012 "
            html g.render(template:"template1")
        }
        flash.message = "Send All!"
        redirect(action: 'list')
    }

}