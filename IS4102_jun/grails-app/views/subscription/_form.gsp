<%@ page import="khronosun.Subscription" %>



<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="subscription.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${subscriptionInstance?.email}"/>
</div>

