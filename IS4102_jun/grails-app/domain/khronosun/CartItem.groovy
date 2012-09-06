package khronosun

class CartItem {

    static belongsTo = Cart //uni-directional declaration
    static hasMany = [design01:Design, design02:Design] // one to many relationship

    double price = 0        //for each cart item
    int quantity = 0        //for each cart item
    Item item
    byte[] finalImage // to store the final image only ! 
    String imageType
    //Design?

    static constraints = {
        quantity (min:0)
        finalImage(nullable:true, maxSize:5000000 )// to store files upto 5MB approx
        imageType(nullable:true)
    }
}
