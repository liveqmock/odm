<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import=" java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>采购质检</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" language="javascript"
	src="js/jquery-fn-tab.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="js/jquery.corners.min.js"></script>
<script type="text/javascript" src="js/flexigrid.js"></script>
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/ChangeImageJS.js"></script>
<link rel="stylesheet" href="CSS/flexigrid.css" type="text/css"></link>
<link rel="stylesheet" href="CSS/flexigrid.pack.css" type="text/css"></link>
<link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="CSS/table.css" />
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />

<script> 
	function zhijian(id, mishu)
	{
		var strs= new Array(); //定义一数组
		strs=id.split("#"); //字符分割      

		var ui1 = document.getElementById("bptiaoma");
		var ui2 = document.getElementById("shijimishu");
		ui1.value = strs[0];
		ui2.value = strs[1].split(".")[0];
	}
	function tongguo()
	{
		var f = document.createElement("form");
		var ui1 = document.getElementById("bptiaoma");
		var ui2 = document.getElementById("shijimishu");
		var ui3 = document.getElementById("beizhu");
		if(ui1.value == "")
			{
			alert("获取条码失败");
			return false;
			}
		if(ui1.value == "")
		{
		alert("获取米数失败");
		return false;
		}
		f.action = "SCGL_dolist?hidden=modify&type=ZHIJIAN_CG&bptiaoma="+ui1.value
				+"&shijimishu="+ui2.value+"&beizhu="+ui3.value;
		f.method = "post";
		document.body.appendChild(f);
		f.submit();
	}
  function add()
  {
		var ui1 = document.getElementById("mishu");
		
		var price = document.getElementById("price");
		var danhao = document.getElementById("danhao");
		if(ui1.value == "" || ui1.value == "0")
		{
			alert("米数不能为0或空");
			return false;
		}
 		location.href = "CKGL_dolist?hidden=add&type=CGRKSQ&mishu="+ui1.value+
      "&price="+price.value +"&danhao="+danhao.value;
	   return true;
  }
</script> 

</head>
<%
	String zijianid = "";
	String cgdid = "";
	String xinghao = "";
	String zongmishu = "";
	String totalcount = "";
	String zhijiancount = "";
	if(zijianid.equals(""))
	{
		if(null != session.getAttribute("zijianid"))
		{
			zijianid = (String)session.getAttribute("zijianid");
		}
		else
		{
			  Random rdm = new Random(System.currentTimeMillis());
		      int intRd = Math.abs(rdm.nextInt())%9999+1;
		      SimpleDateFormat formater = new SimpleDateFormat("yyMMdd");
		      zijianid =  "ZJ"+formater.format(new Date())+String.format("%04d", intRd); 
			  session.setAttribute("zijianid", zijianid);
		}
	}
	if(null  != session.getAttribute("cgdid"))
	{
		cgdid = (String)session.getAttribute("cgdid");
	}
	if(null  != session.getAttribute("xinghao"))
	{
		xinghao = (String)session.getAttribute("xinghao");
	}

	if(null  != session.getAttribute("mishu"))
	{
		zongmishu = (String)session.getAttribute("mishu");
	}

	if(null  != session.getAttribute("totalcount"))
	{
		totalcount = (String)session.getAttribute("totalcount");
	}

	if(null  != session.getAttribute("zhijiancount"))
	{
		zhijiancount = (String)session.getAttribute("zhijiancount");
	}

