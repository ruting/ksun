<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name ="layout" content="main"/>

    <title>Upload profile picture</title>
  </head>
<body>
<g:form action="uploadImage" method="post" enctype="multipart/form-data" >

  <div class="dialog">

  <h1>Upload profile picture</h1>

    <table>
    <tbody>
     <tr class="prop">
      <td valign="top" class="name">

          <label for="avatar"></label>
          <input type="file" name="userImage" id="userImage" />
          <div style="font-size:0.8em; margin: 1.0em;" >
          For best results, your image should have a width-to-height ratio of 9:10.<br>
          For example, if your image is 120 pixels wide, it should be 133 pixels high.
          </div>
          <input type="submit" class="orangeButton" value="Upload" />
           <g:actionSubmit value="Cancel" class="orangeButton" action="account" />
      </td>
      </tr>
     </tbody>

    </table>

     <g:if test="${flash.message}">
     <div class="message">${flash.message}</div>
     </g:if>
  </div>
  </g:form>
</body>
</html>
