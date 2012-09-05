package khronosun
import khronosun.ItemRating
import khronosun.User
import khronosun.Item
import org.springframework.dao.DataIntegrityViolationException

class ItemCommentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [itemCommentInstanceList: ItemComment.list(params), itemCommentInstanceTotal: ItemComment.count()]
    }

    def create() {
        [itemCommentInstance: new ItemComment(params)]
    }

    def save() {
        def itemCommentInstance = new ItemComment(params)
        if (!itemCommentInstance.save(flush: true)) {
            render(view: "create", model: [itemCommentInstance: itemCommentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'itemComment.label', default: 'ItemComment'), itemCommentInstance.id,itemCommentInstance.comment])
        redirect(action: "show", id: itemCommentInstance.id, comment:itemCommentInstance.comment)
    }

    def saveRate(){

        def sum
        def average
        if (params.rating!=null){

            def user =  User.get(session.user.id)
            def item =  Item.get(params.id)

            def newRating = new ItemRating (user:user,item:item,rating:params?.rating)
            newRating.save()
            def itemInstance = Item.get(params.id)

            if (itemInstance?.rating?.rating.size()>0){
            sum = itemInstance?.rating.rating.sum()
            average = sum/(itemInstance?.rating?.rating.size())
        }
       }
       render(template:"../item/rate", model:[average:average])
    }
    

    def saveall() {

        println params.rating
        println params.id
        println session.user.id
        def itemInstance = Item.get(params.id)
        def sum
        def average

        if (params.comment!=null){

            def user =  User.get(params.user.id)
            
            def item =  Item.get(params.item.id)
            // status 1 = Normal , 2 = pending , 3 = offensive
            def status = "1"
            def newComment = new ItemComment (user:user,item:item,comment:params?.comment,status:status)
            newComment.save()
        }
        redirect(controller: "Item",action:"show",id:params.item.id)
    
    }

    def ban(){

        def itemCommentInstance = ItemComment.get(params.id)
        println itemCommentInstance
        if(itemCommentInstance){
            String type = "3"
            itemCommentInstance.status = type
            itemCommentInstance.save()
        }
        redirect(controller:"User",action:"loadComment")
    }

    def approve(){

        def itemCommentInstance = ItemComment.get(params.id)
        println itemCommentInstance
        if(itemCommentInstance){
            String type = "1"
            itemCommentInstance.status = type
            itemCommentInstance.save()
        }
        redirect(controller:"User",action:"loadComment")
    }


    def show() {
        def itemCommentInstance = ItemComment.get(params.id)
        if (!itemCommentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemComment.label', default: 'ItemComment'), params.id])
            redirect(action: "list")
            return
        }

        [itemCommentInstance: itemCommentInstance]
    }

    def edit() {
        def itemCommentInstance = ItemComment.get(params.id)
        if (!itemCommentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemComment.label', default: 'ItemComment'), params.id])
            redirect(action: "list")
            return
        }

        [itemCommentInstance: itemCommentInstance]
    }

    def update() {
        def itemCommentInstance = ItemComment.get(params.id)
        if (!itemCommentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemComment.label', default: 'ItemComment'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (itemCommentInstance.version > version) {
                itemCommentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'itemComment.label', default: 'ItemComment')] as Object[],
                          "Another user has updated this ItemComment while you were editing")
                render(view: "edit", model: [itemCommentInstance: itemCommentInstance])
                return
            }
        }

        itemCommentInstance.properties = params

        if (!itemCommentInstance.save(flush: true)) {
            render(view: "edit", model: [itemCommentInstance: itemCommentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'itemComment.label', default: 'ItemComment'), itemCommentInstance.id])
        redirect(action: "show", id: itemCommentInstance.id)
    }

    def delete() {
        def itemCommentInstance = ItemComment.get(params.id)
        if (!itemCommentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemComment.label', default: 'ItemComment'), params.id])
            redirect(action: "list")
            return
        }

        try {
            itemCommentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'itemComment.label', default: 'ItemComment'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'itemComment.label', default: 'ItemComment'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def report(){
        def itemCommentInstance = ItemComment.get(params.id)
        println itemCommentInstance
        if(itemCommentInstance){
            String type = "2"
            itemCommentInstance.status = type
            itemCommentInstance.save()
        }
        def targetUri = params.targetUri ?: "/"
        redirect(uri: targetUri)
    }
}
