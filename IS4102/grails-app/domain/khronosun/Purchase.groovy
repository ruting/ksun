package khronosun

class Purchase {

    Cart cart
    String shippingAddress
    String transactionID
    String orderStatus
    String paymentMode
    
    static belongsTo =[user:User]

    static constraints = {
    cart(blank:false)
    transactionID(blank:false)

    }
}
