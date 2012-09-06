package khronosun
import khronosun.ItemRating
import khronosun.User
import khronosun.Cart
import khronosun.CartItem
import khronosun.Category

import org.springframework.dao.DataIntegrityViolationException

class ItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def searchableService

    
    
        
    //This is the DIY page
    def diy() {        
        [
            itemInstanceList: Item.list(params), 
            itemInstanceTotal: Item.count(),
            designInstanceList: Design.list(params), 
            designInstanceTotal: Design.count()
        ]
    }
    
    
    def index() {
        redirect(action: "list", params: params)
    }


    def searchAJAX = {

        def items = Item.findAllByItemNameLike("%${params.query}%")
        //Create XML response
        render(contentType: "text/xml") {
            
	    results() {
	        items.each { item ->
		    result(){
		        name(item?.itemName)
                        //Optional id which will be available in onItemSelect
                        id(item?.id)
		    }
		}
            }
        } 
    } // end searchAJAX

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [itemInstanceList: Item.list(params), itemInstanceTotal: Item.count()]
    }

    def create() {
        [itemInstance: new Item(params)]
    }

    def save() {
        def itemInstance = new Item(params)
        if (!itemInstance.save(flush: true)) {
            render(view: "create", model: [itemInstance: itemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'item.label', default: 'Item'), itemInstance.id])
        redirect(action: "show", id: itemInstance.id)
    }

    def show() {

        println "the item id is " + params.id
        def itemInstance = Item.get(params.id)
        println "the item instance is " + itemInstance
        def sum
        def average
        def isRated
        def userInstance
        if (!itemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'item.label', default: 'Item'), params.id])
            redirect(action: "list")
            return
        }

        if (itemInstance?.rating?.rating.size()>0){
            sum = itemInstance?.rating.rating.sum()
            average = sum/(itemInstance?.rating?.rating.size())
        }

        if(session.user){
            userInstance = User.get(session.user.id)
            if (userInstance){
                def flag = ItemRating.findWhere(item:itemInstance,user:userInstance)

                if (flag){
                    isRated = true
                }
                else{
                    isRated = false
                }
            } else{
                isRated = true
            }
        }

        [itemInstance: itemInstance,average: average,isRated:isRated]
    }

    def edit() {
        def itemInstance = Item.get(params.id)
        if (!itemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'item.label', default: 'Item'), params.id])
            redirect(action: "list")
            return
        }

        [itemInstance: itemInstance]
    }

    def update() {
        def itemInstance = Item.get(params.id)
        def f = request.getFile('itemImage')  // List of OK mime-types
        itemInstance.itemImage = f.getBytes()
        itemInstance.imageType = f.getContentType()
        if (!itemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'item.label', default: 'Item'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (itemInstance.version > version) {
                itemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'item.label', default: 'Item')] as Object[],
                          "Another user has updated this Item while you were editing")
                render(view: "edit", model: [itemInstance: itemInstance])
                return
            }
        }

        itemInstance.properties = params

        if (!itemInstance.save(flush: true)) {
            render(view: "edit", model: [itemInstance: itemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'item.label', default: 'Item'), itemInstance.id])
        redirect(action: "show", id: itemInstance.id)
    }

    def delete() {
        def itemInstance = Item.get(params.id)
        if (!itemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'item.label', default: 'Item'), params.id])
            redirect(action: "list")
            return
        }

        try {
            itemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'item.label', default: 'Item'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'item.label', default: 'Item'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    
     def getTemplate(){
            def hasNext = Item.executeQuery("select distinct a.template from Item a")
        
    }   
     //addtocart for diy items
    def addCartItemDiy () {
        def itemInstance = Item.get(params.item) //GET ITEM ID FROM PARAMETER
        def designInstance02 = Design.get(params.design02); //GET LOGO ID FROM PARAMETER
        def cartInstance
        def cartItemInstance
        boolean check = false

        //anyone can add item to cart in a session
        def hasCart = Cart.find("from Cart as c where c.userId=:userId", [userId: (String)session.user.id])
        //if a cart already existed in a session
        if (hasCart != null) {
            cartInstance = hasCart
            if (cartInstance.cartItem != null) {
                //iterating through each cartItem
                cartInstance.cartItem.each {
                    if (it.item == itemInstance) {
                        check = true
                        cartItemInstance = it
                    }
                }
            }
            if (check == true) {
                //add duplicate cart items
                cartItemInstance.quantity += 1
                cartItemInstance.price = itemInstance.price
                cartItemInstance.save(flush: true)
                //checking cart
                cartInstance.totalAmount += itemInstance.price
                //Save to database
                cartInstance.save(flush: true)
            }
            else if (check == false) {
                //add new cart items
                cartItemInstance = new CartItem()
                cartItemInstance.quantity += 1
                cartItemInstance.price = itemInstance.price
                cartItemInstance.item = itemInstance
                
                //Add DESIGN AND LOGO
                if(params.design01!=null){
                   def designInstance = Design.get(params.design01) //GET DESIGN ID FROM PARAMETER
                // Else we will add the existing design to the item
                  if(designInstance!=null){
                     cartItemInstance.addToDesign01(designInstance); 
                  }else{//If design is not found in database, we will create a new instance
                     designInstance = new Design();
                     designInstance.name = "wtf"
                     designInstance.status = "1"
                     designInstance.setUser(User.get(session.user.id));
                     designInstance.designType = "1"
                     designInstance.imageType = "jsp"
                     designInstance.designImage = ""
                     designInstance.save(flush: true);
                     cartItemInstance.addToDesign01(designInstance); 
                  }
                }
                
                //cartItemInstance.addToDesign02(designInstance02);

                //Save cartItem to database
                cartItemInstance.save(flush: true)
                
                //checking cart
                cartInstance.totalAmount += itemInstance.price
                cartInstance.cartItem.add(cartItemInstance)
                cartInstance.save(flush: true)
            }
            flash.message = "Product is added to shopping cart"
            redirect(action: "show", id: params.id)
        }
        //if a cart does not exist in a session
        else {
            cartInstance = new Cart()
            //checking cartItem
            cartItemInstance = new CartItem()
            cartItemInstance.quantity += 1
            cartItemInstance.price = itemInstance.price // must add the design price also!
            cartItemInstance.item = itemInstance
            
                //Add DESIGN AND LOGO
                if(params.design01!=null){
                   def designInstance = Design.get(params.design01) //GET DESIGN ID FROM PARAMETER
                // Else we will add the existing design to the item
                  if(designInstance!=null){
                     cartItemInstance.addToDesign01(designInstance); 
                  }else{//If design is not found in database, we will create a new instance
                     designInstance = new Design();
                     designInstance.name = "wtf"
                     designInstance.status = "1"
                     designInstance.setUser(User.get(session.user.id));
                     designInstance.designType = "1"
                     designInstance.imageType = "jsp"
                     designInstance.designImage = ""
                     designInstance.save(flush: true);
                     cartItemInstance.addToDesign01(designInstance); 

                  }
                }

            cartItemInstance.save(flush: true)
            //checking cart
            cartInstance.totalAmount += itemInstance.price
            cartInstance.userId = (String)session.user.id
            cartInstance.status = "open"
            cartInstance.save(flush: true)
            cartInstance.addToCartItem(cartItemInstance) //one to many relationship
            flash.message = "Product is added to shopping cart"
            redirect(action: "show", id: params.id)
        }
    } 
    
    
       
    
    
    //shopping cart part
    def addCartItem () {
        def itemInstance = Item.get(params.id) //id from list view
        def cartInstance
        def cartItemInstance
        boolean check = false

        //anyone can add item to cart in a session
        def hasCart = Cart.find("from Cart as c where c.userId=:userId", [userId: (String)session.user.id])
        //if a cart already existed in a session
        if (hasCart != null) {
            cartInstance = hasCart
            if (cartInstance.cartItem != null) {
                //iterating through each cartItem
                cartInstance.cartItem.each {
                    if (it.item == itemInstance) {
                        check = true
                        cartItemInstance = it
                    }
                }
            }
            if (check == true) {

                cartItemInstance.quantity += 1
                cartItemInstance.price = itemInstance.price
                cartItemInstance.save(flush: true)
                //checking cart
                cartInstance.totalAmount += itemInstance.price
                cartInstance.save(flush: true)
            }
            else if (check == false) {
                //checking cartItem
                cartItemInstance = new CartItem()
                cartItemInstance.quantity += 1
                cartItemInstance.price = itemInstance.price
                cartItemInstance.item = itemInstance
                cartItemInstance.save(flush: true)
                //checking cart
                cartInstance.totalAmount += itemInstance.price
                cartInstance.cartItem.add(cartItemInstance)
                cartInstance.save(flush: true)
            }
            flash.message = "Product is added to shopping cart"
            redirect(action: "show", id: params.id)
        }
        //if a cart does not exist in a session
        else {
            cartInstance = new Cart()
            //checking cartItem
            cartItemInstance = new CartItem()
            cartItemInstance.quantity += 1
            cartItemInstance.price = itemInstance.price
            cartItemInstance.item = itemInstance
            cartItemInstance.save(flush: true)
            //checking cart
            cartInstance.totalAmount += itemInstance.price
            cartInstance.userId = (String)session.user.id
            cartInstance.status = "open"
            cartInstance.save(flush: true)
            cartInstance.addToCartItem(cartItemInstance) //one to many relationship
            flash.message = "Product is added to shopping cart"
            redirect(action: "show", id: params.id)
        }
    }

    def deleteCart () {
        def itemInstance = Item.get(params.id) //id from list view
        def cartInstance
        def cartItemInstance
        boolean check = false

        //anyone can add item to cart in a session
        def hasCart = Cart.find("from Cart as c where c.userId=:userId", [userId: (String)session.user.id])
        //if a cart already existed in a session
        hasCart.delete(flush:true)
        redirect(action: "show", id: params.id)
    }

    def deleteCartItem () {
        def itemInstance = Item.get(params.id) //id from list view
        def cartInstance
        def cartItemInstance
        boolean check = false

        //anyone can add item to cart in a session
        def hasCart = Cart.find("from Cart as c where c.userId=:userId", [userId: (String)session.user.id])
        //if a cart already existed in a session
        if (hasCart != null) {
            cartInstance = hasCart
            if (cartInstance.cartItem != null) {
                //iterating through each cartItem
                cartInstance.cartItem.each {
                    if (it.item == itemInstance) {
                        check = true
                        cartItemInstance = it
                        println  cartInstance.totalAmount
                        println  cartItemInstance.price
                        println  cartItemInstance.quantity
                        cartInstance.totalAmount =cartInstance.totalAmount -(cartItemInstance.price*cartItemInstance.quantity)
                        cartInstance.save(flush: true)
                        cartInstance.cartItem.remove(cartItemInstance)
                        cartItemInstance.delete()
                    }
                }
            }
        }
        redirect(action: "show", id: params.id)
    }

    def imageTest(){

    }

    def displayImage(){

        // pass the diplay image
        def itemInstance = Item.get(params.id)
        return [itemInstance: itemInstance]

    }// end display image

    def loadImage = {
        def avatar = Item.get(params.id)
        println "the avatar is "+avatar
        response.setContentType(avatar.imageType)
        response.setContentLength(avatar.itemImage.size())
        OutputStream out = response.getOutputStream();
        out.write(avatar.itemImage);
        out.close();

    }//end item Image
/*
    def search() {

        println params.search + " Ya "
        
        def query = params.search
        
        println "Query " + query

        if(query){

            def srchResults = searchableService.search(query)

            println srchResults + "result"
            render(view:"searchPage", model:[searchInstanceList:srchResults.results])

        }else{
            redirect(action: "index")
        }

    }
    */

    def searchPage(){

    }
    
}
