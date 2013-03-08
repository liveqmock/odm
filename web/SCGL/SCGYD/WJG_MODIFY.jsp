<%@page import="com.jiang.bean.ZLGLYLZL" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@page import="java.util.*" %>
<%@page import="com.jiang.bean.ZJGgongyidan" %>
<%@page import="java.text.SimpleDateFormat" %>

<%@page import="com.jiang.util.PublicFunc" %>
<%@ page import="com.jiang.bean.WJGgongyidan" %>
<%@ page import="com.jiang.bean.wJGGongYingShang" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>外加工</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <script type="text/javascript" language="javascript"
            src="js/jquery-fn-tab.js"></script>
    <script type="text/javascript" src="js/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="js/jquery.corners.min.js"></script>
    <script type="text/javascript" src="js/flexigrid.js"></script>
    <script language="javascript" type="text/javascript"
            src="My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src=js/validate/jquery.validate.js></script>
    <script type="text/javascript" src=js/validate/jquery.form.js></script>
    <script type="text/javascript" src=js/validate/valid.js></script>
    <link type="text/css" rel="stylesheet" href="js/validate/validate.css"/>
    <script type="text/javascript" src="js/ChangeImageJS.js"></script>
    <link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"/>

    <link type="text/css" rel="stylesheet" href="CSS/table.css"/>
    <link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css"/>

    <link rel="stylesheet" href="CSS/flexselect.css" type="text/css" media="screen"/>
    <script src="js/select/liquidmetal.js" type="text/javascript"></script>
    <script src="js/select/jquery.flexselect.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("select.flexselect").flexselect();
            // $("input:text:enabled:first").focus();
        });
        function readyshow() {
            $("select.flexselect").flexselect();
            //$("input:text:enabled:first").focus();
        }
    </script>


    <script type="text/javascript">
        /**
         * 自定义验证规则——增加对select的验证
         */
        $.validator.addMethod("selectNone", // name验证方法名
                function (value, element) // 验证规则
                {
                    if (value == "--请选择--") // select默认值需要设置为"none"(当然可以自定义其他值）
                    {
                        return false;
                    } else {
                        return true;
                    }
                }, "必须选择一项" // 默认验证消息（自定义规则信息的国际化是否不起作用？）
        );

        $(document).ready(function () {
            var validator = $("#form1").validate({
                debug:true, //调试模式取消submit的默认提交功能
                errorClass:"haha", //默认为错误的样式类为：error
                focusInvalid:true,
                onfocusout:function (element) {
                    $(element).valid();
                },
                onkeyup:function (element) {
                    $(element).valid();
                },
                submitHandler:function (form) {
                    form.submit();
                },
                rules:{
                    chejian:{
                        selectNone:"ss"
                    },
                    jgtype:{
                        selectNone:"ss"
                    },
                    gongyi:{
                        selectNone:"ss"
                    },
                    xinghao:{
                        required:true
                    },
                    jgxinghao:{
                        required:true
                    },
                    jhtime:{
                        required:true
                    },
                    shuliang:{
                        required:true,
                        number:true,
                        min:1
                    }
                },
                messages:{
                    chejian:{
                        selectNone:"请选择加工单位"
                    },
                    jgtype:{
                        selectNone:"请选择加工类型"
                    },
                    gongyi:{
                        selectNone:"请选择工艺"
                    },
                    jgxinghao:{
                        required:"请输入加工型号"
                    },
                    xinghao:{
                        required:"请输入型号"
                    },
                    jhtime:{
                        required:"请输入交货时间"
                    },
                    shuliang:{
                        number:"请输入数字",
                        required:"请输入数量",
                        min:"数量必须大于 1"
                    }
                },
                errorPlacement:function (error, element) { //验证消息放置的地方
                    error.appendTo(element.parent("td").next("td"));
                },
                highlight:function (element, errorClass) { //针对验证的表单设置高亮
                    $(element).addClass(errorClass);
                }/*,
                 success : function(label) {
                 label.addClass("valid").text("Ok!");
                 }*/
            });
            $("button").click(function () {
                validator.resetForm();
            });
        });
        function backMenu() {
            var f = document.createElement("form");
            f.action = "DisPatch_getUrl?i=0&j=4";
            //f.target = "mainframe";
            f.method = "post";
            document.body.appendChild(f);
            f.submit();
        }

        function enableselect() {
            var ui1 = document.getElementById("hide1");
            var ui2 = document.getElementById("hide2");
            var gt = document.getElementById("jgtype");
            var value = gt.value;

            if (value == "半成品") {
                ui1.style.display = "";
                ui2.style.display = "none";
            }
            if (value == "成品") {
                ui1.style.display = "none";
                ui2.style.display = "";
            }

            if (value == "--请选择--") {
                ui1.style.display = "none";
                ui2.style.display = "none";
            }
        }

    </script>
