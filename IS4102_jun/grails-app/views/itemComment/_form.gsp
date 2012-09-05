<%@ page import="khronosun.ItemComment" %>



<div class="fieldcontain ${hasErrors(bean: itemCommentInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="itemComment.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${khronosun.User.list()}" optionKey="id" required="" value="${itemCommentInstance?.user?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemCommentInstance, field: 'item', 'error')} required">
	<label for="item">
		<g:message code="itemComment.item.label" default="Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="item" name="item.id" from="${khronosun.Item.list()}" optionKey="id" required="" value="${itemCommentInstance?.item?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemCommentInstance, field: 'comment', 'error')} required">
	<label for="comment">
		<g:message code="itemComment.comment.label" default="Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="comment" required="" value="${itemCommentInstance?.comment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemCommentInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="itemComment.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${itemCommentInstance?.status}"/>
</div>

