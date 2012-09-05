<%@ page import="khronosun.Item" %>



<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'itemName', 'error')} required">
	<label for="itemName">
		<g:message code="item.itemName.label" default="Item Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="itemName" required="" value="${itemInstance?.itemName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="item.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${itemInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="item.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="price" required="" value="${fieldValue(bean: itemInstance, field: 'price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="item.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="quantity" required="" value="${fieldValue(bean: itemInstance, field: 'quantity')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'dateAdded', 'error')} required">
	<label for="dateAdded">
		<g:message code="item.dateAdded.label" default="Date Added" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateAdded" precision="day"  value="${itemInstance?.dateAdded}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="item.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${khronosun.Category.list()}" optionKey="id" required="" value="${itemInstance?.category?.categoryType}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'itemImage', 'error')} ">
	<label for="itemImage">
		<g:message code="item.itemImage.label" default="Item Image" />
		
	</label>
	<input type="file" id="itemImage" name="itemImage" />
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'imageType', 'error')} ">
	<label for="imageType">
		<g:message code="item.imageType.label" default="" />
		
	</label>
	<g:hiddenField name="imageType" value="${itemInstance?.imageType}"/>
</div>

