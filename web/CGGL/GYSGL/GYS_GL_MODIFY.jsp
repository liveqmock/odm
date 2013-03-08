<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>供应商</title>
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
				gysname : {
					required : true
				}
			},
			messages : {
				MuDiBuMen : {
					selectNone : "请选择部门"
				},
				gysname : {
					required : "请输入供应商名称"
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
	//	f.action = "DisPatch_getUrl?i=1&j=5";
		f.action = "DisPatch_getLevel23Url?m2=5&m3=0";
		//f.target = "mainframe";
		f.method = "post";
		document.body.appendChild(f);
		f.submit();
	}
	
</script>
</head>
<body >
<%
	String gysname = "";
	String gysname_j= "";
	String gystype = "--请选择--";
	String telephone = "";
	String telename = "";
	String phone = "";
	String cz = "";
	String kpmc = "";
	String kpdz = "";
	String address = "";
	String email = "";
	String khhzh = "";
	String xiangxi = "";
	String id="";
	com.jiang.bean.GYS gys = null;
	if (null != request.getAttribute("gysgl")) {
		gys = (com.jiang.bean.GYS) request.getAttribute("gysgl");
		id = String.valueOf(gys.getId());
		if(gys.getGongyingname() != null)
			gysname = gys.getGongyingname();
		if(gys.getSuoxie() != null)
			gysname_j = gys.getSuoxie();
		if(gys.getLeixing() != null)
			gystype = gys.getLeixing();
		if(gys.getTelephone() != null)
			telephone = gys.getTelephone();
		if(gys.getSeller() != null)
			telename = gys.getSeller();
		if(gys.getPhone() != null)
			phone = gys.getPhone();
		if(gys.getChuanzhen() != null)
			cz = gys.getChuanzhen();
		if(gys.getKpmc1() != null)
			kpmc = gys.getKpmc1();
		if(gys.getKpaddress1() != null)
			kpdz = gys.getKpaddress1();
		if(gys.getAddress() != null)
			address = gys.getAddress();
		if(gys.getEmail() != null)
			email = gys.getEmail();
		if(gys.getKhhzh1() != null)
			khhzh = gys.getKhhzh1();
		if(gys.getBeizhu() != null)
			xiangxi = gys.getBeizhu();
	}
%>
	<form id="form1" name="form1" method="post"
		action="CGGL_dolist?hidden=modify&type=GYSGL">
		<input type="hidden" name="id" value="<%=id%>"></input>
		<div>
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				id="tabs">
				<tr>
					<td class="tabs" align="center"><font color="white">修改供应商信息</font>
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
								align=center  class ="tb">
							<col style="width: 20%" />
							<col style="width: 20%" />
							<col style="width: 20%" />
								<tbody>
								<tr>
										<td class=td3 align="center" style="width:10%">供应商名称</td>
										<td width="10px"><input type="text" size="24" id="gysname" value="<%=gysname %>"
											name="gysname" maxlength="24"><FONT color=red>*</FONT></input> 
										</td>
										<td>&nbsp;</td>
								</tr>
								<tr>
										<td class=td3 align="center" style="width:10%">简称</td>
										<td><input type="text" size="24" id="gysname_j" value="<%=gysname_j%>"
											name="gysname_j" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									
									
									<tr>
										<td class=td3 width=40 align="center">类型</td>
										<td  ><select style="position: relative;"
											id=gystype  name=gystype >
											<%
											String values[] = {"原料","半成品","成品","商品","--请选择--"};
											for(int i=0;i<values.length;i++){
												%>
												<OPTION value="<%=values[i]%>" <%if (values[i].equals(gystype)) {%> selected <%} %> ><%=values[i]%></OPTION>
											<%}%>
												
										</select></td>
										<td id="zgmmerror">&nbsp;</td>
									</tr>
									
									<tr>
										<td class=td3 align="center" >联系电话</td>
										<td><input type="text" size="24" id="telephone" value="<%=telephone%>"
											name="telephone" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >联系人</td>
										<td><input type="text" size="24" id="telename" value="<%=telename%>"
											name="telename" maxlength="24"></input> 
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >手机</td>
										<td><input type="text" size="24" id="phone"  value="<%=phone%>"
											name="phone" maxlength="24"></input> 
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >传真</td>
										<td><input type="text" size="24" id="cz"  value="<%=cz%>"
											name="cz" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >开票名称</td>
										<td><input type="text" size="24" id="kpmc" value="<%=kpmc%>"
											name="kpmc" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >开票地址</td>
										<td><input type="text" size="24" id="kpdz" value="<%=kpdz%>"
											name="kpdz" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >地址</td>
										<td><input type="text" size="24" id="address"  value="<%=address%>"
											name="address" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >E_mail</td>
										<td><input type="text" size="24" id="email" value="<%=email%>"
											name="email" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >开户行帐号</td>
										<td><input type="text" size="24" id="khhzh" value="<%=khhzh%>"
											name="khhzh" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
								
									<tr>
										<td class=td3 align="center" >备注</td>
										<td style="HEIGHT: 100px;width: 300px"><textarea id="xiangxi" 
												name="xiangxi" rows="5"><%=xiangxi%></textarea> </td>
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
           String message = (String)request.getAttribute("modifygysglerror");
			if (message != null && !"".equals(message)) {
				request.removeAttribute("modifygysglerror");
		%>  
		
           alert("<%=message%>");
       <%}%>
</script>
</body>
</html>