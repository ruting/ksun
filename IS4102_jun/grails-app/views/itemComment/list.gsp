
<%@ page import="khronosun.ItemComment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemComment.label', default: 'ItemComment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-itemComment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-itemComment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="itemComment.user.label" default="User" /></th>
					
						<th><g:message code="itemComment.item.label" default="Item" /></th>
					
						<g:sortableColumn property="comment" title="${message(code: 'itemComment.comment.label', default: 'Comment')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'itemComment.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemCommentInstanceList}" status="i" var="itemCommentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemCommentInstance.id}">${fieldValue(bean: itemCommentInstance, field: "user")}</g:link></td>
					
						<td>${fieldValue(bean: itemCommentInstance, field: "item")}</td>
					
						<td>${fieldValue(bean: itemCommentInstance, field: "comment")}</td>
					
						<td>${fieldValue(bean: itemCommentInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${itemCommentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
