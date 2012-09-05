package khronosun

class Item {


    String itemName
    String description
    int price
    int quantity
    Date dateAdded
    byte[] itemImage
    String imageType
    int viewCount

    static searchable = true

    static belongsTo = [category:Category]
    static hasMany = [comment:ItemComment,rating:ItemRating]

    static constraints = {
        itemName(blank:false)
        description(blank:false)
        price(blank:false)
        quantity(blank:false)
        dateAdded(blank:false)
        category(blank:false)
        itemImage(nullable:true, maxSize:5000000 )// to store files upto 5MB approx

    }

    static mapping = {
        description type: 'text'
    }
}
