<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>网站后台管理系统</title>
<meta 
content="中科商务网（www.zk71.com）成立于2000年，是国内华南地区最大的网上商务平台和始终领先的b2b电子商务服务提供商，依托专注和权威的商务信心专业服务及先进的网络技术，为全国中小型企业搭建诚信的供需平台及全面的网络营销解决方案,提供 最新供应，求购，代理，资讯，合作，二手，库存，报价，加工。" 
name="description"/>
<meta 
content="中科商务网(www.zk71.com)，b2b，网上贸易，网上交易，交易市场，在线交易，买卖信息，贸易机会，商业信息，供求信息，采购，求购信息，供应信息，加工合作，代理，商机，行业资讯，商务服务，商务网，客户管理，定单管理，财务管理" 
name="keywords"/>

<link href="CSS/loginV2.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">

function SubmitKeyClick(evt) 
{    
   evt = evt?evt:window.event;   
   if (evt.keyCode == 13) 
   {       
	 document.getElementById("BtnOK").click();
	 return false;
   }   
}
</script>
</head>

<body>
    <form name="form1" method="post" action="VIPLogin.aspx" onsubmit="javascript:return WebForm_OnSubmit();" id="form1">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTA0NTMwNTg3Mw8WAh4LT3BlYXRlckNvZGUFATUWAgIBD2QWAgILDxYCHgRUZXh0BQUzKzI9P2QYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgEFBUJ0bk9L3VO/jgm5OAduyBYGszDOhAVkGxQ=" />
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>


<script src="/WebResource.axd?d=J8n9fd3t649Eqh5lsws0YtyAejnPLGN5q1nnCX8RGeybRZoc3Z5bk2ic7mU0fcYm26eljBkF4cHWrNioRK1Uz50prq81&amp;t=634678368240733912" type="text/javascript"></script>


<script src="/WebResource.axd?d=luSLOfMW4RPzR44OlXJlgMPKLJTLsuvuouvUoQk5y-cNeGSwAnpaT3sjM5fYoDQk2dgV-1zChcmoGreNPOVbFxjGiJI1&amp;t=634678368240733912" type="text/javascript"></script>
<script type="text/javascript">
//<![CDATA[
function WebForm_OnSubmit() {
if (typeof(ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) return false;
return true;
}
//]]>
</script>

<div>

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWBQKy0ZPcBgKl1bKzCQKd+7qdDgKu44m1DQL9mpmPAexePA5kGfOXTBrkxAcjZtH9bkg3" />
</div>
   
   <table width="495" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:112px;">
  
  <tr>
    <td height="56" valign="top" background="testlogv/login_01.gif"><div class="gsmc_htdl">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="text1"><span>网站后台登录</span></td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td height="186" valign="top" background="testlogv/login_06.gif"><table width="326" border="0" align="center" cellpadding="0" cellspacing="0" class="login_inputbox">
      <tr>
        <td width="58">用户名<strong>:</strong></td>
        <td class="input"><input name="txtUserName" type="text" value="zk71" id="txtUserName" tabindex="1" onkeydown="return SubmitKeyClick(event)" style="width:180px;" />
                        <span id="RequiredFieldValidator1" style="color:Red;display:none;">请输入用户</span>
      </td>
      </tr>
      <tr>
        <td>密&nbsp;&nbsp;&nbsp;&nbsp;码<strong>:</strong></td>
        <td class="input"><input name="txtPwd" type="password" id="txtPwd" tabindex="2" onkeydown="return SubmitKeyClick(event)" style="width:180px;" />
                        <a href="http://help.zk71.com/Index_Detail.aspx?id=16&HelpCerterClass1_ValueNum=1&HelpCerterClass2_ID=2" target=_blank><U><font color="#FF0000">找回密码？</font></U></a></li>
                        <span id="RequiredFieldValidator2" style="color:Red;display:none;">请输入密码</span>
                        </td>
      </tr>
      <tr>
        <td>算术题<strong>:</strong></td>
        <td><table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="text3">3+2=?</td>
            <td class="input"><input name="checkCode" type="text" value="5" maxlength="4" id="checkCode" tabindex="3" onkeydown="return SubmitKeyClick(event)" style="width:30px;" /></td>
            <td class="text4">请填写左侧算术答案</td>
            <td><img src="testlogv/login_07.gif" alt="防止非法软件登录或入侵，本系统采用先进的智能算术机制防入侵功能。" width="15" height="15" /></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>
        
                    <input type="image" name="BtnOK" id="BtnOK" tabindex="4" onkeydown="return SubmitKeyClick(event)" src="testlogv/login_Button.gif" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;BtnOK&quot;, &quot;&quot;, true, &quot;LoginGroup&quot;, &quot;&quot;, false, false))" style="border-width:0px;" />                
        
        
        
     </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="89" background="testlogv/login_03.gif"></td>
  </tr>
</table>
<table border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:30PX;">
  <tr>
    <td><img src="testlogv/login_04.gif" width="10" height="23" /></td>
    <td align="center" bgcolor="#2C73B8" class="text2"><a href="http://www.zk71.com" target="_blank">中科商务网</a> 提供技术支持     &nbsp;&nbsp;&nbsp; <a href="http://www.zk71.com/AboutUs/Lxwm.aspx" target="_blank">联系中科</a> | <a href="http://help.zk71.com/" target="_blank">帮助中心</a></td>
    <td><img src="testlogv/login_05.gif" width="10" height="23" /></td>
  </tr>
</table>
   
    
<script type="text/javascript">
//<![CDATA[
var Page_Validators =  new Array(document.getElementById("RequiredFieldValidator1"), document.getElementById("RequiredFieldValidator2"));
//]]>
</script>

<script type="text/javascript">
//<![CDATA[
var RequiredFieldValidator1 = document.all ? document.all["RequiredFieldValidator1"] : document.getElementById("RequiredFieldValidator1");
RequiredFieldValidator1.controltovalidate = "txtUserName";
RequiredFieldValidator1.errormessage = "请输入用户";
RequiredFieldValidator1.display = "Dynamic";
RequiredFieldValidator1.validationGroup = "LoginGroup";
RequiredFieldValidator1.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
RequiredFieldValidator1.initialvalue = "";
var RequiredFieldValidator2 = document.all ? document.all["RequiredFieldValidator2"] : document.getElementById("RequiredFieldValidator2");
RequiredFieldValidator2.controltovalidate = "txtPwd";
RequiredFieldValidator2.errormessage = "请输入密码";
RequiredFieldValidator2.display = "Dynamic";
RequiredFieldValidator2.validationGroup = "LoginGroup";
RequiredFieldValidator2.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
RequiredFieldValidator2.initialvalue = "";
//]]>
</script>

<script>alert("用户名或者密码错误!");</script>
<script type="text/javascript">
//<![CDATA[

var Page_ValidationActive = false;
if (typeof(ValidatorOnLoad) == "function") {
    ValidatorOnLoad();
}

function ValidatorOnSubmit() {
    if (Page_ValidationActive) {
        return ValidatorCommonOnSubmit();
    }
    else {
        return true;
    }
}
        //]]>
</script>
</form>
</body>
</html>
