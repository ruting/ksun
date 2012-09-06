package khronosun

class Subscription {

    String email

    static constraints = {
        email(blank:false, unique:true)
    }
}
