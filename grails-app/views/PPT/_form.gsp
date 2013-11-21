<%@ page import="ppt.PPT" %>



<div class="fieldcontain ${hasErrors(bean: PPTInstance, field: 'endTime', 'error')} required">
	<label for="endTime">
		<g:message code="PPT.endTime.label" default="End Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endTime" precision="day"  value="${PPTInstance?.endTime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: PPTInstance, field: 'shouldShow', 'error')} required">
	<label for="shouldShow">
		<g:message code="PPT.shouldShow.label" default="Should Show" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="shouldShow" type="number" value="${PPTInstance.shouldShow}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: PPTInstance, field: 'startTime', 'error')} required">
	<label for="startTime">
		<g:message code="PPT.startTime.label" default="Start Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startTime" precision="day"  value="${PPTInstance?.startTime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: PPTInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="PPT.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${PPTInstance?.title}"/>
</div>

