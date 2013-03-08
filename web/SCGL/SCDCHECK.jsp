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
	<table border="0" cellpadding="0" cellspacing="0" width="820px"
				id="tabs">
				<tr >
					<td class="tabs"  align="center" ><font color="white" >生产单审核</font>
						</td>
					<td class="tabs"></td>
				</tr>
			</table>
</div>
<div style="height: 6px">
	</div>
	<div>
		<table cellpadding="0" cellspacing="0" width="820" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>
				<td width="80" align="center" class="td1">型号</td>
				<td width="60" class="td2"><input type="text" name="type_num"></input>
				</td>
				<td width="132" align="center" class="td1">状态</td>
				<td class="td2"><select name="ZhuangTaiDL"
					id="ZhuangTaiDL" class="a2" style="position: relative">
						<option selected="selected" value="--请选择--">--请选择--</option>
						<option value="未审核">未审核</option>
						<option value="审核通过">审核通过</option>
						<option value="审核驳回">审核驳回</option>
						<option value="生产完成">生产完成</option>
				</select></td>
				<td width="80" class="td2"><input type="image"
					name="imgBtnSearch" id="imgBtnSearch"
					onmouseover="ChangeImage(this,'images/Search2.gif')"
					onmouseout="ChangeImage(this,'images/Search1.gif')"
					src="images/Search1.gif"
					style="border-width: 0px; position: relative;" /></td>
			</tr>
		</table>
	</div>
	<div style="height: 6px">
	</div>
	<div>
		<table id="flex1" width="100%" style="display: none; font-size: 12px;"
			style="top:7px"></table>
		<input id="hidden" type="hidden" name="hidden" value="manage" />
	</div>
</body>



<script>
	$("#flex1").flexigrid({
		url : 'SCGL_dolist?hidden=manage&type=SCDCHECK',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			align : 'center',
			hide : true
		}, {
			display : '订单号',
			name : 'a',
			width : 85,
			align : 'center',
			hide : false
		}, {
			display : '型号',
			name : 'b',
			width : 80,
			align : 'center'
		}, {
			display : '数量',
			name : 'c',
			width : 50,
			align : 'center'
		}, {
			display : '发货时间',
			name : 'd',
			width : 80,
			align : 'center'
		}, {
			display : '生产交货日期 ',
			name : 'e',
			width : 80,
			align : 'center'
		}, {
			display : '状态 ',
			name : 'e',
			width : 50,
			align : 'center'
		}, {
			display : '审核通过',
			name : 'e',
			width : 50,
			align : 'center'
		}, {
			display : '审核驳回',
			name : 'e',
			width : 50,
			align : 'center'
		}, {
			display : '选择布匹',
			name : 'e',
			width : 80,
			align : 'center'
		} , {
			display : '生产完成',
			name : 'e',
			width : 80,
			align : 'center'
		}],
		buttons : [ {
			name : '添加',
			bclass : 'add',
			onpress : button
		}, {
			separator : true
		}, {
			name : '删除',
			bclass : 'delete',
			onpress : button
		}, {
			separator : true
		} ],
		sortname : "id",
		sortorder : "desc",
		usepager : true,
		resizable : false,
		title : '生产单信息',
		useRp : true,
		rp : 12,
		rpOptions : [ 12, 15, 20, 30, 50 ],
		width : 'auto',
		height : 340,
		showToggleBtn : false,
		onError:
			  function()
			  {
			      alert("登陆超时，请重新登陆!");
				  location.href="/odm/index.jsp";
			  },
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
					var url = "SCGL_dolist?hidden=delete&type=SCDCHECK&" + id;
					del(url);
				}
			}
		} else if (com == '添加') {
			hidden.value = "add";
			location.href = "DisPatch_getUrl?i=1&j=1";
		} else if (com == '修改') {
			hidden.value = "modify";
			if ($(".trSelected").length == 1) {
				window.location.href = "infoAdd.jsp?hidden=" + hidden.value
						+ "&id="
						+ $('.trSelected', grid).find("td").eq(0).text();
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
