<%@page import="com.jiang.bean.ZLGLYLZL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<%@page import="java.util.*"%>
<%@page import="com.jiang.bean.ZLGLBCPZL"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>半成品资料</title>
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
				MuDiBuMen : {
					selectNone : "ss"
				},
				xinghao : {
					required : true
				},
				xilie : {
					required : true
				}
			},
			messages : {
				MuDiBuMen : {
					selectNone : "请选择部门"
				},
				xinghao : {
					required : "请输入型号"
				},
				xilie : {
					required : "请输入系列"
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
		f.action = "DisPatch_getLevel23Url?m2=0&m3=1";
		//f.target = "mainframe";
		f.method = "post";
		document.body.appendChild(f);
		f.submit();
	}
	
</script>
</head>
<body >
<%
	String xinghao = "";
	String beizhu  = "";
	String guige = "";
	String sebie = "";
	String xiaxian = "0";
	String danwei =  "米";
	String xilie = "";
	int id = -1;
	if(null != request.getAttribute("zlgl_bcp"))
	{
		ZLGLBCPZL xh = (ZLGLBCPZL)request.getAttribute("zlgl_bcp");
		if(null != xh.getXilie())
			xilie = xh.getXilie();
		if(null != xh.getType_num())
			xinghao = xh.getType_num();
		if(null != xh.getId())
			id = xh.getId();
		if(null != xh.getXiaxian())
			xiaxian = xh.getXiaxian();
		if(null != xh.getDanwei())
			danwei = xh.getDanwei();
		if(null != xh.getColor())
			sebie = xh.getColor();
		if(null != xh.getBeizhu())
			beizhu = xh.getBeizhu();
		if(null != xh.getGuige())
			guige = xh.getGuige();
	}
%>
	<form id="form1" name="form1" method="post"
		action="CGGL_dolist?hidden=modify&type=ZLGL_BCP">
		<input type="hidden" name="id" value="<%=id%>"></input>
		<div>
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				id="tabs">
				<tr>
					<td class="tabs" align="center"><font color="white">修改半成品资料信息</font>
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
										<td class=td3 align="center" style="width:10%">系列</td>
										<td><input type="text" size="24" id="xilie" value="<%=xilie%>"
											name="xilie" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
								<tr>
										<td class=td3 align="center" style="width:10%">半成品型号</td>
										<td><input type="text" size="24" id="xinghao" value="<%=xinghao%>"
											name="xinghao" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">单位</td>
										<td><input type="text" size="24" id="danwei" value="<%=danwei%>"
											name="danwei" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">下限</td>
										<td><input type="text" size="24" id="xiaxian" value="<%=xiaxian%>"
											name="xiaxian" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">色别</td>
										<td><input type="text" size="24" id="sebie" value="<%=sebie%>"
											name="sebie" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">规格/幅宽</td>
										<td><input type="text" size="24" id="guige" value="<%=guige%>"
											name="guige" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">备注</td>
										<td>
											<textarea id="beizhu" 
												name="beizhu" rows="5"><%=beizhu%></textarea>
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
           String message = (String)request.getAttribute("modifyzlgl_bcperror");
			if (message != null && !"".equals(message)) {
				request.removeAttribute("modifyzlgl_bcperror");
		%>  
		
           alert("<%=message%>");
       <%}%>
</script>
</body>
</html>