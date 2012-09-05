<%@ page import="khronosun.ItemRating" %>



<div class="fieldcontain ${hasErrors(bean: itemRatingInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="itemRating.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${khronosun.User.list()}" optionKey="id" required="" value="${itemRatingInstance?.user?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemRatingInstance, field: 'item', 'error')} required">
	<label for="item">
		<g:message code="itemRating.item.label" default="Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="item" name="item.id" from="${khronosun.Item.list()}" optionKey="id" required="" value="${itemRatingInstance?.item?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemRatingInstance, field: 'rating', 'error')} required">
	<label for="rating">
		<g:message code="itemRating.rating.label" default="Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="rating" required="" value="${fieldValue(bean: itemRatingInstance, field: 'rating')}"/>
</div>

