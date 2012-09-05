package khronosun

import org.springframework.dao.DataIntegrityViolationException

class CategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

      def searchAJAX = {

        def categorys = Category.findAllByCategoryTypeLike("%${params.query}%")


        //Create XML response
        render(contentType: "text/xml") {
	    results() {
	        categorys.each { category ->
		    result(){
		        name(category.categoryType)
                        //Optional id which will be available in onItemSelect
                        id(category.id)
		    }
		}
            }
        }
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [categoryInstanceList: Category.list(params), categoryInstanceTotal: Category.count()]
    }

    def create() {
        [categoryInstance: new Category(params)]
    }

    def save() {
        def categoryInstance = new Category(params)
        if (!categoryInstance.save(flush: true)) {
            render(view: "create", model: [categoryInstance: categoryInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.id])
        redirect(action: "show", id: categoryInstance.id)
    }

    def show() {
        def categoryInstance = Category.get(params.id)
        if (!categoryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), params.id])
            redirect(action: "list")
            return
        }

        [categoryInstance: categoryInstance]
    }

    def edit() {
        def categoryInstance = Category.get(params.id)
        if (!categoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), params.id])
            redirect(action: "list")
            return
        }

        [categoryInstance: categoryInstance]
    }

    def update() {
        def categoryInstance = Category.get(params.id)
        def f = request.getFile('categoryImage')  // List of OK mime-types
        categoryInstance.categoryImage = f.getBytes()
        categoryInstance.imageType = f.getContentType()
        if (!categoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (categoryInstance.version > version) {
                categoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'category.label', default: 'Category')] as Object[],
                          "Another user has updated this Category while you were editing")
                render(view: "edit", model: [categoryInstance: categoryInstance])
                return
            }
        }

        categoryInstance.properties = params

        if (!categoryInstance.save(flush: true)) {
            render(view: "edit", model: [categoryInstance: categoryInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.id])
        redirect(action: "show", id: categoryInstance.id)
    }

    def delete() {
        def categoryInstance = Category.get(params.id)
        if (!categoryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), params.id])
            redirect(action: "list")
            return
        }

        try {
            categoryInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'category.label', default: 'Category'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'category.label', default: 'Category'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
    def imageTest(){

    }

    def displayImage(){

       // pass the diplay image
        def categoryInstance = Category.get(params.id)
        return [categoryInstance: categoryInstance]

    }// end display image

    def loadImage = {
        def avatar = Category.get(params.id)
        println "the avatar is "+avatar
        response.setContentType(avatar.imageType)
        response.setContentLength(avatar.categoryImage.size())
        OutputStream out = response.getOutputStream();
        out.write(avatar.categoryImage);
        out.close();

    }//end item Image

}
