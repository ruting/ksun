
<%@ page import="khronosun.Design" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'design.label', default: 'Design')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-design" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-design" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list design">
			
				<g:if test="${designInstance?.designImage}">
				<li class="fieldcontain">
					<span id="designImage-label" class="property-label"><g:message code="design.designImage.label" default="Design Image" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${designInstance?.designType}">
				<li class="fieldcontain">
					<span id="designType-label" class="property-label"><g:message code="design.designType.label" default="Design Type" /></span>
					
						<span class="property-value" aria-labelledby="designType-label"><g:fieldValue bean="${designInstance}" field="designType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${designInstance?.imageType}">
				<li class="fieldcontain">
					<span id="imageType-label" class="property-label"><g:message code="design.imageType.label" default="Image Type" /></span>
					
						<span class="property-value" aria-labelledby="imageType-label"><g:fieldValue bean="${designInstance}" field="imageType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${designInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="design.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${designInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${designInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="design.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${designInstance?.user?.id}">${designInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${designInstance?.id}" />
					<g:link class="edit" action="edit" id="${designInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
