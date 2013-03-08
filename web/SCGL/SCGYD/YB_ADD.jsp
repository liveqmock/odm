<%@page import="com.jiang.bean.ZLGLYLZL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<%@page import="java.util.*"%>
<%@page import="com.jiang.bean.YBgongyidan"%>
<%@page import="java.text.SimpleDateFormat" %>
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
				diaoka : {
					selectNone : "ss"
				},
				xinghao : {
					required : true
				},
				jgxinghao : {
					required : true
				},
				shuliang : {
					required : true,
					number : true,
					min : 1
				}
			},
			messages : {
				diaoka : {
					selectNone : "请选择类型"
				},
				jgxinghao : {
					required : "请输入加工型号"
				},
				xinghao : {
					required : "请输入型号"
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
		f.action = "DisPatch_getLevel23Url?m2=1&m3=2";
		//f.target = "mainframe";
		f.method = "post";
		document.body.appendChild(f);
		f.submit();
	}
	
</script>
</head>
<body >
<%
	String gydid = "";
	String jgxinghao = "";
	String xinghao = "";
	String shuliang = "";
	String diaoka =  "--请选择--";
	String beizhu  = "";
	String xiadanren = "";
	String xiadantime = "";
	int id = -1;
	if(null != request.getAttribute("yb"))
	{
		YBgongyidan xh = (YBgongyidan)request.getAttribute("yb");
		if(xh.getyBGongYiId() != null)
		{
			gydid = xh.getyBGongYiId();
		}
		if(xh.getId() != null)
		{
			id = xh.getId();
		}
		if(xh.getxJType()!= null)
		{
			jgxinghao = xh.getxJType();
		}
		if(xh.getyBtype() != null)
		{
			xinghao = xh.getyBtype();
		}
		
		if(xh.getNum() != null)
		{
			shuliang = xh.getNum() + "";
		}
		if(xh.getkHoRyB()!= null)
		{
			diaoka = xh.getkHoRyB() ;
		}
		if(xh.getBeiZhu() != null)
		{
			beizhu = xh.getBeiZhu() ;
		}
		if(xh.getKaiDanRen() != null)
		{
			xiadanren = xh.getKaiDanRen() ;
		}
		if(xh.getKaiDanTime() != null)
		{
			  SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
			xiadantime =formater.format(xh.getKaiDanTime()) ;
		}
	}
	if(gydid.equals(""))
	{
		  Random rdm = new Random(System.currentTimeMillis());
	      int intRd = Math.abs(rdm.nextInt())%9999+1;
	      SimpleDateFormat formater = new SimpleDateFormat("yyMMdd");
	      gydid =  "YB"+formater.format(new Date())+String.format("%04d", intRd); 
	}
	if(xiadanren.equals(""))
	{
		com.jiang.bean.User user = null;
		if(null != session.getAttribute("user"))
		{
			user = (com.jiang.bean.User)session.getAttribute("user") ;
		}
		xiadanren = user.getRealName();

		java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd");
 		xiadantime = sf.format(new Date());
	}
%>
	<form id="form1" name="form1" method="post"
		action="SCGL_dolist?hidden=add&type=SCGLYB">
		<input type="hidden" name="id" value="<%=id%>"></input>
		<div>
			<table border="0" cellpadding="0" cellspacing="0" width="820px"
				id="tabs">
				<tr>
					<td class="tabs" align="center"><font color="white">添加样本工艺单</font>
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
										<td class=td3 align="center" style="width:10%">工艺单单号</td>
										<td><input type="text" size="24" id="gydid" value="<%=gydid%>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="gydid" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
								<tr>
										<td class=td3 align="center" style="width:10%">下机型号</td>
										<td><input type="text" size="24" id="jgxinghao" value="<%=jgxinghao%>"
											name="jgxinghao" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" style="width:10%">上机型号</td>
										<td><input type="text" size="24" id="xinghao" value="<%=xinghao%>"
											name="xinghao" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									
									<tr>
										<td class=td3 align="center" style="width:10%">类型</td>
										<td width="200px"><select id="diaoka" 
											name="diaoka"   style="width:170px;position: relative;" >
											<%
										    String cjs[] = {"吊卡", "样本", "--请选择--"};
											for(int i=0;i<cjs.length;i++)
											{
											%>
											<option <%if(cjs[i].equals(diaoka)) {%> selected<%}%> value="<%=cjs[i]%>" ><%=cjs[i] %></option>
											<%	
											}
											%>
											</select>
										</td>
										<td>&nbsp;</td>
								</tr>
								
									<tr>
										<td class=td3 align="center" style="width:10%">数量</td>
										<td><input type="text" size="24" id="shuliang" value="<%=shuliang%>"
											name="shuliang" maxlength="24"></input>
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
   								<tr>
										<td class=td3 align="center" style="width:10%">下单人</td>
										<td><input type="text" size="24" id="xiadanren" value="<%=xiadanren%>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="xiadanren" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
								<tr>
										<td class=td3 align="center" style="width:10%">下单时间</td>
										<td><input type="text" size="24" id="xiadantime" value="<%=xiadantime%>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="xiadantime" maxlength="24"></input>
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
           String message = (String)request.getAttribute("modifyyberror");
			if (message != null && !"".equals(message)) {
				request.removeAttribute("modifyyberror");
		%>  
		
           alert("<%=message%>");
       <%}%>
</script>
</body>
</html>