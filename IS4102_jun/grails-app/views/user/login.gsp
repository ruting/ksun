<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'login.label', default: 'Login')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <h1>Login</h1>
</body>
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml">

  <html>
    <head>
      <title>Login to Khronosun</title>
      <meta name="layout" content="main" />
    </head>
    <body>

      <div class="body" >

        <g:if test="${session?.user}">
        </g:if>

        <g:else>

          <g:form class="dialog" url="[controller:'user',action:'login']">
            <div class="dialog">
              <h1>Sign in to your account</h1>
              <table>
                <tbody>
                  
                  <tr class="prop">
                    <td valign="top" class="name">
                      Don't have an account?
                <g:link controller="user" action="register" class="nav0">
                  Sign up now!
                </g:link>
              </td>
              </tr>

                <tr class="prop">
                  <td valign="top" class="name">
                <g:if test="${flash.message}">
                  <div class="message">${flash.message}</div>
                </g:if>
                </td>
                </tr>

                <tr class="prop">
                  <td valign="top" class="email">
                    <label for="username">Email</label>
                    <div class="email">
                      <g:textField name="email" />
                    </div>
                  </td>
                </tr>

                <tr class="prop">
                  <td valign="top" class="name">
                    <label for="password">Password</label>
                    <div class="name">
                      <g:passwordField name="password" />
                    </div>
                  </td>
                </tr>

                <tr class="prop">
                  <td valign="top" class="name">
                <g:submitButton class="orangeButton" name="submitButton" value="Sign In" />
                </td>
                </tr>

                </tbody>
                
              </table>

            </div>

          </g:form>

        </g:else>

      </div>

    </body>

  </html>
