<!DOCTYPE>
<%@ page import="khronosun.Item"%>
<%@ page import="khronosun.ItemRating"%>
<%@ page import="khronosun.Category"%>
<%@ page import="khronosun.Design" %>


<%@ page contentType="text/html;charset=UTF-8" %>
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
          //This will set the button to be hidden if no object is being selected
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
</div><!-- End of span10 -->  

<!-- span8 (Main view) -->
<div class= "span6 well " align="left"> 
<h3><i class="icon-info-sign"></i>
 Design Your Own Customize Guitar 
</h3>
<div id="container"></div>
</div>
<!-- /End of span8 -->

<!-- span 4-->
<div class="span4 well">
      <button class="btn btn-large  btn disabled" style="width:100%;float: right;">
	<span style="font-size: 15px;">Total Price: $<span id="total">0</span></span></button>

        
<form id="diy_purchase" action="">
<!-- First Fieldset -->
<fieldset>
<legend>Select Guitar</legend>
<div id="alertbtn" class="alert  alert-info">
<h4 class="alert-heading">Welcome!</h4>
Please select a type of Guitars</div>  
<div data-spy="scroll" data-target="#navbarExample" data-offset="50" class="scrollspy-example">
<table  class="table table-condensed"  id="getType">
<thead>
<!-- This show the number of existing template in the database -->
<g:each in="${itemInstanceList.template.unique()}" status="i" var="template">
<tr>
<td width="28%">
<img hidden src="${createLink(controller:'itemTemplate', action:'loadImage', id:template.id)}" id="g${template.id}">
<button id="zipper${template.id}" class="btn add01" style="width:100%" onclick="show(this,'zip${template.id}'); ReplaceImage(0,1,document.getElementById('g${template.id}'))" data-amount="${template.price}">
<div class="span12">
<div class="span5">
<img src="${createLink(controller:'item', action:'loadImage', id:template.id)}">
</div>
<div class="span7">
<h3>${template.templateName}</h3>SGD$${template.price}
<h2><i class="icon-ok" id="zip${template.id}" style="display:none"></i></h2>
</div>
</div>		    
</button>       
</td>
</tr>
</g:each>
<!-- End This show the number of existing template in the database -->
</thead>
</table>
</div>
<br>
</fieldset>
<!-- End of First Fieldset -->

<!-- Second Fieldset -->
<fieldset>
<legend>Design</legend>
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

<!-- Upload new image (Design images) -->
<div id="getUpload">
<div id="upload" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none; ">
   <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h3 id="myModalLabel" class="input-append">
          Upload Design
          </h3>    
   </div>
   <div class="modal-body">
          <p>Please upload your image here and provide a name for your picture</p>
    <!--<uploadr:demo/>-->
   </div>
    <div class="modal-footer">
          <button class="btn" data-dismiss="modal">Close</button>
    </div>
</div>
</div>
<!-- End of Drop down design -->   
<!-- Choose Existing image (Design images) -->
<div id="getOuter">
<div id="background" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none; ">
    <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">×</button>
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
        <!-- This show the number of existing template in the database -->
        <g:each in="${designInstanceList}" status="i" var="design">
        <a id="getOuter${design.id}" onclick="ReplaceImage(1,0,document.getElementById('d${design.id}')); swapBorder(this)" data-amount="${design.id}" class="add02">    
          <div class="thumbnail span4">
            <img src="${createLink(controller:'design', action:'loadImage', id:design.id)}" id="d${design.id}">
              <div class="caption">
                    Facebook(+5) Twitter (+5)
              </div>
          </div>  
        </a>       
        </g:each>

      </div>             
    </div>
    <div class="modal-footer">
      <button class="btn" data-dismiss="modal">Close</button>
    </div>
</div>
</div>
<!-- End of Choose Existing image (Design images) -->
</thead>
</table>

</fieldset>
<!-- End of Second Fieldset -->
<!-- Third Fieldset -->
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
        </ul>
</div>
</div>
</div>    
</thead>
</table>           
</fieldset>        
<!-- End of third fieldset-->

<!-- Fourth fieldset -->
<fieldset>
<legend>Confirmation</legend>   
 <table class="table table-condensed">
        <thead>
        <tr>
        <td>Bag:</td>
        <td><span id="sum01">0</span></td>
        </tr>
                
        <tr>
        <td>Outer Background:</td>
        <td><span id="sum02">0</span></td>
        </tr>
        
        <tr>
        <td>Inner Background:</td>
        <td><span id="sum03">0</span></td>
        </tr>
        
        <tr>
        <td>Logo:</td>
        <td><span id="sum04">0</span></td>
        </tr>
        <tr><td></td><td></td></tr>
        <tr>
        <td>Total:</td>
        <td><span id="total02">0</span></td>
        </tr>                        
        </thead>
 </table>          
<g:form controller="item">
<g:hiddenField name="item" value="0" id="res" />
<g:hiddenField name="design01" value="2" id="we need to set this" />
<g:hiddenField name="design01_image" value="1" />
<g:hiddenField name="design02" value="0" />
<g:hiddenField name="design02_image" value="0" />
<g:hiddenField name="price" value="0" />
<g:hiddenField name="final_image" value="0" />
<!--      
<a onclick="addToCart()" id='SaveAccount' type='button' class='savetocart btn btn-large btn-success'><i class='icon-white  icon-shopping-cart'></i>  Add to Cart</a>  
//--------------------------------------------------------------------------------------------------------------------------------------------------
// add to cart using the necessary information as such:
// 1: item id, design id 1, design id 2
// 2: item id, design id 1
// 3: item id only (this should be easy to do it)
// 4: item id, cust. design id 1, cust. design id 2
// 5: item id, cust. design id 1
// 6: item id, cust. design id 1, design id 2
-->
<!-- First go to the addToCart JS Function set set all variables for submittion-->
<g:actionSubmit onclick="addToCart()" name="Add to Cart"  value="Add to Cart" action="addCartItemDiy" class='savetocart btn btn-large btn-success ' />
</g:form>
</fieldset>  
<a onclick="addToCart()" id='SaveAccount' type='button' class='savetocart btn btn-large btn-success'><i class='icon-white  icon-shopping-cart'></i>  Add to Cart</a>  

</form>
</div>
<!-- /End of span4 -->

</body>   
</html>
