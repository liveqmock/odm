<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="java.util.*"%>
<%@ page import="com.jiang.bean.ZLGLCPZL" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>详细订单管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
    <link type="text/css" rel="stylesheet" href="js/validate/validate.css" />
    <script type="text/javascript" src="js/ChangeImageJS.js"></script>
    <link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"/>

    <link type="text/css" rel="stylesheet" href="CSS/table.css" />
    <link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />
    <link type="text/css" rel="stylesheet" href="CSS/zsz_table.css" />
    <link rel="stylesheet" href="CSS/flexselect.css" type="text/css" media="screen" />
    <script src="js/select/liquidmetal.js" type="text/javascript"></script>
    <script src="js/select/jquery.flexselect.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("select.flexselect").flexselect();
            // $("input:text:enabled:first").focus();
        });
        function readyshow()
        {
            $("select.flexselect").flexselect();
            //$("input:text:enabled:first").focus();
        }

        function Ok(){
            //回调函数
            var gt = document.getElementById("JiaGeDDL").value;
            var t_tiaoma= document.getElementById("huohao2").value.trim();
            var MiShuText =   document.getElementById("MiShuText").value.trim();
            var DanJiaText =   document.getElementsByName("DanJiaText")[gt-1].value.trim();
            var BeiZhuText =  document.getElementById("BeiZhuText").value;
            if(t_tiaoma.length < 2)
            {
                alert("货号不能为空！");
                return false;
            }
            if(MiShuText.length == 0)
            {
                alert("米数不能为空！");
                return false;
            }
            if(MiShuText== 0)
            {
                alert("米数不能为0！");
                return false;
            }
            if(DanJiaText.length == 0)
            {
                alert("单价不能为空！");
                return false;
            }
            if(DanJiaText== 0)
            {
                alert("单价不能为0！");
                return false;
            }
            var constr = "XSGL_dolist?hidden=add&type=ZHDDdetail&"
            + "huohao="+t_tiaoma+"&danjia="+DanJiaText+"&mishu="+MiShuText
                    +"&jiageleixing="+gt+"&beizhu="+BeiZhuText;
            window.parent.del(constr);
            window.parent.JqueryDialog.SubmitCompleted("", true, false);
            return false;
        }
    </script>

    <script type="text/javascript">
        function checkFloat(vv, val)
        {
            if(isNaN(val))
            {
                vv.value=vv.value.substr(0, vv.value.length-1);
                return false;
            }
            return true;
        }


        function backMenu() {
            var f = document.createElement("form");
            f.action = "DisPatch_getUrl?i=0&j=1";
            f.target = "mainframe";
            f.method = "post";
            document.body.appendChild(f);
            f.submit();
        }

        function enableselect()
        {
            var ui1 = document.getElementById("hide1");
            var ui2 = document.getElementById("hide2");
            var ui3 = document.getElementById("hide3");
            var ui4 = document.getElementById("hide4");
            var ui5 = document.getElementById("hide5");
            var gt = document.getElementById("JiaGeDDL");

            var value = gt.value;
            if(value == "1")
            {
                ui1.style.display="";//显示
                ui2.style.display="none";//隐藏
                ui3.style.display="none";
                ui4.style.display="none";
                ui5.style.display="none";
            }
            if(value == "2")
            {
                ui1.style.display="none";//
                ui2.style.display="";//
                ui3.style.display="none";
                ui4.style.display="none";
                ui5.style.display="none";
            }
            if(value == "3")
            {
                ui1.style.display="none";//
                ui2.style.display="none";//
                ui3.style.display="";
                ui4.style.display="none";
                ui5.style.display="none";
            }
            if(value == "4")
            {
                ui1.style.display="none";//
                ui2.style.display="none";//
                ui3.style.display="none";
                ui4.style.display="";
                ui5.style.display="none";
            }
            if(value == "5")
            {
                ui1.style.display="none";//
                ui2.style.display="none";//
                ui3.style.display="none";
                ui4.style.display="none";
                ui5.style.display="";
            }
        }
       function  dosearch()
        {
            var f = document.createElement("form")
            var t_tiaoma = document.getElementById("t_tiaoma").value;
            if(t_tiaoma.trim().length == 0)
            {
                alert("货号不能为空!");
                return false;
            }
            f.action = "DisPatch_getCPByTypeNum?t_tiaoma="+t_tiaoma;
           //f.target = "mainframe";
            f.method = "post";
            document.body.appendChild(f);
            f.submit();
        }

    </script>
