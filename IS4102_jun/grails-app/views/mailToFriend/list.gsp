
<%@ page import="khronosun.MailToFriend" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mailToFriend.label', default: 'MailToFriend')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-mailToFriend" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-mailToFriend" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					<g:sortableColumn property="friendEmail" title="${message(code: 'mailToFriend.friendEmail.label', default: 'Friend Email')}" />
                                        <g:sortableColumn property="name" title="${message(code: 'mailToFriend.name.label', default: 'Name')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${mailToFriendInstanceList}" status="i" var="mailToFriendInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td><g:link action="show" id="${mailToFriendInstance.id}">${fieldValue(bean: mailToFriendInstance, field: "friendEmail")}</g:link></td>
                                        <td>${fieldValue(bean: mailToFriendInstance, field: "name")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mailToFriendInstanceTotal}" />
			</div>
                        
		</div>
	</body>
</html>
