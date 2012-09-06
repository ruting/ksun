package khronosun
import khronosun.ItemTemplate

import org.springframework.dao.DataIntegrityViolationException

class ItemTemplateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [itemTemplateInstanceList: ItemTemplate.list(params), itemTemplateInstanceTotal: ItemTemplate.count()]
    }

    def create() {
        [itemTemplateInstance: new ItemTemplate(params)]
    }

    def save() {
        def itemTemplateInstance = new ItemTemplate(params)
        if (!itemTemplateInstance.save(flush: true)) {
            render(view: "create", model: [itemTemplateInstance: itemTemplateInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'itemTemplate.label', default: 'ItemTemplate'), itemTemplateInstance.id])
        redirect(action: "show", id: itemTemplateInstance.id)
    }

    def show() {
        def itemTemplateInstance = ItemTemplate.get(params.id)
        if (!itemTemplateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemTemplate.label', default: 'ItemTemplate'), params.id])
            redirect(action: "list")
            return
        }

        [itemTemplateInstance: itemTemplateInstance]
    }

    def edit() {
        def itemTemplateInstance = ItemTemplate.get(params.id)
        if (!itemTemplateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemTemplate.label', default: 'ItemTemplate'), params.id])
            redirect(action: "list")
            return
        }

        [itemTemplateInstance: itemTemplateInstance]
    }

    def update() {
        def itemTemplateInstance = ItemTemplate.get(params.id)
        if (!itemTemplateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemTemplate.label', default: 'ItemTemplate'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (itemTemplateInstance.version > version) {
                itemTemplateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'itemTemplate.label', default: 'ItemTemplate')] as Object[],
                          "Another user has updated this ItemTemplate while you were editing")
                render(view: "edit", model: [itemTemplateInstance: itemTemplateInstance])
                return
            }
        }

        itemTemplateInstance.properties = params

        if (!itemTemplateInstance.save(flush: true)) {
            render(view: "edit", model: [itemTemplateInstance: itemTemplateInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'itemTemplate.label', default: 'ItemTemplate'), itemTemplateInstance.id])
        redirect(action: "show", id: itemTemplateInstance.id)
    }

    def delete() {
        def itemTemplateInstance = ItemTemplate.get(params.id)
        if (!itemTemplateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemTemplate.label', default: 'ItemTemplate'), params.id])
            redirect(action: "list")
            return
        }

        try {
            itemTemplateInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'itemTemplate.label', default: 'ItemTemplate'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'itemTemplate.label', default: 'ItemTemplate'), params.id])
            redirect(action: "show", id: params.id)
        }
    }


    def loadImage = {
        def template = ItemTemplate.get(params.id)
        println "the template is "+template
        response.setContentType(template.imageType)
        response.setContentLength(template.templateImage.size())
        OutputStream out = response.getOutputStream();
        out.write(template.templateImage);
        out.close();

    }//end itemtemplate Image

}
