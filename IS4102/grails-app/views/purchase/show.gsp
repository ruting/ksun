
<%@ page import="khronosun.Purchase" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'purchase.label', default: 'Purchase')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-purchase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-purchase" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list purchase">
			
				<g:if test="${purchaseInstance?.cart}">
				<li class="fieldcontain">
					<span id="cart-label" class="property-label"><g:message code="purchase.cart.label" default="Cart" /></span>
					
						<span class="property-value" aria-labelledby="cart-label"><g:link controller="cart" action="show" id="${purchaseInstance?.cart?.id}">${purchaseInstance?.cart?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${purchaseInstance?.transactionID}">
				<li class="fieldcontain">
					<span id="transactionID-label" class="property-label"><g:message code="purchase.transactionID.label" default="Transaction ID" /></span>
					
						<span class="property-value" aria-labelledby="transactionID-label"><g:fieldValue bean="${purchaseInstance}" field="transactionID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${purchaseInstance?.orderStatus}">
				<li class="fieldcontain">
					<span id="orderStatus-label" class="property-label"><g:message code="purchase.orderStatus.label" default="Order Status" /></span>
					
						<span class="property-value" aria-labelledby="orderStatus-label"><g:fieldValue bean="${purchaseInstance}" field="orderStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${purchaseInstance?.paymentMode}">
				<li class="fieldcontain">
					<span id="paymentMode-label" class="property-label"><g:message code="purchase.paymentMode.label" default="Payment Mode" /></span>
					
						<span class="property-value" aria-labelledby="paymentMode-label"><g:fieldValue bean="${purchaseInstance}" field="paymentMode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${purchaseInstance?.shippingAddress}">
				<li class="fieldcontain">
					<span id="shippingAddress-label" class="property-label"><g:message code="purchase.shippingAddress.label" default="Shipping Address" /></span>
					
						<span class="property-value" aria-labelledby="shippingAddress-label"><g:fieldValue bean="${purchaseInstance}" field="shippingAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${purchaseInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="purchase.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${purchaseInstance?.user?.id}">${purchaseInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${purchaseInstance?.id}" />
					<g:link class="edit" action="edit" id="${purchaseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
