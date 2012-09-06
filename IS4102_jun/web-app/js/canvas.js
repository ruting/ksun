// To sum the total amount of the DIY Product	 
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
     var sum01 = 0;
     var sum02 = 0;
     var sum03 = 0;
     var sum04 = 0;
     //document.getElementById("res").value = test
	 $('.add01').click(function() {
	 sum01 = parseFloat($(this).data('amount')).toFixed(2);
     $('#total').text(sum01);
     $('#sum01').text(sum01);
     $('#total02').text(sum01);

  });	 
	 $('.add02').click(function() {
	 sum02 = parseFloat($(this).data('amount')).toFixed(2);
	 var num = ( parseFloat(sum01) + parseFloat(sum02) ).toFixed(2);
     $('#total').text(num);
     $('#sum02').text(sum02);
     $('#total02').text(num);
     
  });
	 $('.add03').click(function() {
	 sum03 = parseFloat($(this).data('amount')).toFixed(2);
	 var num = ( parseFloat(sum01) + parseFloat(sum02) + parseFloat(sum03) ).toFixed(2);
     $('#total').text(num);
     $('#sum03').text(sum03);
     $('#total02').text(num);
    
  });
 	 $('.add04').click(function() {
	 sum04 = parseFloat($(this).data('amount')).toFixed(2);
	 var num = ( parseFloat(sum01) + parseFloat(sum02) + parseFloat(sum03) + parseFloat(sum04) ).toFixed(2);
     $('#total').text(num);
     $('#sum04').text(sum04);
     $('#total02').text(num);
  }); 

//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
    
    
// Preparing the stage
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
       
        var stage 	= null;
        var imagetype = 0;
        var image01 = "${createLinkTo(dir: 'images', file: 'zipper.png')}"; // Type image
        var image02 = "${createLinkTo(dir: 'images', file: 'zipper.png')}"; // Outer image
        var image03 = "${createLinkTo(dir: 'images', file: 'zipper.png')}"; // Inner image
        var image04 = "${createLinkTo(dir: 'images', file: 'zipper.png')}"; // Logo image
        var image02_Size = [[0,0],[570,400],[400,470],[215,305]];
        var image02_XY   = [[0,0],[24,100],[110,28],[200,170]];
        var image03_Size = [[0,0],[120,140],[80,100],[80,100]];
        var image03_XY   = [[0,0],[474,364],[417,395],[333,377]];   
        var image04_Size = [[0,0],[100,100],[100,100],[100,100]];

// Preparing the cursor and image resize position
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------

      /*Function to decide which cursor to choose depending upon the activeAnchor */
        function SelectCursor(activeAnchor){
            switch(activeAnchor.getName()){
                case "topLeft": document.body.style.cursor = "nw-resize";break;
                case "topRight": document.body.style.cursor = "ne-resize";break;
                case "bottomRight": document.body.style.cursor = "se-resize";break;
                case "bottomLeft": document.body.style.cursor = "sw-resize";break;
            }
        }     
      //End SelectCursor function
        
    	//Update function
        function update(group, activeAnchor) {
         var topLeft = group.get(".topLeft")[0];
         var topRight = group.get(".topRight")[0];
         var bottomRight = group.get(".bottomRight")[0];
         var bottomLeft = group.get(".bottomLeft")[0];
         var image = group.get(".image")[0];

        // update anchor positions
        switch (activeAnchor.getName()) {
          case "topLeft":
            topRight.attrs.y = activeAnchor.attrs.y;
            bottomLeft.attrs.x = activeAnchor.attrs.x;
            break;
          case "topRight":
            topLeft.attrs.y = activeAnchor.attrs.y;
            bottomRight.attrs.x = activeAnchor.attrs.x;
            break;
          case "bottomRight":
            bottomLeft.attrs.y = activeAnchor.attrs.y;
            topRight.attrs.x = activeAnchor.attrs.x;
            break;
          case "bottomLeft":
            bottomRight.attrs.y = activeAnchor.attrs.y;
            topLeft.attrs.x = activeAnchor.attrs.x;
            break;
        }
        
        image.setPosition(topLeft.attrs.x, topLeft.attrs.y);
        image.setSize(topRight.attrs.x - topLeft.attrs.x, bottomLeft.attrs.y - topLeft.attrs.y);
      }
      //Update function ends

       //addAnchor function
      function addAnchor(group, x, y, name, getOuterImgUpdate) {
        var stage = group.getStage();
        var layer = group.getLayer();

         var anchor = new Kinetic.Circle({
          x: x,
          y: y,
          stroke: "#666",
          fill: "#ddd",
          strokeWidth: 1,
          radius: 8,
          name: name,
          draggable: true,
          alpha: 0
        });
       
       /** 
        Do not create a new anchor points
        for image02. Only update 
        the anchor points to fit
        the selected image.
       **/
       if(getOuterImgUpdate){
       
       //top Right       
       group.get(".topRight")[0].attrs.y = image02_XY[imagetype][1];      
       group.get(".topRight")[0].attrs.x = image02_XY[imagetype][0] + image02_Size[imagetype][0];
       //top Left
       group.get(".topLeft")[0].attrs.x = image02_XY[imagetype][0];       
       group.get(".topLeft")[0].attrs.y = image02_XY[imagetype][1];
       //bottom Right
       group.get(".bottomRight")[0].attrs.y = image02_XY[imagetype][1] + image02_Size[imagetype][1];
       group.get(".bottomRight")[0].attrs.x = image02_XY[imagetype][0] + image02_Size[imagetype][0];   
       //bottom Left
       group.get(".bottomLeft")[0].attrs.y = image02_XY[imagetype][1] + image02_Size[imagetype][1];       
       group.get(".bottomLeft")[0].attrs.x = image02_XY[imagetype][0];
       
      }else{
        group.on("mouseover", function() {
	      anchor.setAlpha(1);
          layer.draw();
        });
        group.on("mousedown", function() {
	      anchor.setAlpha(1);
          layer.draw();
        });          
        group.on("mouseout", function() {
	      anchor.setAlpha(0);
	      document.body.style.cursor = "default";
          layer.draw();
        });        
        anchor.on("dragmove", function() {
          update(group, this);
          layer.draw();
        });
        anchor.on("mousedown touchstart", function() {
          group.setDraggable(false);
          this.moveToTop();
        });
        anchor.on("dragend", function() {
          group.setDraggable(true);
          layer.draw();
        });
        // add hover styling
        anchor.on("mouseover", function() {
          var layer = this.getLayer();
          SelectCursor(this);                
          anchor.remove();
          layer.draw();
        });
        anchor.on("mouseout", function() {
          var layer = this.getLayer();
          document.body.style.cursor = "default";
          this.setStrokeWidth(2);
          layer.draw();
        });

        group.add(anchor);
       
        }
        
      }
      //End addAnchor function
 //--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------

