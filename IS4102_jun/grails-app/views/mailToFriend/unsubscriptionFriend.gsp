<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main1">
    <title>Sample title</title>
  </head>
  <body>
    <div class="span8">

      <h1><g:message code="Unsubscribe from Newsletter!" arg s="[entityName]" /></h1>
      <br>
      <g:if test="${flash.message}">
        ${flash.message}
      </g:if>
      <g:form controller="MailToFriend" action ="unsubscribe">
        Enter your Email: <input type ="text" name="friendEmail" size="50">
        <br>
        <input type ="submit" value="Submit">
      </g:form>

    </div>
  </body>
</html>
