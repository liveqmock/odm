<%@ page import="com.jiang.bean.User" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>inner2</title>
<script type="text/javascript">
//<!--
//注：每个嵌入页必须定义该方法，供父窗口调用，并且返回true或false来告之父窗口是否关闭
function Ok(){
	//var pwd =document.getElementById("backname").value;
    var id =document.getElementById("id").value;
    var newbupiid =document.getElementById("newbupiid").value;
    var username =document.getElementById("username").value;
    var datetime =document.getElementById("datetime").value;
    var constr = "&newbupiid="+newbupiid+"&username="+username
    +"&datetime="+datetime;
	//.parent.deletebypwd(pwd);
    window.parent.del("SCGL_dolist?hidden=kaijian&type=BCPKJAPPLY&id="+id+constr);
	//回调函数
    window.parent.JqueryDialog.SubmitCompleted("", true, false);
	return false;
}
//-->
</script>
</head>
<%
    String id = request.getParameter("id");
    String tiaoma = request.getParameter("tiaoma");
    String mishu = request.getParameter("mishu");
    String kjmishu = request.getParameter("kjmishu");
    String newbupiid="";
    User user = (User)request.getSession().getAttribute("user");
    String username = "";
    String datetime  = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    if(null != user)
    {
            username = user.getRealName();
    }

    Random rdm = new Random(System.currentTimeMillis());
    int intRd = Math.abs(rdm.nextInt())%9999+1;
    SimpleDateFormat formater = new SimpleDateFormat("yyMMdd");
    if(tiaoma.startsWith("BCP"))
         newbupiid =  "BCP"+formater.format(new Date())+String.format("%04d", intRd);
    else
        newbupiid =  "CP"+formater.format(new Date())+String.format("%04d", intRd);


%>
<body style="margin:0px;padding:0px;">
                                                                           <div style="height: 20px"></div>

<input type="hidden" name="id" id="id" value=<%=id%>  />
<input type="hidden" name="tiaoma" id="tiaoma" value=<%=tiaoma%>  />
<input type="hidden" name="mishu" id="mishu" value=<%=mishu%>  />
<input type="hidden" name="kjmishu" id="kjmishu" value=<%=kjmishu%>  />
 <input type="hidden" name="username" id="username" value=<%=username%>  />
 <input type="hidden" name="datetime" id="datetime" value=<%=datetime%>  />
<input type="hidden" name="newbupiid" id="newbupiid" value=<%=newbupiid%>  />
<form id="form1" action="" method="post">
     <table align="center" border="1">
         <tr>
             <td>原布匹编号：</td>
             <td  style="width: 180px" align="center"> <%=tiaoma%></td>
         </tr>

         <tr>
             <td>原米数：</td>
             <td align="center"><%=mishu%></td>
         </tr>

         <tr>
             <td>剪出新布匹编号：</td>
             <td align="center" > <font color="red"><%=newbupiid%> </font></td>
         </tr>
         <tr>
             <td>剪出新米数：</td>
             <td align="center"><%=kjmishu%></td>
         </tr>
         <tr>
             <td>开剪人：</td>
             <td align="center"><%=username%></td>
         </tr>
         <tr>
             <td>开剪时间：</td>
             <td align="center"><%=datetime%></td>
         </tr>
     </table>


</form>
</body>
</html>
