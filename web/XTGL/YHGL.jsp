<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@page import="com.jiang.util.*"%>
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
<script type="text/javascript" src="js/ChangeImageJS.js"></script>
<link rel="stylesheet" href="CSS/flexigrid.css" type="text/css"></link>
<link rel="stylesheet" href="CSS/flexigrid.pack.css" type="text/css"></link>
<link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="CSS/table.css" />
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />
</head>
<body>
<div>

<table border="0" cellpadding="0" cellspacing="0" width="1110px"
	id="tabs">
	<tr>
		<td class="tabs" align="center"><font color="white">用户管理</font></td>
		<td class="tabs"></td>
	</tr>
</table>


</div>

<div style="height: 6px"></div>
<div>

<table cellpadding="0" cellspacing="0" width="100%" align="center"
	style="border: #b9c2d3 solid 1px; top: 4px">
	<tr>
		<td width="132" align="center" class="td1">姓名</td>
		<td width="140" class="td2"><input type="text" name="realName"
			id="realName"></input></td>
		<td></td>
		<td></td>
		<td width="132" align="center" class="td1">部门</td>
		<td width="140" class=""><select name="bumen" id="bumen"
			class="a2" style="position: relative">
			<option selected="selected" value="--请选择--">--请选择--</option>
			<%for(int i=0;i<PublicFunc.BUMENS.length;i++){ %>
			<option value="<%=PublicFunc.BUMENS[i] %>"><%=PublicFunc.BUMENS[i] %></option>
			<%} %>
		</select></td>
	</tr>
	<tr>
		<td width="132" align="center" class="td1">用户名</td>
		<td width="140" class="td2"><input type="text" name="username"
			id="username"></input></td>
		<td></td>
		<td></td>
		<td width="132" align="center" class="td1">是否主管</td>
		<td width="140" class=""><select name="iszg" id="iszg" class="a2"
			style="position: relative">
			<option selected="selected" value="--请选择--">--请选择--</option>
			<option value="是">是</option>
			<option value="否">否</option>
		</select></td>

		<td width="80" class="td2"><input type="image"
			onmouseover="ChangeImage(this,'images/Search2.gif')"
			onmouseout="ChangeImage(this,'images/Search1.gif')"
			src="images/Search1.gif"
			style="border-width: 0px; position: relative;" onclick="gridFlash()" /></td>
	</tr>

</table>

</div>

<div style="height: 6px"></div>
<div>
<table id="flex1" style="display: none; font-size: 12px;"
	style="top:7px"></table>
<input id="hidden" type="hidden" name="hidden" value="manage" /></div>
</body>

<script>
	function gridFlash(){  
		$("#flex1").flexOptions({params: [
		                                  {name:'realName', value:$("#realName").val()},
		                                  {name:'bumen', value:$("#bumen").val()},
		                                  {name:'username', value:$("#username").val()},
		                                  {name:'iszg', value:$("#iszg").val()}
		                                  ]}).flexReload();
	} 

	$("#flex1").flexigrid({
		url : 'XTGL_dolist?hidden=manage&type=YHGL',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			sortable : true,
			align : 'center',  	 	 	
			hide : true
		}, {
			display : '姓名',
			name : 'dingdan_id',
			width : 60,
			sortable : false,
			align : 'center',
			hide : false
		}, {
			display : '用户名',
			name : 'dingdan_name',
			width : 65,
			sortable : false,
			align : 'center'
		},{
			display : '公司',
			name : 'company',
			width : 50,
			sortable : false,
			align : 'center'
		},  {
			display : '部门',
			name : 'pay_way',
			width : 55,
			sortable : false,
			align : 'center'
		}, {
			display : '权限',
			name : 'fh_way',
			width :790,
			sortable : false,
			align : 'center'
		}],
		buttons : [ { 
			name : '添加',
			bclass : 'add',
			onpress : button 
		}, {
			separator : true
		} , {
			name : '删除',
			bclass : 'delete',
			onpress : button
		}, {
			separator : true
		} , {
			name : '修改',
			bclass : 'edit',
			onpress : button
		} ],
		/*searchitems : [   
		    {display: '信息编号', name : 'id', isdefault: true},   
		    {display: '信息标题', name : 'id'},   
		    {display: '信息类别', name : 'id'},   
		    {display: '发布作者', name : 'id'}   
		    ],   */
		sortname : "id",
		sortorder : "desc",
		usepager : true,
		resizable : false,
		title : '用户管理',
		useRp : true,
		rp : 10,
		rpOptions : [ 10, 15, 20, 30, 50 ],
		width : 'auto',
		height : 340,
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
					var url = "XTGL_dolist?hidden=delete&type=YHGL&" + id;
					del(url);
				}
			}
		} else if (com == '添加') {
			hidden.value = "add";
			location.href = "DisPatch_getAddJsp?a=9&b=1";
		} else if (com == '修改') {
			hidden.value = "modify";
			if ($(".trSelected").length == 1) {
				window.location.href =  "XTGL_dolist?hidden=premodify&type=YHGL&id="+$('.trSelected', grid).find("td").eq(0).text();
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
