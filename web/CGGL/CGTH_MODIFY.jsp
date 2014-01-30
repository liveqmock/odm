<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="com.jiang.bean.CGTH"%>
<%@page import=" java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>采购退货管理</title>
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
<link rel="stylesheet" href="CSS/flexselect.css" type="text/css" media="screen" />
    <style>
    </style>
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
		f.action = "DisPatch_getUrl?i=1&j=1";
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
	String id="";
	CGTH djgl = null;
   String shenqtime = "";
   String tuihuoid = "";
   String caigouid = "";
   Float danjia = 0.0f;
   String shenqr = "";
   String liuyou = "";
	if (null != request.getAttribute("cgth")) {
		djgl = (CGTH) request.getAttribute("cgth");
		id = String.valueOf(djgl.getId());
		shenqtime =  new SimpleDateFormat("yyyy/MM/dd").format(djgl.getApply_Time());
		tuihuoid = djgl.getTuiHuo_Id();
		caigouid = djgl.getCaiGou_Id();
		danjia = djgl.getTuiHuoDanJia();
		shenqr = djgl.getApply_Man();
		liuyou = djgl.getReason();
		
	}
	if(shenqr == "")
	{
		com.jiang.bean.User user = null;
		String quanxian = "";
		if(null != session.getAttribute("user"))
		{
			user = (com.jiang.bean.User)session.getAttribute("user") ;
			shenqr = user.getRealName();
		}
	}
	if(tuihuoid == "")
	{
	  Random rdm = new Random(System.currentTimeMillis());
      int intRd = Math.abs(rdm.nextInt())%9999+1;
      SimpleDateFormat formater = new SimpleDateFormat("yyMMdd");
      tuihuoid =  "CGTH"+formater.format(new Date())+String.format("%04d", intRd); 
	}
	if(shenqtime == "")
	{
      SimpleDateFormat formater = new SimpleDateFormat("yyyy/MM/dd");
      shenqtime =  formater.format(new Date());
	}
	
%>
	<form id="form1" name="form1" method="post"
		action="CGGL_dolist?hidden=modify&type=CGTH">
		<input type="hidden" name="id" value="<%=id%>"></input>
		<div>
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				id="tabs">
				<tr>
					<td class="tabs" align="center"><font color="white">采购退货</font>
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
							<table cellSpacing=0 cellPadding=0 width=600
								align=center class="tb" >
							<col style="width: 20%" />
							<col style="width: 20%" />
							<col style="width: 20%" />
								<tbody>
								<tr>
										<td class=td3 align="center" style="width:10%">退货单号</td>
										<td><input type="text" size="24" id="tuihuoid" value="<%=tuihuoid%>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="tuihuoid" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
								</tr>
								 <tr>
										<td class=td3 align="center" style="width:10%">采购单号</td>
										<td><input type="text" size="24" id="caigouid"  value="<%=caigouid%>"
											name="caigouid" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
								</tr>
								
									<tr>
										<td class=td3 align="center" >退货单价</td>
										<td><input type="text" size="24" id="danjia" value="<%=danjia%>"
											name="danjia" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >退货理由</td>
										<td style="HEIGHT: 100px;width: 300px"><textarea id="liuyou" 
												name="liuyou" rows="5"><%=liuyou %></textarea> </td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >申请人</td>
										<td><input type="text" size="24" id="shenqr"  value="<%=shenqr%>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="shenqr" maxlength="24"></input> 
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >申请日期</td>
										<td><input type="text" size="24" id="shenqtime"  value="<%=shenqtime%>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="shenqtime" maxlength="24"></input> 
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
           String message = (String)request.getAttribute("modifycgtherror");
			if (message != null && !"".equals(message)) {
				request.removeAttribute("modifycgtherror");
		%>  
		
           alert("<%=message%>");
       <%}%>
</script>
</body>
</html>