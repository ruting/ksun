
<%@ page import="khronosun.MailToFriend" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mailToFriend.label', default: 'MailToFriend')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-mailToFriend" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-mailToFriend" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mailToFriend">
			<g:if test="${mailToFriendInstance?.friendEmail}">
				<li class="fieldcontain">
                                  <span id="friendEmail-label" class="property-label"><g:message code="mailToFriend.friendEmail.label" default="Friend's Email" /></span>
                                  <span class="property-value" aria-labelledby="friendEmail-label"><g:fieldValue bean="${mailToFriendInstance}" field="friendEmail"/></span>
                                </li>
                        </g:if>
			<g:if test="${mailToFriendInstance?.name}">
				<li class="fieldcontain">
                                  <span id="name-label" class="property-label"><g:message code="mailToFriend.name.label" default="Friend's Name" /></span>
                                  <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${mailToFriendInstance}" field="name"/></span>
                                </li>
                        </g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${mailToFriendInstance?.id}" />
					<g:link class="edit" action="edit" id="${mailToFriendInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                        <g:actionSubmit class="Mail" action="mail" value="${message(code: 'default.button.mail.label', default: 'Mail')}"onclick="return confirm('${message(code: 'default.button.mail.confirm.message', default: 'Mail to Friends')}');" />
                                </fieldset>
			</g:form>
		</div>
	</body>
</html>
