<%@ page import="khronosun.MailToFriend" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main1">
		<g:set var="entityName" value="${message(code: 'mailToFriend.label', default: 'MailToFriend')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
          <div class="span8">
		
		<div id="create-mailToFriend" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">Successfully sent!</div>
			</g:if>
			<g:hasErrors bean="${mailToFriendInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${mailToFriendInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
          </div>
	</body>
</html>
