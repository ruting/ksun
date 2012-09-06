package khronosun
import khronosun.User
import khronosun.Item

import org.springframework.dao.DataIntegrityViolationException

class ItemRatingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [itemRatingInstanceList: ItemRating.list(params), itemRatingInstanceTotal: ItemRating.count()]
    }

    def create() {
        [itemRatingInstance: new ItemRating(params)]
    }

    def save() {
        def itemRatingInstance = new ItemRating(params)
        if (!itemRatingInstance.save(flush: true)) {
            render(view: "create", model: [itemRatingInstance: itemRatingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'itemRating.label', default: 'ItemRating'), itemRatingInstance.id])
        redirect(action: "show", id: itemRatingInstance.id)
    }

    def show() {
        def itemRatingInstance = ItemRating.get(params.id)
        if (!itemRatingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemRating.label', default: 'ItemRating'), params.id])
            redirect(action: "list")
            return
        }

        [itemRatingInstance: itemRatingInstance]
    }

    def edit() {
        def itemRatingInstance = ItemRating.get(params.id)
        if (!itemRatingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemRating.label', default: 'ItemRating'), params.id])
            redirect(action: "list")
            return
        }

        [itemRatingInstance: itemRatingInstance]
    }

    def update() {
        def itemRatingInstance = ItemRating.get(params.id)
        if (!itemRatingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemRating.label', default: 'ItemRating'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (itemRatingInstance.version > version) {
                itemRatingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'itemRating.label', default: 'ItemRating')] as Object[],
                          "Another user has updated this ItemRating while you were editing")
                render(view: "edit", model: [itemRatingInstance: itemRatingInstance])
                return
            }
        }

        itemRatingInstance.properties = params

        if (!itemRatingInstance.save(flush: true)) {
            render(view: "edit", model: [itemRatingInstance: itemRatingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'itemRating.label', default: 'ItemRating'), itemRatingInstance.id])
        redirect(action: "show", id: itemRatingInstance.id)
    }

    def delete() {
        def itemRatingInstance = ItemRating.get(params.id)
        if (!itemRatingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemRating.label', default: 'ItemRating'), params.id])
            redirect(action: "list")
            return
        }

        try {
            itemRatingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'itemRating.label', default: 'ItemRating'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'itemRating.label', default: 'ItemRating'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