</head>
<body onload="enableselect()">
<%
    String gydid = "";
    String jgxinghao = "";
    String xinghao = "";
    String dbmingchen = "";
    String shuliang = "";
    String chejian = "--请选择--";
    String gongyi = "--请选择--";
    String jhtime = "";
    String beizhu = "";
    String xiadanren = "";
    String xiadantime = "";
    String jgtype = "--请选择--";
    int id = -1;
    if (null != request.getAttribute("wjg")) {
        WJGgongyidan xh = (WJGgongyidan) request.getAttribute("wjg");
        if (xh.getBianhao() != null) {
            gydid = xh.getBianhao();
        }
        if (xh.getId() != null) {
            id = xh.getId();
        }
        if (xh.getDown_typeNum() != null) {
            jgxinghao = xh.getDown_typeNum();
        }
        if (xh.getUP_typeNum() != null) {
            xinghao = xh.getUP_typeNum();
        }
        if (xh.getDibuName() != null) {
            dbmingchen = xh.getDibuName();
        }
        if (xh.getNum() != null) {
            shuliang = xh.getNum() + "";
        }
        if (xh.getJG_danwei() != null) {
            chejian = xh.getJG_danwei();
        }
        if (xh.getGongyi() != null) {
            gongyi = xh.getGongyi();
        }
        if (xh.getJiaohuo_time() != null) {
            java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat(
                    "yyyy-MM-dd");
            jhtime = sf.format(xh.getJiaohuo_time());
        }

        if (xh.getJgtype() != null) {
            jgtype = xh.getJgtype();
        }
        if (xh.getBeizhu() != null) {
            beizhu = xh.getBeizhu();
        }
        if (xh.getKaidanren() != null) {
            xiadanren = xh.getKaidanren();
        }
    }
    if (gydid.equals("")) {
        Random rdm = new Random(System.currentTimeMillis());
        int intRd = Math.abs(rdm.nextInt()) % 9999 + 1;
        SimpleDateFormat formater = new SimpleDateFormat("yyMMdd");
        gydid = "SC" + formater.format(new Date()) + String.format("%04d", intRd);
    }
    if (xiadanren.equals("")) {
        com.jiang.bean.User user = null;
        if (null != session.getAttribute("user")) {
            user = (com.jiang.bean.User) session.getAttribute("user");
        }
        xiadanren = user.getRealName();

        java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat(
                "yyyy-MM-dd");
        xiadantime = sf.format(new Date());
    }

%>
<form id="form1" name="form1" method="post"
      action="SCGL_dolist?hidden=modify&type=SCGLWJG">
<input type="hidden" name="id" value="<%=id%>"/>

<div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%"
           id="tabs">
        <tr>
            <td class="tabs" align="center"><font color="white">修改外加工工艺单</font>
            </td>
            <td class="tabs"></td>
        </tr>
    </table>
</div>

