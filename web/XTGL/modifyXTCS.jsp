<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0046)http://115.239.244.18:3899/XXGL/FSXX/FSXX.aspx -->
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>发送消息</TITLE>
<script type="text/javascript" language="javascript"
	src="js/jquery-fn-tab.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="js/jquery.corners.min.js"></script>
<script type="text/javascript" src="js/flexigrid.js"></script>
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src=js/validate/jquery.validate.pack.js></script>
<script type="text/javascript" src=js/validate/jquery.form.js></script>
<script type="text/javascript" src=js/validate/valid.js></script>
<script type="text/javascript" src="js/ChangeImageJS.js"></script>
<link type="text/css" rel="stylesheet" href="js/validate/validate.css" />
<link rel="stylesheet" href="CSS/flexigrid.css" type="text/css"></link>
<link rel="stylesheet" href="CSS/flexigrid.pack.css" type="text/css"></link>
<link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"></link>
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />
<link type="text/css" rel="stylesheet" href="CSS/table.css" />
<%@page import="com.jiang.bean.XTCS"%>

</HEAD>


<script type="text/javascript">
	$(document).ready(function() {
		var validator = $("#form1").validate({
			debug : true, //调试模式取消submit的默认提交功能  
			errorClass : "haha",//默认为错误的样式类为：error  
			focusInvalid : false,
			onkeyup : false,
			submitHandler : function(form) {
				form.submit();   
			},
			rules : {
				zhonglei : {
					required : true,
					minlength : 2
				}
			},
			messages : {
				zhonglei : {
					required : "参数种类是必需的！",
					minlength : $.format("参数种类至少要{0}个字符！")
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
</script>

<%
	XTCS xtsc = (XTCS) request.getAttribute("xtcs");
	String str = xtsc.getName();
%>
<body>
	<form id="form1" name="form1" method="post" action="XTGL_dolist?hidden=modify&type=XTCS">
	
	<div>
			<table border="0" cellpadding="0" cellspacing="0" width="820px"
				id="tabs">
				<tr >
					<td class="tabs"  align="center" ><font color="white" >参数信息</font>
						</td>
					<td class="tabs"></td>
				</tr>
			</table>

		</div>
		<div style="height: 30px"></div>
	
	
	<input type="hidden" name="id" value="<%=xtsc.getId()%>"></input>
		<DIV id=UpdatePanel1>
			<TABLE align=center>
				<TBODY>
					<TR>
						<TD>
							<TABLE class=tb cellSpacing=0 cellPadding=0 width=600
								align=center>
								<TBODY>
									<TR>
										<TD class=td1 width=40px >参数名称</TD>
										<TD class=td2 >
											<TABLE>
												<TBODY>
													<TR>
														<TD class=td2><SELECT
															style="POSITION: relative" id=name class=a2
															onchange="javascript:setTimeout('__doPostBack(\'FaSongTypeDL\',\'\')', 0)"
															name=name>
															<%
															String values[]= {"布匹类型","仓库类型","加工类型","供应商类型",
																	"部门","车间","采购布匹类型","品级"};
															for(int i=0;i<values.length;i++){
																System.out.println(str);
															%>
																<option value="<%=values[i] %>"  <%if(str !=null && values[i].equals(str)) {%> selected <%} %> ><%=values[i] %></option>
																<%} %>
														</SELECT> <FONT color=red>*</FONT></TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
										<td>&nbsp;</td>
									</TR>
									<TR>
										<TD class=td1 width=40px >参数种类</TD>
										<TD class=td2 ><INPUT
											style="POSITION: relative; WIDTH: 180px" type=text
											name=zhonglei value="<%=xtsc.getZhonglei()%>"></TD>
										<td>&nbsp;</td>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD>
							<TABLE>
								<TBODY>
									<TR>
										<TD style="HEIGHT: 26px" width=200 align=middle><INPUT
											style="POSITION: relative; BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											onmouseover="ChangeImage(this,'images/Sure2.gif')"
											onmouseout="ChangeImage(this,'images/Sure1.gif')"
											src="images/Sure1.gif" type=image></TD>
											<TD style="HEIGHT: 26px" width=200 align=middle><INPUT
											style="POSITION: relative; BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											onmouseover="ChangeImage(this,'images/C2.gif')"
											onmouseout="ChangeImage(this,'images/C1.gif')"
											src="images/C1.gif" type=image onClick="history.back();return false;"></TD>
											
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
	</form>
</body>
</HTML>
