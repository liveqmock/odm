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
<script type="text/javascript" src="js/ChangeImageJS.js"></script>
<link rel="stylesheet" href="CSS/flexigrid.css" type="text/css"></link>
<link rel="stylesheet" href="CSS/flexigrid.pack.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="CSS/table.css" />
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />
</head>
<body>
	<div class="">
		<table border="0" cellpadding="0" cellspacing="0" width="100%"
			id="tabs">
			<tr>
				<td class="tabs" align="center"><font color="white">入库确认</font>
				</td>
				<td class="tabs"></td>
			</tr>
		</table>

		<script language="JavaScript" type="text/javascript">
			function secBoard(n) {
				for (i = 0; i < tabs.cells.length; i++) {
					tabs.cells[i].className = "tabs";
				}
				tabs.cells[2 * n - 1].className = "cur";
			}

			function secBoard1(n) {

				tabs.cells[2 * n - 1].className = "cur1";
			}
		</script>

	</div>

<div style="height: 6px">
	</div>
	<div>
		<table cellpadding="0" cellspacing="0" width="816px" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>
				<td width="132" align="center" class="td1">型号</td>
				<td width="140" class="td2"><input type="text" name="bupi_id"  id="bupi_id" /></td>

				<td width="132" align="center" class="td1">状态</td>
				<td width="140" class=""><select name="ZhuangTaiDL"
					id="ZhuangTaiDL" class="a2" style="position: relative">
						<option selected="selected" value="--请选择--">--请选择--</option>
						<option value="未确认">未确认</option>
						<option value="已确认">已确认</option>

				</select></td>

			</tr>
			<tr>
				<td width="132" align="center" class="td1">采购单号</td>
				<td width="140" class="td2"><input type="text" name="caigou_id" id="caigou_id" /></td>
				<td width="80" class="td2"><input type="image"
					name="imgBtnSearch" id="imgBtnSearch"
					onmouseover="ChangeImage(this,'images/Search2.gif')"
					onmouseout="ChangeImage(this,'images/Search1.gif')"
					src="images/Search1.gif"
					style="border-width: 0px; position: relative;"  onclick="gridFlash()" /></td>
			</tr>

		</table>

	</div>

<div style="height: 6px">
	</div>
	<div>
		<table id="flex1" style="display: none; font-size: 12px;"
			style="top:7px"></table>
		<input id="hidden" type="hidden" name="hidden" value="manage" />
	</div>
</body>

<script>
function gridFlash(){  
	$("#flex1").flexOptions({params: [
	                                  {name:'bupi_id', value:$("#bupi_id").val()},
	                                  {name:'caigou_id',value:$("#caigou_id").val()}
	                                  ]}).flexReload();
}  

	$("#flex1").flexigrid({
		url : 'CGGL_dolist?hidden=manage&type=RKQR',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			sortable : true,
			align : 'center',
			hide : true
		},{
			display : '采购单号 ',
			name : 'caigou_id',
			width : 90,
			sortable : false,
			align : 'center',
			hide : false
		}, {
			display : '型号',
			name : 'bupi_id',
			width : 85,
			sortable : false,
			align : 'center'
		}, {
			display : '条形码',
			name : 'bupi_id',
			width : 85,
			sortable : false,
			align : 'center'
		}, {
			display : '米数',
			name : 'mishu',
			width : 55,
			sortable : false,
			align : 'center'
		}, {
			display : '单价',
			name : 'price',
			width : 55,
			sortable : false,
			align : 'center'
		}, {
			display : '供应商',
			name : 'gongyingname',
			width : 70,
			sortable : false,
			align : 'center'
		}, {
			display : '申请人',
			name : 'apply_man',
			width : 50,
			sortable : false,
			align : 'center'
		} , {
			display : '申请日期',
			name : 'apply_time',
			width : 65,
			sortable : false,
			align : 'center'
		} , {
			display : '确认人',
			name : 'queren_man',
			width : 50,
			sortable : false,
			align : 'center'
		} , {
			display : '确认日期',
			name : 'queren_time',
			width : 65,
			sortable : false,
			align : 'center'
		} ],
		buttons : [ {
			name : '入库确认',
			bclass : 'add',
			onpress : button
		},{
			separator : true
		} ],
		sortname : "id",
		sortorder : "desc",
		usepager : true,
		resizable : false,
		title : '采购入库确认表',
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

		if (com == '入库确认') {
			hidden.value = "add";
			location.href = "DisPatch_getUrl?i=1&j=1";
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
