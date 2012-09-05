<%@ page import="khronosun.Design" %>



<div class="fieldcontain ${hasErrors(bean: designInstance, field: 'designImage', 'error')} ">
	<label for="designImage">
		<g:message code="design.designImage.label" default="Design Image" />
		
	</label>
	<input type="file" id="designImage" name="designImage" />
</div>

<div class="fieldcontain ${hasErrors(bean: designInstance, field: 'designType', 'error')} required">
	<label for="designType">
		<g:message code="design.designType.label" default="Design Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="designType" required="" value="${designInstance?.designType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: designInstance, field: 'imageType', 'error')} ">
	<label for="imageType">
		<g:message code="design.imageType.label" default="Image Type" />
		
	</label>
	<g:textField name="imageType" value="${designInstance?.imageType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: designInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="design.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${designInstance?.status}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: designInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="design.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${khronosun.User.list()}" optionKey="id" required="" value="${designInstance?.user?.id}" class="many-to-one"/>
</div>

