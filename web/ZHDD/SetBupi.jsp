<%@ page import="java.math.BigDecimal" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>仓库</title>
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
</head>
<body>
	<div>

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

            function Ok(){
                //回调函数
                window.parent.JqueryDialog.SubmitCompleted("", true, false);
                return false;
            }
		</script>

	</div>
<%
    String type_num = "";
    String mishu = "";
    BigDecimal fenpeimishu =  new BigDecimal("0.0");;
    BigDecimal weifenpeimishu =  new BigDecimal("0.0");;

    if( null != request.getAttribute("type_num")   )
    {
        type_num = (String) request.getAttribute("type_num");
    }
    if( null != request.getAttribute("mishu")  )
    {
        mishu = (String) request.getAttribute("mishu");
    }
    if( null != request.getAttribute("fenpeimishu")  )
    {
        fenpeimishu = (BigDecimal) request.getAttribute("fenpeimishu");

    }
    if( null != request.getAttribute("weifenpeimishu") )
    {
        weifenpeimishu = (BigDecimal) request.getAttribute("weifenpeimishu");
    }
%>
	<div>
         <input  type='hidden' name='type_num' value="<%=type_num%>"/>
		<table cellpadding="0" cellspacing="0" width="100%" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>
				<td width="132" align="center" class="td1">型号</td>
				<td width="140" class="td2">   <%=type_num%>
				</td>
				<td width="132" align="center" class="td1">总米数</td>
                <td width="140" class="td2">  <input readonly="readonly" id="zongmishu" value="<%=mishu%>"      />
				</tr>
			</tr>
            <tr>
                <td width="132" align="center" class="td1">已分配米数</td>
                <td width="140" class="td2"> <input readonly="readonly"  id="fenpeimishu" value="<%=fenpeimishu%>"      />
                </td>
                <td width="132" align="center" class="td1">还需米数</td>
                <td width="140" class="td2"> <input readonly="readonly"  id="weifenpeimishu" value="<%=weifenpeimishu%>"      />
            </tr>
            </tr>
		</table>

	</div>

	<div>
		<table id="flex1" style="display: none; font-size: 12px;"
			style="top:7px"></table>
		<input id="hidden" type="hidden" name="hidden" value="manage" />
	</div>

    <div>
        <table id="flex2" style="display: none; font-size: 12px;"
               style="top:7px"></table>
        <input id="hidden" type="hidden" name="hidden" value="manage" />
    </div>

</body>



<script>
function gridFlash(){  
	$("#flex1").flexOptions({params: [
	                                  {name:'type_num', value:$("#type_num").val()},
	                                  {name:'ckname', value:$("#ckname").val()},
	                                  {name:'bupi_id', value:$("#bupi_id").val()},
	                                  {name:'mudidanhao', value:$("#mudidanhao").val()},
	                                  {name:'bptype',value:$("#bptype").val()}
	                                  ]}).flexReload();
}  
	$("#flex1").flexigrid({

		url : 'XSGL_dolist?hidden=manage&type=CXBupis',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			sortable : true,
			align : 'center',
			hide : true
		}, {
			display : '条形码',
			name : 'tiaoxingma',
			width : 160,
			sortable : false,
			align : 'center',
			hide : false
		}, {
			display : '型号',
			name : 'bptype',
			width : 160,
			sortable : false,
			align : 'center'
		}, {
			display : '米数',
			name : 'num',
			width : 160,
			sortable : false,
			align : 'center'
		},{
            display : '备注',
            name : 'zhiliangdengji',
            width : 200,
            sortable : false,
            align : 'center'
        } ],
	 	buttons : [ {
			name : '取消分配',
			bclass : 'delete',
			onpress : button
		} ],
		sortname : "id",
		sortorder : "desc",
		usepager : true,
		resizable : false,
		title : '已分配布匹列表',
        pagestat : '显示 {from} 到 {to} 条 共 {total} 条数据',
        pagetext : '第',
        outof : '共',
        findtext : 'Find',
        procmsg : '正在查询, 请等待 ...',
        query : '',
        qtype : '',
        nomsg : '没有符合要求的数据',
		useRp : true,
		rp : 4,
		rpOptions : [ 4, 5, 10, 20, 30 ],
		width : 'auto',
		height : 90,
		showToggleBtn : false,
		checkbox : true
	});
$("#flex2").flexigrid({

    url : 'CGGL_dolist?hidden=manage&type=CKCX',
    dataType : 'json',
    colModel : [ {
        display : 'id',
        name : 'id',
        width : 10,
        sortable : true,
        align : 'center',
        hide : true
    }, {
        display : '条形码',
        name : 'tiaoxingma',
        width : 130,
        sortable : false,
        align : 'center',
        hide : false
    }, {
        display : '型号',
        name : 'bptype',
        width : 130,
        sortable : false,
        align : 'center'
    }, {
        display : '仓库类型',
        hide : true
    }, {
        display : '仓库类型',
        hide : true
    }, {
        display : '可用米数 ',
        name : 'KY_num',
        width : 100,
        sortable : false,
        align : 'center'
    },{
        display : '开剪米数 ',
        name : 'KY_num',
        width : 80,
        sortable : false,
        align : 'center'
    }, {
        display : '总米数',
        name : 'num',
        width : 80,
        sortable : false,
        align : 'center'
    }, {
        display : '仓库类型',
        hide : true
    },{
        display : '备注',
        name : 'zhiliangdengji',
        width : 150,
        sortable : false,
        align : 'center'
    } ],
    buttons : [ {
     name : '分配',
     bclass : 'add',
     onpress : button
     }, {
     separator : true
     } ],
    sortname : "id",
    sortorder : "desc",
    usepager : true,
    resizable : false,
    title : '可用布匹列表',
    pagestat : '显示 {from} 到 {to} 条 共 {total} 条数据',
    pagetext : '第',
    outof : '共',
    findtext : 'Find',
    procmsg : '正在查询, 请等待 ...',
    query : '',
    qtype : '',
    nomsg : '没有符合要求的数据',
    useRp : true,
    rp : 4,
    rpOptions : [ 4, 5, 10, 20, 30 ],
    width : 'auto',
    height : 100,
    showToggleBtn : false,
    checkbox : true
});

function button(com, grid) {
		if (com == '分配') {
			if ($('.trSelected', grid).length == 0) {
				alert("请选择至少一条数据");
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
                var items = $('.trSelected',grid);
                var sum = 0;
                items .each(function() {
                    sum += parseFloat($(this).children().eq(8).text());
                });

                var c  = document.getElementById("weifenpeimishu");
                 if(sum > c.value)
                 {
                     alert("超过总米数");
                 }
                else
                 {
                     var url = "CGGL_dolist?hidden=modify&type=CKFPBP&" + id;
                     del(url);
                 }
			}
		}
        else if (com == '取消分配') {
            if ($('.trSelected', grid).length == 0) {
                alert("请选择至少一条数据");
            } else {
                if (confirm('确定取消分配这 ' + $('.trSelected', grid).length + ' 条布匹吗?')) {
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
                    var url = "CGGL_dolist?hidden=modify&type=ResetCKFPBP&" + id;
                    del(url);
                }
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
			dataType : 'text',
			success : function(json) {
                var a  = document.getElementById("zongmishu");
                var b  = document.getElementById("fenpeimishu");
                var c  = document.getElementById("weifenpeimishu");
                b.value=json;
                c.value= a.value-json;

                $('#flex1').flexReload();
                $('#flex2').flexReload();
			}
		});
	}
</script>
</html>
