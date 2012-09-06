<!DOCTYPE>
<html>
  <head>
    <meta name="layout" content="main2">
    <title>Sample title</title>
<script>
  
// Window on load
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
      window.onload = function() {
          document.getElementById('step0Next').style.display='none';
      	  //Stage on load
          stage = new Kinetic.Stage({
          container: "container",
          width: 540,
          height: 512
        });

        //Default images on load
        var sources = {
          typebag: "${createLinkTo(dir: 'images', file: 'zipper.png')}",
        };
        loadImages(sources, initStage);  
        
          
      };//end window onload

      </script>
      
<style type="text/css">
      canvas {
        border: 0px solid #999;
        position:absolute;left:0px;top:0px;width:100%;height:100%;
      }
      
      body {
        padding-top: 20px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }        
      


        fieldset { border:none; width:auto;}
        legend { font-size:18px; margin:0px; padding:10px 0px; color:#b0232a; font-weight:bold;}
        label { display:block; margin:15px 0 5px;}
        input[type=text], input[type=password] { width:300px; padding:5px; border:solid 1px #000;}
        
        button { background-color:#b0232a; padding:5px 10px; color:#fff; text-decoration:none;}
        .prev { float:center;width:35%;}
        .next {float:right;width:35%;}
        .savetocart {float:right;width:45%;}
        button:hover, .prev:hover, .next:hover { background-color:#000; text-decoration:none;}

        button { border: none; }

        #controls { background: #eee; box-shadow: 0 0 16px #999; height: 30px; position: fixed; padding: 10px; top: 0; left: 0; width: 100%; z-index: 1 }
        #controls h1 { color: #666; display: inline-block; margin: 0 0 8px 0 }
        #controls input[type=text] { border-color: #999; margin: 0 25px; width: 120px }
        
        #steps { margin: 50px 0 0 0 }
</style> 
    <g:external dir="css" file="formToWizard.css" />
    <g:external dir="css" file="validationEngine.jquery.css" />
  </head>
  <body>
    <div class="span10"> <!-- span10 -->  
<ul class="breadcrumb">
  <li>
    <a href="#">Home</a> <span class="divider">&nbsp</span>
  </li>
  <li>
    <a href="#">Library</a> <span class="divider">&nbsp</span>
  </li>
  <li class="active">Data</li>
    <li class="pull-right">
<i class="icon-shopping-cart icon-white"></i>Cart
    </li>
    <li class="pull-right">
<i class="icon-user icon-white"></i>Account    
    </li>

</ul>
    </div>
  <!-- span8 -->
       <div class= "span6 well " align="left"> 
      <h3><i class="icon-info-sign"></i> Design Your Own Customize Guitar 
      </h3>
          <div id="container"></div>
       </div>
       <!-- /span8 -->

    <div class="span4 well">
      <button class="btn btn-large  btn disabled" style="width:100%;float: right;">
		    <span style="font-size: 15px;">
	         Total Price: $<span id="total">0</span></span></button>

    <form id="diy_purchase" action="">
        <fieldset>
            <legend>Select Guitar</legend>
<div id="alertbtn" class="alert  alert-info">
<h4 class="alert-heading">Welcome!</h4>
Please select a type of Guitars</div>  
<div data-spy="scroll" data-target="#navbarExample" data-offset="50" class="scrollspy-example">
<table  class="table table-condensed"  id="getType">
<thead >
<tr>
<td width="28%">
  
<img hidden src="${createLinkTo(dir: 'images/layers', file: 'Guitar02.png')}" id="i0">
<button id="zipper" class="btn add01" style="width:100%" onclick="show(this,'zip'); ReplaceImage(0,1,document.getElementById('i0'))" data-amount="300.90">
<div class="span12">
<div class="span5">
<img src="${createLinkTo(dir: 'images/layers', file: 'Guitar01.png')}">
</div>
<div class="span7">
<h3>Classical Guitar</h3>SGD$300.90
<h2><i class="icon-ok" id="zip" style="display:none"></i></h2>
</div>
</div>		    
</button>       
</td>
</tr>
    
<tr>
<td width="28%">

<img hidden src="${createLinkTo(dir: 'images/layers', file: 'Electrical_Guitar01.png')}" id="i1">
<button id="sock" class="btn add01" style="width:100%" onclick="show(this,'soc'); ReplaceImage(0,2,document.getElementById('i1'))" data-amount="2199.99">
<div class="span12">
<div class="span5">
<img src="${createLinkTo(dir: 'images/layers', file: 'Electrical_Guitar.png')}">
</div>
<div class="span7">
<h3>Eric Clapton Stratocaster®</h3>SGD$2199.99
<h2><i class="icon-ok" id="soc" style="display:none"></i></h2>
</div>
</div>	
</button>
</td>
</tr>
<tr>
<td width="28%">

<img hidden src="${createLinkTo(dir: 'images/layers', file: 'Electrical_Guitar01.png')}" id="i2">
<button id="mini" class="btn add01" style="width:100%" onclick="show(this,'min'); ReplaceImage(0,3,document.getElementById('i2'))" data-amount="2399.99">
<div class="span12">
<div class="span5">
<img src="${createLinkTo(dir: 'images/layers', file: 'Electrical_Guitar.png')}">
</div>
<div class="span7">
<h3>Yngwie Malmsteen Stratocaster®</h3>SGD$2399.99
<h2><i class="icon-ok" id="min" style="display:none"></i></h2>
</div>
</div>	
</button>
</td>
</tr>   
</tbody>
</table>
</div>
<br>

        </fieldset>
<!-- Second Fieldset -->

<!-- Second Fieldset -->
<fieldset>
<legend>Design & Logo</legend>
 <table class="table table-condensed">
        <thead>
          <tr>
            <td>
              
        <button class="btn" style="width:100%" data-toggle="modal" href="#upload" >
	        <span style="font-size: 20px;">
		  <i class="icon-circle-arrow-up"></i><br>
		</span>
	Upload Design
	</button>                   
            </td>
	     <td>
        <button class="btn btn-success" style="width:100%" data-toggle="modal" href="#background" >
	        <span style="font-size: 20px;">
		  <i class="icon-edit"></i><br>
		</span>
	Choose Design
	</button>    	                    		
              </td>    
         </tr>
         <tr>
           <td></td>
           <td>
      <a class="btn btn-small btn-info" id="getOuterShow" style="width:36%">
        Edit
      </a>
      <a class="btn btn-small btn-info" id="getOuterHide" style="width:36%">
        Done
      </a>  
           </td>
         </tr>


<!-- Drop down design for upload file-->
<div id="getUpload">
<div id="upload" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none; ">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">×</button>
              <h3>
              </h3>
              <h3 id="myModalLabel" class="input-append">
              Upload Design
              </h3>    
</div>
   <div class="modal-body">
               <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem.</p>
<uploadr:add name="myFifthUploadr" path="/Users/u0906902/Desktop" direction="up" rating="true" class="demo" placeholder="Behold: the drop area!" fileselect="Behold: the fileselect!" maxVisible="4" noSound="true">
 
</uploadr:add>
    </div>
    <div class="modal-footer">
              <button class="btn" data-dismiss="modal">Close</button>
    </div>
</div>
</div>
<!-- End of Drop down design -->   
         
         
         
<!-- Drop down design -->
<div id="getOuter">
<div id="background" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none; ">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">×</button>
              <h3>
              </h3>
              <h3 id="myModalLabel" class="input-append">
                <span class="span6">Choose Design</span>
                
                <input class="span4" id="appendedInputButton" size="16" type="text"><button class="btn" type="button">Search</button>
              </h3>
              <div id="navbar" class="span12 pagination pagination-centered" >
              <ul>
                <li class="disabled"><a href="#">«</a></li>
                <li class="active"><a href="#1">1</a></li>
                <li><a href="#getOuter1">2</a></li>
                <li><a href="#3">3</a></li>
                <li><a href="#4">4</a></li>
                <li><a href="#getOuter6">5</a></li>
                <li><a href="#6">»</a></li>
             </ul>
            </div>     
</div>
   <div class="modal-body">
              <h4>Text in a modal</h4>
               <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem.</p>
               
  <div data-spy="scroll" data-target=".navbar" class="thumbnails span12">
     <a id="getOuter1" onclick="ReplaceImage(1,0,document.getElementById('i3')); swapBorder(this)" data-amount="14.90" class="add02">    
       <div class="thumbnail span4">
        <img src="${createLinkTo(dir: 'images', file: '238.jpeg')}" id="i3">
       <div class="caption">
             Facebook(+5) Twitter (+5)
       </div>
       </div>  
     </a>
     <a id="getOuter2" onclick="ReplaceImage(1,0,document.getElementById('i4'))" data-amount="15.90" class="add02">    
       <div class="thumbnail span4">
        <img src="${createLinkTo(dir: 'images', file: '385.jpeg')}" id="i4">
       <div class="caption">
             Facebook(+5) Twitter (+5)
       </div>
       </div>  
     </a>
     <a id="getOuter3" onclick="ReplaceImage(1,0,document.getElementById('i5'))" data-amount="16.90" class="add02">    
       <div class="thumbnail span4">
        <img src="${createLinkTo(dir: 'images', file: '238.jpeg')}" id="i5">
       <div class="caption">
             Facebook(+5) Twitter (+5)
       </div>
       </div>  
     </a>
            

     <a id="getOuter4" onclick="ReplaceImage(1,0,document.getElementById('i3'))" data-amount="14.90" class="add02">    
       <div class="thumbnail span4">
        <img src="${createLinkTo(dir: 'images', file: '238.jpeg')}" id="i3">
       <div class="caption">
             Facebook(+5) Twitter (+5)
       </div>
       </div>  
     </a>
     <a id="getOuter5" onclick="ReplaceImage(1,0,document.getElementById('i4'))" data-amount="14.90" class="add02">    
       <div class="thumbnail span4">
        <img src="${createLinkTo(dir: 'images', file: '385.jpeg')}" id="i4">
       <div class="caption">
             Facebook(+5) Twitter (+5)
       </div>
       </div>  
     </a>
     <a id="getOuter6" onclick="ReplaceImage(1,0,document.getElementById('i5'))" data-amount="14.90" class="add02">    
       <div class="thumbnail span4">
        <img src="${createLinkTo(dir: 'images', file: '238.jpeg')}" id="i5">
       <div class="caption">
             Facebook(+5) Twitter (+5)
       </div>
       </div>  
     </a>
   </div>
                       
    </div>
    <div class="modal-footer">
              <button class="btn" data-dismiss="modal">Close</button>
    </div>
</div>
</div>
<!-- End of Drop down design -->
        </thead>
      </table>

        </fieldset>
        
               
        <fieldset>
            <legend>Choose Logo</legend>
 <table class="table table-condensed">
        <thead>
        <tr>
	     <td colspan="2">
        <button class="btn btn-success" style="width:100%" data-toggle="modal" href="#logo" >
	        <span style="font-size: 20px;">
			    <i class="icon-edit"></i><br>
			</span>
			 Choose Logo
		</button>    	    
		
		<br><br>
	  <a class="btn btn-small btn-info" id="getLogoShow" style="width:43%">
        Edit
      </a>
      <a class="btn btn-small btn-info" id="getLogoHide" style="width:43%">
        Done
      </a> 		        
            </td>    
          </tr>


            <div id="getLogo">
		     <div id="logo" class="modal hide fade" style="display: none; ">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">×</button>
              <h3>Modal Heading</h3>
            </div>
            <div class="modal-body">

        <ul class="unstyled span12">    
        <li class="span2">
        <a onclick="ReplaceImage(3,0,document.getElementById('i12'))">
<img alt="20" height="40" src="${createLinkTo(dir: 'images', file: 'Luffy_Flag___One_Piece_by_Sanji_Devastador.png')}" width="40" id="i12">
        </a>
        </li>
        <li class="span2">
        <a onclick="ReplaceImage(3,0,document.getElementById('i13'))">
<img alt="20" height="40" src="${createLinkTo(dir: 'images', file: 'Luffy_One_Piece_Chibi.png')}" width="40" id="i13">
        </a>
        </li>
        <li class="span2">        
        <a onclick="ReplaceImage(3,0,document.getElementById('i14'))">
<img alt="20" height="40" src="${createLinkTo(dir: 'images', file: 'tony.png')}" width="40" id="i14">
        </a>
        </li>
        <li class="span2">
        <a onclick="ReplaceImage(3,0,document.getElementById('i15'))">
<img alt="20" height="40" src="${createLinkTo(dir: 'images', file: 'Tony_Tony_Chopper.png')}" width="40" id="i15">
        </a>   
        </li>
        <li class="span2">   
        <a onclick="ReplaceImage(3,0,document.getElementById('i16'))">
<img alt="20" height="40" src="${createLinkTo(dir: 'images', file: 'Very_Big_One_Piece_Logo_by_hothcold.png')}" width="40" id="i16">
        </a>     
        </li>
        </ul>
        
            </div>
		     </div>
        </div>    
         </thead>
      </table>           
        </fieldset>        


        <fieldset>
            <legend>Confirmation</legend>
            
 <table class="table table-condensed">
        <thead>
        <tr>
        <td>Bag:</td>
        <td>S$<span id="sum01">0</span></td>
        </tr>
                
        <tr>
        <td>Outer Background:</td>
        <td>S$<span id="sum02">0</span></td>
        </tr>
        
        <tr>
        <td>Inner Background:</td>
        <td>S$<span id="sum03">0</span></td>
        </tr>
        
        <tr>
        <td>Logo:</td>
        <td>S$<span id="sum04">0</span></td>
        </tr>
        <tr><td></td><td></td></tr>
        <tr>
        <td>Total:</td>
        <td>S$<span id="total02">0</span></td>
        </tr>                        
        </thead>
 </table>          
<a onclick="addToCart()" id='SaveAccount' type='button' class='savetocart btn btn-large btn-success'><i class='icon-white  icon-shopping-cart'></i>  Add to Cart</a>  

        </fieldset>  
    </form>
      </div> <!-- /span4 -->
  </body>   
</html>
