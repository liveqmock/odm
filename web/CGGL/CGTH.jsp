<%@ page import="com.jiang.util.PublicFunc" %>
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
				<td class="tabs" align="center"><font color="white">采购退货</font>
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

	<div style="height: 6px"></div>
	<div>

		<table cellpadding="0" cellspacing="0" width="100%" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>

				<td width="132" align="center" class="td1">退货申请人</td>
				<td width="140" class="td2"><input type="text" name="Apply_Man"  id="Apply_Man" /></td>
				<td width="132" align="center" class="td1">状态</td>
				<td width="140" class=""><select name="Zhuangtai"
					id="Zhuangtai" class="a2" style="position: relative">
						<option selected="selected" value="--请选择--">--请选择--</option>
                    <option value="<%=PublicFunc.TH_READY%>"><%=PublicFunc.TH_READY%></option>
                    <option value="<%=PublicFunc.TH_ING%>"><%=PublicFunc.TH_ING%></option>
                    <option value="<%=PublicFunc.TH_FINISH%>"><%=PublicFunc.TH_FINISH%></option>

				</select></td>

			</tr>
			<tr>
				<td width="132" align="center" class="td1">型号</td>
				<td width="140" class="td2"><input type="text" name="type_num" /></td>
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
	                                  {name:'Apply_Man', value:$("#Apply_Man").val()},
	                                  {name:'Zhuangtai', value:$("#Zhuangtai").val()}
	                                  ]}).flexReload();
}  
	$("#flex1").flexigrid({
		url : 'CGGL_dolist?hidden=manage&type=CGTH',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			sortable : true,
			align : 'center',
			hide : true
		}, {
			display : '退货单号',
			name : 'TuiHuo_Id',
			width : 120,
			sortable : false,
			align : 'center',
			hide : false
		}, {
			display : '采购单号',
			name : 'CaiGou_Id',
			width : 120,
			sortable : false,
			align : 'center'
		}, {
			display : '退货单价',
			name : 'TuiHuoDanJia',
			width :110,
			sortable : false,
			align : 'center'
		}, {
			display : '申请人',
			name : 'Apply_Man',
			width : 120,
			sortable : false,
			align : 'center'
		}, {
			display : '申请日期',
			name : 'Apply_Time',
			width : 110,
			sortable : false,
			align : 'center'
		}, {
			display : '出库人',
			name : 'Queren_Man',
			width : 120,
			sortable : false,
			align : 'center'
		}, {
			display : '出货时间',
			name : 'Queren_Time',
			width : 120,
			sortable : false,
			align : 'center'
		}, {
			display : '状态  ',
			name : 'Zhuangtai',
			width : 150,
			sortable : false,
			align : 'center'
		} ],
		buttons : [ {
			name : '打印',
			bclass : 'add',
			onpress : button
		}, {
            separator : true
        },  {
			name : '标记为完成',
			bclass : 'edit',
			onpress : button
		}, {
			separator : true
		} ],
		sortname : "id",
		sortorder : "desc",
		usepager : true,
		resizable : false,
		title : '采购退货管理 ',
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
					var url = "CGGL_dolist?hidden=delete&type=CGTH&" + id;
					del(url);
				}
			}
		} else if (com == '添加') {
			hidden.value = "add";
			location.href = "DisPatch_getAddJsp?a=1&b=7";
		} else if (com == '修改') {
			hidden.value="modify";  
	          if($(".trSelected").length==1){   
	        	  window.location.href =  "CGGL_dolist?hidden=premodify&type=CGTH&id="+$('.trSelected', grid).find("td").eq(0).text();
	          }else if($(".trSelected").length>1){   
	              alert("请选择一个修改,不能同时修改多个");   
	          }else if($(".trSelected").length==0){   
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
