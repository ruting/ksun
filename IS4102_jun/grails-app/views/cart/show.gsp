<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="khronosun.CartItem" %>
<%@ page import="khronosun.Cart" %>
<%@ page import="khronosun.Item" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main1">
    <title>Shopping Cart</title>
  </head>
  <body>
    <div class="span8">
      <h1>Shopping Cart</h1>
      <g:if test="${flash.message}">
        <em>${flash.message}</em><br><br>
      </g:if>
      <table border="1" cellpadding="4" cellspacing="0" width="750">
        <thead>
          <tr>
            <td>No</td>
            <td>Image</td>
            <td>Status</td>
            <td>Item Name</td>
            <td>Unit-Price</td>
            <td>Quantity</td>
            <td>Sub-Total</td>
            <td></td>
          </tr>
        </thead>

        <tbody id="shoppingCartContent">
        <g:if test="${cartInstance?.cartItem?.size()<1}">
          <tr><td colspan="8" align="center"><h3>Your shopping cart is empty! </h3></td></tr>
        </g:if>
        <g:each in="${cartInstance?.cartItem?.sort{it.id}}" status="i" var="c">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

            <td>${i+1}</td>
            <td></td>
            <td>
          <g:if test="${c.item.quantity > 20}">In Stock</g:if>
          <g:elseif test="${c.item.quantity < 20 || c.item.quantity > 0}">Running Low</g:elseif>
          <g:else>No stock</g:else>
          </td>
          <td><g:link controller="item" action="show" id="${c.item.id}">${c.item.itemName}</g:link></td>
          <td style="text-align:center;"><g:formatNumber number="${c.item.price}"  minFractionDigits="2"/></td>
          <td align="center">
          <g:formRemote name="myForm" on404="alert('not found!')" url="[controller: 'cart', action:'addSubQuantity']">
            <input name="value"  value="${c.quantity}" type="text"   onchange="this.form.submit();"/>
            <g:hiddenField name="id" value="${cartInstance?.id}" />
            <g:hiddenField name="cartItemId" value="${c.id}" />
          </g:formRemote>
          </td>
          <td>$<g:formatNumber number="${c.item.price *c.quantity}"  minFractionDigits="2"/></td>
          <td><g:link  action="deleteCartItem"  params="[cartItemId: c.id,cartId:cartInstance.id]"><g:message code="default.button.deleteCartItem.label" default="Remove Item" /></g:link></td>

          </tr>
        </g:each>

        <tr class="prop" >
          <th colspan="7" style="text-align:right; border-style:solid; border-top-width:thin; border-color:back;"><g:message code="cart.totalPrice.label" default="Total Price (S&#36;)" /></th>
        <td style="text-align:center; border-style:solid; border-top-width:thin; border-color:back;"><g:formatNumber number="${cartInstance?.totalAmount}"  minFractionDigits="2"/></td>
        </tr>

        </tbody>
      </table>
      <br>
      <g:link  action="deleteCart"  params="[cartId:cartInstance?.id]"><g:message code="default.button.deleteCartItem.label" default="Empty Shopping Cart" /></g:link>
      <br>
      Check out
    </div>
  </body>
</html>
