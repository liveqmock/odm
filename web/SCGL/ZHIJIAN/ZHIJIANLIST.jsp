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
<link rel="stylesheet" href="CSS/flexigrid.css" type="text/css"/>
<link rel="stylesheet" href="CSS/flexigrid.pack.css" type="text/css"/>
<link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"/>

<link type="text/css" rel="stylesheet" href="CSS/table.css" />
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />
<script>
	function cgzhijian(cgid)
	{
		location.href = "DisPatch_getAddJsp?a=2&b=5&cgid="+cgid;
		return true;
	}
    function sczjgzhijian(cgid)
    {
        location.href = "DisPatch_getAddJsp?a=2&b=7&sczjgid="+cgid;
        return true;
    }
    function scwjgzhijian(cgid)
    {
        location.href = "DisPatch_getAddJsp?a=2&b=8&scwjgid="+cgid;
        return true;
    }


    function aload()
    {
        document.getElementById("zhijiantype").value = "采购质检";
    }
</script>
</head>
<body onload="aload()">
	<div>
		<table cellpadding="0" cellspacing="0" width="100%" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>

				<td width="132" align="center" class="td1">质检类型</td>
				<td width="140" class="td2"><select name="zhijiantype"
					id="zhijiantype" class="a2" style="position: relative" onchange="clearID();">
						<option value="采购质检" selected>采购质检</option>
						<option value="自加工质检">自加工质检</option>
						<option value="外加工质检">外加工质检</option>
						<option value="销售退货质检">销售退货质检</option>
				</select></td>
                <td width="132" align="center" class="td1">相关单号</td>
                <td width="140" class="td2"><input type="text" name="cgid" id="cgid" value="" />
                </td>
                <td width="132" align="center" class="td1">型号</td>
                <td width="140" class="td2"><input type="text" name="type_num" id="type_num"/>
                </td>
			</tr>
			<tr>
				<td width="80" align="center" class="td1">下单日期</td>
				<td width="160" align="left" class="td2"><input
					name="dateStartText" type="text" id="dateStartText" class="Wdate"
					onclick="WdatePicker()" style="width: 160px; position: relative" /></td>

				<td width="132" align="center" class="td1">至</td>
				<td class="td2" align="left"><input name="dateEndText"
					type="text" id="dateEndText" class="Wdate" onclick="WdatePicker()"
					style="width: 160px; position: relative" /></td>
                <td class="td2" ></td>
			<td width="80" class="td2"><input type="image"
					name="imgBtnSearch" id="imgBtnSearch"
					onmouseover="ChangeImage(this,'images/Search2.gif')"
					onmouseout="ChangeImage(this,'images/Search1.gif')"
					src="images/Search1.gif"
					style="border-width: 0px; position: relative;" onclick="gridFlash()" /></td>
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
    function clearID()
    {
        var ss1 =  document.getElementById("cgid");
        var ss2 =  document.getElementById("type_num");
        var ss3 =  document.getElementById("dateStartText");
        var ss4 =  document.getElementById("dateEndText");

        ss1.value = "";
        ss2.value = "";
        ss3.value = "";
        ss4.value = "";
        gridFlash();
    }

	function gridFlash(){
		$("#flex1").flexOptions({params: [
		                                  {name:'type_num', value:$("#type_num").val()},
		                                  {name:'dateStartText',value:$("#dateStartText").val()},
		                                  {name:'dateEndText',value:$("#dateEndText").val()},
                                          {name:'cgid',value:$("#cgid").val()},
                                          {name:'zhijiantype', value:$("#zhijiantype").val()}
		                                  ]}).flexReload();
	}  


	$("#flex1").flexigrid({
		url : 'SCGL_dolist?hidden=manage&type=ZHIJIANLIST',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			align : 'center',
			hide : true
		}, {
			display : '单号',
			name : 'a',
			width : 130,
			align : 'center',
			hide : false
		}, {
			display : '型号',
			name : 'b',
			width : 130,
			align : 'center'
		}, {
			display : '数量',
			name : 'c',
			width : 130,
			align : 'center'
		}, {
			display : '下单人 ',
			name : 'e',
			width : 130,
			align : 'center'
		}, {
			display : '下单日期 ',
			name : 'e',
			width : 130,
			align : 'center'
		}, {
			display : '质检状态 ',
			name : 'e',
			width : 130,
			align : 'center'
		}, {
			display : '操作',
			name : 'e',
			width : 200,
			align : 'center'
		}],
		
		sortname : "id",
		sortorder : "desc",
		usepager : true,
		resizable : false,
		title : '单据信息',
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
		height : 380,
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
					var url = "SCGL_dolist?hidden=delete&type=ZHIJIANLIST&" + id;
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
<script>
    <%
        String message = (String)request.getAttribute("zhijianlisterror");
         if (message != null && !"".equals(message)) {
             request.removeAttribute("zhijianlisterror");
     %>

    alert("<%=message%>");
    <%}%>
</script>
</html>
