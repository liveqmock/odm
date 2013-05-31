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
    <link rel="stylesheet" href="skin/WdatePicker.css" type="text/css" />

    <link type="text/css" rel="stylesheet" href="CSS/table.css" />
    <link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />
</head>
<%--
test in company
--%>

<body onload="hiddbutton()">
<%--<div>--%>

<%--<table border="0" cellpadding="0" cellspacing="0" width="100%"--%>
<%--id="tabs">--%>
<%--<tr>--%>
<%--<td class="tabs" align="center"><font color="white">客户管理</font>--%>
<%--</td>--%>
<%--<td class="tabs"></td>--%>
<%--</tr>--%>
<%--</table>--%>


  <script type="text/javascript">

      function hiddbutton()
      {

      }

      function showtable()
      {
          var ui1 = document.getElementById("hidetable");
          if(ui1.style.display == "none")
          {
              ui1.style.display="";
          }
          else
          {
              ui1.style.display="none";
          }
      }
      function hidetable()
      {
          var ui1 = document.getElementById("hidetable");
          if(ui1.style.display == "")
          {
              ui1.style.display="none";
          }
      }

      function checkoldcommit(id)
      {
          var constr = "XSGL_dolist?hidden=modify&type=KHGL_FH_CHECK&"
                  + "id="+id;
          window.parent.del(constr);
          window.parent.JqueryDialog.SubmitCompleted("", true, false);
      }
  </script>

<div style="height: 6px"></div>
<div>
    <input id="hidden" type="hidden" name="hidden" value="manage" />

    <table id="flex2" style="display: none; font-size: 12px;"
           style="top:7px"></table>

    <div id="hidetable" style="display:none">
        <table cellpadding="0" cellspacing="0" width="100%" align="center"
               style="border: #b9c2d3 solid 1px; top: 4px">
            <tr>
                <td width="" align="" class="td1">联系人</td>
                <td width="" class="td2" ><input type="text" /> </td>
                <td width="" align="" class="td1">电话</td>
                <td width="" class="td2"><input type="text" /></td>
                <td width="" align="" class="td1">手机</td>
                <td width="" class="td2"><input type="text" /></td>
            </tr>
            <tr>
                <td width="" align="" class="td1">发货方式</td>
                <td width="" class="td2"><select >
                <option >快递</option>
                <option >普通</option>
                </select></td>
                <td width="" align="" class="td1">地址</td>
                <td width="" class="td2"><input type="text" /></td>
            </tr>

        </table>
    </div>
    <table id="flex1" style="display: none; font-size: 12px;"
           style="top:7px"></table>
</div>
</body>

<script>
    function gridFlash(){
        $("#flex1").flexOptions({params: [
            {name:'kehu_id', value:$("#kehu_id").val()},
            {name:'lianxiren',value:$("#lianxiren").val()}
        ]}).flexReload();
    }
    $("#flex1").flexigrid({
        url : 'XSGL_dolist?hidden=manage&type=KHGL_FH',
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
            width : 135,
            sortable : true,
            align : 'center',
            hide : true
        }, {
            display : '发货方式',
            name : 'dingdan_id',
            width : 80,
            sortable : false,
            align : 'center'
        }, {
            display : '联系人',
            name : 'dingdan_id',
            width : 100,
            sortable : false,
            align : 'center'
        }, {
            display : '电话',
            name : 'type_num',
            width : 100,
            sortable : false,
            align : 'center'
        }, {
            display : '手机',
            name : 'mishu',
            width : 100,
            sortable : false,
            align : 'center'
        }, {
            display : '地址',
            name : 'finish_or_not',
            width : 330,
            sortable : false,
            align : 'center'
        } ] ,
        buttons : [ {
            name : '使用新地址',
            bclass : 'add',
            onpress : button
        }, {
            separator : true
        } , {
            name : '使用选中地址',
            bclass : 'edit',
            onpress : button
        }, {
            separator : true
        }  ],
        /*searchitems : [
         {display: '信息编号', name : 'id', isdefault: true},
         {display: '信息标题', name : 'id'},
         {display: '信息类别', name : 'id'},
         {display: '发布作者', name : 'id'}
         ],   */
        sortname : "id",
        sortorder : "desc",
        usepager : true,
        resizable : false,
        title : '',
        useRp : true,
        rp : 5,
        rpOptions : [ 5, 10, 15, 20, 30 ],
        width : 'auto',
        height : 146,
        showToggleBtn : false,
        checkbox : true
    });

    $("#flex2").flexigrid({
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
            width : 135,
            sortable : true,
            align : 'center',
            hide : true
        }, {
            display : '发货方式',
            name : 'dingdan_id',
            width : 80,
            sortable : false,
            align : 'center'
        }, {
            display : '联系人',
            name : 'dingdan_id',
            width : 100,
            sortable : false,
            align : 'center'
        }, {
            display : '电话',
            name : 'type_num',
            width : 100,
            sortable : false,
            align : 'center'
        }, {
            display : '手机',
            name : 'mishu',
            width : 100,
            sortable : false,
            align : 'center'
        }, {
            display : '地址',
            name : 'finish_or_not',
            width : 350,
            sortable : false,
            align : 'center'
        } ] ,
        buttons : [],
        /*searchitems : [
         {display: '信息编号', name : 'id', isdefault: true},
         {display: '信息标题', name : 'id'},
         {display: '信息类别', name : 'id'},
         {display: '发布作者', name : 'id'}
         ],   */
        sortname : "id",
        sortorder : "desc",
        usepager : false,
        resizable : false,
        title : '当前地址:',
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
                    var url = "XSGL_dolist?type=KHGL_FH&hidden=delete&" + id;
                    del(url);
                }
            }
        } else if (com == '使用新地址') {
            showtable();
           // hidden.value = "add";
            //location.href = "DisPatch_getAddJsp?a=5&b=1";
        } else if (com == '使用选中地址') {
            hidden.value = "modify";
            hidetable();
            if ($(".trSelected").length == 1) {
                if (confirm('是否确认修改此地址为收获地址?')) {
                    checkoldcommit($('.trSelected', grid).find("td").eq(0).text());
                }
                //window.location.href =  "XSGL_dolist?hidden=premodify&type=KHGL_FH&id="+$('.trSelected', grid).find("td").eq(0).text();
            } else if ($(".trSelected").length > 1) {
                alert("不能同时选中多个");
            } else if ($(".trSelected").length == 0) {
                alert("请选择一个收获地址");
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
