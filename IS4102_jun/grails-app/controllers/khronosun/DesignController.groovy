package khronosun

import org.springframework.dao.DataIntegrityViolationException

class DesignController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [designInstanceList: Design.list(params), designInstanceTotal: Design.count()]
    }

    def create() {
        [designInstance: new Design(params)]
    }

    def save() {
        def designInstance = new Design(params)
        if (!designInstance.save(flush: true)) {
            render(view: "create", model: [designInstance: designInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'design.label', default: 'Design'), designInstance.id])
        redirect(action: "show", id: designInstance.id)
    }

    def show() {
        def designInstance = Design.get(params.id)
        if (!designInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'design.label', default: 'Design'), params.id])
            redirect(action: "list")
            return
        }

        [designInstance: designInstance]
    }

    def edit() {
        def designInstance = Design.get(params.id)
        if (!designInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'design.label', default: 'Design'), params.id])
            redirect(action: "list")
            return
        }

        [designInstance: designInstance]
    }

    def update() {
        def designInstance = Design.get(params.id)
        if (!designInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'design.label', default: 'Design'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (designInstance.version > version) {
                designInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'design.label', default: 'Design')] as Object[],
                          "Another user has updated this Design while you were editing")
                render(view: "edit", model: [designInstance: designInstance])
                return
            }
        }

        designInstance.properties = params

        if (!designInstance.save(flush: true)) {
            render(view: "edit", model: [designInstance: designInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'design.label', default: 'Design'), designInstance.id])
        redirect(action: "show", id: designInstance.id)
    }

    def delete() {
        def designInstance = Design.get(params.id)
        if (!designInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'design.label', default: 'Design'), params.id])
            redirect(action: "list")
            return
        }

        try {
            designInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'design.label', default: 'Design'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'design.label', default: 'Design'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
