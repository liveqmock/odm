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
	<div class="">
		<table border="0" cellpadding="0" cellspacing="0" width="820px"
			id="tabs">
			<tr>
				<td class="tabs" align="center"><font color="white">消息管理</font>
				</td>
				<td class="tabs"></td>
			</tr>
		</table>
	</div>
	<div style="height: 6px"></div>
	<div>

		<table cellpadding="0" cellspacing="0" width="816px" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>
				<td width="132" height="30" align="center" class="td1">来源部门</td>
				<td width="140" class="td2"><select name="laiyuanbumen"
					id="laiyuanbumen" class="" style="position: relative">
						<option selected="selected" value="--请选择--">--请选择--</option>
						<option value="采购">采购</option>
						<option value="生产">生产</option>
						<option value="仓储">仓储</option>
						<option value="商品">商品</option>
						<option value="销售">销售</option>
						<option value="财务">财务</option>
						<option value="行政">行政</option>

				</select></td>
				<td width="132" align="center" class="td1">状态</td>
				<td width="140" class="td2"><select name="duqu_or_not"
					id="duqu_or_not" class="a2" style="position: relative">
						<option selected="selected" value="--请选择--">--请选择--</option>
						<option value="是">已处理</option>
						<option value="否">未处理</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width="80" align="center" class="td1">开始时间</td>
				<td width="160" align="left" class="td2"><input
					name="beginTime" type="text" id="beginTime" class="Wdate"
					onclick="WdatePicker()" style="width: 160px; position: relative" /></td>

				<td width="132" align="center" class="td1">结束时间</td>
				<td class="td2" align="left"><input name="endTime"
					type="text" id="endTime" class="Wdate" onclick="WdatePicker()"
					style="width: 160px; position: relative" /></td>
				<td width="80" class="td2"><input type="image"
					name="imgBtnSearch" id="imgBtnSearch"
					onmouseover="ChangeImage(this,'images/Search2.gif')"
					onmouseout="ChangeImage(this,'images/Search1.gif')"
					src="images/Search1.gif"
					style="border-width: 0px; position: relative;" onclick="gridFlash()"/></td>
			</tr>
		</table>

	</div>
	<div style="height: 6px"></div>
	<div>
		<table id="flex1" style="display: none; font-size: 14px"
			style="top:7px"></table>
		<input id="hidden" type="hidden" name="hidden" value="manage" />
	</div>
</body>

<script>
	function gridFlash(){  
		$("#flex1").flexOptions({params: [
		                                  {name:'laiyuanbumen', value:$("#laiyuanbumen").val()},
		                                  {name:'beginTime', value:$("#beginTime").val()},
		                                  {name:'duqu_or_not', value:$("#duqu_or_not").val()},
		                                  {name:'endTime', value:$("#endTime").val()}
		                                  ]}).flexReload();
	}  
	$("#flex1").flexigrid({
		url : 'XXGL_dolist?hidden=manage',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			sortable : true,
			align : 'center',
			hide : true
		}, {
			display : '发件人',
			name : 'send_man',
			width : 70,
			sortable : false,
			align : 'center',
			hide : false
		}, {
			display : '部门',
			name : 'laiyuanbumen',
			width : 70,
			sortable : false,
			align : 'center'
		}, {
			display : '单号 ',
			name : 'danhao',
			width : 120,
			sortable : false,
			align : 'center'
		}, {
			display : '型号',
			name : 'xinghao',
			width : 100,
			sortable : false,
			align : 'center'
		}, {
			display : '事件 ',
			name : 'message',
			width : 170,
			sortable : false,
			align : 'center'
		}, {
			display : '日期',
			name : 'sendTime',
			width : 90,
			sortable : false,
			align : 'center'
		}, {
			display : '类型 ',
			name : 'sendtype',
			width : 70,
			sortable : false,
			align : 'center'
		} ],
		buttons : [ {
			name : '添加',
			bclass : 'add',
			onpress : button
		}, 
		{
			separator : true
		},{
			name : '删除',
			bclass : 'delete',
			onpress : button
		},{
			separator : true
		} ,{
			name : '标记为已读',
			bclass : 'read',
			onpress : button
		},
		{
			separator : true
		} ],
		sortname : "id",
		sortorder : "desc",
		usepager : true,
		resizable : false,
		title : '消息管理',
		useRp : true,
		rp : 12,
		rpOptions : [ 12, 15, 20, 30, 50 ],
		width : 820,
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
					var url = "XXGL_dolist?hidden=delete&" + id;
					del(url);
				}
			}
		} else if (com == '添加') {
			hidden.value = "add";
			location.href = "DisPatch_getUrl?i=0&j=1";
		}else if (com == '标记为已读') {
			if ($('.trSelected', grid).length == 0) {
				alert("请选择将标记为已读的数据");
			} else {
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
				var url = "XXGL_dolist?hidden=readed&" + id;
				readover(url);
			}

		}

	}
	/** 
	 * 已读记录 
	 */
	function readover(url) {
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			success : function() {
				$('#flex1').flexReload();
			}
		});
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
