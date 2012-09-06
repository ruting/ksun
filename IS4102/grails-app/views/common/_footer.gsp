<footer id="box">

  <div class="span4">

    <div class="container_layout">
      <blockquote>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante venenatis.</p>
        <small>Someone famous</small>
      </blockquote>
      <hr>
      <blockquote>
        <p>This is a very creative way of buying! Nice work!</p>
        <small>Someone famous</small>
      </blockquote>
      <hr>
      <blockquote>
        <p>I LIKE IT so much! Thank you very much for providing this servies!</p>
        <small>Someone famous</small>
      </blockquote>
    </div>
  </div>

  <div class="span4 container-fluid-newsletter">
    <h1>
      Newsletter
    </h1>
    <p>
      Hear about new products, promotions & other updates.
    </p>
        <div class="container_layout">

      <g:if test="${flash.message}">
        <div class="message" role="status">Successfully sent!</div>
      </g:if>

      <g:hasErrors bean="${subscriptionInstance}">

          <g:eachError bean="${subscriptionInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><div class="message" role="status">"You are already in our newsletter database."</div></li>
          </g:eachError>

      </g:hasErrors>
      <g:form controller="Subscription" action="save" >
        <div class="input-append fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'email', 'error')} required">
          <g:textField class="span9" name="email" required="" value="${subscriptionInstance?.email}"/>
          <g:submitButton name="create" class="btn save" value="${message(code: 'Subscribe', default: 'Subscribe')}" />
          </div>
      </g:form>

    </div>
    <hr>

    <div class="container_layout">
      <h1>
	          	Social
      </h1>
      <p>
        Get Connected with us
      </p>
      <p>
        <a href="https://twitter.com/#!/KhronosUN" class="sb large glossy gray twitter">Twitter</a>
        <a href="http://www.facebook.com/Khronosun" class="sb large glossy gray facebook">Facebook</a>

      </p>
    </div>
  </div>

  <div class="span4 container-fluid-twitter">
    <h1>
	            Twitter Update
    </h1>
    <div>
      <ul id="twitter_update_list"></ul>
      <a href="http://twitter.com/khronosun" id="twitter-link" style="display:block;text-align:right;">follow us on Twitter</a>
    </div>
  </div>

  <div class="span12">
    <p></p>
       <p align="center">Copyright © 2012 Khronosun. All rights reserved. |
      <g:link controller="User" action="aboutUs"> About Us </g:link> |
      <g:link controller="User" action="termsOfService"> Terms of Service </g:link> |
      <g:link controller="User" action="privacyPolicy"> Privacy Policy </g:link> |
      <g:link controller="User" action="salesAndRefunds"> Sales and Refunds </g:link> |
      <g:link controller="User" action="help"> Help </g:link> |
      <g:link controller="User" action="siteMap"> Site Map </g:link> |
    </p>
  </div>
</footer>
    </div><!--/.fluid-container-->


    <!--///////////////////////////////////////////////////////////////////////////////////////////////////
    //
    //		Scripts
    //
    ///////////////////////////////////////////////////////////////////////////////////////////////////-->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <g:javascript src="jquery.js"/>
    <g:javascript src="bootstrap-transition.js"/>
    <g:javascript src="bootstrap-alert.js"/>
    <g:javascript src="bootstrap-modal.js"/>
    <g:javascript src="bootstrap-dropdown.js"/>
    <g:javascript src="bootstrap-scrollspy.js"/>
    <g:javascript src="bootstrap-tab.js"/>
    <g:javascript src="bootstrap-tooltip.js"/>
    <g:javascript src="bootstrap-popover.js"/>
    <g:javascript src="bootstrap-button.js"/>
    <g:javascript src="bootstrap-collapse.js"/>
    <g:javascript src="bootstrap-carousel.js"/>
    <g:javascript src="bootstrap-typeahead.js"/>
    <g:javascript src="jquery.mobile.customized.min.js"/>
    <g:javascript src="jquery.easing.1.3.js"/>
    <g:javascript src="camera.min.js"/>
    <script type="text/javascript" src="http://jzaefferer.github.com/jquery-validation/jquery.validate.js"></script>

	  
    <!-- Twitter-->
    <script src="http://twitter.com/javascripts/blogger.js" type="text/javascript"></script>
    <script src="http://twitter.com/statuses/user_timeline/STcom.json?callback=twitterCallback2&count=3" type="text/javascript"></script>
    
    <!-- FormToWizard -->
    <g:javascript src="formToWizard.js"/>
    <g:javascript src="jquery.formToWizard.js"/>
    <g:javascript src="jquery.validationEngine.js"/>
    <g:javascript src="jquery.validationEngine-en.js"/>

    <!--rating -->
    <g:javascript src="behavior.js"/>
    <g:javascript src="rating.js"/>

    <script>
        $( function() {
            var $signupForm = $( '#diy_purchase' );
            
            $signupForm.validationEngine();
            
            $signupForm.formToWizard({
                submitButton: 'SaveAccount',
                showProgress: true, //default value for showProgress is also true
                nextBtnName: 'Next ',
                prevBtnName: ' Back',
                showStepNo: false,
                validateBeforeNext: function() {
                    return $signupForm.validationEngine( 'validate' );
                }
            });
            
            
            $( '#txt_stepNo' ).change( function() {
                $signupForm.formToWizard( 'GotoStep', $( this ).val() );
            });
            
            $( '#btn_next' ).click( function() {
                $signupForm.formToWizard( 'NextStep' );
            });
            
            $( '#btn_prev' ).click( function() {
                $signupForm.formToWizard( 'PreviousStep' );
            });
        });
    </script>
    
    <!-- Load the Cloud Zoom JavaScript file -->
    <g:javascript src="cloud-zoom.1.0.2.js"/>
    <script>
      $('#scroll').scrollspy();  

jQuery(function(){
  jQuery('#camera_wrap_1').camera({
	height: '315px',
	loader: 'bar',
        fx: 'random',
        alignment: 'center',
        pagination: true,
        thumbnails: true
   });

});
	</script>
    <!-- Load the bootbox JS File -->
    <!--<script type="text/javascript" src="https://raw.github.com/makeusabrew/bootbox/master/bootbox.min.js"></script>-->

    <!-- Load the chosen & input restriction JavaScript file -->    
    <script type="text/javascript" src="${resource(dir:'chosen', file:'chosen.jquery.js')}" ></script>
    <script type="text/javascript"> $(".chzn-select").chosen({  }); $(".chzn-select-deselect").chosen({allow_single_deselect:true}); </script>

     <!-- Rating Script -->
     <script  type="text/javascript" src="${resource(dir:'js', file:'rating.js')}" ></script>
     <script  type="text/javascript" src="${resource(dir:'js', file:'behavior.js')}" ></script>


    <!-- ToastBox Script -->
    <g:javascript src="toastr.js"/>
    
    <!-- kinetic js -->
    <script type="text/javascript" src="${resource(dir:'js', file:'kinetic-v3.10.5.js')}" ></script>
    <script type="text/javascript" src="${resource(dir:'js', file:'canvas.js')}" ></script>


