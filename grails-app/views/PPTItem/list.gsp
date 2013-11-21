
<%@ page import="ppt.PPTItem" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'PPTItem.label', default: 'PPTItem')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <a href="#list-PPTItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-PPTItem" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<table>
    <thead>
        <tr>
<g:sortableColumn property="title" title="${message(code: 'PPTItem.title.label', default: 'Title')}" />

<g:sortableColumn property="startTime" title="${message(code: 'PPTItem.startTime.label', default: 'Start Time')}" />

<g:sortableColumn property="endTime" title="${message(code: 'PPTItem.endTime.label', default: 'End Time')}" />

<g:sortableColumn property="shouldShow" title="${message(code: 'PPTItem.shouldShow.label', default: 'Should Show')}" />
</tr>
</thead>
<tbody>
<g:each in="${PPTItemInstanceList}" status="i" var="PPTItemInstance">
    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show" id="${PPTItemInstance.id}">${fieldValue(bean: PPTItemInstance, field: "title")}</g:link></td>

    <td><g:formatDate format="yyyy-MM-dd"  date="${PPTItemInstance.startTime}" /></td>

    <td><g:formatDate format="yyyy-MM-dd" date="${PPTItemInstance.endTime}" /></td>

    <td><g:formatBoolean boolean="${PPTItemInstance.shouldShow}" /></td>

    </tr>
</g:each>
    </tbody>
</table>
    <div class="pagination">
        <g:paginate total="${PPTItemInstanceTotal}" />
    </div>
    </div>
</body>
</html>
