<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.jiang.util.PublicFunc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>客户</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

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

    <link type="text/css" rel="stylesheet" href="CSS/table.css"/>
    <link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css"/>
</head>
<body>
<%
    String zhuguan = "false";
    String zhuguanmima = "";
    com.jiang.bean.User user = null;
    String quanxian = "";
    String bumen = "";
    if (null != session.getAttribute("user")) {
        user = (com.jiang.bean.User) session.getAttribute("user");
        zhuguanmima = user.getZGpwd();
        if (zhuguanmima == "") {
            zhuguan = "false";
        } else {
            zhuguan = "true";
        }
    }
    if (null != session.getAttribute("zgmima")) {
        zhuguanmima = (String) session.getAttribute("zgmima");
    }

%>

<div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%"
           id="tabs">
        <tr>
            <td class="tabs" align="center"><font color="white">自加工任务单管理</font>
            </td>
            <td class="tabs"></td>
        </tr>
    </table>
</div>
<form name="form1" action="#">
    <input type="hidden" name="p1t" id="p1t">
    <input type="hidden" name="zhuguanpwd" id="zhuguanpwd" value="<%=zhuguanmima%>">
    <input type="hidden" name="iszhuguan" id="iszhuguan" value="<%=zhuguan%>">
    <input type="hidden" name="orderstate" id="orderstate1" value="<%=PublicFunc.ORDER_STATE_FINISH%>">
    <input type="hidden" name="orderstate" id="orderstate2" value="<%=PublicFunc.ORDER_STATE_WATINGZJ%>">
    <input type="hidden" name="orderstate" id="orderstate3" value="<%=PublicFunc.ORDER_STATE_WATINGRK%>">
    <input type="hidden" name="orderstate" id="orderstate4" value="<%=PublicFunc.ORDER_STATE_DELETE%>">
    <input type="hidden" name="orderstate" id="orderstate5" value="<%=PublicFunc.ORDER_STATE_NOPERSON%>">
    <input type="hidden" name="orderstate" id="orderstate6" value="<%=PublicFunc.SC_STATE_WATINGSC%>">
    <input type="hidden" name="orderstate" id="orderstate7" value="<%=PublicFunc.ORDER_STATE_RESEND%>">

</form>

<div>
    <table cellpadding="0" cellspacing="0" width="100%" align="center"
           style="border: #b9c2d3 solid 1px; top: 4px">
        <tr>
            <td width="132" align="center" class="td1">任务单号</td>
            <td width="140" class="td2"><input type="text" name="bianhao" id="bianhao"/>
            </td>
            <input type="hidden" name="chejian" id="chejian" value="车间一"/>
            <td width="132" align="center" class="td1">状态</td>
            <td width="140" class="td2"><select name="zhuangtai"
                                                id="zhuangtai" class="a2" style="position: relative">
                <%
                    String states[] = {PublicFunc.ORDER_STATE_NOPERSON, PublicFunc.ORDER_STATE_RESEND,
                            PublicFunc.SC_STATE_WATINGSC,PublicFunc.ORDER_STATE_WATINGZJ,
                            PublicFunc.ORDER_STATE_WATINGRK,
                             PublicFunc.ORDER_STATE_FINISH,
                            PublicFunc.ORDER_STATE_DELETE,
                    };
                %>
                <option selected="selected" value="--请选择--">--请选择--</option>
                <%for (int i = 0; i < states.length; i++) {%>
                <option value="<%=states[i] %>"><%=states[i] %>
                </option>
                <%} %>
            </select></td>
        </tr>
        <tr>
            <td width="132" align="center" class="td1">原型号</td>
            <td width="140" class="td2"><input type="text" name="Up_typeNum" id="Up_typeNum"/>
            </td>
            <td width="132" align="center" class="td1">工艺</td>
            <td width="140" class="td2"><select name="gongyi"
                                                id="gongyi" class="a2" style="position: relative">

                <option selected="selected" value="--请选择--">--请选择--</option>
                <%for(int i=0;i<PublicFunc.zjgGYType.length;i++) {%>
                <option value="<%=PublicFunc.zjgGYType[i] %>"   ><%=PublicFunc.zjgGYType[i] %></option>
                <%} %>
            </select>
            </td>
            <td width="80" class="td2"><input type="image"
                                              onmouseover="ChangeImage(this,'images/Search2.gif')"
                                              onmouseout="ChangeImage(this,'images/Search1.gif')"
                                              src="images/Search1.gif" onclick="gridFlash()"
                                              style="border-width: 0px; position: relative;"/></td>
            <td class="td2"></td>
        </tr>
        <tr>
        </tr>
    </table>
</div>
<div>
    <table id="flex1" width="100%" style="display: none; font-size: 12px;"
           style="top:7px"></table>
    <input id="hidden" type="hidden" name="hidden" value="manage"/>