// Load Image on load
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------

      //Load default images on load
      function loadImages(sources, callback) {
        var images = {};
        var loadedImages = 0;
        var numImages = 0;
        for(var src in sources) {
          numImages++;
        }
        for(var src in sources) {
          images[src] = new Image();
          images[src].onload = function() {
            if(++loadedImages >= numImages) {
              callback(images);
            }
          };
          images[src].src = sources[src];
        }
      }
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//End Load default images on load
  
// Initialise Stage
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
    
      //initStage
      function initStage(images) {

        var typebagGroup = new Kinetic.Group({
          x: 0,
          y: 0,
          draggable: false
        });

        var outerbagGroup = new Kinetic.Group({
          x: 0,
          y: 0,
          draggable: true
        });
 
        var innerbagGroup = new Kinetic.Group({
          x: 0,
          y: 0,
          draggable: true
        });
                       
        var logobagGroup = new Kinetic.Group({
          x: 0,
          y: 0,
          draggable: true,
        });      
        
        var layer = new Kinetic.Layer();

        /*
         * Add the groups
         * to the layer and the layer to the
         * stage so that the groups have knowledge
         * of its layer and stage
         */
        layer.add(typebagGroup);    
        layer.add(outerbagGroup); 
        layer.add(innerbagGroup);
        layer.add(logobagGroup);
        stage.add(layer);

      
        // typebag
        var typebagImg = new Kinetic.Image({
          x: 0,
          y: 0,
          image: images.typebag,
          width: 600,
          height: 512,
          name: "image",
        });
        typebagGroup.add(typebagImg);


        // InnerBag
        var innerbagImg = new Kinetic.Image({
          x: 0,
          y: 0,
          name: "image"
        });
        innerbagGroup.add(innerbagImg);


        // OuterBag
        var outerbagImg = new Kinetic.Image({
          x: 0,
          y: 0,
          name: "image"
        });
            outerbagGroup.add(outerbagImg);      
            addAnchor(outerbagGroup, 0, 0, "topLeft", false);
        	addAnchor(outerbagGroup, 0, 0, "topRight",false);
        	addAnchor(outerbagGroup, 0, 0, "bottomRight",false);
        	addAnchor(outerbagGroup, 0, 0, "bottomLeft",false); 
      
        	        
        // LogoBag
        var logobagImg = new Kinetic.Image({
          x: image02_Size[1][0]/2,
          y: image02_Size[1][1]/2,
          name: "image"
        });
        logobagGroup.add(logobagImg);
       	addAnchor(logobagGroup, image02_Size[1][0]/2, image02_Size[1][1]/2, "topLeft",false);
        	addAnchor(logobagGroup, 100 + image02_Size[1][0]/2 , image02_Size[1][1]/2 , "topRight",false);
        	addAnchor(logobagGroup, 100 + image02_Size[1][0]/2, 100 + image02_Size[1][1]/2, "bottomRight",false);
        	addAnchor(logobagGroup, image02_Size[1][0]/2,100 + image02_Size[1][1]/2, "bottomLeft",false); 
        	
        	
        stage.draw();
        
// if the page detect that there are some conditions, below will be executed.
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------        
        //Get the type of Guitars (SAMPLE)

var guitar = getUrlVars()["type"];
        if(null!=guitar){
            $("#zipper1").click();
             //show(document.getElementById('zipper'),'zip');
             //ReplaceImage(0,1,document.getElementById('i0'));
            getTypeChange();
            $("#getOuter1").click(); //to pass the cost of the outer layer
            ReplaceImage(1,0,document.getElementById('i4'));  
              outerbagGroup.moveToBottom();
	      outerbagGroup.setAlpha(1);
              getOuterChange();
              layer.draw();
        $( '#diy_purchase' ).formToWizard( 'GotoStep', '3' );
        document.getElementById('step0Next').style.display='block';

        // On default, the guitar will be the first selected one and background will
        // be the first selected one.
        // Only logo will be not set
        }else{
            //enable the first button to be active
            document.getElementById('step0Next').style.display='block';
            //Select the first object
            $("#zipper1").click();
            //Update Changes to the canvas
            getTypeChange();
            //Select the first background image for the guitar
            $("#getOuter1").click(); //to pass the cost of the outer layer
            ReplaceImage(1,0,document.getElementById('d1'));  
            outerbagGroup.moveToBottom();
	    outerbagGroup.setAlpha(1);
            //Update Changes to the canvas
            getOuterChange();
            
            //Draw everything into the canvas
            layer.draw();

        }
        
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------       
     
    
          document.getElementById("getType").addEventListener("click", function() {
              getTypeChange();
              layer.draw();
              }, false);


          document.getElementById("getOuter").addEventListener("click", function() {
            outerbagGroup.moveToBottom();
	        outerbagGroup.setAlpha(1);	             
            getOuterChange();
            layer.draw();
              }, false);
          document.getElementById("getOuterShow").addEventListener("click", function() {
	        outerbagGroup.moveToTop();
	        outerbagGroup.setAlpha(0.5);
	        layer.draw();
              }, false);
          document.getElementById("getOuterHide").addEventListener("click", function() {
            outerbagGroup.moveToBottom();
	        outerbagGroup.setAlpha(1);            
	        layer.draw();
              }, false);
                 
                                  
          document.getElementById("getLogo").addEventListener("click", function() {
           	logobagGroup.moveToBottom();
           	outerbagGroup.moveToBottom();
            getLogoChange();
            layer.draw();
              }, false);                                                      
          document.getElementById("getLogoShow").addEventListener("click", function() {
            innerbagGroup.moveToBottom();
	        logobagGroup.moveToTop();
	        logobagGroup.setAlpha(0.5);
	        layer.draw();
              }, false);
          document.getElementById("getLogoHide").addEventListener("click", function() {
            innerbagGroup.moveToBottom();
           	logobagGroup.moveToBottom();
           	outerbagGroup.moveToBottom();
	        logobagGroup.setAlpha(1);            
	        layer.draw();
              }, false);

        //getTypeChange()
        function getTypeChange() {
        
        	//Update the anchor points for different selected type bags
            addAnchor(outerbagGroup, image02_XY[imagetype][0], image02_XY[imagetype][1], "topLeft", true);
        	addAnchor(outerbagGroup, image02_XY[imagetype][0] + image02_Size[imagetype][0], image02_XY[imagetype][1], "topRight",true);
        	addAnchor(outerbagGroup, image02_XY[imagetype][0] + image02_Size[imagetype][0], image02_XY[imagetype][1] + image02_Size[imagetype][1], "bottomRight",true);
        	addAnchor(outerbagGroup, image02_XY[imagetype][0], image02_XY[imagetype][1] + image02_Size[imagetype][1], "bottomLeft",true); 
        
            outerbagGroup.hide(outerbagImg);
            innerbagGroup.hide(outerbagImg);
            logobagGroup.hide(outerbagImg);
            
        	typebagGroup.remove(typebagImg);
        	typebagImg.setImage(image01);
        	typebagGroup.add(typebagImg);

        	//Set innerbag img size & position depend on type of bag
       		innerbagImg.setSize( image03_Size[imagetype][0], image03_Size[imagetype][1] );
       		innerbagImg.setX( image03_XY[imagetype][0]);
       	 	innerbagImg.setY( image03_XY[imagetype][1]);
       	 	
        	//Set outerbag img size & position depend on type of bag       	 	
       		outerbagImg.setSize( image02_Size[imagetype][0], image02_Size[imagetype][1] );
       		outerbagImg.setX( image02_XY[imagetype][0]);
       	 	outerbagImg.setY( image02_XY[imagetype][1]);

        	//Set outerbag grop position depend on type of bag       	 	       	 	
            outerbagGroup.setX(0);            
            outerbagGroup.setY(0);
            
        	//Set outerbag img size & position depend on type of bag       	 	
             logobagImg.setSize( image04_Size[imagetype][0], image04_Size[imagetype][1] );
        	
        };
        //End getTypeChange()
        
        //getOuterChange()
        function getOuterChange() {
	outerbagGroup.show(outerbagImg);
        	//outerbagGroup.remove(outerbagImg);
        	outerbagImg.setImage(image02);
        };
        //End getOuterChange()        

        //getInnerChange()
        function getInnerChange() {
         innerbagGroup.show(innerbagImg);
        	innerbagGroup.remove(innerbagImg);
        	innerbagImg.setImage(image03);
        	innerbagGroup.add(innerbagImg);
        };
        //End getInnerChange()     

        //getLogoChange()
        function getLogoChange() {
         logobagGroup.show(logobagImg);
        	logobagGroup.remove(logobagImg);
        	logobagImg.setImage(image04);
        	logobagGroup.add(logobagImg);
        };
        //End getLogoChange()     
                
      }
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
// End initStage


