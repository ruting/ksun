<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="khronosun.Item" %>
<%@ page import="khronosun.ItemRating" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main1">
  <resource:autoComplete skin="default" />
  <title>Sample title</title>
</head>
<body>
  <div class="span8">

    <g:if test="${itemInstance?.itemImage}">
      <img class="avatar" alt="${itemInstance?.id}" src="${createLink(controller:'item', action:'loadImage', id:itemInstance.id)}" width="160px" height="180px" />
    </g:if>
    <g:else>
      <img class="avatar" alt="Your image" src="${resource(dir: 'images/', file: 'apple-touch-icon-retina.png')}" width="160px" height="180px" />
    </g:else>
    <g:if test="${itemInstance?.itemName}">
      <li class="fieldcontain">
        <span id="itemName-label" class="property-label"><g:message code="item.itemName.label" default="Item Name" /></span>

        <span class="property-value" aria-labelledby="itemName-label"><g:fieldValue bean="${itemInstance}" field="itemName"/></span>

      </li>
    </g:if>
    <g:if test="${itemInstance?.price}">
      <li class="fieldcontain">
        <span id="price-label" class="property-label"><g:message code="item.price.label" default="Price" /></span>

        <span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${itemInstance}" field="price"/></span>

      </li>
    </g:if>

    <g:if test="${itemInstance?.quantity}">
      <li class="fieldcontain">
        <span id="quantity-label" class="property-label"><g:message code="item.quantity.label" default="Quantity" /></span>

        <span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${itemInstance}" field="quantity"/></span>

      </li>

    </g:if>
    <g:if test="${session.user && isRated==false}">
      <li class="fieldcontain">
        <span id="rating-label" class="property-label"><g:message code="item.rating.label" default="Rating" /></span>
      <g:render template="rate"/>
    </g:if>
    <g:else>
      <richui:rating dynamic="false" id="${itemInstance.id}" units="5"  showCurrent="false" rating="${average}"/>
    </g:else>
  </g>
</li>


<g:link  action="addCartItem" id="${itemInstance?.id}"><g:message code="default.addCartItem.label" default="addCartItem" /></g:link>

<ul class="nav nav-tabs" id="myTab">
  <li class="active"><a href="#description" data-toggle="tab">Description</a></li>
  <li><a href="#comment" data-toggle="tab">Comment</a></li>
</ul>

<div class="tab-content">

  <div class="tab-pane active" id="description">
    <span id="description-label" class="property-label"><g:message code="item.description.label" default="Description" /></span>

    <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${itemInstance}" field="description"/></span>
  </div>

  <div class="tab-pane" id="comment">
    <g:each in="${itemInstance.comment}" var="c">
      <g:if test="${c.status.equals("1") || c.status.equals("2") }">
        <span class="property-value" aria-labelledby="comment-label"> <g:fieldValue bean="${c.user}" field="firstName"/> Comment on the items:  <g:fieldValue bean="${c}" field="comment"/></span>
      </g:if>
      <g:if test="${c.status.equals("1")}">
        <g:link controller="ItemComment" action="report"  id="${c.id}" params="[targetUri: (request.forwardURI - request.contextPath)]"> Report Comment </g:link>
      </g:if>
<% /* <g:link controller="itemComment" action="show" id="${c.id}">${c?.comment.encodeAsHTML()}</g:link></span> */ %>
    </g:each>
    <g:if test="${session.user}">
      <div> Add a comment <g:form controller="itemComment" action="saveall">
      </div>
      <input type="hidden" name="user.id" value="${session.user.id}">
      <input type="hidden" name="item.id" value="${itemInstance?.id}">
      <TEXTAREA name="comment" cols="40" rows="10"></TEXTAREA>

      <input type ="submit" value="Submit"></g:form>
    </g:if>
  </div>
  <div class="tab-pane" id="messages">...</div>
  <div class="tab-pane" id="settings">...</div>
</div>
</div>
</body>
</html>
