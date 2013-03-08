<%@page import="com.jiang.util.PublicFunc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>客户</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" language="javascript"
	src="js/jquery-fn-tab.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="js/jquery_dialog.js"></script>
<script type="text/javascript" src="js/jquery.corners.min.js"></script>
<script type="text/javascript" src="js/flexigrid.js"></script>
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/ChangeImageJS.js"></script>
<link rel="stylesheet" href="CSS/flexigrid.css" type="text/css"></link>
<link rel="stylesheet" href="CSS/jquery_dialog.css" type="text/css"></link>
<link rel="stylesheet" href="CSS/flexigrid.pack.css" type="text/css"></link>
<link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="CSS/table.css" />
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />

 <script language="javascript" type="text/javascript">
 function winOpenFullScreen(strURL)
 {
     var sheight = screen.height-70;
     var swidth = screen.width-10;
     var winoption    ="left=0,top=0,height="+sheight+",width="+swidth+",toolbar=yes,menubar=yes,location=yes,status=yes,scrollbars=yes,resizable=yes";
     var tmp=window.open(strURL,'',winoption);
     return tmp;
 }
     function opendialogpwd()
     {
         var someValue=window.showModalDialog("CGGL/pwd.jsp",window,"dialogHide:true;dialogWidth=500px;dialogHeight=100px;status=no;help=no;scrollbars=no;");
         document.form1.p1t.value=someValue;
     }
     function flusha()
     {
		alert("ss");    	 
     }
     

    </script>


<%
	String zhuguan = "false";
	String zhuguanmima = "";
	com.jiang.bean.User user = null;
	String quanxian = "";
	String bumen = "";
	if(null != session.getAttribute("user"))
	{
		user = (com.jiang.bean.User)session.getAttribute("user");
		zhuguanmima = user.getZGpwd();
		if(zhuguanmima == "")
		{
			zhuguan = "false";
		}
		else
		{
			zhuguan = "true";
		}
	}
	if(null != session.getAttribute("zgmima"))
	{
		zhuguanmima = (String)session.getAttribute("zgmima");
	}
	
%>

</head>
<body>
	<div>
		<table border="0" cellpadding="0" cellspacing="0" width="100%"
			id="tabs">
			<tr>
				<td class="tabs" align="center"><font color="white">查询采购任务单</font>
				</td>
				<td class="tabs"></td>
			</tr>
		</table>
	</div>
    <div style="height: 6px"></div>

	<form name="form1" action="#">
        <input type="hidden" name="p1t" id="p1t">
        <input type="hidden" name="zhuguanpwd" id="zhuguanpwd" value="<%=zhuguanmima%>">
        <input type="hidden" name="iszhuguan" id="iszhuguan" value="<%=zhuguan%>">
        <input type="hidden" name="orderstate" id="orderstate1" value="<%=PublicFunc.ORDER_STATE_FINISH%>">
        <input type="hidden" name="orderstate" id="orderstate2" value="<%=PublicFunc.ORDER_STATE_WATINGZJ%>">
        <input type="hidden" name="orderstate" id="orderstate3" value="<%=PublicFunc.ORDER_STATE_WATINGRK%>">
        <input type="hidden" name="orderstate" id="orderstate4" value="<%=PublicFunc.ORDER_STATE_DELETE%>">
        <input type="hidden" name="orderstate" id="orderstate5" value="<%=PublicFunc.ORDER_STATE_NOPERSON%>">
        <input type="hidden" name="orderstate" id="orderstate6" value="<%=PublicFunc.ORDER_STATE_WATINGCG%>">
        
    </form>


		<table cellpadding="0" cellspacing="0" width="100%" align="center"
			style="border: #b9c2d3 solid 1px; top: 0px">
			<tr>
				<td width="132" align="center" class="td1">型号</td>
				<td width="140" class="td2"><input type="text" name="type_num" id="type_num"></input>
				</td>
				<td width="132" align="center" class="td1">状态</td>
				<td width="140" class=""><select name="zhuangtai"
					id="zhuangtai" class="a2" style="position: relative">
					<%
					String states[] = { PublicFunc.ORDER_STATE_NOPERSON,PublicFunc.ORDER_STATE_RESEND,
							PublicFunc.ORDER_STATE_WATINGCG,PublicFunc.ORDER_STATE_WATINGRK,
							PublicFunc.ORDER_STATE_WATINGZJ, PublicFunc.ORDER_STATE_FINISH, 
							PublicFunc.ORDER_STATE_DELETE,
							};
					%>
						<option selected="selected" value="--请选择--">--请选择--</option>
						<%for(int i=0;i<states.length;i++) {%>
							<option value="<%=states[i] %>" ><%=states[i] %></option>
						<%} %>
				</select></td>

			</tr>
			<tr>
				<td width="80" align="center" class="td1">下单日期</td>
				<td width="160" align="left" class="td2"><input
					name="beginTime" type="text" id="beginTime" class="Wdate"
					onclick="WdatePicker()" style="width: 160px; position: relative" /></td>

				<td width="132" align="center" class="td1">至</td>
				<td class="td2" align="left"><input name="endTime"
					type="text" id="endTime" class="Wdate" onclick="WdatePicker()"
					style="width: 160px; position: relative" /></td>
				<td width="80" class="td2"><input type="image"
					name="imgBtnSearch" id="imgBtnSearch"
					onmouseover="ChangeImage(this,'images/Search2.gif')"
					onmouseout="ChangeImage(this,'images/Search1.gif')"
					src="images/Search1.gif"
					style="border-width: 0px; position: relative;"  onclick="gridFlash()" /></td>
			</tr>

		</table>

	</div>

	<div style="height: 6px"></div>
	<div>
		<table id="flex1" style="display: none; font-size: 12px;"
			style="top:7px"></table>
		<input id="hidden" type="hidden" name="hidden" value="manage" />
	</div>
