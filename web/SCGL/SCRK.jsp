<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@page import="java.util.*"%>
<%@page import=" java.text.SimpleDateFormat"%>
<%@page import="com.jiang.bean.CGGLDJGL"%>
<%@page import="com.jiang.bean.ZLGLYLZL"%>
<%@page import="com.jiang.bean.ZLGLBCPZL"%>
<%@page import="com.jiang.bean.ZLGLCPZL"%>
<%@page import="com.jiang.bean.ZLGLSPZL"%>
<%@page import="com.jiang.bean.GYS"%>
<%@ page import="com.jiang.util.PublicFunc" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>入库管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" language="javascript"
	src="js/jquery-fn-tab.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="js/jquery.corners.min.js"></script>
<script type="text/javascript" src="js/flexigrid.js"></script>
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src=js/validate/jquery.validate.js></script>
<script type="text/javascript" src=js/validate/jquery.form.js></script>
<script type="text/javascript" src=js/validate/valid.js></script>
<link type="text/css" rel="stylesheet" href="js/validate/validate.css" />
<script type="text/javascript" src="js/ChangeImageJS.js"></script>
<link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"/>

<link type="text/css" rel="stylesheet" href="CSS/table.css" />
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />
<link rel="stylesheet" href="CSS/flexselect.css" type="text/css" media="screen" />
    <style>
    </style>
    <script src="js/select/liquidmetal.js" type="text/javascript"></script>
    <script src="js/select/jquery.flexselect.js" type="text/javascript"></script>
     <script type="text/javascript">
      $(document).ready(function() {
        $("select.flexselect").flexselect();
      });
      function readyshow()
      {
          $("select.flexselect").flexselect();
      }
    </script>

<script type="text/javascript">
	/**  
	 * 自定义验证规则——增加对select的验证  
	 */
	$.validator.addMethod("selectNone", // name验证方法名   
	function(value, element) // 验证规则   
	{
		if (value == "--请选择--") // select默认值需要设置为"none"(当然可以自定义其他值）   
		{
			return false;
		} else {
			return true;
		}
	}, "必须选择一项" // 默认验证消息（自定义规则信息的国际化是否不起作用？）   
	);
	
	$(document).ready(function() {
		var validator = $("#form1").validate({
			debug : true, //调试模式取消submit的默认提交功能  
			errorClass : "haha",//默认为错误的样式类为：error  
			focusInvalid : true,
			onfocusout : function(element) {
				$(element).valid();
			},
			onkeyup : function(element) {
				$(element).valid();
			},
			submitHandler : function(form) {
				form.submit();
			},
			rules : {
				rukutype : {
					selectNone : "ss"
				},
				gysname : {
					required : true
				},
				jiaohuoText : {
					required : true,
					compareDate : true
				},
				totalnum : {
					required : true,
					number : true,
					min : 1
				}
			},
			messages : {
				rukutype : {
					selectNone : "请选择入库凭据"
				},
				gysname : {
					required : "请输入供应商名称"
				},
				jiaohuoText : {
					required : "请输入交货日期",
					compareDate : "必须大于今天"
				},
				totalnum : {
					number : "请输入数字",
					required : "请输入数量",
					min : "数量必须大于 1"
				}
			},
			errorPlacement : function(error, element) { //验证消息放置的地方  
				error.appendTo(element.parent("td").next("td"));
			},
			highlight : function(element, errorClass) { //针对验证的表单设置高亮  
				$(element).addClass(errorClass);
			}/*,
			success : function(label) {
				label.addClass("valid").text("");
			}*/
		});
		$("button").click(function() {
			validator.resetForm();
		});
	});
	function backMenu() {
		var f = document.createElement("form");
		f.action = "DisPatch_getUrl?i=1&j=0";
		f.target = "mainframe";
		f.method = "post";
		document.body.appendChild(f);
		f.submit();
	}
	function enableselect()
	{
		var ui1 = document.getElementById("hide1");
		var ui2 = document.getElementById("hide2");
		var ui3 = document.getElementById("hide3");
		var gt = document.getElementById("rukutype");

		var value = gt.value;
		if(value == "采购入库")
		{
			ui1.style.display="";//显示
			ui2.style.display="none";//隐藏
			ui3.style.display="none";
		}
		if(value == "自加工入库")
		{
			ui1.style.display="none";//显示
			ui2.style.display="";//隐藏
			ui3.style.display="none";
		}
		if(value == "外加工入库")
		{
			ui1.style.display="none";//显示
			ui2.style.display="none";//隐藏
			ui3.style.display="";
		}

		if(value == "--请选择--")
		{
			ui1.style.display="none";//
			ui2.style.display="none";//隐藏
			ui3.style.display="none";
			ui4.style.display="none"; 
		}
	}
	
