<%@page import="com.jiang.bean.BCPKJ_Apply"%>
<%@page import="com.jiang.bean.ZLGLYLZL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<%@page import="com.jiang.bean.BCPKJ_Apply"%>
<%@page import="com.jiang.bean.CangKu"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>半成品开剪申请</title>
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
<link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="CSS/table.css" />
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />

<script type="text/javascript">
	$(document).ready(function() {
		var a = document.getElementById("mishu");
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
				getmishu : {
					required : true,
					number : true,
					min : 1,
					max : a.value-1
				}
			},
			messages : {
				getmishu : {
					number : "请输入数字",
					required : "请输入米数",
					min : "数量必须大于 0",
					max : "超过可用米数"
				}
			},
			errorPlacement : function(error, element) { //验证消息放置的地方  
				error.appendTo(element.parent("td").next("td"));
			},
			highlight : function(element, errorClass) { //针对验证的表单设置高亮  
				$(element).addClass(errorClass);
			}/*,
			success : function(label) {
				label.addClass("valid").text("Ok!");
			}*/
		});
		$("button").click(function() {
			validator.resetForm();
		});
	});
	function backMenu() {
		var f = document.createElement("form");
		f.action = "DisPatch_getUrl?i=4&j=6";
		//f.target = "mainframe";
		f.method = "post";
		document.body.appendChild(f);
		f.submit();
	}
	
</script>
</head>
<body >
<%
	String danhao = "";
	String bupiid = "";
	String xinghao = "";
	String mishu = "";
	String getmishu = "";
	String beizhu  = "";
	String shenqren = "";
	String shenqtime = "";
	int id = -1;
	
	if(null != request.getAttribute("bcpkj"))
	{
		BCPKJ_Apply xh = (BCPKJ_Apply)request.getAttribute("bcpkj");
		
		if(xh.getId() != null)
		{
			id = xh.getId();
		}
		if(xh.getKaijian_id() != null)
		{
			danhao = xh.getKaijian_id();
		}
		if(xh.getBupi_id() != null)
		{
			bupiid = xh.getBupi_id();
		}
		if(xh.getType_num() != null)
		{
			xinghao = xh.getType_num();
		}
		if(xh.getYuanmishu() != null)
		{
			mishu = xh.getYuanmishu();
		}
		if(xh.getJianchumishu() != null)
		{
			getmishu = xh.getJianchumishu();
		}
		if(xh.getBeizhu() != null)
		{
			beizhu = xh.getBeizhu();
		}
		if(xh.getApply_man() != null)
		{
			shenqren = xh.getApply_man();
		}
		
		if(xh.getApply_time() != null)
		{
			SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
			shenqtime =formater.format(xh.getApply_time()) ;
		}
	}
	if(danhao.equals(""))
	{
		  Random rdm = new Random(System.currentTimeMillis());
	      int intRd = Math.abs(rdm.nextInt())%9999+1;
	      SimpleDateFormat formater = new SimpleDateFormat("yyMMdd");
	      danhao =  "KJ"+formater.format(new Date())+String.format("%04d", intRd); 
	}
	if(shenqtime.equals(""))
	{
		com.jiang.bean.User user = null;
		if(null != session.getAttribute("user"))
		{
			user = (com.jiang.bean.User)session.getAttribute("user") ;
		}
		shenqren = user.getRealName();

		java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd");
		shenqtime = sf.format(new Date());
	}
	CangKu bcpbp = null;
	if(null != request.getSession().getAttribute("bcpbupi"))
	{
		bcpbp = (CangKu)request.getSession().getAttribute("bcpbupi");
	}
%>
	<form id="form1" name="form1" method="post"
		action="SCGL_dolist?hidden=add&type=CPKJAPPLY">
		<input type="hidden" name="id" value="<%=id%>"></input>
		<div>
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				id="tabs">
				<tr>
					<td class="tabs" align="center"><font color="white">成品开剪申请</font>
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
							<table  cellSpacing=0 cellPadding=0 width=600
								align=center class ="tb">
							<col style="width: 20%" />
							<col style="width: 20%" />
							<col style="width: 20%" />
								<tbody>
   								<tr>
										<td class=td3 align="center" style="width:10%">申请单号</td>
										<td><input type="text" size="24" id="danhao" value="<%=danhao%>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="danhao" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
								<tr>
								<%
										if(bcpbp != null)
										{
								%>
				<input type="hidden" name="bupiid" id="bupiid" value=<%=bcpbp.getBupi_id() %>></input>
				<input type="hidden" name="xinghao" id="xinghao" value=<%=bcpbp.getType_num() %>></input>
				<input type="hidden" name="mishu" id="mishu" value=<%=bcpbp.getKY_num() %>></input>
								<%
									  }
								%>
										
										<td class=td3 align="center" style="width:10%">布匹编号</td>
										<td><%
										if(bcpbp != null)
										{
											%>
											<%=bcpbp.getBupi_id()%>
											<% }
										%>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">型号</td>
										<td>
											<%
										if(bcpbp != null)
										{
											%>
											<%=bcpbp.getType_num()%>
											<% }
										%>
											
										</td>
										<td>&nbsp;</td>
									</tr>
									
									<tr>
										<td class=td3 align="center" style="width:10%">原米数</td>
										<td>
										<%
										if(bcpbp != null)
										{
											%>
											<%=bcpbp.getKY_num()%>
											<% }
										%>
										
										</td>
										<td>&nbsp;</td>
									</tr>
									
								
									<tr>
										<td class=td3 align="center" style="width:10%">剪出米数</td>
										<td><input type="text" size="24" id="getmishu"  value="<%=getmishu%>"
											name="getmishu"  onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									
   								<tr>
										<td class=td3 align="center" style="width:10%">下单人</td>
										<td><input type="text" size="24" id="shenqren" value="<%=shenqren%>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="shenqren" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
								<tr>
										<td class=td3 align="center" style="width:10%">下单时间</td>
										<td><input type="text" size="24" id="shenqtime" value="<%=shenqtime%>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="shenqtime" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									
									<tr>
										<td class=td3 align="center" style="width:10%">备注</td>
										<td>
											<textarea id="beizhu" 
												name="beizhu" rows="4"><%=beizhu%></textarea>
										</td>
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
           String message = (String)request.getAttribute("modifybcpkjerror");
			if (message != null && !"".equals(message)) {
				request.removeAttribute("modifybcpkjerror");
		%>  
		
           alert("<%=message%>");
       <%}%>
</script>
</body>
</html>