<%@page import="com.jiang.util.PublicFunc"%>
<%@ page import="com.jiang.bean.KHGL" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.jiang.bean.User" %>
<%@ page import="java.math.BigDecimal" %>
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
    <script type="text/javascript" src="js/jquery_dialog.js"></script>
    <script type="text/javascript" src="js/jquery.corners.min.js"></script>
    <script type="text/javascript" src="js/flexigrid.js"></script>
    <script language="javascript" type="text/javascript"
            src="My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/ChangeImageJS.js"></script>
    <link rel="stylesheet" href="CSS/flexigrid.css" type="text/css/"/>
    <link rel="stylesheet" href="CSS/jquery_dialog.css" type="text/css"/>
    <link rel="stylesheet" href="CSS/flexigrid.pack.css" type="text/css"/>
    <link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"/>

    <link type="text/css" rel="stylesheet" href="CSS/table.css" />
    <link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />

    <script language="javascript" type="text/javascript">

        function docommit()
        {
            if (confirm('是否确定提交订货单?')) {
                var f1 = document.getElementById("ddid").value;
                var f2 = document.getElementById("khid").value;
                var f3 = document.getElementById("ydjin").value;
                var f4 = document.getElementById("zjine").value;
                var f5 = document.getElementById("kdyuan").value;
                var f6 = document.getElementById("kdtime").value;
                var f7 = document.getElementById("yewuyuan").value;
                var  connstr =  "ddid="+f1+"&khid="+f2+"&ydjin="+f3+"&zjine="
                        +f4+"&kdyuan="+f5+"&kdtime="+f6+"&yewuyuan="+f7;

                var f = document.createElement("form");
                f.action = "XSGL_dolist?hidden=add&type=DDtoOrder&"+connstr;
                //   f.target = "mainframe";
                f.method = "post";
                document.body.appendChild(f);
                f.submit();
            }
        }

        function checkFloat(vv, val)
        {
            while(true)
            {
                if(isNaN(val))
                {
                    vv.value=vv.value.substr(0, vv.value.length-1);
                    val = vv.value;
                }
                else
                {
                    break;
                }
            }
            return true;
        }
    </script>


    <%
        KHGL tmp = (KHGL)request.getSession().getAttribute
                ("orderDetail");
        String orderId ="";
        float totalnum = 0.0f;
        float totalprice =   0.0f;
        String  username="";
        String datetime  = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        User user = (User)request.getSession().getAttribute("user");
        if(null != user)
        {
            username = user.getRealName();
        }
        if(null != request.getSession().getAttribute("totalnum"))
        {
            totalnum = (Float)request.getSession().getAttribute
                    ("totalnum");
        }
        if(null != request.getSession().getAttribute("totalprice"))
        {
            totalprice = (Float)request.getSession().getAttribute
                    ("totalprice");
        }
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

</head>
<body>
<input type="hidden" name="ddid" id="ddid" value="<%=orderId%>"/>
<input type="hidden" name="khid" id="khid" value="<%=tmp.getKehu_id()%>"/>
<input type="hidden" name="zmishu" id="zmishu" value="<%=totalnum%>"/>
<input type="hidden" name="zjine" id="zjine" value="<%=totalprice%>"/>
<input type="hidden" name="kdyuan" id="kdyuan" value="<%=username%>"/>
<input type="hidden" name="kdtime" id="kdtime" value="<%=datetime%>"/>
<table cellpadding="0" cellspacing="0" width="100%"
       style="border: #b9c2d3 solid 1px; top: 4px">
    <tr>
        <td width="132" align="center" class="td1">订单编号</td>
        <td width="140" class="td2"><%=orderId %></td>
        <td width="132" align="center" class="td1">客户编号</td>
        <td width="140" class="td2"><%=tmp.getKehu_id()%></td>
    </tr>
    <tr>
        <td width="132" align="center" class="td1">客户名称</td>
        <td width="140" class="td2"><%=tmp.getKeHuname()%></td>
        <td width="132" align="center" class="td1">联系方式</td>
        <td width="140" class="td2"><%=tmp.getPhone()%></td>
    </tr>
    <tr>
        <td width="132" align="center" class="td1">公司地址</td>
        <td width="140" colspan="2" class="td2"><%=tmp.getAddress()%></td>
        <td width="100" colspan="1" class="td2"><input type="button" onclick="docommit()"  value="提交订单"/></td>
    </tr>
</table>


