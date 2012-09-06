
<%@ page import="khronosun.ItemTemplate" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemTemplate.label', default: 'ItemTemplate')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-itemTemplate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-itemTemplate" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="templateName" title="${message(code: 'itemTemplate.templateName.label', default: 'Template Name')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'itemTemplate.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="dateAdded" title="${message(code: 'itemTemplate.dateAdded.label', default: 'Date Added')}" />
					
						<g:sortableColumn property="templateImage" title="${message(code: 'itemTemplate.templateImage.label', default: 'Template Image')}" />
					
						<g:sortableColumn property="imageType" title="${message(code: 'itemTemplate.imageType.label', default: 'Image Type')}" />
					
						<g:sortableColumn property="viewCount" title="${message(code: 'itemTemplate.viewCount.label', default: 'View Count')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemTemplateInstanceList}" status="i" var="itemTemplateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemTemplateInstance.id}">${fieldValue(bean: itemTemplateInstance, field: "templateName")}</g:link></td>
					
						<td>${fieldValue(bean: itemTemplateInstance, field: "price")}</td>
					
						<td><g:formatDate date="${itemTemplateInstance.dateAdded}" /></td>
					
						<td>${fieldValue(bean: itemTemplateInstance, field: "templateImage")}</td>
					
						<td>${fieldValue(bean: itemTemplateInstance, field: "imageType")}</td>
					
						<td>${fieldValue(bean: itemTemplateInstance, field: "viewCount")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${itemTemplateInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
