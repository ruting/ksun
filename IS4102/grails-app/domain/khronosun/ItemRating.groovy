package khronosun

class ItemRating {

    int rating
    static belongsTo = [user:User,item:Item]
    static constraints = {
        user nullable:false
        item nullable:false
        rating(blank: false)
    }
    
}
