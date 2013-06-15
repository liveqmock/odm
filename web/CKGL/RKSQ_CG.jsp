<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import=" java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>采购入库</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script type="text/javascript" language="javascript"
            src="js/jquery-fn-tab.js"></script>
    <script type="text/javascript" src="js/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="js/jquery_dialog.js"></script>
    <script type="text/javascript" src="js/jquery.corners.min.js"></script>
    <script type="text/javascript" src="js/flexigrid.js"></script>
    <script language="javascript" type="text/javascript"
            src="My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/ChangeImageJS.js"></script>
    <link rel="stylesheet" href="CSS/flexigrid.css" type="text/css"/>
    <link rel="stylesheet" href="CSS/jquery_dialog.css" type="text/css"/>
    <link rel="stylesheet" href="CSS/flexigrid.pack.css" type="text/css"/>
    <link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"/>

    <link type="text/css" rel="stylesheet" href="CSS/table.css" />
    <link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />

<script>
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
        winOpenFullScreen ("DisPatch_getPrintCGRK",
                "newwindow", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=yes, status=no");

    }
    function dayin(asrc)
    {
            location.href = "CKGL_dolist?hidden=modify&type=RK_CG_ADDPRINT&bptiaoma="+asrc;
    }
    function quxiaodayin(asrc)
    {
        location.href = "CKGL_dolist?hidden=modify&type=RK_CG_NOTPRINT&bptiaoma="+asrc;
    }

    function checkFloat(vv, val)
    {
        if(isNaN(val))
        {
            vv.value=vv.value.substr(0, vv.value.length-1);
            return false;
        }
        return true;
    }

  function add()
  {
      var ui1 = document.getElementById("mishu");
      var zongmishu = document.getElementById("zongmishu");
      var nums = document.getElementById("nums");
      var a1 = parseInt(ui1.value)+parseInt(nums.value);
      var a2 = parseInt(zongmishu.value*1.2);
        if(a1 > a2)
        {
            alert("已超过总米数20%，请重新下单。");
            return;
        }
		var price = document.getElementById("price");
		var danhao = document.getElementById("danhao");
		if(ui1.value == "" || ui1.value == "0" || parseFloat(ui1.value) < 0.1)
		{
			alert("米数不能为0或空");
            document.getElementById("mishu").focus();
			return false;
		}



 		location.href = "CKGL_dolist?hidden=add&type=CGRKSQ&mishu="+ui1.value+
      "&price="+price.value +"&danhao="+danhao.value +"&jitaihao=";
	   return true;
  }

    function flushPage()
    {
        location.href = "CKGL_dolist?hidden=add&type=RKSQ&pingzhengnum=FlushTiaoMa";
    }
</script> 

</head>
<%
    String tiaoma = "";
    String xinghao = "";
    String laiyuandanwei = "";
    String zongmishu = "";
    String rukudanhao = "";
    String rukutype = "";
    String cgdid = "";
    String message = "";
        String leixing = "";
        Float nums = 0.0f;
    if((String)request.getAttribute("modifycgrkqrerror") != null)
    {
        message = (String)request.getAttribute("modifycgrkqrerror");
    }
    if(null != session.getAttribute("leixing"))
    {
        leixing = (String)request.getSession().getAttribute("leixing");
    }
    if(tiaoma.equals(""))
    {
          Random rdm = new Random(System.currentTimeMillis());
          int intRd = Math.abs(rdm.nextInt())%9999+1;
          SimpleDateFormat formater = new SimpleDateFormat("yyMMdd");
          tiaoma =  "PR"+formater.format(new Date())+String.format("%04d", intRd);
    }
    if(null != session.getAttribute("xinghao"))
    {
        xinghao = (String)request.getSession().getAttribute("xinghao");
    }
    if(null != session.getAttribute("laiyuandanwei"))
    {
        laiyuandanwei = (String)request.getSession().getAttribute("laiyuandanwei");
    }
    if(null != session.getAttribute("zongmishu"))
    {
        zongmishu = (String)request.getSession().getAttribute("zongmishu");
    }
    if(null != session.getAttribute("rukudanhao"))
    {
        rukudanhao = (String)request.getSession().getAttribute("rukudanhao");
    }
    if(null != session.getAttribute("rukutype"))
    {
        rukutype = (String)request.getSession().getAttribute("rukutype");
    }
    if(null != session.getAttribute("cgdid"))
    {
        cgdid = (String)request.getSession().getAttribute("cgdid");
    }
    if(null != session.getAttribute("nums"))
    {
        nums = (Float)request.getSession().getAttribute("nums");
    }
    System.out.println("nums:"+nums);



