
<%@ page import="khronosun.ItemTemplate" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemTemplate.label', default: 'ItemTemplate')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-itemTemplate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-itemTemplate" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list itemTemplate">
			
				<g:if test="${itemTemplateInstance?.templateName}">
				<li class="fieldcontain">
					<span id="templateName-label" class="property-label"><g:message code="itemTemplate.templateName.label" default="Template Name" /></span>
					
						<span class="property-value" aria-labelledby="templateName-label"><g:fieldValue bean="${itemTemplateInstance}" field="templateName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemTemplateInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="itemTemplate.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${itemTemplateInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemTemplateInstance?.dateAdded}">
				<li class="fieldcontain">
					<span id="dateAdded-label" class="property-label"><g:message code="itemTemplate.dateAdded.label" default="Date Added" /></span>
					
						<span class="property-value" aria-labelledby="dateAdded-label"><g:formatDate date="${itemTemplateInstance?.dateAdded}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemTemplateInstance?.templateImage}">
				<li class="fieldcontain">
					<span id="templateImage-label" class="property-label"><g:message code="itemTemplate.templateImage.label" default="Template Image" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemTemplateInstance?.imageType}">
				<li class="fieldcontain">
					<span id="imageType-label" class="property-label"><g:message code="itemTemplate.imageType.label" default="Image Type" /></span>
					
						<span class="property-value" aria-labelledby="imageType-label"><g:fieldValue bean="${itemTemplateInstance}" field="imageType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemTemplateInstance?.item}">
				<li class="fieldcontain">
					<span id="item-label" class="property-label"><g:message code="itemTemplate.item.label" default="Item" /></span>
					
						<g:each in="${itemTemplateInstance.item}" var="i">
						<span class="property-value" aria-labelledby="item-label"><g:link controller="item" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${itemTemplateInstance?.viewCount}">
				<li class="fieldcontain">
					<span id="viewCount-label" class="property-label"><g:message code="itemTemplate.viewCount.label" default="View Count" /></span>
					
						<span class="property-value" aria-labelledby="viewCount-label"><g:fieldValue bean="${itemTemplateInstance}" field="viewCount"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${itemTemplateInstance?.id}" />
					<g:link class="edit" action="edit" id="${itemTemplateInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
