package khronosun



import org.junit.*
import grails.test.mixin.*

@TestFor(DesignController)
@Mock(Design)
class DesignControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/design/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.designInstanceList.size() == 0
        assert model.designInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.designInstance != null
    }

    void testSave() {
        controller.save()

        assert model.designInstance != null
        assert view == '/design/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/design/show/1'
        assert controller.flash.message != null
        assert Design.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/design/list'


        populateValidParams(params)
        def design = new Design(params)

        assert design.save() != null

        params.id = design.id

        def model = controller.show()

        assert model.designInstance == design
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/design/list'


        populateValidParams(params)
        def design = new Design(params)

        assert design.save() != null

        params.id = design.id

        def model = controller.edit()

        assert model.designInstance == design
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/design/list'

        response.reset()


        populateValidParams(params)
        def design = new Design(params)

        assert design.save() != null

        // test invalid parameters in update
        params.id = design.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/design/edit"
        assert model.designInstance != null

        design.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/design/show/$design.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        design.clearErrors()

        populateValidParams(params)
        params.id = design.id
        params.version = -1
        controller.update()

        assert view == "/design/edit"
        assert model.designInstance != null
        assert model.designInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/design/list'

        response.reset()

        populateValidParams(params)
        def design = new Design(params)

        assert design.save() != null
        assert Design.count() == 1

        params.id = design.id

        controller.delete()

        assert Design.count() == 0
        assert Design.get(design.id) == null
        assert response.redirectedUrl == '/design/list'
    }
}
