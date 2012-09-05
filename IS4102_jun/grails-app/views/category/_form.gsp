<%@ page import="khronosun.Category" %>



<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'categoryType', 'error')} required">
	<label for="categoryType">
		<g:message code="category.categoryType.label" default="Category Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="categoryType" required="" value="${categoryInstance?.categoryType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'categoryImage', 'error')} ">
	<label for="categoryImage">
		<g:message code="category.categoryImage.label" default="Category Image" />
		
	</label>
	<input type="file" id="categoryImage" name="categoryImage" />
</div>


<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'imageType', 'error')} ">
	<label for="imageType">
		<g:message code="category.imageType.label" default="" />

	</label>
	<g:hiddenField name="imageType" value="${categoryInstance?.imageType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'item', 'error')} ">
	<label for="item">
		<g:message code="category.item.label" default="Item" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${categoryInstance?.item?}" var="i">
    <li><g:link controller="item" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="item" action="create" params="['category.id': categoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'item.label', default: 'Item')])}</g:link>
</li>
</ul>

</div>

