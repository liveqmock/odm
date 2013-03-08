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
</head>
<body>
<div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%"
           id="tabs">
        <tr >
            <td class="tabs"  align="center" ><font color="white" >半成品开剪任务单</font>
            </td>
            <td class="tabs"></td>
        </tr>
    </table>
</div>
<div style="height: 6px">
</div>

<div>
    <table cellpadding="0" cellspacing="0" width="100%" align="center"
           style="border: #b9c2d3 solid 1px; top: 4px">
        <tr>
            <td width="132" align="center" class="td1">型号</td>
            <td width="140" class="td2"><input type="text" id="type_num" name="type_num"/>
            </td>
            <td width="132" align="center" class="td1">状态</td>
            <td width="140" class=""><select name="zhuangtai"
                                             id="zhuangtai" class="a2" style="position: relative" onchange="gridFlash()">
                <option selected="selected" value="--请选择--">--请选择--</option>
                <option value="<%=PublicFunc.KJ_STATE_WAITING%>"><%=PublicFunc.KJ_STATE_WAITING%></option>
                <option value="<%=PublicFunc.KJ_STATE_FINISH%>"><%=PublicFunc.KJ_STATE_FINISH%></option>
                <option value="<%=PublicFunc.KJ_STATE_DISABLE%>"><%=PublicFunc.KJ_STATE_DISABLE%></option>
            </select></td>

        </tr>
        <tr>

            <td width="80" align="center" class="td1">申请日期</td>
            <td width="160" align="left" class="td2"><input
                    name="beginTime" type="text" id="beginTime" class="Wdate"
                    onclick="WdatePicker()" style="width: 160px; position: relative" /></td>

            <td width="132" align="center" class="td1">至</td>
            <td class="td2" align="left"><input name="endTime"
                                                type="text" id="endTime" class="Wdate" onclick="WdatePicker()"
                                                style="width: 160px; position: relative" /></td>
            <td width="80" class="td2"><input type="image"
                                              name="imgBtnSearch" id="imgBtnSearch"
                                              onmouseover="ChangeImage(this,'images/Search2.gif')"
                                              onmouseout="ChangeImage(this,'images/Search1.gif')"
                                              src="images/Search1.gif"              onclick="gridFlash();"
                                              style="border-width: 0px; position: relative;" /></td>
        </tr>

    </table>
</div>
<div style="height: 6px">
</div>
<div>
    <table id="flex1" width="100%" style="display: none; font-size: 12px;"
           style="top:7px"></table>
    <input id="hidden" type="hidden" name="hidden" value="manage" />
</div>
</body>

<script>

    function gridFlash(){
        $("#flex1").flexOptions({params: [
            {name:'type_num', value:$("#type_num").val()},
            {name:'zhuangtai', value:$("#zhuangtai").val()},
            {name:'beginTime', value:$("#beginTime").val()},
            {name:'endTime', value:$("#endTime").val()}
        ]}).flexReload();
    }
    $("#flex1").flexigrid({
        url : 'SCGL_dolist?hidden=manage&type=BCPKJAPPLY',
        dataType : 'json',
        colModel : [ {
            display : 'id',
            name : 'id',
            width : 10,
            align : 'center',
            hide : true
        }, {
            display : '申请单号',
            name : 'a',
            width : 100,
            align : 'center',
            hide : false
        }, {
            display : '型号',
            name : 'c',
            width : 80,
            align : 'center'
        }, {
            display : '原布匹编号',
            name : 'b',
            width : 110,
            align : 'center'
        }, {
            display : '原米数',
            name : 'b',
            width : 40,
            align : 'center'
        }, {
            display : '新开布匹编号',
            name : 'b',
            width : 110,
            align : 'center'
        }, {
            display : '开剪米数 ',
            name : 'e',
            width : 45,
            align : 'center'
        }, {
            display : '损耗米数',
            name : 'e',
            width : 45,
            align : 'center'
        }, {
            display : '申请人',
            name : 'e',
            width : 60,
            align : 'center'
        }, {
            display : '申请时间 ',
            name : 'e',
            width : 70,
            align : 'center'
        } , {
            display : '开剪人 ',
            name : 'e',
            width : 60,
            align : 'center'
        } , {
            display : '开剪时间 ',
            name : 'e',
            width : 70,
            align : 'center'
        }, {
            display : '备注 ',
            name : 'e',
            width : 90,
            align : 'center'
        }, {
            display : '状态 ',
            name : 'e',
            width : 60,
            align : 'center'
        }  ],
        buttons : [  {
            name : '确认开剪',
            bclass : 'edit',
            onpress : button
        }, {
            separator : true
        }
//            , {
//			name : '修改',
//			bclass : 'edit',
//			onpress : button
//		}, {
//			separator : true
//		}
        ],
        sortname : "id",
        sortorder : "desc",
        usepager : true,
        resizable : false,
        title : '半成品开剪管理',
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
        if (com == '确认开剪') {
            hidden.value = "modify";
            if ($(".trSelected").length == 1) {
                var state =  $('.trSelected', grid).find("td").eq(13).text();
                if(state != "等待开剪")
                {
                    alert("当前状态不支持");
                    return;
                }
                var constr =  "&tiaoma="+   $('.trSelected', grid).find("td").eq(3).text()
                + "&mishu="+   $('.trSelected', grid).find("td").eq(4).text()
                + "&kjmishu="+   $('.trSelected', grid).find("td").eq(6).text();

               JqueryDialog.Open('开剪确认', 'CKGL/BCPKJ_DO.jsp?id='+$('.trSelected', grid).find("td").eq(0).text()+constr, 350, 210);
                // window.location.href =  "SCGL_dolist?hidden=kaijian&type=BCPKJAPPLY&id="+$('.trSelected', grid).find("td").eq(0).text();
            } else if ($(".trSelected").length > 1) {
                alert("请选择一项进行开剪,不能同时选择多个");
            } else if ($(".trSelected").length == 0) {
                alert("请选择一个您要开剪的单号");
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
