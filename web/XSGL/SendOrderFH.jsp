<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.jiang.bean.KHGL" %>
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

			function secBoard1(n) {

				tabs.cells[2 * n - 1].className = "cur1";
			}
            function Close(){
                //回调函数
                window.parent.$('#flex1').flexReload();
            }
            function Ok(){
                //回调函数
                if (confirm('备货完成的布匹进行发货')) {
                      window.parent.del("XSGL_dolist?hidden=modify&type=SQFHSTATE");
                      window.parent.JqueryDialog.SubmitCompleted("", true, false);
                }
                return false;
            }
		</script>

	</div>
    <%
        KHGL tmp = (KHGL)request.getSession().getAttribute
                ("orderDetail");
        String orderId ="";

        if(null != request.getSession().getAttribute("orderid"))
        {
            orderId = (String)request.getSession().getAttribute
                    ("orderid");
        }
        else
        {
            Random rdm = new Random(System.currentTimeMillis());
            int intRd = Math.abs(rdm.nextInt())%9999+1;
            SimpleDateFormat formater = new SimpleDateFormat("yyMMdd");
            orderId =  "DD"+formater.format(new Date())+String.format
                    ("%04d", intRd);
            request.getSession().setAttribute("orderid",orderId);
        }
    %>

    <%
    String type_num = "";
    String mishu = "";
    String zhuangtai = "";
    String order_state = "";
    Float fenpeimishu =  0.0f;;
    if(null != request.getAttribute("zhuangtai"))
    {
        zhuangtai = (String)request.getAttribute ("zhuangtai");
    }
    if(null != request.getAttribute("order_state"))
    {
        order_state = (String)request.getAttribute ("order_state");
    }
    if(null != request.getAttribute("fenpeinum"))
    {
        fenpeimishu = (Float)request.getAttribute ("fenpeinum");
    }
     if(session.getAttribute("totalnum") != null)
    {
        mishu = String.valueOf((Float)session.getAttribute("totalnum"));
    }

%>
	<div>
         <input  type='hidden' name='type_num' value="<%=type_num%>"/>
		<table cellpadding="0" cellspacing="0" width="100%" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>
                <td width="132" align="center" class="td1">订单编号</td>
                <td width="140" class="td2"><%=orderId %></td>
                <td width="132" align="center" class="td1">客户编号</td>
                <td width="140" class="td2"><%=tmp.getKehu_id()%></td>
                <td width="132" align="center" class="td1">订单状态</td>
                <td width="140" class="td2"><font color="red" ><%=order_state%> </font> </td>
            </tr>
            <tr>
                <td width="132" align="center" class="td1">配货米数/总米数</td>
                <td width="140" class="td2"> <%=fenpeimishu%> 米 / <%=mishu%>米  </td>
                <td width="132" align="center" class="td1">配货状态</td>
                <td width="140" class="td2"><font color="red" ><%=zhuangtai%></font></td>
            </tr>
		</table>

	</div>

	<div>
		<table id="flex0" style="display: none; font-size: 12px;"
			style="top:7px"></table>
		<input id="hidden" type="hidden" name="hidden" value="manage" />
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
	                                  {name:'type_num', value:$("#type_num").val()},
	                                  {name:'ckname', value:$("#ckname").val()},
	                                  {name:'bupi_id', value:$("#bupi_id").val()},
	                                  {name:'mudidanhao', value:$("#mudidanhao").val()},
	                                  {name:'bptype',value:$("#bptype").val()}
	                                  ]}).flexReload();
}
$("#flex0").flexigrid({
    url : 'XSGL_dolist?hidden=manage&type=KHGL_FH_CHECK',
    dataType : 'json',
    colModel : [ {
        display : 'id',
        name : 'id',
        width : 10,
        sortable : true,
        align : 'center',
        hide : true
    }, {
        display : '编号',
        name : 'xiaoshoudan_id',
        width : 200,
        sortable : true,
        align : 'center',
        hide : true
    }, {
        display : '发货方式',
        name : 'dingdan_id',
        width : 200,
        sortable : false,
        align : 'center'
    }, {
        display : '联系人',
        name : 'dingdan_id',
        width : 200,
        sortable : false,
        align : 'center'
    }, {
        display : '电话',
        name : 'type_num',
        width : 200,
        sortable : false,
        align : 'center'
    }, {
        display : '手机',
        name : 'mishu',
        width : 200,
        sortable : false,
        align : 'center'
    }, {
        display : '地址',
        name : 'finish_or_not',
        width : 200,
        sortable : false,
        align : 'center'
    } ] ,
    buttons : [],
    sortname : "id",
    sortorder : "desc",
    usepager : false,
    resizable : false,
    title : '发货地址:',
    pagestat : '显示 {from} 到 {to} 条 共 {total} 条数据',
    pagetext : '第',
    outof : '共',
    findtext : 'Find',
    procmsg : '正在查询, 请等待 ...',
    query : '',
    qtype : '',
    nomsg : '没有符合要求的数据',
    useRp : true,
    rp : 1,
    rpOptions : [ 1 ],
    width : 'auto',
    height : 37,
    showToggleBtn : false,
    checkbox : false
});
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
        display : '型号',
        name : 'bptype',
        width : 250,
        sortable : false,
        align : 'center'
    }, {
        display : '条形码',
        name : 'tiaoxingma',
        width : 250,
        sortable : false,
        align : 'center',
        hide : false
    }, {
        display : '米数',
        name : 'num',
        width : 250,
        sortable : false,
        align : 'center'
    },{
        display : '备注',
        name : 'zhiliangdengji',
        width : 270,
        sortable : false,
        align : 'center'
    } ],
    buttons : [ {
        name : '全部打印',
        bclass : 'edit',
        onpress : button
    }, {
        separator : true
    }, {
        name : '全部发货完成',
        bclass : 'edit',
        onpress:  button
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
    rp : 15,
    rpOptions : [ 15, 20, 30 ],
    width : 'auto',
    height : 300,
    showToggleBtn : false,
    checkbox : false
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
        else if (com == '全部发货完成') {
                if (confirm('确定所有布匹已发货?')) {
                    window.location.href = "XSGL_dolist?hidden=modify&type=DDGLFHState";
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
