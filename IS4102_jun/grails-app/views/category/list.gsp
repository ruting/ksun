
<%@ page import="khronosun.Category" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main1">
  <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <div class="span8">
    <a href="#list-category" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
      <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
      </ul>
    </div>
    <div id="list-category" class="content scaffold-list" role="main">
      <h1><g:message code="default.list.label" args="[entityName]" /></h1>
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
        </thead>
        <div></div>
        <tbody>
        <g:each in="${categoryInstanceList}" status="i" var="categoryInstance">
          <g:if test="${i%3==0}">

            <g:if test="${i==0}">
              <tr>
                <td>
              <g:link action="show" id="${categoryInstance.id}">
                <g:if test="${categoryInstance?.categoryImage}">
                  <img class="avatar" alt="${categoryInstance?.id}" src="${createLink(controller:'category', action:'loadImage', id:categoryInstance.id)}" width="160px" height="180px" />
                </g:if>
                <g:else>
                  <img class="avatar" alt="Your image" src="${resource(dir: 'images/', file: 'apple-touch-icon-retina.png')}" width="160px" height="180px" />
                </g:else>
                <div></div>
                <div align="center">${fieldValue(bean: categoryInstance, field: "categoryType")}</div>
              </g:link>
              </td>
            </g:if>

            <g:else>
              </tr>
              <tr>
                <td>
              <g:link action="show" id="${categoryInstance.id}">
                <g:if test="${categoryInstance?.categoryImage}">
                  <img class="avatar" alt="${categoryInstance?.id}" src="${createLink(controller:'category', action:'loadImage', id:categoryInstance.id)}" width="160px" height="180px" />
                </g:if>
                <g:else>
                  <img class="avatar" alt="Your image" src="${resource(dir: 'images/', file: 'apple-touch-icon-retina.png')}" width="160px" height="180px" />
                </g:else>
                <div></div>
                <div align="center">${fieldValue(bean: categoryInstance, field: "categoryType")}</div>
              </g:link>
              </td>
            </g:else>
          </g:if>

          <g:else>
            <td>
            <g:link action="show" id="${categoryInstance.id}">
              <g:if test="${categoryInstance?.categoryImage}">
                <img class="avatar" alt="${categoryInstance?.id}" src="${createLink(controller:'category', action:'loadImage', id:categoryInstance.id)}" width="160px" height="180px" />
              </g:if>
              <g:else>
                <img class="avatar" alt="Your image" src="${resource(dir: 'images/', file: 'apple-touch-icon-retina.png')}" width="160px" height="180px" />
              </g:else>
              <div></div>
              <div align="center">${fieldValue(bean: categoryInstance, field: "categoryType")}</div>
            </g:link>
            </td>
          </g:else>

          <g:if test="${i==categoryInstanceList.size()-1}">
            <g:if test="${i%3==1}">
              <td></td>
              <td></td>
            </g:if>
            <g:if test="${i%3==2}">
              <td></td>
            </g:if>
            </tr>
          </g:if>
        </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${categoryInstanceTotal}" />
      </div>
    </div>
  </div>
</body>
</html>

