package khronosun

import org.springframework.dao.DataIntegrityViolationException

class CartController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def show() {
        def cartInstance = Cart.find("from Cart as c where c.userId=:userId", [userId: (String)session.user.id])
        if (!cartInstance){
                cartInstance = new Cart()
                cartInstance.totalAmount = 0
                cartInstance.userId = (String)session.user.id
                cartInstance.save(flush: true)
        }

        [cartInstance: cartInstance]
    }

    def addSubQuantity = {

        def cartItemInstance = CartItem.get(params.cartItemId) //params.cartItemId to get cartItem id
        def cartInstance = Cart.get(params.id) //session.user.id to get cart id

        def qty = Long.parseLong(params.value)
        if(qty<cartItemInstance.item.quantity){
            cartItemInstance.quantity = qty
            def itemInstance = cartItemInstance.item
            def unitPrice = itemInstance.price
            def subTotal = qty * unitPrice
            cartItemInstance.price = subTotal
            cartItemInstance.save(flush: true)
            def totalPrice = 0
            cartInstance.cartItem.each{
                it.price = it.item.price * it.quantity
                it.save(flush:true)
                totalPrice += it.price
            }
            cartInstance.totalAmount = totalPrice
            cartInstance.save(flush: true)
            flash.message = "Your shopping cart has been updated!"
        }
        else{
            flash.message = "You cannot order more than max or Please add item to cart!"
        }
        render (view: "show", model:[cartInstance: cartInstance])
    }

    def deleteCartItem () {

        def cartItemInstance = CartItem.get(params.cartItemId) //params.cartItemId to get cartItem id
        def cartInstance = Cart.get(params.cartId) //session.user.id to get cart id
        cartInstance.totalAmount = cartInstance.totalAmount - (cartItemInstance.price*cartItemInstance.quantity)
        cartInstance.cartItem.remove(cartItemInstance)
        cartItemInstance.delete()
        if(cartInstance.save(flush: true)){
            flash.message="You have successfully removed the selected item from your shopping cart!"
        }
        else{
            flash.message="Due to unexpected error, we cannot remove the selected item from your shopping cart!"
        }
        render (view: "show", model:[cartInstance: cartInstance])

    }

    def deleteCart () {

        def cartInstance = Cart.get(params.cartId) //session.user.id to get cart id
        cartInstance.cartItem.clear()
        cartInstance.totalAmount = 0
        if(cartInstance.save(flush: true)){
            flash.message="You have successfully emptied your shopping cart!"
        }
        else{
            flash.message="Due to unexpected error, we cannot empty your shopping cart!"
        }
        render (view: "show", model:[cartInstance: cartInstance])

    }


}
