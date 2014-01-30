<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@page import="java.util.*"%>
<%@page import=" java.text.SimpleDateFormat"%>
<%@ page import="com.jiang.bean.*" %>

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
<link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="CSS/table.css" />
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />
<link rel="stylesheet" href="CSS/flexselect.css" type="text/css" media="screen" />
    <style>
      label, input { display: block; }
      label { font-weight: bold; }
      input, .flexselect_dropdown li { font-size: 1em; }
      small { color: #999; }
      .flexselect_selected small { color: #ddd; }
    </style>
    <script src="js/select/liquidmetal.js" type="text/javascript"></script>
    <script src="js/select/jquery.flexselect.js" type="text/javascript"></script>
     <script type="text/javascript">
      $(document).ready(function() {
        $("select.flexselect").flexselect();
       // $("input:text:enabled:first").focus();
       
      });
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
					required : true
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
					required : "请输入交货日期"
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
		f.action = "DisPatch_getUrl?i=1&j=0";
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
			ui1.style.display="none";//
			ui2.style.display="";//显示
			ui3.style.display="none";
			ui4.style.display="none";
		}
		if(value == "成品")
		{
			ui1.style.display="none";//
			ui2.style.display="none";//
			ui3.style.display="";//显示
			ui4.style.display="none";
		}
		if(value == "商品")
		{
			ui1.style.display="none";//
			ui2.style.display="none";//隐藏
			ui3.style.display="none";
			ui4.style.display="";//显示
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
<body onload="enableselect()">
<%
	Integer gysid = 0;
	String gysname_xh= "";
	String gystype = "--请选择--";
	String id="";
	String currentuser = "";
   CGGLDJGL djgl = null;
   String num = "";
   String username = "";
   String typenum ="";
   String xiadandate = "";
   String caigouid = "";
   String beizhu = "";
	if (null != session.getAttribute("djgl")) {
		djgl = (CGGLDJGL) session.getAttribute("djgl");
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
		if(djgl.getGyspinming() != null)
			gysname_xh = djgl.getGyspinming();
		if(djgl.getUserName() != null)
		{
			username = djgl.getUserName();
		}
	}
	if (null != session.getAttribute("user")) {
		com.jiang.bean.User user = (com.jiang.bean.User) session.getAttribute("user");
		currentuser = user.getRealName();
	}
	  Random rdm = new Random(System.currentTimeMillis());
      int intRd = Math.abs(rdm.nextInt())%9999+1;
      SimpleDateFormat formater = new SimpleDateFormat("yyMMdd");
      String rdmstr =  "CG"+formater.format(new Date())+String.format("%04d", intRd); 
%>
	<form id="form1" name="form1" method="post"
		action="CGGL_dolist?hidden=modify&type=DJGLAGYS">
		<input type="hidden" name="id" value="<%=id%>"/>
		<div>
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				id="tabs">
				<tr>
					<td class="tabs" align="center"><font color="white">采购单据信息</font>
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
							<table  cellSpacing=0 cellPadding=0 width=1000
								align=center class="tb">
							<col style="width: 20%" />
							<col style="width: 30%" />
							<col style="width: 50%" />
								<tbody>
								<tr>
										<td class=td3 align="center" style="width:10%">供应商名称</td>
										<td width="200px"><select class="flexselect" id="gysname" 
											name="gysname"   style="width:170px;position: relative;" >
											<%
											List<GYS> gyss = null;
											if (null != session.getAttribute("gyss")) {
												gyss = (List<GYS>) session.getAttribute("gyss");
											}
											for(int i=0;i<gyss.size();i++)
											{
											%>
											<option <%if(((GYS)gyss.get(i)).getId()==gysid) {%> selected<%}%> ><%=((GYS)gyss.get(i)).getGongyingname() %></option>
											<%	
											}
											%>
											</select>
											
										</td>
										<td>&nbsp;</td>
								</tr>
							
								<tr>
										<td class=td3 align="center" style="width:10%">供应商型号</td>
										<td>
                                            <select class="flexselect" id="gysname_xh"
                                                    name="gysname_xh"   style="width:170px;position: relative;" >
                                                <%
                                                    List<GYSXH> gysxhs = new ArrayList<GYSXH>();
                                                    if (null != session.getAttribute("gysxhs")) {
                                                        gysxhs = (List<GYSXH>) session.getAttribute("gysxhs");
                                                    }
                                                    for(int i=0;i<gysxhs.size();i++)
                                                    {
                                                %>
                                                <option <%if(((GYSXH)gysxhs.get(i)).getXinghao().equals(gysname_xh)) {%> selected<%}%> > <%=((GYSXH)gysxhs.get(i)).getXinghao() %></option>
                                                <%
                                                    }
                                                %>
                                            </select>
										</td>
										<td>&nbsp;</td>
								</tr>
								 <tr>
										<td class=td3 align="center" style="width:10%">采购单号</td>
										<td><input type="text" size="24" id="caigoudanid"  value="<%=caigouid%>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="caigoudanid" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
								</tr>
							
								<tr>
										<td class=td3 width=40 align="center">类型</td>
										<td  ><select style="position: relative;"  onchange="enableselect()" 
										 style="this.disabled=true;" 
											id=gystype  name=gystype >
											<%
											String values[] = {"原料","半成品","成品","商品","--请选择--"};
											for(int i=0;i<values.length;i++){
											%>
												 <%if (values[i].equals(gystype)) {%> <OPTION value="<%=values[i]%>" selected ><%=values[i]%></OPTION><%} %> 
											<%}%>
										</select></td>
										<td id="zgmmerror">&nbsp;</td>
								</tr>
										<tr>
										<td class=td3 align="center" style="width:10%">型号</td>
										<td>
											<input type="text"   id="xinghao1" 
											 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											 value=<%=typenum%>
											name="xinghao" >
										</td>
										<td>&nbsp;</td>
								</tr>
									<tr>
										<td class=td3 align="center" >采购数量</td>
										<td><input type="text" size="24" id="totalnum" value="<%=num%>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="totalnum" maxlength="24"></input>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >交货日期</td>
										<td><input name="jiaohuoText"
									type="text" id="jiaohuoText" class="" value=<%=xiadandate %>
									 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
									style="width: 180px; position: relative" /> 
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >操作人</td>
										<td><input type="text" size="24" id="opname"  value="<%=username%>"
										
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="opname" maxlength="24"></input> 
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >接单人</td>
										<td><input type="text" size="24" id="jiedanren"  value="<%=currentuser%>"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
											name="jiedanren" maxlength="24"></input> 
										</td>
										<td>&nbsp;</td>
									</tr>
								
									<tr>
										<td class=td3 align="center" >备注</td>
										<td style="HEIGHT: 100px;width: 300px"><textarea id="xiangxi"
										 onfocus="this.blur()" readonly="readonly"  style="color:gray" 
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