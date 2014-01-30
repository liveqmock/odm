<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>客户管理</title>
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
				khmc : {
					required : true
				}
			},
			messages : {
				MuDiBuMen : {
					selectNone : "请选择部门"
				},
				khmc : {
					required : "请输入客户姓名"
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
		f.action = "DisPatch_getLevel23Url?m2=6&m3=0";
		//f.action = "DisPatch_getLevel23Url?m2=5&m3=0";
		//f.target = "mainframe";
		f.method = "post";
		document.body.appendChild(f);
		f.submit();
	}
	
</script>
</head>
<body >
<%
	String id="";
	String khbh = "";
	String khmc = "";
	String khjc = "";
	String ssqy = "";
	String bgdh1 = "";
	String bgdh2 = "";
	String lxr = "";
	String yddh = "";
	String cz = "";
	String address = "";
	String email = "";
	String url = "";
	String ywy = "";
	String vip = "";
	String jsfs = "";
	String beizhu = "";
	com.jiang.bean.KHGL khgl = null;
	if (null != request.getAttribute("khgl")) {
		khgl = (com.jiang.bean.KHGL) request.getAttribute("khgl");
		id = khgl.getId()+"";
		if(null !=khgl.getKehu_id() ) khbh = khgl.getKehu_id();
		if(null !=khgl.getKeHuname() ) khmc = khgl.getKeHuname();
		if(null !=khgl.getSuoxie() ) khjc = khgl.getSuoxie();
		if(null !=khgl.getSuoshuquyu()) ssqy = khgl.getSuoshuquyu();
		if(null !=khgl.getTelephone()) bgdh1 = khgl.getTelephone();
		if(null !=khgl.getTelephone2()) bgdh2 = khgl.getTelephone2();
		if(null !=khgl.getSeller()) lxr = khgl.getSeller();
		if(null !=khgl.getPhone()) yddh = khgl.getPhone();
		if(null !=khgl.getChuanzhen()) cz = khgl.getChuanzhen();
		if(null !=khgl.getAddress()) address = khgl.getAddress();
		if(null !=khgl.getEmail()) email = khgl.getEmail();
		if(null !=khgl.getWeb()) url = khgl.getWeb();
		if(null !=khgl.getYewuyuan()) ywy = khgl.getYewuyuan();
		if(null !=khgl.getVIPkeHu()) vip = khgl.getVIPkeHu();
		if(null !=khgl.getJiesuanfangshi()) jsfs = khgl.getJiesuanfangshi();
		if(null !=khgl.getBeizhu()) beizhu = khgl.getBeizhu();
		
	}
	if(khbh.equals(""))
	{
		  Random rdm = new Random(System.currentTimeMillis());
	      int intRd = Math.abs(rdm.nextInt())%9999+1;
	      SimpleDateFormat formater = new SimpleDateFormat("yyMMdd");
	      khbh =  "63"+formater.format(new Date())+String.format("%04d", intRd); 
	}
%>
	<form id="form1" name="form1" method="post"
		action="XSGL_dolist?hidden=modify&type=KHGL">
		<input type="hidden" name="id" value="<%=id%>"></input>
		<div>
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				id="tabs">
				<tr>
					<td class="tabs" align="center"><font color="white">修改客户信息</font>
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
										<td class=td3 align="center" style="width:10%">客户编号</td>
										<td width="10px"><input type="text" size="24" id="khbh" value="<%=khbh %>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="khbh" maxlength="24"><FONT color=red>*</FONT></input> 
										</td>
										<td>&nbsp;</td>
								</tr>
								<tr>
										<td class=td3 align="center" style="width:10%">客户名称</td>
										<td><input type="text" size="24" id="khmc" value="<%=khmc%>"
											name="khmc" maxlength="24"><FONT color=red>*</FONT></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									
									<tr>
										<td class=td3 align="center" >简称</td>
										<td><input type="text" size="24" id="khjc" value="<%=khjc%>"
											name="khjc" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									
									<tr>
										<td class=td3 align="center" >所属区域</td>
										<td><input type="text" size="24" id="ssqy" value="<%=ssqy%>"
											name="ssqy" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >办公电话1</td>
										<td><input type="text" size="24" id="bgdh1" value="<%=bgdh1%>"
											name="bgdh1" maxlength="24"></input> 
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >办公电话2</td>
										<td><input type="text" size="24" id="bgdh2" value="<%=bgdh2%>"
											name="bgdh2" maxlength="24"></input> 
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >联系人</td>
										<td><input type="text" size="24" id="lxr"  value="<%=lxr%>"
											name="lxr" maxlength="24"></input> 
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >移动电话</td>
										<td><input type="text" size="24" id="yddh"  value="<%=yddh%>"
											name="yddh" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >传真</td>
										<td><input type="text" size="24" id="cz" value="<%=cz%>"
											name="cz" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >地址</td>
										<td><input type="text" size="24" id="address" value="<%=address%>"
											name="address" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >Email</td>
										<td><input type="text" size="24" id="email"  value="<%=email%>"
											name="email" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >网址</td>
										<td><input type="text" size="24" id="url" value="<%=url%>"
											name="url" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >业务员</td>
										<td><input type="text" size="24" id="khhzh" value="<%=ywy%>"
											name="ywy" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
								<tr>
										<td class=td3 align="center" >VIP客户等级</td>
										<td>
											<select id="vip" name="vip">
											<%
											String vips[] = {"A", "B", "C", "D"};
											for(int i=0;i<vips.length;i++)
											{
											%>
												<option value="<%=vips[i] %>" <%if(!"".equals(vip) && vip.equals(vips[i])) {%> selected <%} %>><%=vips[i]%></option>
											<%
											}
											%>	
											</select>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
									<td class=td3 align="center" >结算方式</td>
										<td>
											<select id="jsfs" name="jsfs">
												<%
											String jsfss[] = {"月结", "现付"};
											for(int i=0;i<jsfss.length;i++)
											{
											%>
												<option value="<%=jsfss[i] %>" <%if(!"".equals(jsfs) && jsfs.equals(jsfss[i])) {%> selected <%} %>><%=jsfss[i]%></option>
											<%
											}
											%>	
											</select>
										</td>
										<td>&nbsp;</td>
									</tr>
									
									<tr>
										<td class=td3 align="center" >欠款上限</td>
										<td><input type="text" size="24" id="qksx" value="<%=ywy%>"
											name="qksx" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									
									<tr>
										<td class=td3 align="center" >备注</td>
										<td style="HEIGHT: 100px;width: 300px"><textarea id="beizhu" 
												name="beizhu" rows="5"><%=beizhu%></textarea> </td>
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
           String message = (String)request.getAttribute("modifykhzlerror");
			if (message != null && !"".equals(message)) {
				request.removeAttribute("modifykhzlerror");
		%>  
		
           alert("<%=message%>");
       <%}%>
</script>
</body>
</html>