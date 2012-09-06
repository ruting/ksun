<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main1">
    <title>Forget Password</title>
  </head>
  <body>
    <div class="span8">
      <g:if test="${flash.message}">
        <h2>${flash.message}</h2>
        <br>
      </g:if>
      <g:form controller="User" action ="forgetPasswordProcess">
        Enter your Email: <input type ="text" name="email" size="50">
        <br>
        <input type ="submit" value="Submit">
      </g:form>
    </div>
  </body>
</html>
