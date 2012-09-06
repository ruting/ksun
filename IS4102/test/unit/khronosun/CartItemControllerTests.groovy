package khronosun



import org.junit.*
import grails.test.mixin.*

@TestFor(CartItemController)
@Mock(CartItem)
class CartItemControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cartItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cartItemInstanceList.size() == 0
        assert model.cartItemInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.cartItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cartItemInstance != null
        assert view == '/cartItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cartItem/show/1'
        assert controller.flash.message != null
        assert CartItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cartItem/list'


        populateValidParams(params)
        def cartItem = new CartItem(params)

        assert cartItem.save() != null

        params.id = cartItem.id

        def model = controller.show()

        assert model.cartItemInstance == cartItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cartItem/list'


        populateValidParams(params)
        def cartItem = new CartItem(params)

        assert cartItem.save() != null

        params.id = cartItem.id

        def model = controller.edit()

        assert model.cartItemInstance == cartItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cartItem/list'

        response.reset()


        populateValidParams(params)
        def cartItem = new CartItem(params)

        assert cartItem.save() != null

        // test invalid parameters in update
        params.id = cartItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cartItem/edit"
        assert model.cartItemInstance != null

        cartItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cartItem/show/$cartItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cartItem.clearErrors()

        populateValidParams(params)
        params.id = cartItem.id
        params.version = -1
        controller.update()

        assert view == "/cartItem/edit"
        assert model.cartItemInstance != null
        assert model.cartItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cartItem/list'

        response.reset()

        populateValidParams(params)
        def cartItem = new CartItem(params)

        assert cartItem.save() != null
        assert CartItem.count() == 1

        params.id = cartItem.id

        controller.delete()

        assert CartItem.count() == 0
        assert CartItem.get(cartItem.id) == null
        assert response.redirectedUrl == '/cartItem/list'
    }
}
