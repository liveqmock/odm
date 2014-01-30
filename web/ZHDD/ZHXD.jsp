<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.jiang.bean.KHGL"%>
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
    <script type="text/javascript" src=js/validate/jquery.validate.js></script>
    <script type="text/javascript" src=js/validate/jquery.form.js></script>
    <script type="text/javascript" src=js/validate/valid.js></script>
    <link type="text/css" rel="stylesheet" href="js/validate/validate.css" />
    <script type="text/javascript" src="js/ChangeImageJS.js"></script>
    <link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"/>

    <link type="text/css" rel="stylesheet" href="CSS/table.css" />
    <link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />
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
        function docommit()
        {
            var f = document.getElementById("form1") ;
            var constr = "";
            var querykehu_id = document.getElementById("querykehu_id") ;
            var id = document.getElementById("id") ;
            var KeHuname = document.getElementById("KeHuname") ;

              if(id.value.length == 0)
              {
                  if(querykehu_id.value.length == 0)
                  {
                      alert("请输入客户编号!");
                      return false;
                  }
                  if(querykehu_id.value.length != 12)
                  {
                      alert("客户编号必须是12位数字!");
                      return false;
                  }
                  if(KeHuname.value.length == 0)
                  {
                      alert("请输入客户名称!");
                      return false;
                  }

                  constr = "&kehu_id="+querykehu_id.value;
              }

            f.action="XSGL_dolist?hidden=modify&type=ZHXD"+constr;
       //     f.target="mainframe";
         //   f.method="post";
            f.submit();
        }
        function cleardata()
        {
            $("#querykehu_id").attr("value","");
            //$("#queryKeHuname").attr("value","");
            $("#show_kehu_id").html("");
            $("#kehu_id").attr("value","");
            $("#id").attr("value","");
            $("#KeHuname").attr("value","");// 客户名称
            $("#suoshuquyu").attr("value","");//所属区域
            $("#telephone").attr("value","");// 办公电话1
            $("#telephone2").attr("value","");//  办公电话2
            $("#phone").attr("value","");//  移动电话
            $("#chuanzhen").attr("value","");//  传真
            $("#email").attr("value","");//  E-mail
            $("#suoxie").attr("value","");// 客户简称
            $("#jiesuanfangshi").attr("value","");// 结算方式
            $("#qiankuanshangxian").attr("value","");// 欠款上限
            $("#VIPkeHu").attr("value","");// VIP
            $("#address").attr("value","");// 地址
            $("#web").attr("value","");// 网址
            $("#seller").attr("value","");// 联系人
            $("#yewuyuan").attr("value","");// 业务员
        }
        function getKHGLInfo() {
            var kehu_id =  document.getElementById("querykehu_id").value;
            var KeHuname =  document.getElementById("queryKeHuname").value;

            if(KeHuname == "" && kehu_id== "" )
            {
                   alert("客户编号和客户名称须填写一个！");
                   return ;
            }
            $.ajax({
                type: "POST",//使用POST方法访问后台
                dataType: "json",//返回json格式的数据
                url: "XSGL_dolist?hidden=query&type=findXSGLBykehu_idAndKeHuname",//要访问的后台地址
                data: "kehu_id=" + kehu_id+"&KeHuname="+KeHuname,//要发送的数据
                success: function(result){//result为返回的数据，在这里做数据绑定
                    $("#show_kehu_id").html(result.kehu_id);
                    $("#kehu_id").attr("value",result.kehu_id);
                    $("#id").attr("value",result.id);
                    $("#KeHuname").attr("value",result.KeHuname);// 客户名称
                    $("#suoshuquyu").attr("value",result.suoshuquyu);//所属区域
                    $("#telephone").attr("value",result.telephone);// 办公电话1
                    $("#telephone2").attr("value",result.telephone2);//  办公电话2
                    $("#phone").attr("value",result.phone);//  移动电话
                    $("#chuanzhen").attr("value",result.chuanzhen);//  传真
                    $("#email").attr("value",result.email);//  E-mail
                    $("#suoxie").attr("value",result.suoxie);// 客户简称
                    $("#jiesuanfangshi").attr("value",result.jiesuanfangshi);// 结算方式
                    $("#qiankuanshangxian").attr("value",result.qiankuanshangxian);// 欠款上限
                    $("#VIPkeHu").attr("value",result.VIPkeHu);// VIP
                    $("#address").attr("value",result.address);// 地址
                    $("#web").attr("value",result.web);// 网址
                    $("#seller").attr("value",result.seller);// 联系人
                    $("#yewuyuan").attr("value",result.yewuyuan);// 业务员

                },
                error: function(result)
                {
                        alert("无客户信息！");
                }
            });
        }
    </script>

