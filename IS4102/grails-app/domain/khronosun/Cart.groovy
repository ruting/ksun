package khronosun

class Cart {

   double totalAmount= 0
   String userId
   Date dateAdded
   String status  //lock or open
   
    static hasMany = [cartItem:CartItem]

    static constraints = {
        totalAmount (blank:false)
        cartItem (nullable:true)
        dateAdded (nullable:true)
    }
}
