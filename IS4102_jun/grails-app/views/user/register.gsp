    <g:render template="../common/header" /> 
    
<!-- main site -->
      <div class="row-fluid">
        <div class="span12">    
    
<div class="row-fluid">
     
<div class="span2">
      <div class="well" style="padding: 8px 0;"> <!-- well -->
        <ul class="nav">
          <!--<li class="nav-header">Departments</li>-->
          <li class="active"><a href="#"><i class="icon-white icon-home"></i> Shop Mac</a></li>
          <li><a href="#"><i class="icon-book"></i> Shop iPod</a></li>
          <li><a href="#"><i class="icon-pencil"></i> Shop iPhone</a></li>
          <li><a href="#"><i class="icon-user"></i> Shop iPad</a></li>
          <li><a href="#"><i class="icon-cog"></i> Mac Accessories</a></li>
          <li><a href="#"><i class="icon-flag"></i> Mac Software</a></li>
                    <li class="nav-divider"></li>
          <li><a href="#"><i class="icon-book"></i> Shop iPod</a></li>
          <li><a href="#"><i class="icon-pencil"></i> Shop iPhone</a></li>
          <li><a href="#"><i class="icon-user"></i> Shop iPad</a></li>
          <li><a href="#"><i class="icon-cog"></i> Mac Accessories</a></li>
          <li><a href="#"><i class="icon-flag"></i> Mac Software</a></li>                    
        </ul>
      </div> <!-- /well -->

    </div> <!-- /span 2 -->
              
              
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


      <div> <!-- inner span10 -->
      <div class="well span10"> <!-- span10 -->
          <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
          </g:if>
          <g:hasErrors bean="${userInstance}">
          <ul class="errors" role="alert">
                  <g:eachError bean="${userInstance}" var="error">
                  <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                  </g:eachError>
          </ul>
          </g:hasErrors>    
    
          <g:form action="saveUser"  enctype="multipart/form-data" class="form-horizontal">
                  <fieldset class="registerForm">
    
<legend>Account Creation</legend>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label class="control-label" for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
    <g:remoteField  name ="email" required="" value="${userInstance?.email}" update="emailResult" paramName="emailcheck" url ="[controller:'user',action:'checkEmail']"/>
    <div id="emailResult">
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label class="control-label" for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" required="" value="" onkeyup='strengthCheck( this.value );'/>
        <g:hiddenField name="strength" value="" id='pstrength'/>
        <img id='strength' alt='' />
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'confirmPassword', 'error')} required">
	<label class="control-label" for="confirmPassword">
		<g:message code="user.confirmPassword.label" default="Confirm Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="confirmPassword" required="" value=""/>
</div>

<legend>User's Details</legend>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
	<label class="control-label" for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${userInstance?.firstName}"/>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
	<label class="control-label" for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${userInstance?.lastName}"/>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'dateOfBirth', 'error')} required">
	<label class="control-label" for="dateOfBirth">
		<g:message code="user.dateOfBirth.label" default="Date Of Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfBirth" required="" value="${userInstance?.dateOfBirth}"/>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'securityQns', 'error')} required">
	<label class="control-label" for="securityQns">
		<g:message code="user.securityQns.label" default="Security Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="securityQns" required="" value="${userInstance?.securityQns}"/>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'securityAns', 'error')} required">
	<label class="control-label" for="securityAns">
		<g:message code="user.securityAns.label" default="Security Answer" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="securityAns" required="" value="${userInstance?.securityAns}"/>
</div>


<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'gender', 'error')} required">
	<label class="control-label" for="gender">
		<g:message code="user.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${['Male', 'Female']}" valueMessagePrefix="${userInstance?.gender}" noSelection="['':'-Select-']" value="${userInstance?.gender}"/>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'address', 'error')} required">
	<label class="control-label" for="address">
		<g:message code="user.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${userInstance?.address}"/>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'contactNo', 'error')} required">
	<label class="control-label" for="contactNo">
		<g:message code="user.contactNo.label" default="Contact No" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contactNo" required="" value="${userInstance?.contactNo}"/>
</div>

<div class="control-group">
   <recaptcha:ifEnabled>
       <recaptcha:recaptcha theme="white" lang="en" custom_theme_widget="recaptcha_widget"/>
   </recaptcha:ifEnabled>
</div>                  
           
    
<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'userImage', 'error')} ">
	<input type="hidden" id="userImage" name="userImage" />
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'accountStatus', 'error')} ">
	<g:hiddenField name="accountStatus" value="inactive"/>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'imageType', 'error')} ">
	<g:hiddenField name="imageType" value=""/>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'usertype', 'error')} ">
	<g:hiddenField name="usertype" value="user"/>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'verifyCode', 'error')} ">
	<g:hiddenField name="verifyCode"value="${userInstance?.verifyCode}"/>
</div>

           
                  
                  </fieldset>

                  <fieldset class="buttons">
                          <g:submitButton name="register" class="register" value="${message(code: 'default.button.register.label', default: 'Register')}" />
                  </fieldset>
          </g:form>    
    
    

 
      
      
    
      
      
      </div> <!-- /span10 -->
<div class="span2">
      <div class="well" style="padding: 8px 0;"> <!-- well -->
        <ul class="nav">
          <li class="nav-header">New for Mac</li>
          <li class="active"><a href="#"> Shop Mac</a></li>
          <li><a href="#"> Shop iPod</a></li>
          <li><a href="#"> Shop iPhone</a></li>
          <li><a href="#"> Shop iPad</a></li>
          <li><a href="#"> Mac Accessories</a></li>
          <li><a href="#"> Mac Software</a></li>
          <li><a href="#"> Shop iPod</a></li>
          <li><a href="#"> Shop iPhone</a></li>
          <li><a href="#"> Shop iPad</a></li>
          <li><a href="#"> Mac Accessories</a></li>
          <li><a href="#"> Mac Software</a></li>
          <li><a href="#"> Shop iPod</a></li>
          <li><a href="#"> Shop iPhone</a></li>
          <li><a href="#"> Shop iPad</a></li>
          <li><a href="#"> Mac Accessories</a></li>
          <li><a href="#"> Mac Software</a></li>
                    <li class="nav-divider"></li>
           
        </ul>
      </div> <!-- /well -->

    </div> <!-- /span 2 -->
      </div> <!-- /inner span10 -->


</div> <!-- /span10 -->               
          
          
                
              
              
     </div> <!-- /row-fluid -->
    <g:render template="../common/footer" />
