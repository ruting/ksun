package khronosun

class Design {

   byte[] designImage // to store the image
   String imageType // to indicate if the image is jsp , gif ,etc
   String designType //logo or background
   String status //approve;pending;reject
   // Do we need to give it a name and also tags?
   // for example: a design named "konkon" with tags of "abstract, cool, heavy, etc"
     static belongsTo = [user:User]

    static constraints = {

         designImage (nullable:true, maxSize:5000000 )// to store files upto 5MB approx
         designType (blank:false)

    }
}
