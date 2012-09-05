<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main2">
    <title>Sample title</title>
<style type="text/css">
      body {
        padding-top: 20px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
        .prev { float:center;width:35%;}
        .next {float:right;width:35%;}
        .savetocart {float:right;width:50%;}

        #steps { list-style:none; width:100%; overflow:hidden; margin:0px; padding:0px;}
        #steps li {font-size:12px; float:left; padding:11px; color:#b0b1b3;}
        #steps li span {font-size:0px; display:hidden;}
        #steps li.current { color:#000;}
        #makeWizard { background-color:#b0232a; color:#fff; padding:5px 10px; text-decoration:none; font-size:18px;}
        #makeWizard:hover { background-color:#000;}
    fieldset.bag {
	}
    legend.bag {
   	    border-bottom: 0px;
    }
    .nextbtn{
	    padding-right:5px;
	    padding-left:5px;
    }    

</style>      
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
    <div class="span10">
      <div class="well span12 hidden-phone"> <!-- span12 / only show for desktop and tablet size. Phone will not show this.-->
       
  <!-- span8 -->
       <div class= "span8 " align="left"> 
      <h3><i class="icon-info-sign"></i> Design Your Own Customize Guitar 

      </h3>

          <div id="container"></div>

       </div>
       <!-- /span8 -->
       
       
       <!-- span4 -->
        <div class= "span4" align="left"> 
      <button class="btn btn-large  btn disabled" style="width:100%;float: right;">
		    <span style="font-size: 15px;">
	         Total Price: $<span id="total">0</span></span></button>
<form id="SignupForm">

<fieldset >
<legend>Choose Type</legend>
<div id="alertbtn" class="alert  alert-info">
<h4 class="alert-heading">Welcome!</h4>
Please select a instrument</div>  
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
<button id="sock" class="btn add01" style="width:100%" onclick="show(this,'soc'); ReplaceImage(0,2,document.getElementById('i1'))" data-amount="24.90">
<div class="span12">
<div class="span5">
<img src="${createLinkTo(dir: 'images/layers', file: 'Electrical_Guitar.png')}">
</div>
<div class="span7">
<h3>Sock Sleeve</h3>SGD$24.90
<h2><i class="icon-ok" id="soc" style="display:none"></i></h2>
</div>
</div>	
</button>
</td>
</tr>
<tr>
<td width="28%">

<img hidden src="${createLinkTo(dir: 'images/layers', file: 'Electrical_Guitar01.png')}" id="i2">
<button id="mini" class="btn add01" style="width:100%" onclick="show(this,'min'); ReplaceImage(0,3,document.getElementById('i2'))" data-amount="14.90">
<div class="span12">
<div class="span5">
<img src="${createLinkTo(dir: 'images', file: 'mini_preview.png')}">
</div>
<div class="span7">
<h3>Mini Sleeve</h3>SGD$14.90
<h2><i class="icon-ok" id="min" style="display:none"></i></h2>
</div>
</div>	
</button>

</td>
</tr>   
    
 <tr>
<td width="28%">

<img hidden src="${createLinkTo(dir: 'images', file: 'sock.png')}" id="i1">
<button id="sock" class="btn add01" style="width:100%" onclick="show(this,'soc'); ReplaceImage(0,2,document.getElementById('i1'))" data-amount="24.90">
<div class="span12">
<div class="span5">
<img src="${createLinkTo(dir: 'images', file: 'sock_preview.png')}">
</div>
<div class="span7">
<h3>Sock Sleeve</h3>SGD$24.90
<h2><i class="icon-ok" id="soc" style="display:none"></i></h2>
</div>
</div>	
</button>
</td>
</tr>
<tr>
<td width="28%">

<img hidden src="${createLinkTo(dir: 'images', file: 'sock.png')}" id="i1">
<button id="sock" class="btn add01" style="width:100%" onclick="show(this,'soc'); ReplaceImage(0,2,document.getElementById('i1'))" data-amount="24.90">
<div class="span12">
<div class="span5">
<img src="${createLinkTo(dir: 'images', file: 'sock_preview.png')}">
</div>
<div class="span7">
<h3>Sock Sleeve</h3>SGD$24.90
<h2><i class="icon-ok" id="soc" style="display:none"></i></h2>
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



        <fieldset>
            <legend>Choose Background</legend>
 <table class="table table-condensed">
        <thead>

          <tr>
	     <td colspan="2">
        <button class="btn btn-success" style="width:100%" data-toggle="modal" href="#background" >
	        <span style="font-size: 20px;">
			    <i class="icon-edit"></i><br>
			</span>
			 Choose Background
		</button>    	            
		<br><br>
		
	  <button class="btn btn-small btn-info" id="getOuterShow" style="width:49%">
        Edit
      </button>
      <button class="btn btn-small btn-info" id="getOuterHide" style="width:49%">
        Done
      </button>    
      		
            </td>    
          </tr>
            <div id="getOuter">
		     <div id="background" class="modal hide fade" style="display: none; ">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">×</button>
              <h3>Modal Heading</h3>
            </div>
            <div class="modal-body">

        <ul class="unstyled span12">    
        <li class="span2">
        <a onclick="ReplaceImage(1,0,document.getElementById('i3'))" data-amount="14.90" class="add02">
    
        <img src="${createLinkTo(dir: 'images', file: '238.jpeg')}" width="40px" height="40px" id="i4">
        </a>
        </li>
        <li class="span2">
        <a onclick="ReplaceImage(1,0,document.getElementById('i4'))" data-amount="14.90" class="add02">
        <img src="${createLinkTo(dir: 'images', file: '385.jpeg')}" width="40px" height="40px" id="i4">
        </a>
        </li>
        <li class="span2">        
        <a onclick="ReplaceImage(1,0,document.getElementById('i5'))" data-amount="14.90" class="add02">
        <img src="${createLinkTo(dir: 'images', file: '385.jpeg')}" width="40px" height="40px" id="i5">
        </a>
        </li>
        <li class="span2">
        <a onclick="ReplaceImage(1,0,document.getElementById('i6'))" data-amount="14.90" class="add02">
        <img src="${createLinkTo(dir: 'images', file: '385.jpeg')}" width="40px" height="40px" id="i6">
        </a>       
        </li>
        <li class="span2">
        <a onclick="ReplaceImage(1,0,document.getElementById('i61'))" data-amount="14.90" class="add02">
        <img src="${createLinkTo(dir: 'images', file: '385.jpeg')}" width="40px" height="40px" id="i61">
        </a>   
        </li>
        </ul>
        
            </div>
		     </div>
        </div>

          <tr>
	     <td colspan="2">
        <button class="btn btn-success" style="width:100%" data-toggle="modal" href="#inner" >
	        <span style="font-size: 20px;">
			    <i class="icon-edit"></i><br>
			</span>
			 Choose Inner Background
		</button>    	            
            </td>    
          </tr>
            <div id="getInner">
		     <div id="inner" class="modal hide fade" style="display: none; ">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">×</button>
              <h3>Modal Heading</h3>
            </div>
            <div class="modal-body">

        <ul class="unstyled span12">    
        <li class="span2">
        <a onclick="ReplaceImage(2,0,document.getElementById('i7'))">
<img alt="20" height="40" src="${createLinkTo(dir: 'images', file: '1.png')}" width="40" id="i7">
        </a>
        </li>
        <li class="span2">
        <a onclick="ReplaceImage(2,0,document.getElementById('i8'))">
<img alt="20" height="40" src="${createLinkTo(dir: 'images', file: '2.png')}" width="40" id="i8">
        </a>
        </li>
        <li class="span2">        
        <a onclick="ReplaceImage(2,0,document.getElementById('i9'))">
<img alt="20" height="40" src="${createLinkTo(dir: 'images', file: '3.png')}" width="40" id="i9">
        </a>
        </li>
        <li class="span2">
        <a onclick="ReplaceImage(2,0,document.getElementById('i10'))">
<img alt="20" height="40" src="${createLinkTo(dir: 'images', file: '4.png')}" width="40" id="i10">
        </a>      
        </li>
        <li class="span2">
        <a onclick="ReplaceImage(2,0,document.getElementById('i11'))">
<img alt="20" height="40" src="${createLinkTo(dir: 'images', file: '20.png')}" width="40" id="i11">
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
	  <button class="btn btn-small btn-info" id="getLogoShow" style="width:49%">
        Edit
      </button>
      <button class="btn btn-small btn-info" id="getLogoHide" style="width:49%">
        Done
      </button> 		        
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
            <legend>Product Details</legend>

<form class="form-inline">

        <input type="text" placeholder="Enter Laptop's Name here..."  id='bag_name' style="width:86%;" class="chzn-container chzn-container-multi" >
           
          <div class="control-group">
            <div class="controls">
              <label class="controls">
        <select data-placeholder="Enter Laptop's Model here..." style="width:90%;" class="chzn-select-deselect" tabindex="7">
          <option value=""></option>
          <option>American Black Bear</option>
          <option>Asiatic Black Bear</option>
          <option>Brown Bear</option>
          <option>Giant Panda</option>
          <option>MacBook Pro 13"</option>
          <option>Sun Bear</option>
          <option>Polar Bear</option>
          <option>Spectacled Bear</option>
        </select>  
             </label>
            </div>
          </div>
          <div class="control-group">
            <div class="controls">
        <select data-placeholder="Enter tags here..." style="width:90%;" multiple class="chzn-select" tabindex="8">
          <option value=""></option>
          <option>Technology</option>
          <option>Abstract</option>
          <option>Anime</option>
          <option>Adult</option>
          <option>MacBook Pro 13"</option>
          <option disabled>Children</option>
          <option>Dark</option>
          <option>Nature</option>
        </select>
            </div>
          </div>
          <div class="control-group">
            <div class="controls">
              <label class="checkbox">
    <input type="checkbox"> Allow others to view & purchase this item
  </label>
        <select data-placeholder="Share with Friends..." style="width:90%;" multiple class="chzn-select" tabindex="8">
          <option value=""></option>
          <option>Technology</option>
          <option>Abstract</option>
          <option>Anime</option>
          <option>Adult</option>
          <option>MacBook Pro 13"</option>
          <option disabled>Children</option>
          <option>Dark</option>
          <option>Nature</option>
        </select>
            </div>
          </div>
 
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

    
<button id='save' type='submit' class='savetocart btn btn-large btn-success'><i class='icon-white  icon-shopping-cart'></i>  Add to Cart</button>  
      </form><!-- form from previous fieldset-->
        </fieldset>

          </div>
        <!-- /span4 -->

      </div> <!-- /span12 -->
    </div>
  </body>
</html>
