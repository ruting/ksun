package khronosun



import org.junit.*
import grails.test.mixin.*

@TestFor(ItemRatingController)
@Mock(ItemRating)
class ItemRatingControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/itemRating/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.itemRatingInstanceList.size() == 0
        assert model.itemRatingInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.itemRatingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.itemRatingInstance != null
        assert view == '/itemRating/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/itemRating/show/1'
        assert controller.flash.message != null
        assert ItemRating.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/itemRating/list'


        populateValidParams(params)
        def itemRating = new ItemRating(params)

        assert itemRating.save() != null

        params.id = itemRating.id

        def model = controller.show()

        assert model.itemRatingInstance == itemRating
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/itemRating/list'


        populateValidParams(params)
        def itemRating = new ItemRating(params)

        assert itemRating.save() != null

        params.id = itemRating.id

        def model = controller.edit()

        assert model.itemRatingInstance == itemRating
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/itemRating/list'

        response.reset()


        populateValidParams(params)
        def itemRating = new ItemRating(params)

        assert itemRating.save() != null

        // test invalid parameters in update
        params.id = itemRating.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/itemRating/edit"
        assert model.itemRatingInstance != null

        itemRating.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/itemRating/show/$itemRating.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        itemRating.clearErrors()

        populateValidParams(params)
        params.id = itemRating.id
        params.version = -1
        controller.update()

        assert view == "/itemRating/edit"
        assert model.itemRatingInstance != null
        assert model.itemRatingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/itemRating/list'

        response.reset()

        populateValidParams(params)
        def itemRating = new ItemRating(params)

        assert itemRating.save() != null
        assert ItemRating.count() == 1

        params.id = itemRating.id

        controller.delete()

        assert ItemRating.count() == 0
        assert ItemRating.get(itemRating.id) == null
        assert response.redirectedUrl == '/itemRating/list'
    }
}
