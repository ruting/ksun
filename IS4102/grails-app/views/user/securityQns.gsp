<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
  </head>
  <body>
      <g:if test="${flash.message}">
                        <h2>${flash.message}</h2>
                          <br>
                        </g:if>
<g:form controller="User" action ="resetPassword">
    <input type ="hidden" name="email" value="${params.email}">${params.email}
    <br>
    Your Security Question is: ${params.question}
    <input type="hidden" name="qns" value="${params.question}">
    <br>
    Enter your Security Answer: <input type="text" name="ans" size="50">
    <input type ="submit" value="Submit">
  </g:form>
  </body>
</html>
