<%@ page import="khronosun.User" %>


<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
  <label for="password">
    <g:message code="user.password.label" default="Old Password" />
    <span class="required-indicator">*</span>
  </label>
  <g:passwordField name="password" required="" value="" />
</div>

<div>
  <label for="newPassword">
    <g:message code="user.confirmPassword.label" default="New Password" />
    <span class="required-indicator">*</span>
  </label>
  <g:passwordField name="newPassword" required="" value="" onkeyup='strengthCheck( this.value );' />
  <g:hiddenField name="strength" value="" id='pstrength'/>
  <img id='strength' alt='' />
</div>

<div>
  <label for="newPassword">
    <g:message code="user.confirmPassword.label" default="Confirmed New Password" />
    <span class="required-indicator">*</span>
  </label>
  <g:passwordField name="newPassword1" required="" value=""/>
</div>