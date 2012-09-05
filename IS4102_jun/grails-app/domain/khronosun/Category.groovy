package khronosun

class Category {
   
    String categoryType
    byte[] categoryImage
    String imageType

    static hasMany = [item:Item]

    static searchable = true

    static constraints = {
        categoryType(blank:false)
        categoryImage(nullable:true, maxSize:5000000 )// to store files upto 5MB approx
    }
}
