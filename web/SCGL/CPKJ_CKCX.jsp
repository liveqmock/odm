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
</head>
<body>
<div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%"
           id="tabs">
        <tr>
            <td class="tabs" align="center"><font color="white">成品仓库查询</font>
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
            <td width="132" align="center" class="td1">型号</td>
            <td width="140" class="td2"><input type="text" name="type_num" id="type_num"/>
            </td>
            <input type="hidden" name=ckname id=ckname />
            <input type="hidden" name=mudidanhao id=mudidanhao />

            <td width="132" align="center" class="td1">布匹类型</td>
            <td width="140" class=""><select name="bptype"
                                             id="bptype" class="a2" style="position: relative">
                <option value="成品"  selected="selected" >成品</option>
            </select></td>
        </tr>
        <tr>

            <td width="132" align="center" class="td1">条形码</td>
            <td width="140" class="td2"><input type="text" name="bupi_id" id=bupi_id />
            </td>

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
    <%
        String message = (String)request.getAttribute("bcpkjckcxerror");
         if (message != null && !"".equals(message)) {
             request.removeAttribute("bcpkjckcxerror");
     %>

    alert("<%=message%>");
    <%}%>
</script>


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

        url : 'CGGL_dolist?hidden=manage&type=CKCX&bptype=cp',
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
            width : 120,
            sortable : false,
            align : 'center',
            hide : false
        },  {
            display : '型号 ',
            name : 'type_num',
            width : 120,
            sortable : false,
            align : 'center',
            hide : false
        }, {
            display : '仓库类型',
            name : 'bptype',
            width : 120,
            sortable : false,
            align : 'center'
        }, {
            display : '布匹类型',
            name : 'bptype',
            width : 100,
            sortable : false,
            align : 'center'
        }, {
            display : '可用米数 ',
            name : 'KY_num',
            width : 80,
            sortable : false,
            align : 'center'
        }, {
            display : '开剪米数',
            name : 'num',
            width : 80,
            sortable : false,
            align : 'center'
        }, {
            display : '总米数',
            name : 'num',
            width : 80,
            sortable : false,
            align : 'center'
        },{
            display : '品级',
            name : 'zhiliangdengji',
            width : 100,
            sortable : false,
            align : 'center'
        },{
            display : '备注',
            name : 'zhiliangdengji',
            width : 190,
            sortable : false,
            align : 'center'
        } ],
        buttons : [ {
            name : '开剪',
            bclass : 'edit',
            onpress : button
        }, {
            separator : true
        } ],
        sortname : "id",
        sortorder : "desc",
        usepager : true,
        resizable : false,
        title : '成品布匹管理',
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
        height : 340,
        showToggleBtn : false,
        checkbox : true
    });

    function button(com, grid) {
        var hidden = document.getElementById("hidden");
        if (com == '开剪') {
            hidden.value = "modify";
            if ($(".trSelected").length == 1) {
                window.location.href = "DisPatch_getAddJsp?a=5&b=5&id="
                        + $('.trSelected', grid).find("td").eq(0).text();
            } else if ($(".trSelected").length > 1) {
                alert("请选择一个开剪,不能同时开剪多个");
            } else if ($(".trSelected").length == 0) {
                alert("请选择一个您要开剪的布匹");
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
