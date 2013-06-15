<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import=" java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>采购质检</title>
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

<script>
    function checkFloat(vv, val)
    {
        if(isNaN(val))
        {
            vv.value=vv.value.substr(0, vv.value.length-1);
            return false;
        }
        return true;
    }
    function winOpenFullScreen(strURL)
    {
        var sheight = screen.height-70;
        var swidth = screen.width-10;
        var winoption    ="left=0,top=0,height="+sheight+",width="+swidth+",toolbar=yes,menubar=yes,location=yes,status=yes,scrollbars=yes,resizable=yes";
        var tmp=window.open(strURL,'',winoption);
        return tmp;
    }
    function printcgrk()
    {
        winOpenFullScreen ("DisPatch_getPrintCGCR_ZJ",
                "newwindow", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=yes, status=no");

    }

	function zhijian(id, mishu)
	{
		var strs= new Array(); //定义一数组
		strs=id.split("#"); //字符分割      

		var ui1 = document.getElementById("bptiaoma");
		var ui2 = document.getElementById("shijimishu");
        var ui3 = document.getElementById("jitaihao");
        var pinzhi = document.getElementById("pinzhi");
		ui1.value = strs[0];
		ui2.value = strs[1].split(".")[0];
        ui3.value = strs[2];
        pinzhi.value='一般';
	}
	function tongguo(tongugo)
	{
        var f = document.createElement("form");
        var ui1 = document.getElementById("bptiaoma");
        var ui2 = document.getElementById("shijimishu");
        var ui3 = document.getElementById("beizhu");
        var pinzhi = document.getElementById("pinzhi");
        var jitaihao = document.getElementById("jitaihao");

        if(ui1.value == "")
        {
            alert("获取条码失败");
            return false;
        }
        if(ui2.value == "")
        {
            alert("获取实际米数失败");
            return false;
        }
        if(pinzhi.value == "")
        {
            alert("质检品质不能为空");
            return false;
        }
        if(jitaihao.value == "")
        {
            alert("获取机台号失败");
            return false;
        }
        if(tongugo == 1)
        {
            f.action = "SCGL_dolist?hidden=modify&type=ZHIJIAN_CG&bptiaoma="+ui1.value
                    +"&shijimishu="+ui2.value+"&beizhu="+ui3.value+"&pinzhi="+pinzhi.value+"&jitaihao="+jitaihao.value;
        }
        else if(tongugo == 0)
        {
            f.action = "SCGL_dolist?hidden=modify&type=ZHIJIAN_CG_BTG&bptiaoma="+ui1.value
                    +"&shijimishu="+ui2.value+"&beizhu="+ui3.value+"&pinzhi="+pinzhi.value+"&jitaihao="+jitaihao.value;
        }
        f.method = "post";
        document.body.appendChild(f);
        f.submit();
	}

  function dayin(asrc)
  {
      location.href = "SCGL_dolist?hidden=modify&type=ZHIJIAN_CG_ADDPRINT&bptiaoma="+asrc;
  }
    function quxiaodayin(asrc)
    {
        location.href = "SCGL_dolist?hidden=modify&type=ZHIJIAN_CG_NOTPRINT&bptiaoma="+asrc;
    }
  function add()
  {
		var ui1 = document.getElementById("mishu");
		
		var price = document.getElementById("price");
		var danhao = document.getElementById("danhao");
		if(ui1.value == "" || ui1.value == "0")
		{
			alert("米数不能为0或空");
			return false;
		}
 		location.href = "CKGL_dolist?hidden=add&type=CGRKSQ&mishu="+ui1.value+
      "&price="+price.value +"&danhao="+danhao.value;
	   return true;
  }
</script> 

</head>
<%
	String zijianid = "";
	String cgdid = "";
	String xinghao = "";
	String zongmishu = "";
	String totalcount = "";
	String zhijiancount = "";
    String zjmishu = "";
	if(zijianid.equals(""))
	{
		if(null != session.getAttribute("zijianid"))
		{
			 zijianid = (String)session.getAttribute("zijianid");
		}
	}
	if(null  != session.getAttribute("cgdid"))
	{
		cgdid = (String)session.getAttribute("cgdid");
	}
	if(null  != session.getAttribute("xinghao"))
	{
		xinghao = (String)session.getAttribute("xinghao");
	}

	if(null  != session.getAttribute("mishu"))
	{
		zongmishu = (String)session.getAttribute("mishu");
	}

	if(null  != session.getAttribute("totalcount"))
	{
		totalcount = (String)session.getAttribute("totalcount");
	}

	if(null  != session.getAttribute("zhijiancount"))
	{
		zhijiancount = (String)session.getAttribute("zhijiancount");
	}
    if(null  != session.getAttribute("zjmishu"))
    {
        zjmishu = (String)session.getAttribute("zjmishu");
    }

%>
<body>


	<div>
		<table cellpadding="0" cellspacing="0" width="100%" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>
				<td width="132" align="center" class="td1">质检报告单号:</td>
				<td width="140" class="td2">&nbsp;&nbsp;&nbsp;<%=zijianid %>
				</td>
				<td width="132" align="center" class="td1">采购单号:</td>
				<td width="140" class="">&nbsp;&nbsp;&nbsp;<%=cgdid %></td>
				<td width="132" align="center" class="td1">型号:</td>
				<td width="140" class="">&nbsp;&nbsp;&nbsp;<%=xinghao %></td>
			</tr>
			<tr>
				<td width="132" align="center" class="td1">总米数:</td>
				<td width="140" class="td2">&nbsp;&nbsp;&nbsp;<%=zongmishu %>
				</td>
				<td width="132" align="center" class="td1">统计:</td>
				<td width="140" class="">&nbsp;&nbsp;&nbsp;<%=zhijiancount %>/<%=totalcount%>&nbsp;&nbsp;已质检 &nbsp;&nbsp;<%=zjmishu%> &nbsp;&nbsp;米</td>
				<td width="132" align="center" class="td1">质检报告</td>
				<td width="140" class="">&nbsp;&nbsp;&nbsp;<input type="button" value="预览" onclick="printcgrk()"/></td>
			</tr>
			
			
		</table>

	<table cellpadding="0" cellspacing="0" width="100%" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
	<tr>
					<td width=""  class="td1">条码:</td>
					<td width="100" class=""><input   SIZE="12" type="text" id="bptiaoma" name="bptiaoma"
					 onfocus="this.blur()" readonly="readonly"  style="color:gray"   /> </td>
					<td width="" align="center" class="td1">实际米数:</td>
					<td width="60" class=""><input SIZE="6" type="text" id="shijimishu" name="shijimishu" onkeyup="return checkFloat(this,value)"  style="color:red"/> </td>

                    <td width="" align="center" class="td1">质检品质:</td>
                    <td width="80" class=""><input  SIZE="6" type="text" name="pinzhi" id="pinzhi"/> </td>

                    <td width="" align="center" class="td1">机台号:</td>
                    <td width="80" class=""><input  SIZE="5" type="text" name="jitaihao" id="jitaihao"  onkeyup="value=value.replace(/[^\d]/g,'')" /> </td>
					<td width="" align="center" class="td1">备注:</td>
					<td width="150" class=""><input type="text" SIZE="40" name="beizhu" id="beizhu" /> </td>
					<td width="80" class=""><input type="button" value="质检通过"  onclick="tongguo(1)"/> </td>
					<td width="50" class=""><input type="button" value="不通过" onclick="tongguo(0)" /> </td>
				</tr>
	</table>
	</div>

	<div style="height: 6px"></div>
	
	<div>
		<table id="flex1" style="display: none; font-size: 12px;"
			style="top:7px"></table>
		<input id="hidden" type="hidden" name="hiddflex1en" value="manage" />
	</div>

</body>

<script>

    function onRowSelect(div, id) {
        $('tr#row'+id).click( function () {
           // alert(id);
            this.disableSelection();
        } );
    }

    function gridFlash(){
	$("#flex1").flexOptions({params: [
	                                  {name:'type_num', value:$("#type_num").val()},
	                                  {name:'zhuangtai', value:$("#zhuangtai").val()},
	                                  {name:'beginTime',value:$("#beginTime").val()},
	                                  {name:'endTime',value:$("#endTime").val()}
	                                  ]}).flexReload();
}  
	$("#flex1").flexigrid({

		url : 'CKGL_dolist?hidden=manage&type=CGRKZJ',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			sortable : true,
			align : 'center',
			hide : true,
            process: onRowSelect
        }, {
			display : '条形码',
			name : 'tiaoxingma',
			width : 140,
			sortable : false,
			align : 'center',
			hide : false
		}, {
            display : '机台号',
            name : 'num',
            width : 100,
            sortable : false,
            align : 'center'
        }, {
			display : '米数',
			name : 'num',
			width : 100,
			sortable : false,
			align : 'center'
		}, {
            display : '实际米数',
            name : 'num',
            width : 100,
            sortable : false,
            align : 'center'
        }, {
            display : '质检品质',
            name : 'num',
            width : 120,
            sortable : false,
            align : 'center'
        }, {
			display : '备注',
			name : 'huojiahao',
			width : 300,
			sortable : false,
			align : 'center'
		}, {
			display : '状态',
			name : 'tiaoxingma',
			width : 150,
			sortable : false,
			align : 'center',
			hide : false
		}],

        pagestat : '显示 {from} 到 {to} 条 共 {total} 条数据',
        pagetext : '第',
        outof : '共',
        findtext : 'Find',
        procmsg : '正在查询, 请等待 ...',
        query : '',
        qtype : '',
        nomsg : '没有符合要求的结果',
		sortname : "id",
		sortorder : "desc",
		usepager : true,
		resizable : false,
		title : '布匹列表',
		useRp : true,
		rp : 9,
		rpOptions : [ 9, 15, 20, 30, 50 ],
		width : 'auto',
		height : 310,
		showToggleBtn : false,
		checkbox : true
	});
    function changeselect(grid)
    {
                   alert("a");
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
					var url = "CGGL_dolist?hidden=delete&type=DJGL&" + id;
					del(url);
				}
			}
		} else if (com == '添加') {
			hidden.value = "add";
			
			//var ui1 = document.getElementById("hide1");
			//ui1.style.display="";//显示
			//window.showModalDialog("test7.htm");
 		 	//location.href = "CKGL_dolist?hidden=add&type=CGDJRK&";
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

    /**
     *
     */
    function reloadflex() {
        $('#flex1').flexReload();

    }
</script>
</html>
