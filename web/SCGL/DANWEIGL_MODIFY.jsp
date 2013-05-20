<%@page import="com.jiang.bean.ZLGLYLZL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<%@page import="java.util.*"%>
<%@page import="com.jiang.bean.wJGGongYingShang"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="com.jiang.util.PublicFunc" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>样本</title>
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
		if (value ==  "--请选择--") // select默认值需要设置为"none"(当然可以自定义其他值）   
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
				jgdanwei : {
					required : true
				},
				shuliang : {
					required : true,
					number : true,
					min : 1
				}
			},
			messages : {
				jgdanwei : {
					required : "请输入加工单位名称"
				},
				shuliang : {
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
				label.addClass("valid").text("Ok!");
			}*/
		});
		$("button").click(function() {
			validator.resetForm();
		});
	});
	function backMenu() {
		var f = document.createElement("form");
		f.action = "DisPatch_getUrl?i=2&j=5";
		f.target = "mainframe";
		f.method = "post";
		document.body.appendChild(f);
		f.submit();
	}
	
</script>
</head>
<body >
<%
	String jgdanwei="";
	String suoxie="";
	String leixing="--请选择--";
	String telephone="";
	String person="";
	String phone="";
	String urladdress="";
	String chuanzhen="";
	String kaipname="";
	String kpaddress="";
	String address="";
	String email="";
	String kaihuZh="";
	String beizhu="";

	int id = -1;
	if(null != request.getAttribute("wjgdwgl"))
	{
		wJGGongYingShang xh = (wJGGongYingShang)request.getAttribute("wjgdwgl");
		if(xh.getId() != null)
		{
			id = xh.getId();
		}
		if(xh.getDanweiname() != null)
		{
			jgdanwei = xh.getDanweiname();
		}
		if(xh.getSuoxie() != null)
		{
			suoxie = xh.getSuoxie();
		}
		if(xh.getJGleixing() != null)
		{
			leixing = xh.getJGleixing();
		}
		if(xh.getTelephone() != null)
		{
			telephone = xh.getTelephone();
		}
		if(xh.getSeller() != null)
		{
			person = xh.getSeller();
		}
		if(xh.getPhone() != null)
		{
			phone = xh.getPhone();
		}
		if(xh.getWeb() != null)
		{
			urladdress = xh.getWeb();
		}
		if(xh.getChuanzhen() != null)
		{
			chuanzhen = xh.getChuanzhen();
		}
		if(xh.getKpmc() != null)
		{
			kaipname = xh.getKpmc();
		}
		if(xh.getKpaddress() != null)
		{
			kpaddress = xh.getKpaddress();
		}
		if(xh.getAddress() != null)
		{
			address = xh.getAddress();
		}
		if(xh.getEmail() != null)
		{
			email = xh.getEmail();
		}
		if(xh.getKhhzh() != null)
		{
			kaihuZh = xh.getKhhzh();
		}
		if(xh.getBeizhu() != null)
		{
			beizhu = xh.getBeizhu();
		}
	}
	
%>
	<form id="form1" name="form1" method="post"
		action="SCGL_dolist?hidden=modify&type=WJGDWGL">
		<input type="hidden" name="id" value="<%=id%>"></input>
		<div>
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				id="tabs">
				<tr>
					<td class="tabs" align="center"><font color="white">修改单位信息</font>
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
										<td class=td3 align="center" style="width:10%">外加工单位</td>
										<td><input type="text" size="24" id="jgdanwei" value="<%=jgdanwei%>"
											name="jgdanwei" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">缩写</td>
										<td><input type="text" size="24" id="suoxie" value="<%=suoxie%>"
											name="suoxie" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									
									<tr>
										<td class=td3 align="center" style="width:10%">加工类型</td>
                                        <td width="200px"><select id="leixing"
                                                                  name="leixing"   style="width:170px;position: relative;" >
                                            <option selected="selected" value="--请选择--">--请选择--</option>
                                            <%for(int i=0;i< PublicFunc.wjgGYType.length;i++) {%>
                                            <option <%if(PublicFunc.wjgGYType[i].equals(leixing)) {%> selected<%}%>
                                             value="<%=PublicFunc.wjgGYType[i]%>" ><%=PublicFunc.wjgGYType[i] %></option>
                                            <%} %>
                                        </select></td>
										<td>&nbsp;</td>
								</tr>
								
									<tr>
										<td class=td3 align="center" style="width:10%">联系电话</td>
										<td><input type="text" size="24" id="telephone" value="<%=telephone%>"
											name="telephone" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">联系人</td>
										<td><input type="text" size="24" id="person" value="<%=person%>"
											name="person" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">手机</td>
										<td><input type="text" size="24" id="phone" value="<%=phone%>"
											name="phone" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">网址</td>
										<td><input type="text" size="24" id="urladdress" value="<%=urladdress%>"
											name="urladdress" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">传真</td>
										<td><input type="text" size="24" id="chuanzhen" value="<%=chuanzhen%>"
											name="chuanzhen" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">开票名称</td>
										<td><input type="text" size="24" id="kaipren" value="<%=kaipname%>"
											name="kaipname" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">开票地址</td>
										<td><input type="text" size="24" id="kpaddress" value="<%=kpaddress%>"
											name="kpaddress" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">地址</td>
										<td><input type="text" size="24" id="address" value="<%=address%>"
											name="address" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">E_mail</td>
										<td><input type="text" size="24" id="email" value="<%=email%>"
											name="email" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">开户行帐号</td>
										<td><input type="text" size="24" id="kaihuZh" value="<%=kaihuZh%>"
											name="kaihuZh" maxlength="24"></input>
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
           String message = (String)request.getAttribute("modifydanweiglerror");
			if (message != null && !"".equals(message)) {
				request.removeAttribute("modifydanweiglerror");
		%>  
		
           alert("<%=message%>");
       <%}%>
</script>
</body>
</html>