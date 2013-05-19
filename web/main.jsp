<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="User" class="com.jiang.bean.User"/>

<%@page import="com.jiang.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>   
<head>  
<meta  http-equiv="Expires"  CONTENT="0">   
<meta  http-equiv="Cache-Control"  CONTENT="no-cache">   
<meta  http-equiv="Pragma"  CONTENT="no-cache">    
<title>宜纺布艺管理系统</title>
<link href="/odm/CSS/demo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/odm/js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="/odm/js/ChangeImageJS.js"></script>
<script type="text/javascript" src="/odm/js/changeImg.js"></script>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache");
response.setDateHeader("Expires", 0);
%>
<script type="text/javascript">
	function initMenu() {
		$(".menuChild").eq(0).show('normal');
		//test$(".menuChild:first").show();menu
		$(".menuChild:first").show();	
		$(".menu").click(function() {
			var $menuChild = $(this).next();
			if ($menuChild.is('div') && $menuChild.is(':visible')) {
				$menuChild.hide('normal');
				return false;//防止类似标签<a>的链接
			}
			if ($menuChild.is('div') && (!$menuChild.is(':visible'))) {
				$('.menuChild:visible').hide('normal');
				$menuChild.show('normal');
				return false;
			}
		});
		$(".split_button")
				.click(
						function() {
							var $left = $(".left");

							if ($left.is('div') && $left.is(':visible')) {
								$left.hide('normal');
								$(".split_button")
										.css("background",
												"url(/odm/images/new4.png) no-repeat center");
								return false;
							}
							if ($left.is('div') && (!$left.is(':visible'))) {
								$('.left:visible').hide('normal');
								//ps:header footer 的边框各为5 所以减去 110 (header footer 为 75 25) 不需要边框可以在这个地方减去100 css 做相应改动
								$left.height($(window).height() - 110);//防止浏览器右侧按钮闪动  
								$left.show('normal');
								$(".split_button")
										.css("background",
												"url(/odm/images/split_close.gif) no-repeat center");
								return false;
							}
						});
	}
	function initContentSize() {
		$(".content").height($(window).height() - 110);//用$(document).height()-100 在IE下尺寸不对
		//$(".content").height($(document).height()-100);
	}
	$(function() {
		initContentSize();
		initMenu();
	});
	<%
	com.jiang.bean.User user = null;
	String quanxian = "";
	String bumen = "";

     int  jj = -1;
	if(null != session.getAttribute("user"))
	{
		user = (com.jiang.bean.User)session.getAttribute("user") ;
	}
	else{
		response.sendRedirect("/odm/index.jsp");
	}
	%>
	function docommit( i,  j)
	{
		var f=document.createElement("form");
		f.action="DisPatch_getUrl?i="+i+"&j="+j;
		f.target="mainframe";
		f.method="post";
		document.body.appendChild(f);
		f.submit();
	}
	
	function doMenucommit( i)
	{/*
		var f=document.createElement("form");
		f.action="DisPatch_getMenuUrl?i="+i;
		f.target="mainframe";
		f.method="post";
		document.body.appendChild(f);
		f.submit();*/
	}
	var clickeddiv = null;
	var clickeddiv_son =  null;
	function ChangeBG(a, img)
	{
		if(img == 1)
			{
			if(clickeddiv != a)
			a.style.background = "url(/odm/images/menu_bg_move.png)";
			}
		else
			a.style.background = "url(/odm/images/menuson_bg_P.png)";
			
	}
	
	
	function ChangeBGBack(a, img)
	{
		if(img == 1)
		{
			if(clickeddiv != a)
			{
				a.style.background = "url(/odm/images/menu_bg.png)";
			}
			
		}
		else
		{
			if(clickeddiv_son != a)
			{
				a.style.background = "url(/odm/images/menuson_bg.png)";
			}
		}
			
	}
	function ClickMenu(a, img)
	{
		if(img == 1)
		{
			if(clickeddiv != null && clickeddiv != a)
			{
				clickeddiv.style.background = "url(/odm/images/menu_bg.png)";
			}
			if(clickeddiv_son != null)
			{
				//clickeddiv_son.style.background = "url(/odm/images/menuson_bg.png)";
				//clickeddiv_son = null;
			}
			a.style.background = "url(/odm/images/menu_bg_P.png)";
			clickeddiv = a;
		}
		else
		{
			if(clickeddiv_son != null && clickeddiv_son != a)
			{
				clickeddiv_son.style.background = "url(/odm/images/menuson_bg.png)";
			}
			clickeddiv_son = a;
		}
	}
	function tick() {
		 var today=new Date();
		 var month=today.getMonth()+1;
		 var year, date, hours, minutes, seconds;
		 var intHours, intMinutes, intSeconds;
		 var week=new Array();
		     week[0]="星期天 ";
		     week[1]="星期一 ";
		     week[2]="星期二 ";
		     week[3]="星期三 ";
		     week[4]="星期四 ";
		     week[5]="星期五 ";
		     week[6]="星期六 ";
		 intHours = today.getHours();
		 intMinutes = today.getMinutes();
		 intSeconds = today.getSeconds();
		 year=today.getFullYear();
		 date=today.getDate();
		 var time;
		 if (intHours == 0) {
		  hours = "00:";
		 } 
		 else if (intHours < 10) { 
		  hours = "0" + intHours+":";
		 } 
		 else {
		  hours = intHours + ":";
		 }
		 if (intMinutes < 10) {
		  minutes = "0"+intMinutes+":";
		 } 
		 else {
		  minutes = intMinutes+":";
		 }
		 if (intSeconds < 10) {
		  seconds = "0"+intSeconds+" ";
		 } 
		 else {
		  seconds = intSeconds+" ";
		 } 
		 //根据不同的时间显示不同的问候。
		 //下面采用自己总结的测试纠正法对time进行赋值
		 time="午夜好";
		 if(today.getHours()<=22)  time="晚上好";
		 if(today.getHours()<=19)  time="傍晚好";
		 if(today.getHours()<=17)  time="下午好";
		 if(today.getHours()<=14)  time="中午好";
		 if(today.getHours()<=12)  time="上午好";
		 if(today.getHours()<=8)   time="早上好";
		 if(today.getHours()<=5)   time="凌晨好";
		 timeString="今天是："+year+"年"+month+"月"+date+"日  "+hours+minutes+seconds+week[today.getDay()]+time;
		 var cl = document.getElementById("Clock");
		 cl.innerHTML = timeString;
		 window.setTimeout("tick();", 1000);
		 }
		 

	//$(window).resize(function(){
	//	$(".content").height($(window).height()-110);
	//});
