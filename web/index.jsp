<%@ page import="com.jiang.util.PublicFunc" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">

<title>宜纺布艺管理系统登录</title>
<script type="text/javascript" src="js/changeImg.js"></script>

<style type="text/css">
{
background:fixed no-repeat
}
</style>
<script>  

function  pageOnLoad(){
	 <%
     String message = (String)session.getAttribute("message");
		if (message != null && !"".equals(message)) {
	%>  
	//if(top.frames.length == 0)
     alert("<%=message%>");
 <%}%>
 
    try{
        if(top.frames.length > 0){
            top.document.location.href=document.location.href;
        }
    }catch(e){}
}
</script> 
<%
	String uname="";
	String upwd="";
	if(null !=session.getAttribute("uname"))
	{
		uname = (String)session.getAttribute("uname");
	}
	if(null !=session.getAttribute("upwd"))
	{
		upwd = (String)session.getAttribute("upwd");
	}

%>
</head>
<body style="azimuth: center; background: #d1d9e6;" onload= "pageOnLoad()">
	<form name="form1" method="post" action="<%=request.getContextPath() %>/Login_login" id="form1">
		<table width="950" align="center"
			style="height: 576px; azimuth: center" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td colspan="3"
					style="background-image: url(images/4_01.gif); width: 950px; height: 180px; azimuth: center;"></td>
			</tr>
			<tr>
				<td
					style="background-image: url(images/4_02.gif); height: 216px; width: 260px;"></td>
				<td
					style="background-image: url(images/21_03.gif); height: 216px; width: 416px;">
					<table
						style="left: 50px; position: relative; top: 3px; width: 339px;">
						<tr>
							<td
								style="font-size: 14px; color: #ffffff; text-align: center; width: 58px;">
								<span id="textName"  >用户名:</span>
							</td>
							<td style="height: 25px; width: 168px;"><input
								name="userName" type="text"  maxlength="50" id="txtName" tabindex="1"
								style="width: 150px;" value="<%=uname %>" /></td>
							<td rowspan="3" style="width: 90px;"><input type="image"
								tabindex="4" src="images/12_06.gif"
								onmouseover="this.src='images/3_06.gif'"
								onmouseout="this.src='images/12_06.gif'" /></td>
						</tr>
						<tr>
							<td
								style="font-size: 14px; color: #ffffff; text-align: center; width: 58px; height: 28px;">
								<span id="Label1">密 码:</span>
							</td>
							<td style="height: 28px; width: 168px;"><input
								name="passWord"  type="password"  id="passWord" value="<%=upwd %>" maxlength="16" tabindex="2"
								style="width: 150px;" /></td>
						</tr>
						<tr>
							<td
								style="font-size: 14px; color: #ffffff; text-align: center; width: 58px;">
								<span id="dd">单 位:</span>
							</td>
							<td>
                                <%
                                    String index = "1";

                                    Cookie comchoiese =
                                            PublicFunc.getCookieByName(request,  "companychoise");
                                    if(comchoiese != null)
                                    {
                                        index =  comchoiese.getValue();
                                    }
                                    System.out.println(index);
                                %>
								<select style="width: 66px" name="company" id="company">
                                    <%
                                        String values[] = {"森泰", "宜纺", "管理员"};
                                        for(int i=0;i<3;i++){ %>
								<option value="<%=i%>" <%if(Integer.valueOf(index) == i) {%> selected <%}%> class="">
                                        <%=values[i]%> </option>
                                   <%}%>
                                </select>
							</td>
						</tr>
						<tr>
							<td
								style="font-size: 14px; color: #ffffff; text-align: center; width: 58px;">
								<span id="ww">验证码:</span>
							</td>
							<td style="height: 25px; vertical-align: middle; width: 168px;">
								<input name="veryCode" type="text"  maxlength="4" id="veryCode" tabindex="3"
								style="width: 60px;" />&nbsp; &nbsp; <img
								style="cursor: hand; width: 67px; height: 25px; azimuth: center; vertical-align: middle;"
								id="veryCodeimg" name="veryCodeimg" src="<%=request.getContextPath() %>/Login_makeImg"
								alt="看不清，请点击我！" onclick="this.src=this.src+'?'" />
							</td>
						</tr>
					</table>
				</td>
				<td
					style="background-image: url(images/4_04.gif); height: 216px; width: 274px;"></td>
			</tr>
			<tr>
				<td colspan="3"
					style="background-image: url(images/2_05.gif); height: 180px; width: 950px; background-repeat: repeat-x;"></td>
			</tr>
		</table>
	</form>
	
		<script>  
       
	</script>
</body>
</html>

