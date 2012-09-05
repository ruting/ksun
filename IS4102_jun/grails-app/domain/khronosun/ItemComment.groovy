package khronosun

class ItemComment {

    String comment
    String status

    static belongsTo = [user:User,item:Item]

    static constraints = {
        user nullable:false
        item nullable:false
        comment(blank: false)
        status(nullable:true)
    }

    static mapping = {
        comment type: 'text'
    }
}
