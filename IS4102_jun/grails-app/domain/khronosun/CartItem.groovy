package khronosun

class CartItem {

    static belongsTo = Cart //uni-directional declaration
    static hasMany = [design:Design]

    double price = 0        //for each cart item
    int quantity = 0        //for each cart item
    Item item
    byte[] finalImage // to store the image
    String imageType

    static constraints = {
        quantity (min:0)
        finalImage(nullable:true, maxSize:5000000 )// to store files upto 5MB approx
        imageType(nullable:true)
    }
}
