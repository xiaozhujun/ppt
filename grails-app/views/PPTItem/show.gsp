
<%@ page import="ppt.PPTItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'PPTItem.label', default: 'PPTItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-PPTItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-PPTItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list PPTItem">
			
				<g:if test="${PPTItemInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="PPTItem.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${PPTItemInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${PPTItemInstance?.createTime}">
				<li class="fieldcontain">
					<span id="createTime-label" class="property-label"><g:message code="PPTItem.createTime.label" default="Create Time" /></span>
					
						<span class="property-value" aria-labelledby="createTime-label"><g:formatDate date="${PPTItemInstance?.createTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${PPTItemInstance?.endTime}">
				<li class="fieldcontain">
					<span id="endTime-label" class="property-label"><g:message code="PPTItem.endTime.label" default="End Time" /></span>
					
						<span class="property-value" aria-labelledby="endTime-label"><g:formatDate date="${PPTItemInstance?.endTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${PPTItemInstance?.shouldShow}">
				<li class="fieldcontain">
					<span id="shouldShow-label" class="property-label"><g:message code="PPTItem.shouldShow.label" default="Should Show" /></span>
					
						<span class="property-value" aria-labelledby="shouldShow-label"><g:formatBoolean boolean="${PPTItemInstance?.shouldShow}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${PPTItemInstance?.startTime}">
				<li class="fieldcontain">
					<span id="startTime-label" class="property-label"><g:message code="PPTItem.startTime.label" default="Start Time" /></span>
					
						<span class="property-value" aria-labelledby="startTime-label"><g:formatDate date="${PPTItemInstance?.startTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${PPTItemInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="PPTItem.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${PPTItemInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${PPTItemInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="PPTItem.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${PPTItemInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${PPTItemInstance?.id}" />
					<g:link class="edit" action="edit" id="${PPTItemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
