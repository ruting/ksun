package khronosun

class User {

   String email
   String usertype // to indicate if the account is normal user or admin
   String password
   String firstName
   String lastName
   Date dateOfBirth
   String gender
   String address
   String contactNo
   byte[] userImage // to store the image
   String imageType // to indicate if the image is jsp , gif ,etc
   String accountStatus // to determine if the account is inactive (not activated yet) , active or banned
   String verifyCode // to activate the account
   String securityQns // security question for the user
   String securityAns // security Answer of the user for the question
   double credit

    static hasMany = [rating:ItemRating,comment:ItemComment,purchase:Purchase,design:Design,cart:Cart]

    static constraints = {
       firstName(blank:false)
       lastName(blank:false)
       password (blank:false)
       email(email:true, blank: false, unique:true) // to set as primary key for the user
       dateOfBirth(blank:false)
       gender(blank:false)
       address(blank:false)
       contactNo(blank: false)
       userImage(nullable:true, maxSize:5000000 )// to store files upto 5MB approx
       securityQns(blank:false)
       securityAns(blank:false)
    }
}
