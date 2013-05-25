<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.jiang.bean.YHGL"%>

<%@page import="com.jiang.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>客户</title>
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
<link rel="stylesheet" href="skin/WdatePicker.css" type="text/css" />

<link type="text/css" rel="stylesheet" href="CSS/table.css" />
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />

<script language="javascript"> 
		function selectcheckbox(a) {
			var ccheck;
			switch(a)
			{
			case 0:
				ccheck = document.form1.check0;break;
			case 1:
				ccheck = document.form1.check1;break;
			case 2:
				ccheck = document.form1.check2;break;
			case 3:
				ccheck = document.form1.check3;break;
			case 4:
				ccheck = document.form1.check4;break;
			case 5:
				ccheck = document.form1.check5;break;
			case 6:
				ccheck = document.form1.check6;break;
			case 7:
				ccheck = document.form1.check7;break;
			case 8:
				ccheck = document.form1.check8;break;
			case 9:
				ccheck = document.form1.check9;break;
			case 10:
				ccheck = document.form1.check10;break;
			default:
				break;
			}
			ccheck.checked=!ccheck.checked; 
		}
		
   function changBumen()
   {
	   var id = 0;
	   var bumen = document.getElementById("bumen");
	   if(bumen.value == "<%=PublicFunc.STR_BUMEN_JH%>")
	   {
	   		id = 0;
	   }
	   else if(bumen.value == "<%=PublicFunc.STR_BUMEN_CG%>")
	   {
	   		id = 1;
	   }
	   else if(bumen.value == "<%=PublicFunc.STR_BUMEN_SC%>")
	   {
	   		id = 2;
	   }
	   else if(bumen.value == "<%=PublicFunc.STR_BUMEN_CK%>")
	   {
	   		id = 3;
	   }
	   else if(bumen.value == "<%=PublicFunc.STR_BUMEN_XS%>")
	   {
	   		id = 4;
	   }
	   else if(bumen.value == "<%=PublicFunc.STR_BUMEN_SJ%>")
	   {
	   		id = 5;
	   }
	   else if(bumen.value == "<%=PublicFunc.STR_BUMEN_CW%>")
	   {
	   		id = 6;
	   }
	   else if(bumen.value == "<%=PublicFunc.STR_BUMEN_XT%>")
	   {
	   		id = 7;
	   }
	   else if(bumen.value == "<%=PublicFunc.STR_BUMEN_ZH%>")
	   {
	   		id = 8;
	   } 
	   var tdcompany = document.getElementById("companys");

	
	   var tbodycompany=tdcompany.parentNode;

	    tbodycompany.removeChild(tdcompany);
	   var cellcompany=tbodycompany.insertCell(1);

	   cellcompany.id = "companys";  
	   var companysrc;
	   if(id == 4)
		  companysrc = "<select style='position:relative' id='company' class=a2 name=company > <option value='1' >宜纺 </option><option value='0' >森泰 </option></select>";
   	   else
   		  companysrc = "<select style='position:relative' id='company' class=a2 name=company > <option value='1' >宜纺 </option></select>";

   	   cellcompany.innerHTML = companysrc;
 
	   var td = document.getElementById("qtd");
	   var tbody=td.parentNode;
	   tbody.removeChild(td);

	   var array32=new Array();
	     array32 =[
	     ['订单查询','采购跟踪单管理','自加工跟踪单管理(1车间)','自加工跟踪单管理(2车间)','外加工跟踪单管理',
	      '半成品仓库查询','半成品开剪'],
	     ['采购任务单','采购退货任务单','供应商管理'],
	     ['自加工任务单(一车间)', '自加工任务单(二车间)', '外加工任务单','待质检任务单'],
	     ["待入库任务单", "待出库任务单", "仓库查询", "开剪任务单",  "发货订单"],
	     ["预订单管理", "展会订单管理", "订单管理", "展会开单", "客户管理", "成品仓库查询",
			"成品开剪申请", "销售单退货入库"],
		 ["原料资料", "半成品资料", "成品资料"],
		 ["采购付款", "销售收款", "工资核算", "费用收支", "对账", "查询", "单位管理"],
		 ["用户管理", "历史记录", "系统备份与还原",  "系统日志"],
		 ["综合管理"]
	     ]; 

	  var cell=tbody.insertCell(1);
	  cell.id = "qtd";
	  var html = "";
	  var str = "";
	  if(id == 7)
	  {
		  html += "全部权限";
	  }
	  else
	  {
          var qxtext = document.getElementById("qxtext").value;
		  for(var i=0;i<array32[id].length;i++){
			  str += array32[id][i];
              var checkstr="";
              if(qxtext.substring(i, i+1) == "1")
              {
                  checkstr = " checked ";
              }

			  html += "<input type='checkbox' "+checkstr+" name='check"+i+"' id='check"+i+"' > <a onclick='selectcheckbox("+i+")' style='cursor:hand;color:black' >"+array32[id][i]+"</a></input>";
			  if(str.length > 20)
			  {
				  html += "<br></br>";
				  str = "";
			  }
		  }
	  }
	 
	  //var html = "<input type='checkbox' name='check0' id='check0' > <a onclick='selectcheckbox(0)' style='cursor:hand;color:black' >踩踩踩</a></input>";
	  //html += "<input type='checkbox' name='check1' id='check1' > <a onclick='selectcheckbox(1)' style='cursor:hand;color:black' >踩踩踩</a></input>";
	  cell.innerHTML = html;

   }
	
    function changeZhuGuan()
	{
    	var ss = document.getElementById("zhuguan").value;
    	var zhuguanmima = document.getElementById("zhuguanmima");
		if(ss == "是"){
			zhuguanmima.style.display="";
		   document.getElementById("zgmmerror").style.display="";
		}
		else{
			zhuguanmima.style.display="none";
			document.getElementById("zgmmerror").style.display="none";
		}
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var validator = $("#form1").validate({
			debug : true, //调试模式取消submit的默认提交功能  
			errorClass : "haha",//默认为错误的样式类为：error  
			focusInvalid : true,
			onfocusout: function(element) {
		        $(element).valid();
		    },
		    onkeyup: function(element) {
		        $(element).valid();
		    },
			submitHandler : function(form) {
				form.submit();   
			},
			rules : {
				realname : {
					required : true
				},nickname : {
					required : true
				},pwd : {
					required : true,
					minlength : 6
				},zhuguanmima : {
					required : true,
					minlength : 6
				}
				
			},
			messages : {
				realname : {
					required : "请输入真实姓名！"
				},nickname : {
					required : "用户名不能为空！"
				},pwd : {
					required : "密码不能为空！",
					minlength : $.format("密码至少{0}位！")
				},zhuguanmima : {
					required : "主管密码不能为空！",
					minlength : $.format("主管密码至少{0}位！")
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
	function backMenu()
	{
		var f=document.createElement("form");
		f.action="DisPatch_getUrl?i=8&j=0";
		f.target="mainframe";
		f.method="post";
		document.body.appendChild(f);
		f.submit();
	}
</script>

</head>
<body onload="changeZhuGuan();changBumen()">
<%
YHGL yhgl = null;
int id = 0;
String username = "";
String nickname = "";
String pwd = "123456";
String str = "";
String zhuguan = "否";
String zgmm = "000000";
String company = "1";
String qxtext = "";
if(null != request.getAttribute("yhgl"))
{
	System.out.println("not null");
	yhgl = (YHGL)request.getAttribute("yhgl");
	username = yhgl.getRealName();
	nickname = yhgl.getUsername();
	company = yhgl.getCompany();
	pwd = yhgl.getPwd();
	str = yhgl.getBumen();
	zhuguan = yhgl.getZGpwd() != null ? "是" : "否";
	System.out.println("是否主管"+zhuguan);
	if(yhgl.getZGpwd() != null)
	{
		zgmm = yhgl.getZGpwd();
	}
    qxtext = yhgl.getQuanxian();
	id = yhgl.getId();
}
%>
	<form id="form1" name="form1" method="post" action="XTGL_dolist?hidden=modify&type=YHGL">
		<input type="hidden" name="id" value="<%=id%>"/>
        <input type="hidden" name="qxtext"  id="qxtext" value="<%=qxtext%>"/>
		
		<div>
			<table border="0" cellpadding="0" cellspacing="0" width="1110px"
				id="tabs">
				<tr >
					<td class="tabs"  align="center" ><font color="white" >用户信息</font>
						</td>
					<td class="tabs"></td>
				</tr>
			</table>

		</div>
		<div style="height: 30px"></div>

		<DIV id=UpdatePanel1>
			<TABLE align=center>
				<TBODY>
					<TR>
						<td>
							<TABLE class=tb cellSpacing=0 cellPadding=0 width=100%
								align=center>
							<col style="width: 20%" />
							<col style="width: 40%" />
							<col style="width: 40%" />
									<TR>
										<td class=td1 width=40 align="center" >真实姓名</td>
										<td class='td2'  ><input type="text"  size="14"   maxlength="20" id="realname" name="realname" value=<%=username %> />
										<FONT color=red>*</FONT>
										</td>
										<td>&nbsp;</td>
									</TR>
									<TR>
										<td class=td1 align="center" width="40px">用户名</td>
										<td class=td2 ><input type="text"  size="14"   id="nickname" name="nickname"  maxlength="20"  value=<%=nickname %> />
										<FONT color=red>*</FONT>
										</td>
										<td>&nbsp;</td>
									</TR>
									<TR>
										<td class=td1 align="center" width="40px">密码</td>
										<td class=td2  width="400px"><input type="password" size="14"    id="pwd"  maxlength="20"  name="pwd"  value=<%=pwd %> />
										<FONT color=red>*</FONT>
										</td>
										<td>&nbsp;</td>
									</TR>
									
									<TR>
										<td class=td1  align="center" width="40px">部门</td>
										<td class=td2 ><SELECT
											style="POSITION: relative" id=bumen class=a2
											name=bumen onchange="changBumen()">
												<%
											String values[]= PublicFunc.BUMENS;
											for(int i=0;i<values.length;i++){
											%>
												<option value="<%=values[i] %>"  <%if(str !=null && values[i].equals(str)) {%> selected <%} %> ><%=values[i] %></option>
												<%} %>
																
										</SELECT> </td>
										<td>&nbsp;</td>
									</TR>
									<TR>
										<td class=td1  align="center" width="40px">公司</td>
										
										<td id='companys'    width="500px"> </td>
										<td>&nbsp;</td>
									</TR>
									<TR>
										<td class=td1  align="center" width="40px">是否主管</td>
										<td class=td2  ><SELECT
											style="POSITION: relative" id=zhuguan class=a2
											name=zhuguan onchange="changeZhuGuan()" >
												
												<%
											String values2[]= {"是","否"};
											for(int i=0;i<values2.length;i++){
											%>
												<option value="<%=values2[i] %>"  <%if(zhuguan !=null && values2[i].equals(zhuguan)) {%> selected <%} %> ><%=values2[i] %></option>
										  <%} %>
												
										</SELECT> <input type="password" id="zhuguanmima"  value=<%=zgmm %> name="zhuguanmima" ><FONT color=red>*</FONT></input></td>
										<td id=zgmmerror>&nbsp;</td>
									</TR>
									<TR>
										<td class=td1  align="center" width="40px">权限</td>
										<td  id='qtd'  width="500px"></td>
									
										<td>&nbsp;</td>
									</TR>
									
							</TABLE>
						</td>
					</TR>
					<TR>
						<td>
							<TABLE>
								<TBODY>
									<TR>
										<td style="HEIGHT: 26px" width=200 align=right><INPUT
											style="POSITION: relative; BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											id=imgbtnSure
											onmouseover="ChangeImage(this,'images/Sure2.gif')"
											onmouseout="ChangeImage(this,'images/Sure1.gif')"
											src="images/Sure1.gif" type=image name=imgbtnSure></td>	
											<td style="HEIGHT: 26px" width=100 align=right><INPUT
											style="POSITION: relative; BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
											onmouseover="ChangeImage(this,'images/C2.gif')"
											onmouseout="ChangeImage(this,'images/C1.gif')"
											src="images/C1.gif" type=image onClick="backMenu();return false;"></td>
				
									</TR>
								</TBODY>
							</TABLE>
						</td>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>

	</FORM>
		<script>  
       <%
           String message = (String)request.getAttribute("modifyyhglerror");
			if (message != null && !"".equals(message)) {
				request.removeAttribute("modifyyhglerror");
		%>  
		
           alert("<%=message%>");
       <%}%>
</script>
</body>
</html>
