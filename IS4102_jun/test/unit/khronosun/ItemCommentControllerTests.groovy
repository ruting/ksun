package khronosun



import org.junit.*
import grails.test.mixin.*

@TestFor(ItemCommentController)
@Mock(ItemComment)
class ItemCommentControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/itemComment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.itemCommentInstanceList.size() == 0
        assert model.itemCommentInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.itemCommentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.itemCommentInstance != null
        assert view == '/itemComment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/itemComment/show/1'
        assert controller.flash.message != null
        assert ItemComment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/itemComment/list'


        populateValidParams(params)
        def itemComment = new ItemComment(params)

        assert itemComment.save() != null

        params.id = itemComment.id

        def model = controller.show()

        assert model.itemCommentInstance == itemComment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/itemComment/list'


        populateValidParams(params)
        def itemComment = new ItemComment(params)

        assert itemComment.save() != null

        params.id = itemComment.id

        def model = controller.edit()

        assert model.itemCommentInstance == itemComment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/itemComment/list'

        response.reset()


        populateValidParams(params)
        def itemComment = new ItemComment(params)

        assert itemComment.save() != null

        // test invalid parameters in update
        params.id = itemComment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/itemComment/edit"
        assert model.itemCommentInstance != null

        itemComment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/itemComment/show/$itemComment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        itemComment.clearErrors()

        populateValidParams(params)
        params.id = itemComment.id
        params.version = -1
        controller.update()

        assert view == "/itemComment/edit"
        assert model.itemCommentInstance != null
        assert model.itemCommentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/itemComment/list'

        response.reset()

        populateValidParams(params)
        def itemComment = new ItemComment(params)

        assert itemComment.save() != null
        assert ItemComment.count() == 1

        params.id = itemComment.id

        controller.delete()

        assert ItemComment.count() == 0
        assert ItemComment.get(itemComment.id) == null
        assert response.redirectedUrl == '/itemComment/list'
    }
}
