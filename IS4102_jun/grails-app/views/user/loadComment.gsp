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
    <h1>Reported Comment</h1>
    <g:if test="${commentInstance}">
       <g:each in="${commentInstance}" var="c">
    <table border="1">      
     <tr>
       <td>
           <span class="property-value" aria-labelledby="comment-label"> <g:fieldValue bean="${c.user}" field="firstName"/>  Comment on the items:  <g:fieldValue bean="${c}" field ="comment"  /></span>
           <g:link controller="ItemComment" action="ban"  id="${c.id}"> Ban Comment </g:link>
           <g:link controller="ItemComment" action="approve"  id="${c.id}"> Approve Comment </g:link>          
         </td>
              </tr>
    </table>
                   </g:each>
             </g:if>
  </body>
</html>
