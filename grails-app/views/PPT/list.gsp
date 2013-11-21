
<%@ page import="ppt.PPT" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'PPT.label', default: 'PPT')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-PPT" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-PPT" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="endTime" title="${message(code: 'PPT.endTime.label', default: 'End Time')}" />
					
						<g:sortableColumn property="shouldShow" title="${message(code: 'PPT.shouldShow.label', default: 'Should Show')}" />
					
						<g:sortableColumn property="startTime" title="${message(code: 'PPT.startTime.label', default: 'Start Time')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'PPT.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${PPTInstanceList}" status="i" var="PPTInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${PPTInstance.id}">${fieldValue(bean: PPTInstance, field: "endTime")}</g:link></td>
					
						<td>${fieldValue(bean: PPTInstance, field: "shouldShow")}</td>
					
						<td><g:formatDate date="${PPTInstance.startTime}" /></td>
					
						<td>${fieldValue(bean: PPTInstance, field: "title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${PPTInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
