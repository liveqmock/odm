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
		<table cellpadding="0" cellspacing="0" width="100%" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>
				<td width="132" align="center" class="td1">质检报告单号</td>
				<td width="140" class="td2"><input type="text" id="report_id" name="report_id"></input>
				</td>
				<td width="132" align="center" class="td1">型号</td>
				<td width="140" class="td2"><input type="text" id="xinghao" name="xinghao"></input>
				</td>
			</tr>
			<tr>
				<td width="132" align="center" class="td1">质检人</td>
				<td width="140" class="td2"><input type="text" id="apply_man" name="apply_man"></input>
				</td>
				<td width="80" class="td2"><input type="image"
					name="imgBtnSearch" id="imgBtnSearch"
					onmouseover="ChangeImage(this,'images/Search2.gif')"
					onmouseout="ChangeImage(this,'images/Search1.gif')"
					src="images/Search1.gif" onclick="gridFlash();"
					style="border-width: 0px; position: relative;" /></td>
			</tr>
		</table>
	</div>
	<div>
		<table id="flex1" width="100%" style="display: none; font-size: 12px;"
			style="top:7px"></table>
		<input id="hidden" type="hidden" name="hidden" value="manage" />
	</div>
</body>



<script>

function gridFlash(){  
	$("#flex1").flexOptions({params: [
	                                  {name:'report_id', value:$("#report_id").val()},
	                                  {name:'xinghao', value:$("#xinghao").val()},
	                                  {name:'apply_man', value:$("#apply_man").val()}
	                                  ]}).flexReload();
}  
	$("#flex1").flexigrid({
		url : 'SCGL_dolist?hidden=manage&type=ZHIJIANREPORT',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			align : 'center',
			hide : true
		}, {
			display : '报告单号',
			name : 'a',
			width : 140,
			align : 'center',
			hide : false
		}, {
			display : '来源单号',
			name : 'b',
			width : 140,
			align : 'center'
		}, {
			display : '型号',
			name : 'c',
			width : 140,
			align : 'center'
		}, {
			display : '米数 ',
			name : 'e',
			width : 140,
			align : 'center'
		}, {
			display : '质检人',
			name : 'e',
			width : 140,
			align : 'center'
		}, {
			display : '质量时间',
			name : 'e',
			width : 140,
			align : 'center'
		}, {
			display : '进度 ',
			name : 'e',
			width : 140,
			align : 'center'
		} ],
		buttons : [ 
		{
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
		title : '质检报告',
		useRp : true,
		rp : 12,
		rpOptions : [ 12, 15, 20, 30, 50 ],
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
					var url = "SCGL_dolist?hidden=delete&type=ZHIJIANREPORT&"
							+ id;
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