// Read a page's GET URL variables and return them as an associative array.
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
function getUrlVars()
{
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}


// Replacement of IMAGES on the CANVAS
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
        function ReplaceImage(pos,type,img) {
        
	        // Get the type of bag
        	switch (type){
			case 0:
			break;
			case 1:
			imagetype='1';
			break;
			case 2:
			imagetype='2';
			break;
			case 3:
			imagetype='3';
			break;				
			}
	        // Change the type of image as indicate "pos"
			switch (pos){
			case 0:
			image01=img;
			break;
			case 1:
			image02=img;
			break;
			case 2:
			image03=img;
			break;
			case 3:
			image04=img;
			break;			
			}
        };




// Array of participating td's ids
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
var show_array = new Array();
var disable_array = new Array();
show_array[0] = 'zip1';
show_array[1] = 'zip2';
show_array[2] = 'zip3';
disable_array[0] = 'zipper1';
disable_array[1] = 'zipper2';
disable_array[2] = 'zipper3';

function show(btn,ele) {

var srcElement = document.getElementById(ele);
for(var i = 0; i < show_array.length; i++) {    
var nav = document.getElementById(show_array[i]);
var nav2 = document.getElementById(disable_array[i]);     
         if(srcElement != null && srcElement.id==nav.id) {
         		   document.getElementById('step0Next').style.display='block';
         		   document.getElementById('alertbtn').style.display='none';
                           srcElement.style.display='block';
                           btn.disabled = "disabled";
                           $(nav2).toggleClass('btn-success');
       }else{
                   nav.style.display='none';
                   nav2.disabled = null;
                   $(nav2).removeClass('btn-success');
                   $(nav2).addClass('btn-default');

       }//end if else 
    }//end if    
  }//end function