<div>
    <table cellpadding="0" cellspacing="0" width="100%"
           style="border: #b9c2d3 solid 1px; top: 4px">
        <tr>
            <td width="132" align="center" class="td1">总米数</td>
            <td width="140" class="td2"><%=totalnum %></td>
            <td width="132" align="center" class="td1">总金额</td>
            <td width="140" class="td2"><%=totalprice%></td>
            <td width="132" align="center" class="td1">预付定金</td>
            <td width="140" class="td2">
                <input type="text" size="24" id="ydjin"    onkeyup="return checkFloat(this,value)" value=""
                       name="ydjin" maxlength="24"/>
            </td>
        </tr>
        <tr>
            <td width="132" align="center" class="td1">业务员</td>
            <td width="140" class="td2">
                <input type="text" size="24" id="yewuyuan" value=""
                       name="yewuyuan" maxlength="24"/>
            </td>
            <td width="132" align="center" class="td1">开单员</td>
            <td width="140" class="td2"><%=username%></td>
            <td width="132" align="center" class="td1">开单日期</td>
            <td width="140" class="td2"><%=datetime%></td>
        </tr>
    </table>
</div>
<div>
    <table id="flex1" style="display: none; font-size:
12px;top:7px"> </table>
    <input id="hidden" type="hidden" name="hidden" value="manage" />
</div>
</body>



<script>

    function gridFlash(){
        $("#flex1").flexOptions({params: [
            {name:'type_num', value:$("#type_num").val()},
            {name:'zhuangtai', value:$("#zhuangtai").val()},
            {name:'beginTime',value:$("#beginTime").val()},
            {name:'endTime',value:$("#endTime").val()}
        ]}).flexReload();
    }
    $("#flex1").flexigrid({
        url : 'XSGL_dolist?hidden=manage&type=ZHXDDETAIL',
        dataType : 'json',
        colModel : [ {
            display : 'id',
            name : 'id',
            width : 10,
            sortable : true,
            align : 'center',
            hide : true
        }, {
            display : '商品名',
            name : 'TuiHuo_Id',
            width : 120,
            sortable : false,
            align : 'center',
            hide : false
        }, {
            display : '货号',
            name : 'CaiGou_Id',
            width : 120,
            sortable : false,
            align : 'center'
        }, {
            display : '规格',
            name : 'TuiHuoDanJia',
            width :110,
            sortable : false,
            align : 'center'
        }, {
            display : '数量',
            name : 'Apply_Man',
            width : 120,
            sortable : false,
            align : 'center'
        }, {
            display : '单价',
            name : 'Apply_Time',
            width : 110,
            sortable : false,
            align : 'center'
        }, {
            display : '金额',
            name : 'Queren_Man',
            width : 120,
            sortable : false,
            align : 'center'
        }, {
            display : '备注',
            name : 'Queren_Time',
            width : 300,
            sortable : false,
            align : 'center'
        }],
        buttons : [  {
            name : '备货',
            bclass : 'edit',
            onpress:  button
        }, {
            separator : true
        }],
        sortname : "id",
        sortorder : "desc",
        usepager : true,
        resizable : false,
        title : '订单明细表 ',
        pagestat : '显示 {from} 到 {to} 条 共 {total} 条数据',
        pagetext : '第',
        outof : '共',
        findtext : 'Find',
        procmsg : '正在查询, 请等待 ...',
        query : '',
        qtype : '',
        nomsg : '没有符合要求的数据',
        useRp : true,
        rp : 10,
        rpOptions : [ 10, 15, 20, 30, 50 ],
        width : 'auto',
        height : 280,
        showToggleBtn : false,
        checkbox : true
    });

    function button(com, grid) {
        if (com == '备货') {
            if ($('.trSelected', grid).length == 0) {
                alert("请选择要删除的数据");
            } else {
                var id = "";
                var comcount = $('.trSelected', grid).length;
                for ( var i = 0; i < $('.trSelected', grid).length; i++) {
                    if (i == $('.trSelected', grid).length - 1) {
                        id += "id=" + $('.trSelected', grid).find("td:first")
                                .eq(i).text();
                    } else {
                        id += "id=" + $('.trSelected', grid).find("td:first")
                                .eq(i).text() + "&";
                    }
                }
                if (confirm('是否删除这 ' + comcount + ' 条记录吗?')) {
                    var url = "XSGL_dolist?hidden=delete&type=ZHDDdetail&" + id;
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
            dataType : 'json',
            success : function() {
                // $('#flex1').flexReload();
                window.location= "DisPatch_getUrl?i=4&j=8";
            },
            error:function()
            {
                window.location= "DisPatch_getUrl?i=4&j=8";
            }
        });
    }
    <%
        String message = (String)request.getSession().getAttribute("ddmxadderror");
         if (message != null && !"".equals(message)) {
             request.getSession().removeAttribute("ddmxadderror");
     %>

    alert("<%=message%>");
    <%}%>
</script>
</html>
