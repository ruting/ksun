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
    <h1>Sample line</h1>
    <g:if test="${userInstance?.userImage}">
      <img class="avatar" alt="Your image" src="${createLink(controller:'user', action:'loadImage')}" width="160px" height="180px" />
    </g:if>
    <g:else>
      <img class="avatar" alt="Your image" src="${resource(dir: 'images/user', file: 'DummyImage.gif')}" width="160px" height="180px" />
    </g:else>
  </body>
</html>