</script>
</head>

<%
	String menuitems[] = {  "计划管理", "采购管理","生产管理", "生产仓库",
			"销售管理", "设计管理",  "财务管理",  "综合管理","系统管理", "成品仓库" } ;
%>
</head>
<body onload="tick()">

	<div id="container" style="position: relative;">
		<div id="header">
			<form action="Login_loginOut">

				<table  width="100%" align="center" border="0" cellpadding="0"
					cellspacing="0" style="height: 62px">

					<tr style="background-image: url(/odm/images/top-bg.gif)">
						<td style="height: 64px; width: 100%; ">
						<%
						int index =  0;
						if(user !=null && user.getQuanxian() != null )
						{
							quanxian  = user.getQuanxian();
						}
						String mainQuanxian = "";
						if(user !=null && user.getBumen() != null )
						{
							bumen  = user.getBumen();
							if(bumen.contains(PublicFunc.STR_BUMEN_XT))  mainQuanxian = "1111111111";
							if(bumen.contains(PublicFunc.STR_BUMEN_JH))  mainQuanxian = "1000000000";
							if(bumen.contains(PublicFunc.STR_BUMEN_CG))  mainQuanxian = "0100000000";
							if(bumen.contains(PublicFunc.STR_BUMEN_SC))  mainQuanxian =  "0010000000";
							if(bumen.contains(PublicFunc.STR_BUMEN_CK))  mainQuanxian =  "0001000000";
							if(bumen.contains(PublicFunc.STR_BUMEN_XS))  mainQuanxian =  "0000100000";
							if(bumen.contains(PublicFunc.STR_BUMEN_SJ))  mainQuanxian =   "0000010000";
							if(bumen.contains(PublicFunc.STR_BUMEN_CW))  mainQuanxian = "0000001000";
							if(bumen.contains(PublicFunc.STR_BUMEN_ZH))  mainQuanxian =  "0000000100";
						}
						index = mainQuanxian.indexOf("1");
						if(user !=null && user.getCompany() != null && user.getCompany().contains("0"))
						{	%>
						    <input type="image" 
							name="top2$logobtn" id="top2_logobtn" src="/odm/images/logo2.png"
							style="border-width: 0px; position: relative; left: 0px;" />
						<%} else{%>
							<input type="image" 
							name="top2$logobtn" id="top2_logobtn" src="/odm/images/logo.gif"
							style="border-width: 0px; position: relative; left: 0px;" onclick="return false;"/>
						<%} %>
							&nbsp;
						</td>
						<td style="height: 64px; width: 119px;">
							<div
								style="position: relative; left: 0px; top: -15px; width: 136px; height: 10px;">
								<table style="width: 138px" border="0" cellpadding="0"
									cellspacing="0">
									<tr valign="top">
										<td align="right" style="width: 76px; height: 18px" ><input
											type="image"  
											onmouseover="ChangeImage(this,'/odm/images/zhuxiao1.gif ')"
											onmouseout="ChangeImage(this,'/odm/images/zhuxiao0.gif ')" 
											src="/odm/images/zhuxiao0.gif" style="border-width: 0px;" onclick="alert('您已经成功退出!');"/></td>
										<td align="right" style="height: 18px"><input
											type="image"  
											onmouseover="ChangeImage(this,'/odm/images/help_02.gif ')"
											onmouseout="ChangeImage(this,'/odm/images/help_01.gif ')"
											src="/odm/images/help_01.gif" style="border-width: 0px;" onclick="return false;" /></td>
									</tr>
								</table>
							</div>

							<div
								style="position: relative; right: 0px; top: 10px; width: 140px; height: 24px; background-image: url(/odm/images/msg.gif);">
								<div style="position: relative; left: 65px; top: 5px;" ><a
											id="top21" href="#"  
											target="mainframe" style="color: White; font-size: 12px"></a>
											<font color=white>您有来信0条</font>
										</div>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
			<div id="sidebar">
			<div><br><center><%=user ==null?"null":user.getRealName() %> 欢迎登陆
			<%if(user !=null && user.getCompany() != null && user.getCompany().contains("0")){ %>森泰<%}else{ %>宜纺<%} %>系统</center><br></div>
				<%
					for (int i = 0; i < menuitems.length; i++) {
						if(mainQuanxian != "" && mainQuanxian.length() == 10 && mainQuanxian.charAt(i) == '1')
						{
				%>
					<div class="menu" onmouseover="ChangeBG(this, 1)" onmouseout="ChangeBGBack(this, 1)"
					onclick="ClickMenu(this, 1);doMenucommit(<%=i %>);" >
						<div><%=menuitems[i]%></div>
					</div>
					<div class="menuChild">
						<%
							for (int j = 0; j < PublicFunc.sunmenus[i].length; j++) {
								if(user.getBumen().contains(PublicFunc.STR_BUMEN_XT))
								{
									quanxian = "1111111111111";
								}
								if(quanxian != "" && quanxian.length() >= PublicFunc.sunmenus[i].length && quanxian.charAt(j) == '1')
								{
                                    if(jj == -1)
                                    {
                                        jj = j;
                                    }
						%>
						<div  onmouseover="ChangeBG(this, 2)" onmouseout="ChangeBGBack(this, 2)" 
					onclick="ClickMenu(this, 2); docommit(<%=i%>, <%=j%>);" >
								<%=PublicFunc.sunmenus[i][j]%>
						</div>
						<%
								}
							}
						%>
					</div>
					<%
						}
					}
				%>
			<div id=Clock></div>

			</div>
			<div id="content">
				<iframe name="mainframe" width=100% height=100%
					style="border-color: white; border: thick;" src="DisPatch_getUrl?i=<%=index %>&j=<%=jj%>"></iframe>
			</div>
		<div id="footer">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				align="center">
				<tr style="height: 28px; background-color: #224684;">
					<td style="width: 5px"><img src="/odm/images/boder.gif" /></td>
					<td
						style="background-color: #224684; font-size: 12px; color: #ffffff; height: 25px; width: 901px;"
						align="center">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
						 &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
						  &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Copyright @ 1998 - 2013
						yifangbuyi. All Rights Reserved.&nbsp; &nbsp;<%if(user !=null && user.getCompany() != null && user.getCompany().contains("0")){ %>森泰布艺<%}else{ %>宜纺布艺<%} %> &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp;
					<td style="width: 124px; height: 30px;">
						<% if(user !=null && user.getCompany() != null && user.getCompany().contains("0"))
						{	%>
							<img
						src="/odm/images/foot2.png" style="width: 84px; height: 14px" />
						<%} else{%>
							<img
						src="/odm/images/bottomLogo.gif" style="width: 84px; height: 14px" />
						<%} %>
						</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>