</script>
</head>
<body onload="enableselect()">
<%
String danhao = "";
String rukutype = "--请选择--";
String pingzheng = "";
if(danhao.equals(""))
{
	  Random rdm = new Random(System.currentTimeMillis());
      int intRd = Math.abs(rdm.nextInt())%9999+1;
      SimpleDateFormat formater = new SimpleDateFormat("yyMMdd");
      danhao =  "RK"+formater.format(new Date())+String.format("%04d", intRd); 
}

%>
	<form id="form1" name="form1" method="post" action="CKGL_dolist?hidden=add&type=RKSQ">
		<div>
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				id="tabs">
				<tr>
					<td class="tabs" align="center"><font color="white">入库申请</font>
					</td>
					<td class="tabs"></td>
				</tr>
			</table>
		</div>

		<DIV id=UpdatePanel1>
			<table align=center>
				<tbody>
					<tr>
						<td>
							<table cellSpacing=0 cellPadding=0 width=800
								align=center class="tb" >
								<tbody>
								<tr>

				<input type="text" name="danhao"  style="display: none" id="danhao"
				onfocus="this.blur()" readonly="readonly"  style="color:gray" 
				 value=<%=danhao %> />
				<tr>
				<td  class=td1 width=40 align="center">入库凭据 </td>
				<td >
				
				<select  style="position: relative;" onchange="enableselect()"  
				id="rukutype"  name="rukutype">
					<%
					String values[] = { PublicFunc.RK_TYPE_CG, PublicFunc.RK_TYPE_ZJG, PublicFunc.RK_TYPE_WJG,"--请选择--"};
					for(int i=0;i<values.length;i++){
					%>
						<OPTION value="<%=values[i]%>" <%if (values[i].equals(rukutype)) {%> selected <%} %> ><%=values[i]%></OPTION>
					<%}%>
				</select>
				</td>
				<td>
					<div id="hide1" style="display:none">
				<select class="flexselect" class="flexselect"  id="xinghao1" 
							name="pingzhengnum" >
                    <option></option>
					<%
							Map<String, List<String>> strs = new HashMap<String, List<String>>();
							if (null != session.getAttribute("dhids")) {
								strs = (Map<String, List<String>>) session.getAttribute("dhids");
							}
							List<String> str1 = strs.get("cgids");
							for(int i=0;i<str1.size();i++)
							{
							%>
							<option <%if(str1.get(i).equals(pingzheng)) {%> selected<%}%> ><%=str1.get(i) %></option>
							<%	
							}
							%>
							</select></div>
						<div id="hide2"   style="display:none">
							<select class="flexselect"  id="xinghao2" 
							name="pingzhengnum"  >
                                <option>请点击后输入</option>
							<%
							List<String> str2 = strs.get("zjgids");
							for(int i=0;i<str2.size();i++)
							{
							%>
							<option <%if(str2.get(i).equals(pingzheng)) {%> selected<%}%> ><%=str2.get(i) %></option>
							<%	
							}
							%>
							</select>
							</div>	
							
						<div id="hide3"   style="display:none">
							<select class="flexselect"  id="xinghao3" 
							name="pingzhengnum"  >
                                <option>请点击后输入</option>
							<%
							List<String> str3 = strs.get("wjgids");
							for(int i=0;i<str3.size();i++)
							{
							%>
							<option <%if(str3.get(i).equals(pingzheng)) {%> selected<%}%> ><%=str3.get(i) %></option>
							<%	
							}
							%>
							</select>
							</div>
						</td>
						<td>
						 <input type="submit" name="ID" value="开始入库" onclick="" id="ID" />
						</td>
		   	</tr>
				</tbody>
				</table>
			</table>
		</div>
	</form>
<script>  
       <%
           String message = (String)request.getAttribute("modifyrksqlerror");
			if (message != null && !"".equals(message)) {
				request.removeAttribute("modifyrksqlerror");
		%>  
		
           alert("<%=message%>");
       <%}%>
</script>
</body>
</html>