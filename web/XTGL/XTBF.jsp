<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>客户</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" language="javascript"
	src="js/jquery-fn-tab.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="js/jquery.corners.min.js"></script>
<script type="text/javascript" src="js/flexigrid.js"></script>
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/ChangeImageJS.js"></script>
<link rel="stylesheet" href="CSS/flexigrid.css" type="text/css"></link>
<link rel="stylesheet" href="CSS/flexigrid.pack.css" type="text/css"></link>
<link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="CSS/table.css" />
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />
<script>
	function browseFolder(path) {
	    try {
	        var Message = "\u8bf7\u9009\u62e9\u6587\u4ef6\u5939"; //选择框提示信息
	        var Shell = new ActiveXObject("Shell.Application");
	        var Folder = Shell.BrowseForFolder(0, Message, 64, 17); //起始目录为：我的电脑
	       //var Folder = Shell.BrowseForFolder(0, Message, 0); //起始目录为：桌面
	        if (Folder != null) {
	            Folder = Folder.items(); // 返回 FolderItems 对象
	            Folder = Folder.item(); // 返回 Folderitem 对象
	            Folder = Folder.Path; // 返回路径
	            if (Folder.charAt(Folder.length - 1) != "\\") {
	                Folder = Folder + "\\";
	            }
	            document.getElementById(path).value = Folder;
	            return Folder;
	        }
	    }
	    catch (e) {
	        alert(e.message);
	    }
	}
	
	function restoreDB()
	{
		var f = document.createElement("form");
		var history = document.getElementById("history");
		f.action = "XTGL_dolist?hidden=add&type=XTHY&history="+history.value;
		f.method = "post";
		document.body.appendChild(f);
		f.submit();
	}
	function backupDB()
	{
		var f = document.createElement("form");
		f.action = "XTGL_dolist?hidden=add&type=XTBF";
		f.method = "post";
		document.body.appendChild(f);
		f.submit();
	}
</script>
<%
    
	List<String> strs = null;
    if(null != (List<String>)session.getAttribute("historystrs"))
    {
    	strs = (List<String>)session.getAttribute("historystrs");
    }
    if(strs == null)
    {
    	strs = new ArrayList<String>();
    }
%>
</head>
<body>
	<div>
		<table border="0" cellpadding="0" cellspacing="0" width="100%"
			id="tabs">
			<tr>
				<td class="tabs" align="center"><font color="white">系统备份与还原</font>
				</td>
				<td class="tabs"></td>
			</tr>
		</table>
	</div>

	<div style="height: 6px"></div>
	<div>

		<table cellpadding="0" cellspacing="0" width="706px" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>
				<td width="102" align="center" class="td1">数据库名称</td>
				<td width="160" >Fabrics</td>
				<td width="140" ><input type="button"
					name="imgBtnSearch" id="imgBtnSearch"
					 value="备份" onclick="backupDB()"/></td>
			</tr>
			<tr>
				<td width="102" align="center" class="td1">还原历史备份</td>
				<td width="160"  ><select name="history" id="history"
					class="a2" style="position: relative">
					<%
					for(int i=0;i<strs.size();i++)
					{
						%>
						<option value=<%=strs.get(i) %>><%=strs.get(i) %></option>
			  <%}	%>
				</select></td>
				<td width="100" ><input type="button"
					name="imgBtnSearch" id="imgBtnSearch"
					 value="还原" onclick="restoreDB()" /></td>
			</tr>
			<tr>
				<td width="102" align="center" class="td1">默认保存路径</td>
				<td width="160"  colspan="2"> D:/database/ </td>
			</tr>

		</table> 
<script>  
       <%
           String message = (String)request.getAttribute("modifyxtbferror");
			if (message != null && !"".equals(message)) {
				request.removeAttribute("modifyxtbferror");
		%>  
		
           alert("<%=message%>");
       <%}%>
</script>
	</div>

</body>
</html>