</head>
<body>
<div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%"
           id="tabs">
        <tr>
            <td class="tabs" align="center"><font color="white">展会下单管理</font></td>
        </tr>
    </table>
</div>
<div style="height: 6px"></div>
<div>
    <table cellpadding="0" cellspacing="0" width="100%" align="left"
           style="border: #b9c2d3 solid 1px; top: 4px">
        <tr>
            <td width="132" align="center" class="td1">客户编号</td>
            <td width="140" class="td2">
                <input  type="text" size = "24" id="querykehu_id" name="querykehu_id"/>
            </td>
            <td width="132" align="center" class="td1">客户名称</td>
            <td width="140" class="td2">
                <select class="flexselect" id="queryKeHuname"
                        name="queryKeHuname"   style="width:170px;position: relative;" >
                    <option></option>
                    <%
                        List<KHGL> khgls = new ArrayList<KHGL>();
                        if (null != session.getAttribute("KHGLList")) {
                            khgls = (List<KHGL>) session.getAttribute("KHGLList");
                        }
                        for(int i=0;i<khgls.size();i++)
                        {
                    %>
                    <option><%=((KHGL)khgls.get(i)).getKeHuname() %></option>
                    <%
                        }
                    %>
                </select>
            </td>
            <td width="80" class="td2"><input type="image"
                                              name="imgBtnSearch" id="imgBtnSearch"
                                              onmouseover="ChangeImage(this,'images/Search2.gif')"
                                              onmouseout="ChangeImage(this,'images/Search1.gif')"
                                              src="images/Search1.gif"
                                              style="border-width: 0px; position: relative;"  onclick="getKHGLInfo()"/>
            </td>
        </tr>
    </table>
</div>
<form id="form1" name="form1" method="post"
      action="XSGL_dolist?hidden=modify&type=ZHXD">
