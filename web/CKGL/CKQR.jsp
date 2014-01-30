<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TabPanel</title>
<style>
html, body {
	width : 100%;
	height : 100%;
	padding : 0;
	margin : 0;
	overflow : hidden;
}
</style>
<link href="CSS/core.css" rel="stylesheet" type="text/css"/>
<link href="CSS/TabPanel.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tabpanel/Fader.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tabpanel/TabPanel.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tabpanel/Math.uuid.js"></script>
</head>

<body>

<script type="text/javascript">
var tabpanel;
$(document).ready(function(){
	  tabpanel = new TabPanel({
		renderTo:'tab',
		autoResizable:true,
		border:'none',
		active : 0,
		maxLength : 10,
		width : 870,
		items : [{
			id:'toolbarPlugin',
			title:'生产出库确认',
			icon:'image/read-n.gif',
			html:'<iframe id="callIframe" src="DisPatch_getLevel23Url?m2=4&m3=0" width="50%" height="50%" frameborder="0"></iframe>',
			closable: false
		},{
			id:'toolbarPlugin3',
			title:'销售出库确认',
			icon:'image/read-n.gif',
			html:'<iframe id="callIframe" src="DisPatch_getLevel23Url?m2=4&m3=2" width="50%" height="50%" frameborder="0"></iframe>',
			closable: false
		},{
			id:'toolbarPlugin4',
			title:'退货出库确认',
			icon:'image/read-n.gif',
			html:'<iframe id="callIframe" src="DisPatch_getLevel23Url?m2=4&m3=3" width="50%" height="50%" frameborder="0"></iframe>',
			closable: false
		}]
	});
});
</script>
<div id="tab" style="width:500px;"></div>
</body>
</html>