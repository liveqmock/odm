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
		<table border="0" cellpadding="0" cellspacing="0" width="100%"
			id="tabs">
			<tr>
				<td class="tabs" align="center"><font color="white">单据管理</font>
				</td>
				<td class="tabs"></td>
			</tr>
		</table>
	</div>

	<div style="height: 6px"></div>
	<div>

		<table cellpadding="0" cellspacing="0" width="1100px" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>
				<td width="132" align="center" class="td1">型号</td>
				<td width="140" class="td2"><input type="text" name="type_num" id="type_num"></input>
				</td>
				<td width="132" align="center" class="td1">状态</td>
				<td width="140" class=""><select name="zhuangtai"
					id="zhuangtai" class="a2" style="position: relative">
						<option selected="selected" value="--请选择--">--请选择--</option>
						<option value="完成">已完成</option>
						<option value="未完成">未完成</option>
						<option value="退货">退货</option>

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
			width : 130,
			sortable : false,
			align : 'center',
			hide : false
		}, {
			display : '型号',
			name : 'type_num',
			width : 110,
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
			width : 110,
			sortable : false,
			align : 'center'
		}, {
			display : '操作人 ',
			name : 'userName',
			width : 90,
			sortable : false,
			align : 'center'
		}, {
			display : '下单日期',
			name : 'xiadan_time',
			width : 110,
			sortable : false,
			align : 'center'
		}, {
			display : '状态 ',
			name : 'zhuangtai',
			width : 100,
			sortable : false,
			align : 'center'
		} ],

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
		}, {
			name : '修改',
			bclass : 'edit',
			onpress : button
		}, {
			separator : true
		} , {
			name : '标记为已下单',
			bclass : 'edit',
			onpress : button
		}, {
			separator : true
		} , {
			name : '打印预览',
			bclass : 'print',
			onpress : button
		}, {
			separator : true
		} ],
		sortname : "id",
		sortorder : "desc",
		usepager : true,
		resizable : false,
		title : '采购单管理',
        pagestat : '显示 {from} 到 {to} 条 共 {total} 条数据',
        pagetext : '第',
        outof : '共',
        findtext : 'Find',
        procmsg : '正在查询, 请等待 ...',
        query : '',
        qtype : '',
        nomsg : '没有符合要求的数据',
		useRp : true,
		rp : 12,
		rpOptions : [ 12, 15, 20, 30, 50 ],
		width : 820,
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
					var url = "CGGL_dolist?hidden=delete&type=DJGL&" + id;
					del(url);
				}
			}
		} else if (com == '添加') {
			hidden.value = "add";
 			 location.href = "DisPatch_getAddJsp?a=1&b=1";
		}  else if (com == '打印预览') {
			 hidden.value = "add";
			if ($(".trSelected").length == 1) {
				var x = "DisPatch_getPrintDJGL?id="+$('.trSelected', grid).find("td").eq(0).text();
				window.open (x , "newwindow", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=yes, status=no"); 
			} else if ($(".trSelected").length > 1) {
				alert("只能选择一项单据,打印预览");
			} else if ($(".trSelected").length == 0) {
				alert("请选择一项您要打印预览的单据");
			}
			
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
