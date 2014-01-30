<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="com.jiang.bean.CGGLDJGL"%>
<%@page import="com.jiang.bean.ZLGLYLZL"%>
<%@page import="com.jiang.bean.ZLGLBCPZL"%>
<%@page import="com.jiang.bean.ZLGLCPZL"%>
<%@page import="com.jiang.bean.ZLGLSPZL"%>
<%@page import="com.jiang.bean.GYS"%>
<%@page import=" java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单据管理</title>
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
<script src="js/select/liquidmetal.js" type="text/javascript"></script>
<script src="js/select/jquery.flexselect.js" type="text/javascript"></script>
     <script type="text/javascript">
      $(document).ready(function() {
        $("select.flexselect").flexselect();
       // $("input:text:enabled:first").focus();
      });
      function readyshow()
      {
          $("select.flexselect").flexselect();
    	 //$("input:text:enabled:first").focus();
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
	$.validator.addMethod("compareDate", function(value, element, param) {
         var date1 = new Date();
         var reg = new RegExp("-", "g");//g表示替换所有  
         var date2 = new Date(Date.parse(value.replace(reg, "/")));
         var x = date1 < date2;
         return date1 < date2;
     },"必须大于今天");
	
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
				gystype : {
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
				gystype : {
					selectNone : "请选择类型"
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
		f.action = "DisPatch_getUrl?i=0&j=1";
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
		var ui4 = document.getElementById("hide4");
		var gt = document.getElementById("gystype");

		var value = gt.value;
		if(value == "原料")
		{
			ui1.style.display="";//显示
			ui2.style.display="none";//隐藏
			ui3.style.display="none";
			ui4.style.display="none";
		}
		if(value == "半成品")
		{
			ui1.style.display="none";//显示
			ui2.style.display="";//隐藏
			ui3.style.display="none";
			ui4.style.display="none";
		}
		if(value == "成品")
		{
			ui1.style.display="none";//显示
			ui2.style.display="none";//隐藏
			ui3.style.display="";
			ui4.style.display="none";
		}
		if(value == "商品")
		{
			ui1.style.display="none";//显示
			ui2.style.display="none";//隐藏
			ui3.style.display="none";
			ui4.style.display="";
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
<body onload="enableselect();">
<%
	Integer gysid = 0;
	String gystype = "--请选择--";
	String id="";
   CGGLDJGL djgl = null;
   String num = "";
   String username = "";
   String typenum ="";
   String xiadandate = "";
   String caigouid = "";
   String beizhu = "";
	if (null != request.getAttribute("djgl_add")) {
		djgl = (CGGLDJGL) request.getAttribute("djgl_add");
		id = String.valueOf(djgl.getId());
		gysid = djgl.getGongyingshangid();
		num = String.valueOf(djgl.getCG_totalnum());
		gystype = djgl.getLeixing();
		typenum = djgl.getType_num();
		xiadandate =  new SimpleDateFormat("yyyy-MM-dd").format(djgl.getJiaohuo_time());
		caigouid = djgl.getCaigou_id();
		if(null != djgl.getBeizhu())
		{
			beizhu = djgl.getBeizhu();
		}
		
	}
	if (null != session.getAttribute("user")) {
		com.jiang.bean.User user = (com.jiang.bean.User) session.getAttribute("user");
		username = user.getRealName();
	}
	if(caigouid == "")
	{
	  Random rdm = new Random(System.currentTimeMillis());
      int intRd = Math.abs(rdm.nextInt())%9999+1;
      SimpleDateFormat formater = new SimpleDateFormat("yyMMdd");
      caigouid =  "CG"+formater.format(new Date())+String.format("%04d", intRd); 
	}
%>
	<form id="form1" name="form1" method="post"
		action="CGGL_dolist?hidden=add&type=DJGL">
		<input type="hidden" name="id" value="<%=id%>"/>
		<div>
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				id="tabs">
				<tr>
					<td class="tabs" align="center"><font color="white">采购开单</font>
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
							<table cellSpacing=0 cellPadding=0 width=1000
								align=center class="tb" >
							<col style="width: 20%" />
							<col style="width: 30%" />
							<col style="width: 50%" />
								<tbody>
								 <tr>
										<td class=td3 align="center" style="width:10%">采购单号</td>
										<td><input type="text" size="24" id="caigoudanid"  value="<%=caigouid%>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="caigoudanid" maxlength="24"/>
										</td>
										<td>&nbsp;</td>
								</tr>
							
								<tr>
										<td class=td3 width=40 align="center">类型</td>
										<td  ><select style="position: relative;" onchange="enableselect()"  
											id="gystype"  name="gystype" >
											<%
											String values[] = {"原料","半成品","成品","--请选择--"};
											for(int i=0;i<values.length;i++){
											%>
												<OPTION value="<%=values[i]%>" <%if (values[i].equals(gystype)) {%> selected <%} %> ><%=values[i]%></OPTION>
											<%}%>
										</select></td>
										<td id="zgmmerror">&nbsp;</td>
								</tr>
										<tr>
										<td class=td3 align="center" style="width:10%">型号</td>
										<td>
										<div id="hide1" style="display:none">
											<select  class="flexselect"  id="xinghao1" 
											name="xinghao" >
											<%
											Map<String, List<String>> strs = new HashMap<String, List<String>>();
											if (null != session.getAttribute("type_nums")) {
												strs = (Map<String, List<String>>) session.getAttribute("type_nums");
											}
											List<String> str1 = strs.get("str1");
											for(int i=0;i<str1.size();i++)
											{
											%>
											<option <%if(str1.get(i).equals(typenum)) {%> selected<%}%> ><%=str1.get(i) %></option>
											<%	
											}
											%>
											</select></div>
										<div id="hide2"   style="display:none">
											<select class="flexselect"  id="xinghao2" 
											name="xinghao"  >
											<%
											List<String> str2 = strs.get("str2");
											for(int i=0;i<str2.size();i++)
											{
											%>
											<option <%if(str2.get(i).equals(typenum)) {%> selected<%}%> ><%=str2.get(i) %></option>
											<%	
											}
											%>
											</select>
											</div>	
											
										<div id="hide3"   style="display:none">
											<select  class="flexselect"  id="xinghao3" 
											name="xinghao"  >
											<%
											List<String> str3 = strs.get("str3");
											for(int i=0;i<str3.size();i++)
											{
											%>
											<option <%if(str3.get(i).equals(typenum)) {%> selected<%}%> ><%=str3.get(i) %></option>
											<%	
											}
											%>
											</select>
											</div>
											
										<div id="hide4"  style="display:none" >
											<select  class="flexselect"  id="xinghao4" 
											name="xinghao" >
											<%
											List<String> str4 = strs.get("str4");
											for(int i=0;i<str4.size();i++)
											{
											%>
											<option <%if(str4.get(i).equals(typenum)) {%> selected<%}%> ><%=str4.get(i) %></option>
											<%	
											}
											%>
											</select>
											</div>
										</td>
										<td>&nbsp;</td>
								</tr>
									<tr>
										<td class=td3 align="center" >采购数量</td>
										<td><input type="text" size="24" id="totalnum" value="<%=num%>"
											name="totalnum" maxlength="24"/>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >交货日期</td>
										<td><input name="jiaohuoText"
									type="text" id="jiaohuoText" class="Wdate" value="<%=xiadandate %>"
									onClick="WdatePicker()"
									style="width: 180px; position: relative" /> 
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >操作人</td>
										<td><input type="text" size="24" id="opname"  value="<%=username%>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="opname" maxlength="24"/>
										</td>
										<td>&nbsp;</td>
									</tr>
								
									<tr>
										<td class=td3 align="center" >备注</td>
										<td style="HEIGHT: 100px;width: 300px"><textarea id="xiangxi" 
												name="xiangxi" rows="5"><%=beizhu %></textarea> </td>
										<td>&nbsp;</td>
									</tr>

								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table>
								<tbody>
									<tr>
										<td style="HEIGHT: 26px" width=100 align=right><INPUT
											style="POSITION: relative; BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											onmouseover="ChangeImage(this,'images/Sure2.gif')"
											onmouseout="ChangeImage(this,'images/Sure1.gif')"
											src="images/Sure1.gif" type=image></td>
										<td style="HEIGHT: 26px" width=100 align=right><INPUT
											style="POSITION: relative; BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											onmouseover="ChangeImage(this,'images/C2.gif')"
											onmouseout="ChangeImage(this,'images/C1.gif')"
											src="images/C1.gif" type="image"
											onClick="backMenu();return false;"></td>

									</tr>
								</tbody>
							</table>
						</td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<script>  
       <%
           String message = (String)request.getAttribute("modifydjglerror");
			if (message != null && !"".equals(message)) {
				request.removeAttribute("modifydjglerror");
		%>  
		
           alert("<%=message%>");
       <%}%>
</script>
</body>
</html>