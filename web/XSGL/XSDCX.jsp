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
				<td class="tabs" align="center"><font color="white">销售单管理</font>
				</td>
				<td class="tabs"></td>
			</tr>
		</table>


	</div>

	<div style="height: 6px"></div>
	<div>

		<table cellpadding="0" cellspacing="0" width="100%" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px;">
			<tr>
				<td width="132" align="center" class="td1">客户名称</td>
				<td width="140" class="td2"><input type="text" name="kehuname" id="kehuname"></input>
				</td>
				<td></td>
				<td></td>
				<td width="132" align="center" class="td1">订单号</td>
				<td width="140" class=""><input type="text" name="dingdanhao" id="dingdanhao"></input></td>
			</tr>
			<tr>
				<td width="80" align="center" class="td1">下单日期</td>
				<td width="160" align="left" class="td2"><input
					name="dateStartText" type="text" id="dateStartText" class="Wdate"
					onclick="WdatePicker()" style="width: 160px; position: relative" /></td>
				<td>至</td>
				<td><input name="dateEndText" type="text" id="dateEndText"
					class="Wdate" onclick="WdatePicker()"
					style="width: 160px; position: relative" /></td>
				<td width="132" align="center" class="td1">状态</td>

				<td width="140" class=""><select name="zhuangtai"
					id="zhuangtai" class="a2" style="position: relative">
						<option selected="selected" value="--请选择--">--请选择--</option>
						<option value="缺货">缺货</option>
						<option value="已配货，待发货">已配货，待发货</option>
						<option value="完成">完成</option>
				</select></td>

				<td width="80" class="td2"><input type="image"
					name="imgBtnSearch" id="imgBtnSearch"
					onmouseover="ChangeImage(this,'images/Search2.gif')"
					onmouseout="ChangeImage(this,'images/Search1.gif')"
					src="images/Search1.gif"
					style="border-width: 0px; position: relative;"   onclick="gridFlash()" /></td>
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
	                                  {name:'kehuname', value:$("#kehuname").val()},
	                                  {name:'dingdanhao', value:$("#dingdanhao").val()},
	                                  {name:'dateStartText', value:$("#dateStartText").val()},
	                                  {name:'dateEndText', value:$("#dateEndText").val()},
	                                  {name:'zhuangtai',value:$("#zhuangtai").val()}
	                                  ]}).flexReload();
}  
	$("#flex1").flexigrid({
		url : 'XSGL_dolist?hidden=manage&type=DDGL',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			sortable : true,
			align : 'center',
			hide : true
		}, {
			display : '订单号',
			name : 'dingdan_id',
			width : 120,
			sortable : false,
			align : 'center'
		}, {
			display : '客户名称',
			name : 'dingdan_id',
			width : 140,
			sortable : false,
			align : 'center'
		}, {
			display : '支付方式',
			name : 'type_num',
			width : 100,
			sortable : false,
			align : 'center'
		},{
			display : '发货方式 ',
			name : 'finish_or_not',
			width : 100,
			sortable : false,
			align : 'center'
		},{
			display : '开单日期',
			name : 'ckname',
			width : 120,
			sortable : false,
			align : 'center'
		}, {
            display : '备货状态',
            name : 'ckname',
            width : 120,
            sortable : false,
            align : 'center'
        },{
            display : '订单状态',
            name : 'ckname',
            width : 100,
            sortable : false,
            align : 'center'
        } ,{
            display : '备注',
            name : 'ckname',
            width : 190,
            sortable : false,
            align : 'center'
        } ],
		buttons : [/*  {
			name : '发货',
			bclass : 'add',
			onpress : button
		}, {
			name : '删除',
			bclass : 'delete',
			onpress : button
		}, {
			separator : true
		}, {
			name : '详细',
			bclass : 'edit',
			onpress : button
		} */],
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
		title : '销售单管理',
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
					var url = "CGGL_dolist?hidden=delete&" + id;
					del(url);
				}
			}
		} else if (com == '添加') {
			hidden.value = "add";
			location.href = "DisPatch_getUrl?i=1&j=1";
		} else if (com == '详细') {
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
