<%@ page import="khronosun.Cart" %>



<div class="fieldcontain ${hasErrors(bean: cartInstance, field: 'totalAmount', 'error')} required">
	<label for="totalAmount">
		<g:message code="cart.totalAmount.label" default="Total Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="totalAmount" required="" value="${fieldValue(bean: cartInstance, field: 'totalAmount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cartInstance, field: 'cartItem', 'error')} ">
	<label for="cartItem">
		<g:message code="cart.cartItem.label" default="Cart Item" />
		
	</label>
	<g:select name="cartItem" from="${khronosun.CartItem.list()}" multiple="multiple" optionKey="id" size="5" value="${cartInstance?.cartItem*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cartInstance, field: 'dateAdded', 'error')} ">
	<label for="dateAdded">
		<g:message code="cart.dateAdded.label" default="Date Added" />
		
	</label>
	<g:datePicker name="dateAdded" precision="day"  value="${cartInstance?.dateAdded}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: cartInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="cart.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${cartInstance?.status}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cartInstance, field: 'userId', 'error')} ">
	<label for="userId">
		<g:message code="cart.userId.label" default="User Id" />
		
	</label>
	<g:textField name="userId" value="${cartInstance?.userId}"/>
</div>

