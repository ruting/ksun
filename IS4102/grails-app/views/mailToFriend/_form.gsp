<%@ page import="khronosun.MailToFriend %>



<div class="fieldcontain ${hasErrors(bean: mailToFriendInstance, field: 'friendEmail', 'error')} required">
	<label for="friendEmail">
		<g:message code="mailToFriend.friendEmail.label" default="Friend's Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="friendEmail" required="" value="${mailToFriendInstance?.friendEmail}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: mailToFriendInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="mailToFriend.name.label" default="Friend's Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${mailToFriendInstance?.name}"/>
</div>