</head>
<body onload="enableselect()">
<%
   String  id = "";
    String t_tiaoma="";
    ZLGLCPZL cpzl = null;
    String huohao = "";
    String tiaoma = "";
    String chenpmc = "";
    String guige = "";
    String sehao = "";
    Float z_jia = 0.0f;
    Float l_jia = 0.0f;
    Float s_jia = 0.0f;
    Float p_jia = 0.0f;
    if(null != request.getSession().getAttribute("ZLGLCPZL_search"))
    {
        cpzl = (ZLGLCPZL) request.getSession().getAttribute("ZLGLCPZL_search");
       if(cpzl.getType_num() != null)  huohao = cpzl.getType_num();
        if(cpzl.getTiaoxingma() != null)  tiaoma = cpzl.getTiaoxingma();
        if(cpzl.getPinming() != null)   chenpmc = cpzl.getPinming();
        if(cpzl.getGuige() != null)   guige = cpzl.getGuige();
        if(cpzl.getColor() != null)  sehao = cpzl.getColor();
        if(cpzl.getZhengjuanjia() != null)   z_jia = cpzl.getZhengjuanjia();
        if(cpzl.getLingjianjia() != null)   l_jia = cpzl.getLingjianjia();
        if(cpzl.getBaimijia() != null)   s_jia = cpzl.getBaimijia();
        if(cpzl.getPifajia() != null)  p_jia = cpzl.getPifajia();

        request.getSession().removeAttribute("ZLGLCPZL_search");
        request.getSession().setAttribute("ZLGLCPZL_search1", cpzl);
    }


