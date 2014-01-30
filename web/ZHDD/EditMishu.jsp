<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="java.util.*"%>
<%@ page import="com.jiang.bean.ZLGLCPZL" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>修改米数</title>
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
        function Ok(){
            //回调函数
            var id = document.getElementById("id").value;
           var mishu= document.getElementById("mishu").value.trim();

            if(isNaN(mishu))
            {
                alert("米数不合法！");
                return false;
            }
            if(mishu.length == 0)
            {
                alert("米数不能为空！");
                return false;
            }
            if(mishu== 0)
            {
                alert("米数不能为0！");
                return false;
            }

            var constr = "XSGL_dolist?hidden=modify&type=ZHDDdetail&"
            + "id="+id+"&mishu="+mishu;
            window.parent.del(constr);
            window.parent.JqueryDialog.SubmitCompleted("", true, false);
            return false;
        }
    </script>

    <script type="text/javascript">
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
</head>
<body  >
<%
   String  id = "";
    String mishu = "";
    if(null != request.getParameter("id"))
    {
        id = (String)request.getParameter("id");
    }
    if(null != request.getParameter("mishu"))
    {
        mishu = (String)request.getParameter("mishu");
    }

%>
<form id="form1" name="form1" method="post"
      action="">
    <input type="hidden" name="id" id="id" value="<%=id%>"/>
              请输入米数： </br><input type="type"   onkeyup="return checkFloat(this,value)" name="mishu" id="mishu" value="<%=mishu%>" />
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