<DIV id=UpdatePanel1>
<table align=center>
<tbody>
<tr>
    <td>
        <table cellSpacing=0 cellPadding=0 width=600
               align=center class="tb">
            <col style="width: 20%"/>
            <col style="width: 20%"/>
            <col style="width: 20%"/>
            <tbody>
            <tr>
                <td class=td3 align="center" style="width:10%">工艺单单号</td>
                <td><input type="text" size="24" id="gydid" value="<%=gydid%>"
                           onfocus="this.blur()" readonly="readonly" style="color:gray"
                           name="gydid" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td class=td3 width=40 align="center">类型</td>
                <td><select style="position: relative;" onchange="enableselect()"
                            id="jgtype" name="jgtype">
                    <%
                        String values[] = {"--请选择--", "半成品", "成品"};
                        for (int i = 0; i < values.length; i++) {
                    %>
                    <OPTION value="<%=values[i]%>" <%if (values[i].equals(jgtype)) {%> selected <%} %> ><%=values[i]%>
                    </OPTION>
                    <%}%>
                </select></td>
                <td id="zgmmerror">&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">加工型号</td>
                <td>

                    <div id="hide1" style="display:none">
                        <select class="flexselect" id="xinghao1"
                                name="jgxinghao">
                            <%
                                Map<String, List<String>> strs = new HashMap<String, List<String>>();
                                if (null != session.getAttribute("yl_bcp_cp_type_nums")) {
                                    strs = (Map<String, List<String>>) session.getAttribute("yl_bcp_cp_type_nums");
                                }
                                List<String> str1 = strs.get("str1");
                                for (int i = 0; i < str1.size(); i++) {
                            %>
                            <option <%if (str1.get(i).equals(jgxinghao)) {%> selected<%}%> ><%=str1.get(i) %>
                            </option>
                            <%
                                }
                            %>
                        </select></div>
                    <div id="hide2" style="display:none">
                        <select class="flexselect" id="xinghao2"
                                name="jgxinghao">
                            <%
                                List<String> str2 = strs.get("str2");
                                for (int i = 0; i < str2.size(); i++) {
                            %>
                            <option <%if (str2.get(i).equals(jgxinghao)) {%> selected<%}%> ><%=str2.get(i) %>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">原型号</td>
                <td>
                    <select class="flexselect" id="xinghao"
                            name="xinghao">
                        <%

                            List<String> str3 = strs.get("str3");
                            for (int i = 0; i < str3.size(); i++) {
                        %>
                        <option <%if (str3.get(i).equals(xinghao)) {%> selected <%}%> > <%=str3.get(i) %>
                        </option>
                        <%
                            }
                        %>
                    </select>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">底布名称</td>
                <td><input type="text" size="24" id="dbmingchen" value="<%=dbmingchen%>"
                           name="dbmingchen" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">数量</td>
                <td><input type="text" size="24" id="shuliang" value="<%=shuliang%>"
                           name="shuliang" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">加工单位</td>
                <td width="200px">
                    <select id="chejian"
                            name="chejian">
                        <option selected="selected" value="--请选择--">--请选择--</option>
                        <%
                            List<wJGGongYingShang> JGDW = new ArrayList<wJGGongYingShang>();
                            if (null != session.getAttribute("wjggyss")) {
                                JGDW = (List<wJGGongYingShang>) session.getAttribute("wjggyss");
                            }
                            for (int i = 0; i < JGDW.size(); i++) {
                        %>
                        <option <%if (JGDW.get(i).getDanweiname().equals(chejian)) {%> selected<%}%> ><%=JGDW.get(i).getDanweiname() %>
                        </option>
                        <%
                            }
                        %>
                    </select>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">工艺</td>
                <td width="200px"><select name="gongyi"
                                          id="gongyi" class="a2" style="position: relative">

                    <option selected="selected" value="--请选择--">--请选择--</option>
                    <%for (int i = 0; i < PublicFunc.wjgGYType.length; i++) {%>
                    <option value="<%=PublicFunc.wjgGYType[i] %>" <%if (gongyi.equals(PublicFunc.wjgGYType[i])) { %>
                            selected<%}%> ><%=PublicFunc.wjgGYType[i] %>
                    </option>
                    <%} %>
                </select>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center">交货日期</td>
                <td><input name="jhtime"
                           type="text" id="jhtime" class="Wdate" value="<%=jhtime %>"
                           onClick="WdatePicker()"
                           style="width: 180px; position: relative"/>
                </td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td class=td3 align="center" style="width:10%">备注</td>
                <td>
                    <textarea id="beizhu"
                              name="beizhu" rows="4"><%=beizhu%>
                    </textarea>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">下单人</td>
                <td><input type="text" size="24" id="xiadanren" value="<%=xiadanren%>"
                           onfocus="this.blur()" readonly="readonly" style="color:gray"
                           name="xiadanren" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">下单时间</td>
                <td><input type="text" size="24" id="xiadantime" value="<%=xiadantime%>"
                           onfocus="this.blur()" readonly="readonly" style="color:gray"
                           name="xiadantime" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            </tbody>
        </table>
    </td>
</tr>
<tr>
    <td>
        <table>
            <tbody>
            <tr>
                <td style="HEIGHT: 26px" width=100 align=right><INPUT
                        style="POSITION: relative; BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        onmouseover="ChangeImage(this,'images/Sure2.gif')"
                        onmouseout="ChangeImage(this,'images/Sure1.gif')"
                        src="images/Sure1.gif" type=image></td>
                <td style="HEIGHT: 26px" width=100 align=right><INPUT
                        style="POSITION: relative; BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        onmouseover="ChangeImage(this,'images/C2.gif')"
                        onmouseout="ChangeImage(this,'images/C1.gif')"
                        src="images/C1.gif" type="image"
                        onClick="backMenu();return false;"></td>

            </tr>
            </tbody>
        </table>
    </td>
    <td></td>
    <td></td>
</tr>
</tbody>
</table>
</div>
</form>
<script>
    <%
            String message = (String)request.getAttribute("modifywjgglerror");
             if (message != null && !"".equals(message)) {
                 request.removeAttribute("modifywjgglerror");
         %>

    alert("<%=message%>");
    <%}%>
</script>
</body>
</html>