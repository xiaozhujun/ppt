<%@ page import="ppt.PPTItem" %>
<%@ page import="java.text.SimpleDateFormat" %>
<link rel="stylesheet" href="${resource(dir:'My97DatePicker/skin',file:'WdatePicker.css')}" type="text/css">
<script type="text/javascript" src='${resource(dir: 'My97DatePicker',file: 'WdatePicker.js')}'></script>
<script type="text/javascript" charset="utf-8" src="${resource(dir: 'ueditor', file: 'ueditor.config.js')}"></script>
<script type="text/javascript" charset="utf-8" src="${resource(dir: 'ueditor', file: 'ueditor.parse.js')}"></script>
<script type="text/javascript" charset="utf-8" src="${resource(dir: 'ueditor', file: 'ueditor.all.js')}"></script>
<script type="text/javascript">

    UE.getEditor("editor",{
        maxImageSideLength:600,
        elementPathEnabled:false,
        initialFrameHeight:400,
        toolbars: [["fullscreen","source","undo","redo","insertunorderedlist",
            "insertorderedlist","unlink","link","cleardoc","selectall","print",
            "searchreplace","preview","|","pagebreak","insertimage",
            "date","time","horizontal",
            "spechars","blockquote","template",
            "bold","italic","underline","strikethrough","forecolor","backcolor",
            "superscript","subscript","justifyleft","justifycenter","justifyright",
            "justifyjustify","touppercase","tolowercase","directionalityltr",
            "directionalityrtl","indent","removeformat","formatmatch","autotypeset",
            "customstyle","paragraph","rowspacingbottom","rowspacingtop","lineheight",
            "fontfamily","fontsize","imagenone","imageleft","imageright","imagecenter",
            "inserttable","deletetable","mergeright","mergedown","splittorows",
            "splittocols","splittocells","mergecells","insertcol","insertrow",
            "deletecol","deleterow","insertparagraphbeforetable"]]

    });
</script>

<div class="fieldcontain ${hasErrors(bean: PPTItemInstance, field: 'title', 'error')} ">
    <label for="title">
        <g:message code="PPTItem.title.label" default="Title" />:

    </label>
    <g:textField name="title" value="${PPTItemInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: PPTItemInstance, field: 'startTime', 'error')} required">
    <label for="startTime">
        <g:message code="PPTItem.startTime.label" default="Start Time" />
        <span class="required-indicator">*</span>:
    </label>
    <g:if test="${PPTItemInstance?.startTime!=null}">
        <g:textField name="startTime" class="Wdate" onclick="WdatePicker()"  value="${new SimpleDateFormat("yyyy-MM-dd").format(PPTItemInstance?.startTime)}"  />
    </g:if>
    <g:else>
        <g:textField name="startTime" class="Wdate" onclick="WdatePicker()"  value=""  />
    </g:else>

</div>

<div class="fieldcontain ${hasErrors(bean: PPTItemInstance, field: 'endTime', 'error')} required">
    <label for="endTime">
        <g:message code="PPTItem.endTime.label" default="End Time" />
        <span class="required-indicator">*</span>:
    </label>
    <g:if test="${PPTItemInstance?.endTime!=null}">
        <g:textField name="endTime" class="Wdate" onclick="WdatePicker()"  value="${new SimpleDateFormat("yyyy-MM-dd").format(PPTItemInstance?.endTime)}"  />
    </g:if>
    <g:else>
        <g:textField name="endTime" class="Wdate" onclick="WdatePicker()"  value=""  />
    </g:else>

</div>

<div class="fieldcontain ${hasErrors(bean: PPTItemInstance, field: 'shouldShow', 'error')} ">
	<label for="shouldShow">
		<g:message code="PPTItem.shouldShow.label" default="Should Show" />:
		
	</label>
	<g:checkBox name="shouldShow" value="${PPTItemInstance?.shouldShow}" />
</div>

<div class="fieldcontain ${hasErrors(bean: PPTItemInstance, field: 'type', 'error')} required">
	<g:field name="type" type="hidden" value="1" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: PPTItemInstance, field: 'content', 'error')} ">
    <label for="content">
        <g:message code="PPTItem.content.label" default="Content" />:

    </label>
    <script type="text/plain" id="editor" name="content" style="width:1000px">
        ${PPTItemInstance?.content}
    </script>
    %{--<g:textField name="content" value="${PPTItemInstance?.content}"/>--}%
</div>
