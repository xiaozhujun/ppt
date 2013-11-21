
<%@ page import="ppt.PPTItem" %>
<!DOCTYPE html>
<html>
<head>
    <g:set var="entityName" value="${message(code: 'PPTItem.label', default: 'PPTItem')}" />
    <title>幻灯片投影</title>
    <link rel="stylesheet" href="${resource(dir: "css",file: "pptView.css")}" type="text/css">
    <script type="text/javascript" src='${resource(dir: 'js',file: 'jquery-1.7.2.min.js')}'></script>
</head>
<body>
<div id="pptItemList">
    <ul class="pptItemUL">
    <g:each in="${PPTItemInstanceList}" status="i" var="PPTItemInstance">
        <li class="pptItemLi">
            <div class="pptItem">
                <div class="pptTitle">${PPTItemInstance?.title}</div>
                <div class="pptContent">${PPTItemInstance?.content}</div>
            </div>
        </li>
    </g:each>
    </ul>
</div>
<script language="javascript">
    $(function(){
        setInterval(refreshPage,60000)
    });
    function refreshPage(){
        location.reload();
    }
</script>

<script type="text/javascript" src='${resource(dir: 'js',file: 'slide.js')}'></script>
</body>
</html>
