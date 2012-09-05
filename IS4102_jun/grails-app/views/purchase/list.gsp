
<%@ page import="khronosun.Purchase" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'purchase.label', default: 'Purchase')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-purchase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-purchase" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="purchase.cart.label" default="Cart" /></th>
					
						<g:sortableColumn property="transactionID" title="${message(code: 'purchase.transactionID.label', default: 'Transaction ID')}" />
					
						<g:sortableColumn property="orderStatus" title="${message(code: 'purchase.orderStatus.label', default: 'Order Status')}" />
					
						<g:sortableColumn property="paymentMode" title="${message(code: 'purchase.paymentMode.label', default: 'Payment Mode')}" />
					
						<g:sortableColumn property="shippingAddress" title="${message(code: 'purchase.shippingAddress.label', default: 'Shipping Address')}" />
					
						<th><g:message code="purchase.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${purchaseInstanceList}" status="i" var="purchaseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${purchaseInstance.id}">${fieldValue(bean: purchaseInstance, field: "cart")}</g:link></td>
					
						<td>${fieldValue(bean: purchaseInstance, field: "transactionID")}</td>
					
						<td>${fieldValue(bean: purchaseInstance, field: "orderStatus")}</td>
					
						<td>${fieldValue(bean: purchaseInstance, field: "paymentMode")}</td>
					
						<td>${fieldValue(bean: purchaseInstance, field: "shippingAddress")}</td>
					
						<td>${fieldValue(bean: purchaseInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${purchaseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
