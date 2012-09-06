package khronosun

class ItemTemplate {


    String templateName
    int price
    Date dateAdded
    byte[] templateImage
    String imageType
    int viewCount

    static hasMany = [item:Item]

    static constraints = {
        templateName(blank:false)
        price(blank:false)
        dateAdded(blank:false)
        templateImage(nullable:true, maxSize:5000000 )// to store files upto 5MB approx

    }

}
