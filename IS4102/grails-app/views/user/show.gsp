
<%@ page import="khronosun.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="user.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${userInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="user.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${userInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="user.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${userInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="user.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${userInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.contactNo}">
				<li class="fieldcontain">
					<span id="contactNo-label" class="property-label"><g:message code="user.contactNo.label" default="Contact No" /></span>
					
						<span class="property-value" aria-labelledby="contactNo-label"><g:fieldValue bean="${userInstance}" field="contactNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.userImage}">
				<li class="fieldcontain">
					<span id="userImage-label" class="property-label"><g:message code="user.userImage.label" default="User Image" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.accountStatus}">
				<li class="fieldcontain">
					<span id="accountStatus-label" class="property-label"><g:message code="user.accountStatus.label" default="Account Status" /></span>
					
						<span class="property-value" aria-labelledby="accountStatus-label"><g:fieldValue bean="${userInstance}" field="accountStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.imageType}">
				<li class="fieldcontain">
					<span id="imageType-label" class="property-label"><g:message code="user.imageType.label" default="Image Type" /></span>
					
						<span class="property-value" aria-labelledby="imageType-label"><g:fieldValue bean="${userInstance}" field="imageType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.usertype}">
				<li class="fieldcontain">
					<span id="usertype-label" class="property-label"><g:message code="user.usertype.label" default="Usertype" /></span>
					
						<span class="property-value" aria-labelledby="usertype-label"><g:fieldValue bean="${userInstance}" field="usertype"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.verifyCode}">
				<li class="fieldcontain">
					<span id="verifyCode-label" class="property-label"><g:message code="user.verifyCode.label" default="Verify Code" /></span>
					
						<span class="property-value" aria-labelledby="verifyCode-label"><g:fieldValue bean="${userInstance}" field="verifyCode"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userInstance?.id}" />
					<g:link class="edit" action="edit" id="${userInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
