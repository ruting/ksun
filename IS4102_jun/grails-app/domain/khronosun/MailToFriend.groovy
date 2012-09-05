package khronosun

class MailToFriend {

    String friendEmail
    String name

    static constraints = {

        friendEmail(blank:false)
        name(blank:false)

    }
}
