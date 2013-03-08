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
			<tr>
				<td class="tabs" align="center"><font color="white">预订单</font>
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
				<td width="132" align="center" class="td1">订单号</td>
				<td width="140" class="td2"><input type="text" name="type_num"></input>
				</td>
				<td width="132" align="center" class="td1">客户名称</td>
				<td width="140" class="td2"><input type="text" name="type_num"></input>
				</td>
				<td align="center" class="td2" style="height: 24px"><input
					type="submit" name="ID" value="新客户" onclick="" id="ID" /></td>
				<td align="center" class="td2" style="height: 24px"><input
					type="submit" name="ID" value="生产预订单" onclick="" id="ID" /></td>
			</tr>

		</table>

	</div>

	<div style="height: 6px"></div>
	<div></div>
</body>



<script>
	$("#flex1").flexigrid({

		url : 'CGGL_dolist?hidden=manage&type=CKGL',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			sortable : true,
			align : 'center',
			hide : true
		}, {
			display : '型号 ',
			name : 'type_num',
			width : 130,
			sortable : false,
			align : 'center',
			hide : false
		}, {
			display : '仓库类型',
			name : 'bptype',
			width : 110,
			sortable : false,
			align : 'center'
		}, {
			display : '布匹类型',
			name : 'ckname',
			width : 50,
			sortable : false,
			align : 'center'
		}, {
			display : '可用米数 ',
			name : 'KY_num',
			width : 110,
			sortable : false,
			align : 'center'
		}, {
			display : '总米数',
			name : 'num',
			width : 90,
			sortable : false,
			align : 'center'
		}, {
			display : '价格',
			name : 'c',
			width : 110,
			sortable : false,
			align : 'center'
		}, {
			display : '品级 ',
			name : 'zhiliangdengji',
			width : 100,
			sortable : false,
			align : 'center'
		} ],
		buttons : [ {
			name : '添加',
			bclass : 'add',
			onpress : button
		}, {
			name : '删除',
			bclass : 'delete',
			onpress : button
		}, {
			name : '修改',
			bclass : 'edit',
			onpress : button
		}, {
			separator : true
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
		title : '仓库管理',
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

	function contextmenu(row) {//右键菜单对应方法

		var menu = {
			width : 150,
			items : [

			{
				text : "查看",
				icon : "css/images/add.png",
				alias : "contextmenu-view",
				action : contextMenuItem_click
			},

			{
				text : "编辑",
				icon : "css/images/add.png",
				alias : "contextmenu-edit",
				action : contextMenuItem_click
			},

			{
				text : "删除",
				icon : "css/images/add.png",
				alias : "contextmenu-delete",
				action : contextMenuItem_click
			},

			{
				text : "刷新",
				icon : "css/images/add.png",
				alias : "contextmenu-reflash",
				action : contextMenuItem_click
			}

			]

		};

		function contextMenuItem_click(target) {

			var id = $(target).attr("id").substr(3);

			var cmd = this.data.alias;

			var ch = $.browser.msie ? target.ch : target.getAttribute("ch");

			var cell = ch.split("_FG$SP_");

			if (cmd == "contextmenu-view") {

				alert("编辑，产品编号=" + id);

			}

			else if (cmd == "contextmenu-edit") {

				//alert("编辑，产品编号=" + id);

				location = '/UnitPosition/Edit/' + id;

			}

			else if (cmd == "contextmenu-delete") {

				var name = cell[11];

				if (confirm("你确认要删除工作经历信息 [" + name + "] 吗？")) {

					//alert("删除，产品编号=" + id);

					location = '/UnitPosition/Delete/' + id;

				}

			}

			else {

				$("#grdProList").flexReload();

			}

		}

		$("#grdProList").contextmenu(menu);

	}

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
					var url = "CGGL_dolist?hidden=delete&" + id;
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