</div>
</body>


<script>
function gridFlash() {
    $("#flex1").flexOptions({params:[
        {name:'chejian', value:$("#chejian").val()},
        {name:'zhuangtai', value:$("#zhuangtai").val()},
        {name:'Up_typeNum', value:$("#Up_typeNum").val()},
        {name:'gongyi', value:$("#gongyi").val()},
        {name:'bianhao', value:$("#bianhao").val()}
    ]}).flexReload();
}

$("#flex1").flexigrid({
    url:'SCGL_dolist?hidden=manage&type=SCGLZJG',
    dataType:'json',
    colModel:[
        {
            display:'id',
            name:'id',
            width:10,
            align:'center',
            hide:true
        },
        {
            display:'任务单号',
            name:'a',
            width:100,
            align:'center',
            hide:false
        },
        {
            display:'加工型号',
            name:'b',
            width:80,
            align:'center'
        },
        {
            display:'型号',
            name:'c',
            width:80,
            align:'center'
        },
        {
            display:'底布名称',
            name:'d',
            width:70,
            align:'center'
        },
        {
            display:'数量 ',
            name:'e',
            width:50,
            align:'center'
        } ,
        {
            display:'工艺 ',
            name:'e',
            width:50,
            align:'center'
        },
        {
            display:'卡号 ',
            name:'e',
            width:50,
            align:'center'
        }  ,
        {
            display:'针数 ',
            name:'e',
            width:60,
            align:'center'
        } ,
        {
            display:'车间 ',
            name:'e',
            width:50,
            align:'center'
        }  ,
        {
            display:'交货日期 ',
            name:'e',
            width:70,
            align:'center'
        } ,
        {
            display:'状态 ',
            name:'e',
            width:90,
            align:'center'
        } ,
        {
            display:'接单人 ',
            name:'e',
            width:60,
            align:'center'
        } ,
        {
            display:'备注',
            name:'e',
            width:100,
            align:'center'
        }
    ],
    buttons:[
        {
            name:'添加',
            bclass:'add',
            onpress:button
        },
        {
            separator:true
        },
        {
            name:'删除',
            bclass:'delete',
            onpress:button
        },
        {
            separator:true
        } ,
        {
            name:'修改',
            bclass:'edit',
            onpress:button
        },
        {
            separator:true
        },
        {
            name:'标记为无效',
            bclass:'edit',
            onpress:button
        },
        {
            separator:true
        }
    ],
    sortname:"id",
    sortorder:"desc",
    usepager:true,
    resizable:false,
    title:'自加工工艺单管理',
    pagestat : '显示 {from} 到 {to} 条 共 {total} 条数据',
    pagetext : '第',
    outof : '共',
    findtext : 'Find',
    procmsg : '正在查询, 请等待 ...',
    query : '',
    qtype : '',
    nomsg : '没有符合要求的数据',
    useRp:true,
    rp:12,
    rpOptions:[ 12, 15, 20, 30, 50 ],
    width:'auto',
    height:340,
    showToggleBtn:false,
    checkbox:true
});
var comcount;
var comstr;
function button(com, grid) {
    var hidden = document.getElementById("hidden");
    if (com == '删除') {
        hidden.value = "delete";
        if ($('.trSelected', grid).length == 0) {
            alert("请选择要删除的数据");
        } else {
            var orderstate5 = document.getElementById("orderstate5");
            var zhuguanpwd = document.getElementById("zhuguanpwd");
            var p1t = document.getElementById("p1t");

            var id = "";
            comcount = $('.trSelected', grid).length;
            for (var i = 0; i < $('.trSelected', grid).length; i++) {
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
            comstr = id;
            if ($('.trSelected', grid).find("td").eq(11).text() == orderstate5.value) {
                //未打印前不用输密码。。
                if (confirm('是否删除这 ' + comcount + ' 条记录吗?')) {
                    var url = "SCGL_dolist?hidden=delete&type=SCGLZJG&" + comstr;

                    del(url);
                }
            }
            else {
                if (zhuguanpwd.value == "" || zhuguanpwd.value == "null" || zhuguanpwd.value == null) {
                    alert("部门没有主管，无法操作，请联系管理员");
                    return;
                }
                var a = JqueryDialog.Open('主管密码', 'CGGL/pwd.jsp', 500, 100);
                if (p1t.value == "undefined") {
                    return;
                }
            }


        }
    } else if (com == '添加') {
        hidden.value = "add";
        location.href = "DisPatch_getAddJsp?a=2&b=0";
    } else if (com == '修改') {
        hidden.value = "modify";
        if ($(".trSelected").length == 1) {
            var orderstate5 = document.getElementById("orderstate5");
            var zhuguanpwd = document.getElementById("zhuguanpwd");
            comstr = $('.trSelected', grid).find("td").eq(0).text();

            var orderstate1 = document.getElementById("orderstate1");
            var orderstate2 = document.getElementById("orderstate2");
            var orderstate3 = document.getElementById("orderstate3");
            var orderstate4 = document.getElementById("orderstate4");
            var orderstate6 = document.getElementById("orderstate6");
            var orderstate7 = document.getElementById("orderstate7");

            if ($('.trSelected', grid).find("td").eq(11).text() == orderstate1.value
                    || $('.trSelected', grid).find("td").eq(11).text() == orderstate2.value
                    || $('.trSelected', grid).find("td").eq(11).text() == orderstate3.value
                    || $('.trSelected', grid).find("td").eq(11).text() == orderstate4.value
                    || $('.trSelected', grid).find("td").eq(11).text() == orderstate6.value
                    ) {
                alert("当前任务状态，不支持该操作!");
                return;
            }


            if ($('.trSelected', grid).find("td").eq(8).text() == orderstate5.value
                    || $('.trSelected', grid).find("td").eq(8).text() == orderstate7.value) {
                //未打印前不用输密码。。

            }
            else {
                if (zhuguanpwd.value == "" || zhuguanpwd.value == "null" || zhuguanpwd.value == null) {
                    alert("部门没有主管，无法操作，请联系管理员");
                    return;
                }

            }
            getstatusbycgid("DisPatch_modifyZJG?id=" + $('.trSelected', grid).find("td").eq(0).text());


        } else if ($(".trSelected").length > 1) {
            alert("请选择一个修改,不能同时修改多个");
        } else if ($(".trSelected").length == 0) {
            alert("请选择一个您要修改的信息");
        }
    } else if (com == '标记为无效') {
        hidden.value = "add";
        if ($(".trSelected").length == 1) {
            var orderstate1 = document.getElementById("orderstate1");
            var orderstate2 = document.getElementById("orderstate2");
            var orderstate3 = document.getElementById("orderstate3");
            var orderstate4 = document.getElementById("orderstate4");
            var orderstate6 = document.getElementById("orderstate6");

            if ($('.trSelected', grid).find("td").eq(8).text() == orderstate1.value
                    || $('.trSelected', grid).find("td").eq(8).text() == orderstate2.value
                    || $('.trSelected', grid).find("td").eq(8).text() == orderstate3.value
                    || $('.trSelected', grid).find("td").eq(8).text() == orderstate4.value
                    || $('.trSelected', grid).find("td").eq(8).text() == orderstate6.value
                    ) {
                alert("当前任务状态，不支持该操作!");
                return;
            }
            if (confirm("是否确定置为无效？")) {
                var x = "DisPatch_disableSCZJG?id=" + $('.trSelected', grid).find("td").eq(0).text();
                disableline(x);
            } else {
                return;
            }
        } else if ($(".trSelected").length > 1) {
            alert("只能选择一项单据标记为无效");
        } else if ($(".trSelected").length == 0) {
            alert("请选择一项您要标记为无效的单据");
        }
    }
}


function deletebypwd(pwd) {
    var zhuguanpwd = document.getElementById("zhuguanpwd");
    if (pwd != zhuguanpwd.value) {
        alert("密码错误");
        return;
    }

    if (confirm('是否删除这 ' + comcount + ' 条记录吗?')) {
        var url = "SCGL_dolist?hidden=delete&type=SCGLZJG&" + comstr;
        del(url);
    }
}
/**
 * 标记为无效
 */
function disableline(url) {
    $.ajax({
        url : url,
        type : 'POST',
        dataType : 'json',
        success : function() {
            $('#flex1').flexReload();
        },
        error : function()
        {
            $('#flex1').flexReload();
        }
    });
}
function editbypwd(pwd) {
    var zhuguanpwd = document.getElementById("zhuguanpwd");
    if (pwd != zhuguanpwd.value) {
        alert("密码错误");
        return;
    }
    getstatusbycgid(comstr);

}
/**
 * 删除记录
 */
function del(url) {
    $.ajax({
        url:url,
        type:'POST',
        dataType:'json',
        success:function () {
            $('#flex1').flexReload();
        }
    });
}
/**
 * 标记为无效
 */
function disableline(url) {
    $.ajax({
        url:url,
        type:'POST',
        dataType:'json',
        success:function () {
            $('#flex1').flexReload();
        },
        error:function () {
            $('#flex1').flexReload();
        }
    });
}
/**
 * 获取状态
 */
function getstatusbycgid(url) {
    $.ajax({
        url:url,
        type:'POST',
        dataType:'text',
        success:function () {
            newaction();
        },
        error:function () {
            JqueryDialog.Open('主管密码', 'CGGL/pwd2.jsp', 500, 100);
        }
    });
}
function newaction() {
    window.location.href = "SCGL_dolist?hidden=premodify&type=SCGLZJG&id=" + comstr;
}
</script>
</html>
