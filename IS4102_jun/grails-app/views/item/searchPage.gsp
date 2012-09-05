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
  <g:form action="searchAJAX">
    Search Item
    <input type="text" name="search" value="${params.search}" />
    <input type="submit" value="Search" />
  </g:form>
  <table>
    <g:each in="${searchInstanceList}" var="i">
      <tr>
        <td><g:link action="show" id="${searchInstanceList.id}">${fieldValue(bean: itemInstance, field: "itemName")}</g:link></td>

      <td>${fieldValue(bean: itemInstance, field: "description")}</td>

      <td>${fieldValue(bean: itemInstance, field: "price")}</td>

      <td>${fieldValue(bean: itemInstance, field: "quantity")}</td>

      <td>${fieldValue(bean: itemInstance, field: "category")}</td>
      </tr>
    </g:each>
  </table>
</body>
</html>
