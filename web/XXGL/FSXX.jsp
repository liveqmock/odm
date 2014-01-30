<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>发送消息</title>
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
				danhao : {
					required : true
				},
				xinghao : {
					required : true
				},
				recivename : {
					required : true
				},
				xiangxi : {
					required : true
				}

			},
			messages : {
				MuDiBuMen : {
					selectNone : "请选择部门"
				},
				recivename : {
					required : "请输入接收人"
				},
				danhao : {
					required : "相关单号不能为空！"
				},
				xinghao : {
					required : "型号不能为空！"
				},
				xiangxi : {
					required : "内容不能为空！"
				}
			},
			errorPlacement : function(error, element) { //验证消息放置的地方  
				error.appendTo(element.parent("td").next("td"));
			},
			highlight : function(element, errorClass) { //针对验证的表单设置高亮  
				$(element).addClass(errorClass);
			},
			success : function(label) {
				label.addClass("valid").text("Ok!");
			}
		});
		$("button").click(function() {
			validator.resetForm();
		});
	});
	function backMenu() {
		var f = document.createElement("form");
		f.action = "DisPatch_getUrl?i=0&j=0";
		f.target = "mainframe";
		f.method = "post";
		document.body.appendChild(f);
		f.submit();
	}

	function changeType() {
		var ss = document.getElementById("FaSongTypeDL").value;
		var zhuguanmima = document.getElementById("recivename");
		if (ss == "个人") {
			zhuguanmima.style.display = "";
			document.getElementById("zgmmerror").style.display = "";
		} else {
			zhuguanmima.style.display = "none";
			document.getElementById("zgmmerror").style.display = "none";
		}

	}
</script>
</head>
<body onunload="closeMe();" onload="changeType();">
<%
	String date = "";
	String fasongtimestr = "";
	String laiyuanbumen = "";
	String fasongren = "";
	com.jiang.bean.User user = null;
	java.util.Date d = new java.util.Date();
	java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat(
			"yyyy/MM/dd");
	fasongtimestr = sf.format(d);
	if (null != session.getAttribute("user")) {
		user = (com.jiang.bean.User) session.getAttribute("user");
		laiyuanbumen = user.getBumen();
		fasongren = user.getRealName();
	}
%>
	<form id="form1" name="form1" method="post"
		action="XXGL_dolist?hidden=add&type=XXGL">
		<div>
			<table border="0" cellpadding="0" cellspacing="0" width="820px"
				id="tabs">
				<tr>
					<td class="tabs" align="center"><font color="white">发送消息</font>
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
							<table class=tb cellSpacing=0 cellPadding=0 width=800
								align=center>
								<tbody>
									<tr>
										<td class=td1  align="center">发送方式</td>
										<td class='td2'><select style="position: relative;"
											id=FaSongTypeDL class=a2 name=FaSongTypeDL
											onclick="changeType()">
												<OPTION selected value=群发>群发</OPTION>
												<OPTION value=个人>个人</OPTION>
												<input type="text" size="14" id="recivename"
												name="recivename" />
										</select><FONT color=red>*</FONT></td>
										<td id="zgmmerror">&nbsp;</td>
									</tr>
									<tr>
										<td class=td1 align="center" width="40px">目的部门</td>
										<td class=td2><SELECT style="POSITION: relative"
											id=MuDiBuMen class=a2 name=MuDiBuMen>
												<OPTION selected value=--请选择-->--请选择--</OPTION>
												<OPTION value=采购>采购</OPTION>
												<OPTION value=生产>生产</OPTION>
												<OPTION value=仓储>仓储</OPTION>
												<OPTION value=商品>商品</OPTION>
												<OPTION value=销售>销售</OPTION>
												<OPTION value=财务>财务</OPTION>
										</SELECT> <FONT color=red>*</FONT></td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td1 align="center" width="40px">相关单号</td>
										<td class=td2><input type="text" size="14" id="danhao"
											name="danhao" maxlength="20"/> <FONT color=red>*</FONT>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td1 align="center" width="40px">型号</td>
										<td class=td2><input type="text" size="14" id="xinghao"
											name="xinghao" maxlength="20"/> <FONT color=red>*</FONT>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td1 align="center" width="40px">发送时间</td>
										<td class=td2><input type="text" size="14"
											id="fasongtime" readonly="readonly"   style="color:gray" name="fasongtime"  onfocus="this.blur()"
											value="<%=fasongtimestr%>" maxlength="20"/> </td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td1 align="center" width="40px">发送人</td>
										<td class=td2><input type="text" size="14" id="fasongren"
											name="fasongren" value="<%=fasongren%>"   style="color:gray"  onfocus="this.blur()" readonly="readonly"
											maxlength="20"/></td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td1 align="center" width="40px">来源部门</td>
										<td class=td2><input type="text" size="14" id="laiyuan"  
											name="laiyuan"   onfocus="this.blur()" readonly="readonly"  style="color:gray" value="<%=laiyuanbumen%>"
											maxlength="20" /></td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td1 align="center" width="40px">详细内容</td>
										<td style="HEIGHT: 100px"><textarea id="xiangxi"
												name="xiangxi" rows="5"></textarea> <FONT color=red>*</FONT></td>
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
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>