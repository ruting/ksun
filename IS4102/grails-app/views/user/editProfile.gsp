<%@ page import="khronosun.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main1">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
           <div class="span8">
		
		<div id="edit-user" class="content scaffold-edit" role="main">
			<h1><g:message code="Edit Profile" args="[entityName]" /></h1>
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
			<g:form method="post"  enctype="multipart/form-data">
				<g:hiddenField name="id" value="${userInstance?.id}" />
				<g:hiddenField name="version" value="${userInstance?.version}" />
                                <g:hiddenField name="accountStatus" value="${userInstance?.accountStatus}"/>
                                <g:hiddenField name="imageType" value="${userInstance?.imageType}"/>
                                <g:hiddenField name="usertype" value="${userInstance?.usertype}"/>
                                <g:hiddenField name="verifyCode" value="${userInstance?.verifyCode}"/>
                                <g:hiddenField name="password" value="${userInstance?.password}" />
                                <g:hiddenField  name ="email" required="" value="${userInstance?.email}" />
                                <g:hiddenField  name ="securityQns" required="" value="${userInstance?.securityQns}" />
                                <g:hiddenField  name ="securityAns" required="" value="${userInstance?.securityAns}" />
				<fieldset class="form">
					<g:render template="editProfileForm"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="updateProfile" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
           </div>
	</body>
</html>