%>
<body>
	<div>
		<table border="0" cellpadding="0" cellspacing="0" width="100%"
			id="tabs">
			<tr>
				<td class="tabs" align="center"><font color="white">采购单质检详细</font>
				</td>
				<td class="tabs"></td>
			</tr>
		</table>
	</div>

	<div style="height: 6px"></div>
	<div>
		<table cellpadding="0" cellspacing="0" width="100%" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>
				<td width="132" align="center" class="td1">质检报告单号:</td>
				<td width="140" class="td2">&nbsp;&nbsp;&nbsp;<%=zijianid %>
				</td>
				<td width="132" align="center" class="td1">采购单号:</td>
				<td width="140" class="">&nbsp;&nbsp;&nbsp;<%=cgdid %></td>
				<td width="132" align="center" class="td1">型号:</td>
				<td width="140" class="">&nbsp;&nbsp;&nbsp;<%=xinghao %></td>
			</tr>
			<tr>
				<td width="132" align="center" class="td1">总米数:</td>
				<td width="140" class="td2">&nbsp;&nbsp;&nbsp;<%=zongmishu %>
				</td>
				<td width="132" align="center" class="td1">统计:</td>
				<td width="140" class="">&nbsp;&nbsp;&nbsp;<%=zhijiancount %>/<%=totalcount%></td>
				<td width="132" align="center" class="td1">质检报告</td>
				<td width="140" class="">&nbsp;&nbsp;&nbsp;<input type="button" value="预览" /></td>
			</tr>
			
			
		</table>
	<div style="height: 5px"></div>

	<table cellpadding="0" cellspacing="0" width="100%" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
	<tr>
					<td width="100"  class="td1">条码:</td>
					<td width="100" class="td2"><input type="text" id="bptiaoma" name="bptiaoma" 
					 onfocus="this.blur()" readonly="readonly"  style="color:gray"   /> </td>
					<td width="100" align="center" class="td1">米数:</td>
					<td width="100" class="td2"><input type="text" id="shijimishu" name="shijimishu"  onkeyup="value=value.replace(/[^\d]/g,'')" style="color:red"/> </td>
		
					<td width="100" align="center" class="td1">备注:</td>
					<td width="100" class="td2"><input type="text" name="beizhu" id="beizhu" /> </td>
					<td width="100" class="td2">&nbsp;&nbsp;&nbsp;<input type="button" value="质检通过"  onclick="tongguo()"/> </td>
					<td width="100" class="td2"><input type="button" value="不通过" /> </td>
				</tr>
	</table>
	</div>

	<div style="height: 6px"></div>
	
	<div>
		<table id="flex1" style="display: none; font-size: 12px;"
			style="top:7px"></table>
		<input id="hidden" type="hidden" name="hiddflex1en" value="manage" />
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

		url : 'CKGL_dolist?hidden=manage&type=CGRKZJ',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			sortable : true,
			align : 'center',
			hide : true
		}, {
			display : '条形码',
			name : 'tiaoxingma',
			width : 250,
			sortable : false,
			align : 'center',
			hide : false
		}, {
			display : '米数',
			name : 'num',
			width : 250,
			sortable : false,
			align : 'center'
		}, {
			display : '备注',
			name : 'huojiahao',
			width : 250,
			sortable : false,
			align : 'center'
		}, {
			display : '是否质检',
			name : 'tiaoxingma',
			width : 250,
			sortable : false,
			align : 'center',
			hide : false
		}],

	
		sortname : "id",
		sortorder : "desc",
		usepager : true,
		resizable : false,
		title : '布匹列表',
		useRp : true,
		rp : 8,
		rpOptions : [ 8, 15, 20, 30, 50 ],
		width : 'auto',
		height : 310,
		showToggleBtn : false,
		checkbox : true
	});

	function button(com, grid) {
		var hidden = document.getElementById("hidden");

		if (com == '删除') {
			hidden.value = "delete";

			if ($('.trSelected', grid).length == 0) {
				alert("请选择要删除的数据");
			} else {
				if (confirm('是否删除这 ' + $('.trSelected', grid).length + ' 条记录吗?')) {
					var id = "";
					for ( var i = 0; i < $('.trSelected', grid).length; i++) {
						if (i == $('.trSelected', grid).length - 1) {
							id += "id="
									+ $('.trSelected', grid).find("td:first")
											.eq(i).text();
						} else {
							id += "id="
									+ $('.trSelected', grid).find("td:first")
											.eq(i).text() + "&";
						}
					}
					var url = "CGGL_dolist?hidden=delete&type=DJGL&" + id;
					del(url);
				}
			}
		} else if (com == '添加') {
			hidden.value = "add";
			
			//var ui1 = document.getElementById("hide1");
			//ui1.style.display="";//显示
			//window.showModalDialog("test7.htm");
 		 	//location.href = "CKGL_dolist?hidden=add&type=CGDJRK&";
		} else if (com == '修改') {
			hidden.value = "modify";
			if ($(".trSelected").length == 1) {
				window.location.href =  "CGGL_dolist?hidden=premodify&type=DJGL&id="+$('.trSelected', grid).find("td").eq(0).text();
			} else if ($(".trSelected").length > 1) {
				alert("请选择一个修改,不能同时修改多个");
			} else if ($(".trSelected").length == 0) {
				alert("请选择一个您要修改的信息");
			}
		}
	}

	/** 
	 * 删除记录 
	 */
	function del(url) {
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			success : function() {
				$('#flex1').flexReload();
			}
		});
	}
</script>
</html>
