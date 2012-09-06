
<%@ page import="khronosun.ItemRating" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemRating.label', default: 'ItemRating')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-itemRating" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-itemRating" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="itemRating.user.label" default="User" /></th>
					
						<th><g:message code="itemRating.item.label" default="Item" /></th>
					
						<g:sortableColumn property="rating" title="${message(code: 'itemRating.rating.label', default: 'Rating')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemRatingInstanceList}" status="i" var="itemRatingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemRatingInstance.id}">${fieldValue(bean: itemRatingInstance, field: "user")}</g:link></td>
					
						<td>${fieldValue(bean: itemRatingInstance, field: "item")}</td>
					
						<td>${fieldValue(bean: itemRatingInstance, field: "rating")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${itemRatingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
