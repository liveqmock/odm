<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="com.jiang.bean.KHGL_FH" %>
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
				fahuofangshi : {
					selectNone : "ss"
				},
                kehu_id : {
					required : true
				},
                lianxiren : {
                    required : true
                },
                dizhi : {
                    required : true
                }
			},
			messages : {
                fahuofangshi : {
					selectNone : "请选择发货方式"
				},
				kehu_id : {
				required : "请输入客户编号"
				} ,
                lianxiren : {
                    required : "请输入联系人"
                },
                dizhi : {
                    required : "请输入联系地址"
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
		f.action = "DisPatch_getAddJsp?a=5&b=6";
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
	String kehu_id = "";
	String fahuofangshi = "";
	String lianxiren = "";
	String dianhua = "";
	String yidongdianhua = "";
	String dizhi = "";

	KHGL_FH khgl = null;

	if (null != request.getAttribute("khglfh")) {
		khgl = (KHGL_FH)request.getAttribute("khglfh");
		id = khgl.getId()+"";
        if(null !=khgl.getKehu_id() ) kehu_id = khgl.getKehu_id();
        if(null !=khgl.getFahuofangshi() ) fahuofangshi = khgl.getFahuofangshi();
        if(null !=khgl.getLianxiren() ) lianxiren = khgl.getLianxiren();
        if(null !=khgl.getDianhua() ) dianhua = khgl.getDianhua();
        if(null !=khgl.getYidongdianhua() ) yidongdianhua = khgl.getYidongdianhua();
        if(null !=khgl.getDizhi() ) dizhi = khgl.getDizhi();
		
	}

    if(null != request.getSession().getAttribute("kehuid"))
    {
        kehu_id = (String) request.getSession().getAttribute("kehuid");
    }

%>
	<form id="form1" name="form1" method="post"
		action="XSGL_dolist?hidden=add&type=KHGL_FH_2">
		<input type="hidden" name="id" value="<%=id%>"/>
		<div>
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				id="tabs">
				<tr>
					<td class="tabs" align="center"><font color="white">添加收货地址</font>
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
										<td width="10px"><input type="text" size="24" id="kehu_id" value="<%=kehu_id %>"
											name="kehu_id" maxlength="24"><FONT color=red>*</FONT></input>
										</td>
										<td>&nbsp;</td>
								</tr>
								<tr>
										<td class=td3 align="center" style="width:10%">联系人</td>
										<td><input type="text" size="24" id="lianxiren" value="<%=lianxiren%>"
											name="lianxiren" maxlength="24"><FONT color=red>*</FONT></input>
										</td>
										<td>&nbsp;</td>
									</tr>
                                <tr>
                                    <td class=td3 align="center" >发货方式</td>
                                    <td>
                                        <select id="fahuofangshi" name="fahuofangshi">
                                            <%
                                                String vips[] = {"--请选择--", "快递", "普通"};
                                                for(int i=0;i<vips.length;i++)
                                                {
                                            %>
                                            <option value="<%=vips[i] %>" <%if(!"".equals(fahuofangshi) && fahuofangshi.equals(vips[i])) {%> selected <%} %>><%=vips[i]%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
									<tr>
										<td class=td3 align="center" >电话</td>
										<td><input type="text" size="24" id="dianhua" value="<%=dianhua%>"
											name="dianhua" maxlength="24"/>
										</td>
										<td>&nbsp;</td>
									</tr>
									
									<tr>
										<td class=td3 align="center" >手机</td>
										<td><input type="text" size="24" id="yidongdianhua" value="<%=yidongdianhua%>"
											name="yidongdianhua" maxlength="24"/>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class=td3 align="center" >地址</td>
										<td><input type="text" size="24" id="dizhi" value="<%=dizhi%>"
											name="dizhi" maxlength="24"/>
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
           String message = (String)request.getAttribute("modifykhglfherror");
			if (message != null && !"".equals(message)) {
				request.removeAttribute("modifykhglfherror");
		%>  
		
           alert("<%=message%>");
       <%}%>
</script>
</body>
</html>