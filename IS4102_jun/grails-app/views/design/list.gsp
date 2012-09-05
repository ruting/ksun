
<%@ page import="khronosun.Design" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'design.label', default: 'Design')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-design" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-design" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="designImage" title="${message(code: 'design.designImage.label', default: 'Design Image')}" />
					
						<g:sortableColumn property="designType" title="${message(code: 'design.designType.label', default: 'Design Type')}" />
					
						<g:sortableColumn property="imageType" title="${message(code: 'design.imageType.label', default: 'Image Type')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'design.status.label', default: 'Status')}" />
					
						<th><g:message code="design.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${designInstanceList}" status="i" var="designInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${designInstance.id}">${fieldValue(bean: designInstance, field: "designImage")}</g:link></td>
					
						<td>${fieldValue(bean: designInstance, field: "designType")}</td>
					
						<td>${fieldValue(bean: designInstance, field: "imageType")}</td>
					
						<td>${fieldValue(bean: designInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: designInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${designInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
