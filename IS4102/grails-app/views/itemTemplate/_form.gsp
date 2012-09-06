<%@ page import="khronosun.ItemTemplate" %>



<div class="fieldcontain ${hasErrors(bean: itemTemplateInstance, field: 'templateName', 'error')} required">
	<label for="templateName">
		<g:message code="itemTemplate.templateName.label" default="Template Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="templateName" required="" value="${itemTemplateInstance?.templateName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemTemplateInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="itemTemplate.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="price" required="" value="${fieldValue(bean: itemTemplateInstance, field: 'price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemTemplateInstance, field: 'dateAdded', 'error')} required">
	<label for="dateAdded">
		<g:message code="itemTemplate.dateAdded.label" default="Date Added" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateAdded" precision="day"  value="${itemTemplateInstance?.dateAdded}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: itemTemplateInstance, field: 'templateImage', 'error')} ">
	<label for="templateImage">
		<g:message code="itemTemplate.templateImage.label" default="Template Image" />
		
	</label>
	<input type="file" id="templateImage" name="templateImage" />
</div>

<div class="fieldcontain ${hasErrors(bean: itemTemplateInstance, field: 'imageType', 'error')} ">
	<label for="imageType">
		<g:message code="itemTemplate.imageType.label" default="Image Type" />
		
	</label>
	<g:textField name="imageType" value="${itemTemplateInstance?.imageType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemTemplateInstance, field: 'item', 'error')} ">
	<label for="item">
		<g:message code="itemTemplate.item.label" default="Item" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${itemTemplateInstance?.item?}" var="i">
    <li><g:link controller="item" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="item" action="create" params="['itemTemplate.id': itemTemplateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'item.label', default: 'Item')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: itemTemplateInstance, field: 'viewCount', 'error')} required">
	<label for="viewCount">
		<g:message code="itemTemplate.viewCount.label" default="View Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="viewCount" required="" value="${fieldValue(bean: itemTemplateInstance, field: 'viewCount')}"/>
</div>