<input type="hidden" id="id" name="id" value=""/>
<input type="hidden" id="kehu_id" name="kehu_id" value=""/>
<DIV id=UpdatePanel1>
<table align=center  width=100%>
<tbody>
<tr>
    <td>
        <table cellSpacing=0 cellPadding=0 width=100%
               align=center class="tb" >
            <col style="width: 15%" />
            <col style="width: 15%" />
            <col style="width: 20%" />
            <col style="width: 15%" />
            <col style="width: 15%" />
            <col style="width: 20%" />
            <tbody>
            <tr><td class=td3 colspan="6" align="left">&nbsp;&nbsp;&nbsp;<font color="blue" size=3>客户资料</font>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="cdata" name="cdata" type="button" value=新客户 onclick="cleardata()" />
                <input id="commit" name="commit" type="button" value=保存客户并生成订货单 onclick="docommit()" /></td>

            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">客户条码</td>
                <td id="show_kehu_id">
                </td>
                <td>&nbsp;</td>
                <td class=td3 align="center" style="width:10%">所属区域</td>
                <td><input type="text" size="24" id="suoshuquyu" value=""
                           name="suoshuquyu" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">客户名称</td>
                <td><input type="text" size="24" id="KeHuname" value=""
                           name="KeHuname" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
                <td class=td3 align="center" style="width:10%">联系人</td>
                <td><input type="text" size="24" id="seller" value=""
                           name="seller" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">客户简称</td>
                <td><input type="text" size="24" id="suoxie" value=""
                           name="suoxie" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
                <td class=td3 align="center" style="width:10%">办公电话1</td>
                <td><input type="text" size="24" id="telephone" value=""
                           name="telephone" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">VIP等级</td>
                <td width="200px">
                    <select id="VIPkeHu"
                            name="VIPkeHu"   style="width:170px;position: relative;" >
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                        <option value="E">E</option>
                        <option value="F">F</option>
                    </select>
                </td>
                <td>&nbsp;</td>
                <td class=td3 align="center" style="width:10%">办公电话2</td>
                <td><input type="text" size="24" id="telephone2" value=""
                           name="telephone2" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">欠款上限</td>
                <td><input type="text" size="24" id="qiankuanshangxian" value=""
                           name="qiankuanshangxian" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
                <td class=td3 align="center" style="width:10%">传真</td>
                <td><input type="text" size="24" id="chuanzhen" value=""
                           name="chuanzhen" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">结算方式</td>
                <td width="200px">
                    <select id="jiesuanfangshi"
                            name="jiesuanfangshi"   style="width:170px;position: relative;" >
                        <option value="现金">现金</option>
                        <option value="月结">月结</option>
                    </select>
                </td>
                <td>&nbsp;</td>
                <td class=td3 align="center" style="width:10%">移动电话</td>
                <td><input type="text" size="24" id="phone" value=""
                           name="phone" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">业务员</td>
                <td><input type="text" size="24" id="yewuyuan" value=""
                           name="yewuyuan" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
                <td class=td3 align="center" style="width:10%">E-mail</td>
                <td><input type="text" size="24" id="email" value=""
                           name="email" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td class=td3 align="center" style="width:10%">公司地址</td>
                <td colspan="4"><input type="text" size="50" id="address" value=""
                                       name="address"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">公司网址</td>
                <td colspan="4"><input type="text" size="50"  id="web" value=""
                                       name="web"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr><td class=td3 colspan="6" align="left">&nbsp;&nbsp;&nbsp;<font color="blue" size=3>开票信息</font></td></tr>
            <tr>
                <td class=td3 align="center" style="width:10%">单位名称</td>
                <td><input type="text" size="24" id="danweimc" value=""
                           name="danweimc" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
                <td class=td3 align="center" style="width:10%">税号</td>
                <td><input type="text" size="24" id="shuihao" value=""
                           name="shuihao" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">开户银行</td>
                <td><input type="text" size="24" id="khbank" value=""
                           name="khbank" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
                <td class=td3 align="center" style="width:10%">帐号</td>
                <td><input type="text" size="24" id="zhanghao" value=""
                           name="zhanghao" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">备注</td>
                <td style="HEIGHT: 100px;width: 300px"><textarea id="xiangxi"
                                                                 name="xiangxi" rows="5"></textarea> </td>
                <td colspan="4">&nbsp;</td>
            </tr>
            <tr><td class=td3 colspan="6" align="left">&nbsp;&nbsp;&nbsp;<font color="blue" size=3>发货管理</font></td></tr>
            <tr>
                <td class=td3 align="center" style="width:10%">发货方式</td>
                <td width="200px">
                    <select id="gysname"
                            name="gysname"   style="width:170px;position: relative;" >
                        <option value="快递">快递</option>
                        <option value="货运">货运</option>
                    </select>
                </td>
                <td>&nbsp;</td>
                <td class=td3 align="center" style="width:10%">联系人</td>
                <td><input type="text" size="24" id="lianxiren" value=""
                           name="lianxiren" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">办公电话</td>
                <td><input type="text" size="24" id="dianhua" value=""
                           name="dianhua" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
                <td class=td3 align="center" style="width:10%">移动电话</td>
                <td><input type="text" size="24" id="yidong" value=""
                           name="yidong" maxlength="24"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class=td3 align="center" style="width:10%">收货地址</td>
                <td colspan="4"><input type="text" size="50" id="gysname_xh" value=""
                                       name="gysname_xh"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            </tbody>
        </table>
    </td>
</tr>
<tr>
    <td>

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
        String message = (String)request.getAttribute("addhkzlerror");
         if (message != null && !"".equals(message)) {
             request.removeAttribute("addhkzlerror");
     %>

    alert("<%=message%>");
    <%}%>
</script>
</body>
</html>