</body>



<script>

function gridFlash(){  
	$("#flex1").flexOptions({params: [
	                                  {name:'type_num', value:$("#type_num").val()},
	                                  {name:'zhuangtai', value:$("#zhuangtai").val()},
	                                  {name:'beginTime',value:$("#beginTime").val()},
	                                  {name:'endTime',value:$("#endTime").val()}
	                                  ]}).flexReload();
}  
	$("#flex1").flexigrid({

		url : 'CGGL_dolist?hidden=manage&type=DJGL',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			sortable : true,
			align : 'center',
			hide : true
		}, {
			display : '采购单号',
			name : 'caigou_id',
			width : 120,
			sortable : false,
			align : 'center',
			hide : false
		}, {
			display : '型号',
			name : 'type_num',
			width : 80,
			sortable : false,
			align : 'center'
		}, {
			display : '数量 ',
			name : 'CG_totalnum',
			width : 50,
			sortable : false,
			align : 'center'
		}, {
			display : '交货日期 ',
			name : 'jiaohuo_time',
			width : 90,
			sortable : false,
			align : 'center'
		}, {
			display : '供应商 ',
			name : 'jiaohuo_time',
			width : 150,
			sortable : false,
			align : 'center'
		}, {
			display : '下单人 ',
			name : 'userName',
			width : 80,
			sortable : false,
			align : 'center'
		}, {
			display : '下单日期',
			name : 'xiadan_time',
			width : 80,
			sortable : false,
			align : 'center'
		}, {
			display : '状态 ',
			name : 'zhuangtai',
			width : 120,
			sortable : false,
			align : 'center'
		}, {
			display : '接单人 ',
			name : 'zhuangtai',
			width : 80,
			sortable : false,
			align : 'center'
		}, {
			display : '备注 ',
			name : 'zhuangtai',
			width : 110,
			sortable : false,
			align : 'center'
		}  ],
		buttons : [ {
			name : '打印',
			bclass : 'edit',
			onpress : button
		}, {
			separator : true
		} , {
			name : '补充供应商信息',
			bclass : 'edit',
			onpress : button
		}, {
			separator : true
		}],
		sortname : "id",
		sortorder : "desc",
		usepager : true,
		resizable : false,
		title : '采购任务单',
		useRp : true,
		page : 1,
		rp : 12,
		rpOptions : [ 12, 15, 20, 30, 50 ],
		width : 'auto',
		height : 340,
		showToggleBtn : false,
		checkbox : true
	});

	var comstr;
	var comcount;
	var printstr;
	function button(com, grid) {
		var hidden = document.getElementById("hidden");

		if (com == '打印') {
		 	hidden.value = "add";
			 
			if ($(".trSelected").length == 1) {

				 if($('.trSelected', grid).find("td").eq(5).text().length <2)
				 {
				 	alert("请先补充供应商信息!");
				 	return;
				 }
				
				 var orderstate1 = document.getElementById("orderstate1");
				 var orderstate2 = document.getElementById("orderstate2");
				 var orderstate3 = document.getElementById("orderstate3");
				 var orderstate4 = document.getElementById("orderstate4");
				 var orderstate6 = document.getElementById("orderstate6");
				 
				 if($('.trSelected', grid).find("td").eq(8).text() == orderstate1.value
						 ||$('.trSelected', grid).find("td").eq(8).text() == orderstate2.value
						 ||$('.trSelected', grid).find("td").eq(8).text() == orderstate3.value
						 ||$('.trSelected', grid).find("td").eq(8).text() == orderstate4.value
						 ||$('.trSelected', grid).find("td").eq(8).text() == orderstate6.value
						 )
				 {
				 	alert("当前任务状态，不支持该操作!");
				 	return;
				 }
						 
				printstr = "id="+$('.trSelected', grid).find("td").eq(0).text()+"&state="+$('.trSelected', grid).find("td").eq(8).text();
				getstatusbeforeprint("DisPatch_getPrintDJGL?"+printstr);
				//printstr
				//window.open (x , "newwindow", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=yes, status=no"); 
			} else if ($(".trSelected").length > 1) {
				alert("只能选择一项单据,打印预览");
			} else if ($(".trSelected").length == 0) {
				alert("请选择一项您要打印预览的单据");
			}
		}
		else if(com == '补充供应商信息')
		{
			hidden.value = "modify";
			if ($(".trSelected").length == 1) {
				 var orderstate5 = document.getElementById("orderstate5");
			//	 var zhuguanpwd = document.getElementById("zhuguanpwd");
			//	 comstr = $('.trSelected', grid).find("td").eq(0).text();

				 var orderstate1 = document.getElementById("orderstate1");
				 var orderstate2 = document.getElementById("orderstate2");
				 var orderstate3 = document.getElementById("orderstate3");
				 var orderstate4 = document.getElementById("orderstate4");
				 var orderstate6 = document.getElementById("orderstate6");
				 
				 if($('.trSelected', grid).find("td").eq(8).text() == orderstate1.value
						 ||$('.trSelected', grid).find("td").eq(8).text() == orderstate2.value
						 ||$('.trSelected', grid).find("td").eq(8).text() == orderstate3.value
						 ||$('.trSelected', grid).find("td").eq(8).text() == orderstate4.value
						 ||$('.trSelected', grid).find("td").eq(8).text() == orderstate6.value
						 )
				 {
				 	alert("当前任务状态，不支持该操作!");
				 	return;
				 }
				 
					 
				 if($('.trSelected', grid).find("td").eq(8).text() == orderstate5.value)
				 {
					 //未打印前不用输密码。。
				 }
				 else
				 {
					    if(zhuguanpwd.value == "" || zhuguanpwd.value == "null" || zhuguanpwd.value == null)
						{
							alert("部门没有主管，无法操作，请联系管理员");
							return ;
						}
					
				 }
  				 var aa = "CGGL_dolist?hidden=premodify&type=DJGLAGYS&id="+$('.trSelected', grid).find("td").eq(0).text();
  				 window.location.href = aa;
				// window.location.href =  "CGGL_addmodifyDJGL?id="+$('.trSelected', grid).find("td").eq(0).text();
			
				//	comstr = $('.trSelected', grid).find("td").eq(0).text();
			//	var aa = "CGGL_dolist?hidden=premodify&type=DJGL&id="+$('.trSelected', grid).find("td").eq(0).text();
			//	getstatusbycgid(aa);
			} else if ($(".trSelected").length > 1) {
				alert("请选择一个修改,不能同时修改多个");
			} else if ($(".trSelected").length == 0) {
				alert("请选择一个您要修改的信息");
			}
		}
	}

	/** 
	 * 获取状态
	 */
	function getstatusbeforeprint(url) {
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			success : function(result) {
				if(result.result=="true"){
					winOpenFullScreen ("DisPatch_getPrintDJGLOK?"+printstr , "newwindow", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=yes, status=no");
					
				}else{
					alert("状态被修改");
					$('#flex1').flexReload();
				}
			}
		});
	}
	
	
</script>
<script>  
       <%
           String message = (String)request.getAttribute("djglerror");
			if (message != null && !"".equals(message)) {
				request.removeAttribute("djglerror");
		%>  
		
           alert("<%=message%>");
       <%}%>
</script>
</html>
