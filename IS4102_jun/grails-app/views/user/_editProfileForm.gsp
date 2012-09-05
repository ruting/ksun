<%@ page import="khronosun.User" %>

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

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="user.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${['Male', 'Female']}" valueMessagePrefix="${userInstance?.gender}"  value="${userInstance?.gender}"/>
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

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userImage', 'error')} ">
  	<label for="Image">
		<g:message code="user.image.label" default="Image" />
	</label>
	<input type="file" id="userImage" name="userImage" />
</div>

<br>

