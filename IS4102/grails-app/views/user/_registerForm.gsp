<%@ page import="khronosun.User" %>

<h4 align ="center">Account Creation</h4>
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
    <g:remoteField  name ="email" required="" value="${userInstance?.email}" update="emailResult" paramName="emailcheck" url ="[controller:'user',action:'checkEmail']"/>
    <div id="emailResult"  >
    </div>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" required="" value="" onkeyup='strengthCheck( this.value );'/>
        <g:hiddenField name="strength" value="" id='pstrength'/>
        <img id='strength' alt='' />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'confirmPassword', 'error')} required">
	<label for="confirmPassword">
		<g:message code="user.confirmPassword.label" default="Confirm Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="confirmPassword" required="" value=""/>
</div>
<br>
<h4 align ="center">User's Details</h4>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${userInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${userInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'dateOfBirth', 'error')} required">
	<label for="dateOfBirth">
		<g:message code="user.dateOfBirth.label" default="Date Of Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfBirth" required="" value="${userInstance?.dateOfBirth}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="user.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${['Male', 'Female']}" valueMessagePrefix="${userInstance?.gender}" noSelection="['':'-Select-']" value="${userInstance?.gender}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="user.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${userInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'contactNo', 'error')} required">
	<label for="contactNo">
		<g:message code="user.contactNo.label" default="Contact No" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contactNo" required="" value="${userInstance?.contactNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'securityQns', 'error')} required">
	<label for="securityQns">
		<g:message code="user.securityQns.label" default="Security Qns" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="securityQns" required="" value="${userInstance?.securityQns}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'securityAns', 'error')} required">
	<label for="securityAns">
		<g:message code="user.securityAns.label" default="Security Ans" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="securityAns" required="" value="${userInstance?.securityAns}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userImage', 'error')} ">
	<input type="hidden" id="userImage" name="userImage" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountStatus', 'error')} ">
	<g:hiddenField name="accountStatus" value="inactive"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'imageType', 'error')} ">
	<g:hiddenField name="imageType" value=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'usertype', 'error')} ">
	<g:hiddenField name="usertype" value="user"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'verifyCode', 'error')} ">
	<g:hiddenField name="verifyCode"value="${userInstance?.verifyCode}"/>
</div>

<div >
   <recaptcha:ifEnabled>
       <recaptcha:recaptcha theme="white" lang="en" custom_theme_widget="recaptcha_widget"/>
   </recaptcha:ifEnabled>
</div>
<br>

