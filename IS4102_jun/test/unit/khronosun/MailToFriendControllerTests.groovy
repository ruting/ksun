package khronosun



import org.junit.*
import grails.test.mixin.*

@TestFor(MailToFriendController)
@Mock(MailToFriend)
class MailToFriendControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/mailToFriend/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.mailToFriendInstanceList.size() == 0
        assert model.mailToFriendInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.mailToFriendInstance != null
    }

    void testSave() {
        controller.save()

        assert model.mailToFriendInstance != null
        assert view == '/mailToFriend/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/mailToFriend/show/1'
        assert controller.flash.message != null
        assert MailToFriend.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/mailToFriend/list'


        populateValidParams(params)
        def mailToFriend = new MailToFriend(params)

        assert mailToFriend.save() != null

        params.id = mailToFriend.id

        def model = controller.show()

        assert model.mailToFriendInstance == mailToFriend
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/mailToFriend/list'


        populateValidParams(params)
        def mailToFriend = new MailToFriend(params)

        assert mailToFriend.save() != null

        params.id = mailToFriend.id

        def model = controller.edit()

        assert model.mailToFriendInstance == mailToFriend
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/mailToFriend/list'

        response.reset()


        populateValidParams(params)
        def mailToFriend = new MailToFriend(params)

        assert mailToFriend.save() != null

        // test invalid parameters in update
        params.id = mailToFriend.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/mailToFriend/edit"
        assert model.mailToFriendInstance != null

        mailToFriend.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/mailToFriend/show/$mailToFriend.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        mailToFriend.clearErrors()

        populateValidParams(params)
        params.id = mailToFriend.id
        params.version = -1
        controller.update()

        assert view == "/mailToFriend/edit"
        assert model.mailToFriendInstance != null
        assert model.mailToFriendInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/mailToFriend/list'

        response.reset()

        populateValidParams(params)
        def mailToFriend = new MailToFriend(params)

        assert mailToFriend.save() != null
        assert MailToFriend.count() == 1

        params.id = mailToFriend.id

        controller.delete()

        assert MailToFriend.count() == 0
        assert MailToFriend.get(mailToFriend.id) == null
        assert response.redirectedUrl == '/mailToFriend/list'
    }
}