%>
<form id="form1" name="form1" method="post"
      action="">
    <input type="hidden" name="id" id="id" value="<%=id%>"/>
    <input type="hidden" name="huohao2" id="huohao2" value=<%=huohao%> />
        <table width="100%" align="center" style="padding-top:10px">
            <tr>
                <td>

                    <table align="center" width="450" class="tb">
                        <tr align="center">
                            <td colspan="3" align="center" width="450" class="td0">
                                <b>订&nbsp;单&nbsp;明&nbsp;细</b>
                            </td>
                        </tr>

                        <tr align="center">
                            <td height="30" width="180" align="right">输入货号或条码：</td>
                            <td width="5"></td>
                            <td align="left">
                                <select style="position: relative;"   class="flexselect"
                                        id="t_tiaoma"  name="t_tiaoma"  style="width:110px;"  onchange="changesss()">
                                    <%
                                        List<ZLGLCPZL> cps = new ArrayList<ZLGLCPZL>();
                                        cps =    (List<ZLGLCPZL>)request.getSession().getAttribute("cpzls");
                                        for(int i=0;i<cps.size();i++){
                                            String t_num =    cps.get(i).getType_num();
                                            String tiaoma_a =   cps.get(i).getTiaoxingma();
                                    %>
                                    <OPTION value="<%=t_num%>" <%if (t_num.equals(t_tiaoma)) {%> selected <%} %> ><%=t_num%></OPTION>
                                    <OPTION value="<%=tiaoma_a%>" <%if (tiaoma_a.equals(t_tiaoma)) {%> selected <%} %> ><%=tiaoma_a%></OPTION>
                                    <%}%>
                                </select>

                                <input type="button" name="search" value="显示资料" id="search" style="width:90px;" onclick="dosearch()"/>
                            </td>
                        </tr>
                        <tr align="center">
                            <td height="30" width="180" align="right">货品条码：</td>
                            <td width="5"></td>
                            <td align="left"><span id="HuoPinTiaoMaLab" size="12"><%=tiaoma%></span><!--通过货号获得，在此显示之--></td>
                        </tr>
                        <tr align="center">
                            <td height="30" width="180" align="right">货号：</td>
                            <td width="5"></td>
                            <td align="left"><span id="HuoHaoLab" size="12"><%=huohao%></span><!--通过货号获得，在此显示之--></td>
                        </tr>
                        <tr align="center">
                            <td height="30" width="180" align="right">成品名称：</td>
                            <td width="5"></td>
                            <td align="left"><span id="PinMingLab" size="12"><%=chenpmc%></span><!--通过货号获得，在此显示之--></td>
                        </tr>
                        <tr align="center">
                            <td height="30" width="180" align="right">规格/幅宽：</td>
                            <td width="5"></td>
                            <td align="left"><span id="GuiGeLab" size="12"><%=guige%></span><!--通过货号获得，在此显示之--></td>
                        </tr>
                        <tr align="center">
                            <td width="180" align="right" style="height: 32px">色&nbsp;&nbsp;号：</td>
                            <td width="5" style="height: 32px"></td>
                            <td align="left" style="height: 32px"><span id="SeHaoLab" size="12"><%=sehao%></span><!--通过货号获得，在此显示之--></td>
                        </tr>
                        <tr align="center">
                            <td height="60" width="180" align="right">价格类型：</td>
                            <td width="5"></td>
                            <td align="left">
                                <select  name="JiaGeDDL"   id="JiaGeDDL" onchange="enableselect()"  >
                                    <option selected="selected" value="1">整卷价</option>
                                    <option value="2">零剪价</option>
                                    <option value="3">300价</option>
                                    <option value="4">批发价</option>
                                    <option value="5">自定义价</option>
                                </select>
                            </td>
                        </tr>
                        <tr align="center">
                            <td height="30" width="180" align="right">单价：</td>
                            <td width="5"></td>
                            <td align="left">
                                <div id="hide1" >
                                    <input name="DanJiaText" type="text" id="DanJiaText1" value="<%=z_jia %>"
                                            onfocus="this.blur()" readonly="readonly"  style="color:gray" />
                               </div>
                                <div id="hide2" >
                                    <input name="DanJiaText" type="text" id="DanJiaText2" value="<%=l_jia %>"
                                            onfocus="this.blur()" readonly="readonly"  style="color:gray" />
                                </div>
                                <div id="hide3" >
                                    <input name="DanJiaText" type="text" id="DanJiaText3" value="<%=s_jia %>"
                                            onfocus="this.blur()" readonly="readonly"  style="color:gray" />
                                </div>
                                <div id="hide4" >
                                    <input name="DanJiaText" type="text" id="DanJiaText4" value="<%=p_jia %>"
                                            onfocus="this.blur()" readonly="readonly"  style="color:gray" />
                                </div>
                                <div id="hide5" >
                                    <input name="DanJiaText" type="text" id="DanJiaText5" onkeyup="return checkFloat(this,value)"  size="12" />
                                </div>
                            </td>
                        </tr>
                        <tr align="center">
                            <td height="30" width="180" align="right">米&nbsp;&nbsp;数：</td>
                            <td width="5"></td>
                            <td align="left"><input name="MiShuText" type="text" id="MiShuText"  onkeyup="return checkFloat(this,value)"  size="12"  size="12" /></td>
                        </tr>
                        <tr>
                        </tr>
                        <tr align="center">
                            <td height="30" width="180" align="right">备&nbsp;&nbsp;注：</td>
                            <td width="5"></td>
                            <td align="left"><input name="BeiZhuText" type="text" id="BeiZhuText" size="12" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

    </div>
</form>
<script>
    <%
        String message = (String)request.getAttribute("modifydjglerror");
         if (message != null && !"".equals(message)) {
             request.removeAttribute("modifydjglerror");
     %>

    alert("<%=message%>");
    <%}%>
</script>
</body>
</html>