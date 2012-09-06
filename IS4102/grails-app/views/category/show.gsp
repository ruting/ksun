
<%@ page import="khronosun.Category" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main1">
  <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <div class="span8">
    <a href="#show-category" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
      <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
      </ul>
    </div>
    <div id="show-category" class="content scaffold-show" role="main">
      <h1><g:message code="default.show.label" args="[entityName]" /></h1>
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <ol class="property-list category">
        <g:if test="${categoryInstance?.categoryImage}">
          <img class="avatar" alt="${categoryInstance?.id}" src="${createLink(controller:'category', action:'loadImage', id:categoryInstance.id)}" width="160px" height="180px" />
        </g:if>
        <g:else>
          <img class="avatar" alt="Your image" src="${resource(dir: 'images/', file: 'apple-touch-icon-retina.png')}" width="160px" height="180px" />
        </g:else>
        <g:if test="${categoryInstance?.categoryType}">
          <li class="fieldcontain">
            <span id="categoryType-label" class="property-label"><g:message code="category.categoryType.label" default="Category Type" /></span>

            <span class="property-value" aria-labelledby="categoryType-label"><g:fieldValue bean="${categoryInstance}" field="categoryType"/></span>

          </li>
        </g:if>

        <g:if test="${categoryInstance?.item}">
          <li class="fieldcontain">
            <span id="item-label" class="property-label"><g:message code="category.item.label" default="Item" /></span>

          <g:each in="${categoryInstance.item}" var="i">
            <span class="property-value" aria-labelledby="item-label"><g:link controller="item" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
          </g:each>

          </li>
        </g:if>

      </ol>
      <g:form>
        <fieldset class="buttons">
          <g:hiddenField name="id" value="${categoryInstance?.id}" />
          <g:link class="edit" action="edit" id="${categoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
          <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
      </g:form>
    </div>
  </div>
</body>
</html>
