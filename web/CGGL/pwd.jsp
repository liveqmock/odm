<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>inner2</title>
<script type="text/javascript">
<!--
//注：每个嵌入页必须定义该方法，供父窗口调用，并且返回true或false来告之父窗口是否关闭
function Ok(){
	var pwd =document.getElementById("backname").value;
	window.parent.deletebypwd(pwd);
	//回调函数
	window.parent.JqueryDialog.SubmitCompleted("", true, false);
	return false;
}

function ll()
{
	var backnames = document.getElementById("backname");
	backnames.focus();
}
//-->
</script>
</head>

<body style="margin:0px;padding:0px;" onload="ll()">
<form id="form1" action="" method="post">
		请输入主管密码：
        <input type="password" value="" id="backname" maxlength="10"  name="backname" >

</form>
</body>
</html>
