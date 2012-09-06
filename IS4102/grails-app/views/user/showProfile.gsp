
<%@ page import="khronosun.User" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main1">
  <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
  <div class="span8">

    <div id="show-user" class="content scaffold-show" role="main">
      <h1></i> Welcome 
        <g:if test="${userInstance?.firstName}">
          <span id="firstName-label" class="property-label"></span>
          <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${userInstance}" field="firstName"/></span>
        </g:if>

        <g:if test="${userInstance?.lastName}">
          <span id="lastName-label" class="property-label"></span>
          <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${userInstance}" field="lastName"/></span>
        </g:if> 
      </h1>

      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>

      <ol class="property-list user">

        <g:if test="${userInstance?.userImage}">
          <img class="avatar" alt="${userInstance?.id}" src="${createLink(controller:'user', action:'loadImage', id:userInstance.id)}" width="160px" height="180px" />
        </g:if>
        <g:else>
          <img class="avatar" alt="Your image" src="${resource(dir: 'images/', file: 'apple-touch-icon-retina.png')}" width="160px" height="180px" />
        </g:else>
        <table>
          <tr><td width="150"><b></b></td><td width="250"></td></tr>
          <g:if test="${userInstance?.firstName}">
            <tr><td><b><span id="firstName-label" class="property-label"><g:message code="user.firstName.label" default="First Name" /></span></b></td>
              <td><span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${userInstance}" field="firstName"/></span></td></tr>
          </g:if>

          <g:if test="${userInstance?.lastName}">
            <tr><td><b><span id="lastName-label" class="property-label"><g:message code="user.lastName.label" default="Last Name" /></span></b></td>
              <td>
                <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${userInstance}" field="lastName"/></span></td></tr>
          </g:if>

          <g:if test="${userInstance?.gender}">
            <tr><td><b><span id="gender-label" class="property-label"><g:message code="user.gender.label" default="Gender" /></span></b></td>
              <td>
                <span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${userInstance}" field="gender"/></span></td></tr>
          </g:if>

          <g:if test="${userInstance?.email}">
            <tr><td><b><span id="email-laabel" class="property-label"><g:message code="user.email.label" default="Email" /></span></b></td>
              <td>
                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span></td></tr>
          </g:if>

          <g:if test="${userInstance?.address}">
            <tr><td><b><span id="address-label" class="property-label"><g:message code="user.address.label" default="Address" /></span></b></td>

              <td>
                <span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${userInstance}" field="address"/></span></td></tr>
          </g:if>

          <g:if test="${userInstance?.contactNo}">
            <tr><td><b><span id="contactNo-label" class="property-label"><g:message code="user.contactNo.label" default="Contact No" /></span></b></td>
              <td>
                <span class="property-value" aria-labelledby="contactNo-label"><g:fieldValue bean="${userInstance}" field="contactNo"/></span></td></tr>
          </g:if>

          <g:if test="${userInstance?.credit}">
            <tr><td><b><span id="contactNo-label" class="property-label"><g:message code="user.contactNo.label" default="Credit" /></span></b></td>
              <td>
                <span class="property-value" aria-labelledby="contactNo-label"><g:fieldValue bean="${userInstance}" field="credit"/></span></td></tr>
          </g:if>

        </table>


      </ol>
      <div class="form-actions">
        <g:form>
          <fieldset class="buttons">
            <g:hiddenField name="id" value="${userInstance?.id}" />
            <g:actionSubmit name="editProfile" value="Edit" action="editProfile" id="${userInstance?.id}" />
          </fieldset>
        </g:form>
      </div>
    </div>
  </div>
</body>
</html>