%>
<body>
	<div>
		<table border="0" cellpadding="0" cellspacing="0" width="100%"
			id="tabs">
			<tr>
				<td class="tabs" align="center"><font color="white">采购入库单详细</font>
				</td>
				<td class="tabs"></td>
			</tr>
		</table>
	</div>
    <input type="hidden" name="nums" id="nums" value="<%=nums%>" />
    <input type="hidden" name="zongmishu" id="zongmishu" value="<%=zongmishu%>" />
    <input type="hidden" name="cgdid" id="cgdid" value="<%=cgdid%>" />

	<div style="height: 6px"></div>
	<div>
		<table cellpadding="0" cellspacing="0" width="100%" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>
				<td width="132" align="center" class="td1">入库单号:</td>
				<td width="140" class="td2">&nbsp;&nbsp;&nbsp;<%=rukudanhao %>
				</td>
				<td width="132" align="center" class="td1">入库凭据:</td>
				<td width="140" class="td2">&nbsp;&nbsp;&nbsp;<%=cgdid %></td>
				<td width="132" align="center" class="td1">型号:</td>
				<td width="140" class="td2">&nbsp;&nbsp;&nbsp;<%=xinghao %></td>
			</tr>
			<tr>
				<td width="132" align="center" class="td1">入库类型:</td>
				<td width="140" class="td2">&nbsp;&nbsp;&nbsp;<%=rukutype %>
				</td>
				<td width="132" align="center" class="td1">来源单位:</td>
				<td width="140" class="td2">&nbsp;&nbsp;&nbsp;<%=laiyuandanwei %></td>
				<td width="132" align="center" class="td1">总米数:</td>
				<td width="140" class="td2">&nbsp;&nbsp;&nbsp;<%=zongmishu %>米</td>
			</tr>
			
		</table>

	</div>

	<div style="height: 6px"></div>
	<div id="hide1" >
	<table cellpadding="0" cellspacing="0" width="100%" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>
				<td width="140" align="center" class="td1">布匹类型：</td>
				<td width="120" class=""><select>
                    <%
                        String [] leixs = {"原料", "半成品", "成品"};
                        for(int i=0;i<leixs.length;i++)   {
                    %>
                    <option <%if(leixs[i].equals(leixing)){%> selected <%}%> > <%=leixs[i]%></option>
                    <%}%>

				<td width="122" align="center" class=""><font color="#666333"><%=message %></font></td>
                <td width="140" align="center" class="td1">已入库米数：</td>
                <td width="120" class="td2">&nbsp;&nbsp; <%=nums %>&nbsp;&nbsp;&nbsp;米 </td>
                <td width="120" class=""></td>
                <td width="122" align="center" class=""></td>
				<td width="120" class=""><input type=button value="打印预览" onclick="printcgrk()" /></td>
				<input type="hidden" name="price" id="price" />
			</tr>
			<tr>
				<td width="140" align="center" class="td1">条码：</td>
				<td width="120" class=""> <input type="text" name="danhao" id="danhao"
				onfocus="this.blur()" readonly="readonly"  style="color:gray" 
				 value=<%=tiaoma %> ></td>
				 	<td width="122" align="center" class=""><input type=button value="刷新条码"  onclick="flushPage()" /></td>
				 
				<td width="80" align="center" class="td1">米数：</td>
				<td width="80" class=""><input type="text" name="mishu" id="mishu"  onkeyup="return checkFloat(this,value)"  /></td>

				<td><input type=button value="确认添加" onclick="add()" /></td>
			</tr>
		</table>
				 
	</div>
	<div>
		<table id="flex1" style="display: none; font-size: 12px;"
			style="top:7px"></table>
		<input id="hidden" type="hidden" name="hidden" value="manage" />
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

		url : 'CKGL_dolist?hidden=manage&type=CGRK',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			sortable : true,
			align : 'center',
			hide : true ,
            process: onRowSelect
		}, {
			display : '条形码',
			name : 'tiaoxingma',
			width : 310,
			sortable : false,
			align : 'center',
            hide : false
		}, {
			display : '米数',
			name : 'num',
			width : 370,
			sortable : false,
			align : 'center'
		}, {
            display : '机台号',
            name : 'num',
            width : 266,
            sortable : false,
            align : 'center',
            hide : true
        }, {
            display : 'beizhu',
            name : 'beizhu',
            width : 10,
            sortable : true,
            align : 'center',
            hide : true
        },{
            display : '状态',
            name : 'num',
            width : 360,
            sortable : false,
            align : 'center'
        }],

		buttons : [  {
			separator : true
		},{
			name : '删除',
			bclass : 'delete',
			onpress : button
		}, {
			separator : true
		}],
		sortname : "id",
		sortorder : "desc",
		usepager : true,
		resizable : false,
		title : '布匹列表',
		useRp : true,
		rp : 8,
		rpOptions : [ 8, 15, 20, 30, 50 ],
		width : 'auto',
		height : 280,
        pagestat : '显示 {from} 到 {to} 条 共 {total} 条数据',
        pagetext : '第',
        outof : '共',
        findtext : 'Find',
        procmsg : '正在查询, 请等待 ...',
        query : '',
        qtype : '',
        nomsg : '没有符合要求的数据',
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
                var xx = 0;
				if (confirm('是否删除这 ' + $('.trSelected', grid).length + ' 条记录吗?')) {
					var id = "";
					for ( var i = 0; i < $('.trSelected', grid).length; i++) {
                        if($('.trSelected', grid).find("td").eq(4).text() == "已质检")
                        {
                            xx = 1;
                        }

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

                    if(xx == 1)
                    {
                        alert("已质检的布匹无法删除");
                        return;
                    }
                    var cgdid  = document.getElementById("cgdid");
					var url = "CKGL_dolist?hidden=delete&type=CGRKSQ&" + id+"&cgid="+cgdid.value;
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
			success : function(txt) {
                document.getElementById("nums").value =  txt;
				$('#flex1').flexReload();
			}
		});
	}
</script>
</html>