//when user is done, this save function will pass the details ( name, price, img, etc ) into the cart. 
function addToCart() {
          /*
           * since the stage toDataURL() method is asynchronous, we need
           * to provide a callback
           */
          stage.toDataURL({
            callback: function(dataUrl) {
                
              /*
               * here you can do anything you like with the data url.
               * In this tutorial we'll just open the url with the browser
               * so that you can see the result as an image
               */
             // window.open(dataUrl);
            }
          }); 
                 document.getElementById("res").value = 1


        //Guitar type (image01)
        //Design ID (image02)
        //Design Price (sum02)
        //Logo ID (image04)
        //Logo Price (sum04)
        var total = ( parseFloat(sum01) + parseFloat(sum02) + parseFloat(sum03) + parseFloat(sum04) ).toFixed(2);
       	toastr.success( 'Item added to Cart! ' + total , 'Guitar Type' + image01);         
       

  }//end function
     



//Swap Function
 $(function() {$('#selection a').click(function() { 
     alert('test');
   return swapBorder(this); 
   }); 
 }); 
 
 function swapBorder(clickObject) { 
    var currentId=clickObject.id; 
        $('#selection a').each(function() { 
          if ($(this).attr('id')==currentId) { 
                  $(this).addClass('active-class'); 
                  alert('test');
            }else{ 
                  $(this).removeClass('active-class'); 
           } 
 }); 
 return false; 
 } 













