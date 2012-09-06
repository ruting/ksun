<%@ page import="khronosun.Purchase" %>



<div class="fieldcontain ${hasErrors(bean: purchaseInstance, field: 'cart', 'error')} required">
	<label for="cart">
		<g:message code="purchase.cart.label" default="Cart" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cart" name="cart.id" from="${khronosun.Cart.list()}" optionKey="id" required="" value="${purchaseInstance?.cart?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: purchaseInstance, field: 'transactionID', 'error')} required">
	<label for="transactionID">
		<g:message code="purchase.transactionID.label" default="Transaction ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="transactionID" required="" value="${purchaseInstance?.transactionID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: purchaseInstance, field: 'orderStatus', 'error')} ">
	<label for="orderStatus">
		<g:message code="purchase.orderStatus.label" default="Order Status" />
		
	</label>
	<g:textField name="orderStatus" value="${purchaseInstance?.orderStatus}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: purchaseInstance, field: 'paymentMode', 'error')} ">
	<label for="paymentMode">
		<g:message code="purchase.paymentMode.label" default="Payment Mode" />
		
	</label>
	<g:textField name="paymentMode" value="${purchaseInstance?.paymentMode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: purchaseInstance, field: 'shippingAddress', 'error')} ">
	<label for="shippingAddress">
		<g:message code="purchase.shippingAddress.label" default="Shipping Address" />
		
	</label>
	<g:textField name="shippingAddress" value="${purchaseInstance?.shippingAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: purchaseInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="purchase.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${khronosun.User.list()}" optionKey="id" required="" value="${purchaseInstance?.user?.id}" class="many-to-one"/>
</div>

