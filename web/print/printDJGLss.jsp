<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.jiang.bean.CGGLDJGL"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>采购单打印预览</title>

</head>
<script type="text/javascript" language="javascript"
        src="js/jquery-fn-tab.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="js/jquery_dialog.js"></script>
<script type="text/javascript" src="js/jquery.corners.min.js"></script>
<script type="text/javascript" src="js/flexigrid.js"></script>
<script language="javascript" type="text/javascript"
        src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/ChangeImageJS.js"></script>
<link rel="stylesheet" href="CSS/flexigrid.css" type="text/css" />
<link rel="stylesheet" href="CSS/jquery_dialog.css" type="text/css" />
<link rel="stylesheet" href="CSS/flexigrid.pack.css" type="text/css" />
<link rel="stylesheet" href="skin/WdatePicker.css" type="text/css" />

<link type="text/css" rel="stylesheet" href="CSS/table.css" />
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />
<style>

    <!-- /* Font Definitions */
    @font-face {
        font-family: 宋体;
        panose-1: 2 1 6 0 3 1 1 1 1 1;
        mso-font-alt: SimSun;
        mso-font-charset: 134;
        mso-generic-font-family: auto;
        mso-font-pitch: variable;
        mso-font-signature: 3 680460288 22 0 262145 0;
    }

    @font-face {
        font-family: "Cambria Math";
        panose-1: 2 4 5 3 5 4 6 3 2 4;
        mso-font-charset: 1;
        mso-generic-font-family: roman;
        mso-font-format: other;
        mso-font-pitch: variable;
        mso-font-signature: 0 0 0 0 0 0;
    }

    @font-face {
        font-family: 仿宋;
        panose-1: 2 1 6 9 6 1 1 1 1 1;
        mso-font-charset: 134;
        mso-generic-font-family: modern;
        mso-font-pitch: fixed;
        mso-font-signature: -2147482945 953122042 22 0 262145 0;
    }

    @font-face {
        font-family: "\@宋体";
        panose-1: 2 1 6 0 3 1 1 1 1 1;
        mso-font-charset: 134;
        mso-generic-font-family: auto;
        mso-font-pitch: variable;
        mso-font-signature: 3 680460288 22 0 262145 0;
    }

    @font-face {
        font-family: "\@仿宋";
        panose-1: 2 1 6 9 6 1 1 1 1 1;
        mso-font-charset: 134;
        mso-generic-font-family: modern;
        mso-font-pitch: fixed;
        mso-font-signature: -2147482945 953122042 22 0 262145 0;
    }
        /* Style Definitions */
    p.MsoNormal,li.MsoNormal,div.MsoNormal {
        mso-style-unhide: no;
        mso-style-qformat: yes;
        mso-style-parent: "";
        margin: 0cm;
        margin-bottom: .0001pt;
        text-align: justify;
        text-justify: inter-ideograph;
        mso-pagination: none;
        font-size: 10.5pt;
        mso-bidi-font-size: 12.0pt;
        font-family: "Times New Roman", "serif";
        mso-fareast-font-family: 宋体;
        mso-font-kerning: 1.0pt;
    }

    p.MsoHeader,li.MsoHeader,div.MsoHeader {
        mso-style-unhide: no;
        mso-style-link: "页眉 Char";
        margin: 0cm;
        margin-bottom: .0001pt;
        text-align: center;
        mso-pagination: none;
        tab-stops: center 207.65pt right 415.3pt;
        layout-grid-mode: char;
        border: none;
        mso-border-bottom-alt: solid windowtext .75pt;
        padding: 0cm;
        mso-padding-alt: 0cm 0cm 1.0pt 0cm;
        font-size: 9.0pt;
        font-family: "Times New Roman", "serif";
        mso-fareast-font-family: 宋体;
        mso-font-kerning: 1.0pt;
    }

    p.MsoFooter,li.MsoFooter,div.MsoFooter {
        mso-style-unhide: no;
        mso-style-link: "页脚 Char";
        margin: 0cm;
        margin-bottom: .0001pt;
        mso-pagination: none;
        tab-stops: center 207.65pt right 415.3pt;
        layout-grid-mode: char;
        font-size: 9.0pt;
        font-family: "Times New Roman", "serif";
        mso-fareast-font-family: 宋体;
        mso-font-kerning: 1.0pt;
    }

    p.MsoAcetate,li.MsoAcetate,div.MsoAcetate {
        mso-style-noshow: yes;
        mso-style-unhide: no;
        margin: 0cm;
        margin-bottom: .0001pt;
        text-align: justify;
        text-justify: inter-ideograph;
        mso-pagination: none;
        font-size: 9.0pt;
        font-family: "Times New Roman", "serif";
        mso-fareast-font-family: 宋体;
        mso-font-kerning: 1.0pt;
    }

    p.p0,li.p0,div.p0 {
        mso-style-name: p0;
        mso-style-unhide: no;
        margin: 0cm;
        margin-bottom: .0001pt;
        text-align: justify;
        text-justify: inter-ideograph;
        mso-pagination: widow-orphan;
        font-size: 10.5pt;
        font-family: "Times New Roman", "serif";
        mso-fareast-font-family: 宋体;
    }

    span.Char {
        mso-style-name: "页眉 Char";
        mso-style-unhide: no;
        mso-style-locked: yes;
        mso-style-link: 页眉;
        mso-ansi-font-size: 9.0pt;
        mso-bidi-font-size: 9.0pt;
        mso-font-kerning: 1.0pt;
    }

    span.Char0 {
        mso-style-name: "页脚 Char";
        mso-style-unhide: no;
        mso-style-locked: yes;
        mso-style-link: 页脚;
        mso-ansi-font-size: 9.0pt;
        mso-bidi-font-size: 9.0pt;
        mso-font-kerning: 1.0pt;
    }

    span.GramE {
        mso-style-name: "";
        mso-gram-e: yes;
    }

    .MsoChpDefault {
        mso-style-type: export-only;
        mso-default-props: yes;
        mso-fareast-font-family: 宋体;
    }
        /* Page Definitions */
    @page {
        mso-page-border-surround-header: no;
        mso-page-border-surround-footer: no;
        mso-gutter-position: top;
        mso-footnote-separator: url("采购单.files/header.htm") fs;
        mso-footnote-continuation-separator: url("采购单.files/header.htm") fcs;
        mso-endnote-separator: url("采购单.files/header.htm") es;
        mso-endnote-continuation-separator: url("采购单.files/header.htm") ecs;
    }

    @page WordSection1 {
        size: 841.9pt 595.3pt;
        mso-page-orientation: landscape;
        margin: 1.0cm 36.55pt 14.2pt 36.55pt;
        mso-header-margin: 36.0pt;
        mso-footer-margin: 36.0pt;
        mso-paper-source: 0;
        layout-grid: 16.3pt;
    }

    div.WordSection1 {
        page: WordSection1;
    }
    -->
</style>
<script language="javascript" type="text/javascript" >
    function confirmPrint()
    {
        if (confirm('此操作将修改订单状态为采购中，是否确定')) {
            var id = document.getElementById("cgid").value;
            var url = "CGGL_dolist?hidden=state&type=DJGLCG&id=" + id;
            changestatusbycgid(url);
        }
    }
    function cc(a){
        a.style.cursor="pointer";
        //这里还可以换成许多各种不同形状的鼠标：
        //crosshair   sw-resize   help move   wait   s-resize   等等
    }

    /**
     * 修改状态
     */
    function changestatusbycgid(url) {
        $.ajax({
            url : url,
            type : 'POST',
            dataType : 'text',
            success : function() {
                if(!+[1,])
                {
                    preview(1);
//                    doprint();
                }
                else
                {
                    preview(1);
                }
                //	alert(window.flushFlex());
                window.opener.opener=null;window.opener.location.reload();
            },
            error : function()
            {
                if(!+[1,])
                {
                    preview(1);
                    //doprint();
                }
                else
                {
                    preview(1);
                }
                window.opener.opener=null;window.opener.location.reload();
            }
        });
    }

    function preview(oper) {
        if (oper < 10){
            bdhtml=window.document.body.innerHTML; //获取当前页的html代码
            sprnstr="<!--startprint"+oper+"-->"; //设置打印开始区域
            eprnstr="<!--endprint"+oper+"-->"; //设置打印结束区域
            prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18); //从开始代码向后取html

            prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html
            window.document.body.innerHTML=prnhtml;
            window.print();
            window.document.body.innerHTML=bdhtml;

        }
        else{
            window.print();
        }
    }

</script>

<script language="Javascript">

    function doprint() {
        factory.printing.header = "";
        factory.printing.footer = "";
        factory.printing.portrait = false; //portrait是指打印方向，设置为true就是纵向，false就是横向。
        factory.DoPrint(true); //设置为false，直接打印
    }

</script>
</head>
<%
    CGGLDJGL dj = (CGGLDJGL)request.getAttribute("djgl");
    String gysname = (String)request.getAttribute("gysname");

    SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy/MM/dd");
    String jiaohuo_time = dateformat1.format(dj.getJiaohuo_time());
    String type_num = dj.getType_num();

    String kdtime = dateformat1.format(new Date());
%>



<body lang=ZH-CN
      style='tab-interval: 21.0pt; text-justify-trim: punctuation' >

<div style="margin-left: 900px">
    <img src="images/print_ico.gif" align="absmiddle" onclick="confirmPrint()" onmouseover="cc(this)"/>
    <font size="1"><--打印</font>
</div>
<input type="hidden" name="cgid" id="cgid" value=<%=dj.getId() %> />


<!--startprint1-->
<div class=WordSection1 style='layout-grid: 16.3pt;tab-interval: 21.0pt; text-justify-trim: punctuation'>

<div align=center>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
       width=1021
       style='width: 27.0cm; border-collapse: collapse; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>

<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 60.0pt'>
    <td width=1021 colspan=14 valign=top
        style='width: 27.0cm; padding: 0cm 5.4pt 0cm 5.4pt; height: 60.0pt'>
        <p class=p0 align=center
           style='text-align: center; layout-grid-mode: char; mso-layout-grid-align: none'>
            <b style='mso-bidi-font-weight: normal'><span
                    style='font-size: 18.0pt; font-family: 宋体; letter-spacing: 15.0pt'>森泰家居<span
                    lang=EN-US><o:p></o:p></span></span></b>
        </p>
        <p class=p0 align=center
           style='text-align: center; layout-grid-mode: char; mso-layout-grid-align: none'>
            <b style='mso-bidi-font-weight: normal'><span
                    style='font-size: 18.0pt; font-family: 宋体; letter-spacing: 15.0pt'>原材料采购单</span></b><b
                style='mso-bidi-font-weight: normal'><span lang=EN-US
                                                           style='font-size: 16.0pt; font-family: 宋体; letter-spacing: 15.0pt'><o:p></o:p></span></b>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow: 1; height: 19.85pt'>
    <td width=392 colspan=7
        style='width: 294.2pt; border: none; border-bottom: solid black 1.0pt; mso-border-bottom-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.85pt'>
        <p class=p0
           style='layout-grid-mode: char; mso-layout-grid-align: none'>
							<span style='font-size: 14.0pt; font-family: 仿宋'>供应商名称：<span
                                    lang=EN-US><%=gysname %></span>家居有限公司<span lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=628 colspan=7 valign=bottom
        style='width: 471.25pt; border: none; border-bottom: solid black 1.0pt; mso-border-bottom-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.85pt'>
        <p class=p0 align=right
           style='text-align: right; layout-grid-mode: char; mso-layout-grid-align: none'>
							<span style='font-size: 12.0pt; font-family: 仿宋'>采购单号：<span
                                    lang=EN-US><%=dj.getCaigou_id() %><o:p></o:p></span></span>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow: 2; height: 22.7pt'>
    <td width=141 colspan=2
        style='width: 105.7pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=right style='text-align: right'>
							<span
                                    style='font-size: 12.0pt; mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体'>原材料型号</span><span
                style='font-size: 12.0pt; font-family: 宋体'>： <span
                lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=251 colspan=5
        style='width: 188.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=dj.getType_num()%></span>
        </p>
    </td>
    <td width=251 colspan=3
        style='width: 188.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=right
           style='text-align: right; word-break: break-all'>
							<span
                                    style='font-size: 12.0pt; mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体'>采购数量</span><span
                style='font-size: 12.0pt; font-family: 宋体'>：<span
                lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=377 colspan=4
        style='width: 282.75pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0>
							<span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=dj.getCG_totalnum() %></span>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow: 3; height: 22.7pt'>
    <td width=141 colspan=2
        style='width: 105.7pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=right style='text-align: right'>
							<span
                                    style='font-size: 12.0pt; mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体'>供应商型号：<span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=251 colspan=5
        style='width: 188.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p>&nbsp;</o:p></span>
        </p>
    </td>
    <td width=251 colspan=3
        style='width: 188.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=right
           style='text-align: right; word-break: break-all'>
							<span
                                    style='font-size: 12.0pt; mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体'>交货日期：</span><span
                lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p></o:p></span>
        </p>
    </td>
    <td width=377 colspan=4
        style='width: 282.75pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0>
							<span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=jiaohuo_time %></span>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow: 4; height: 22.7pt'>
    <td width=141 colspan=2
        style='width: 105.7pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=right style='text-align: right'>
							<span
                                    style='font-size: 12.0pt; mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体'>规格<span
                                    lang=EN-US>/</span>幅宽
							</span><span style='font-size: 12.0pt; font-family: 宋体'>：<span
                lang=EN-US> <o:p></o:p></span></span>
        </p>
    </td>
    <td width=251 colspan=5
        style='width: 188.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p>&nbsp;</o:p></span>
        </p>
    </td>
    <td width=251 colspan=3
        style='width: 188.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=right
           style='text-align: right; word-break: break-all'>
							<span
                                    style='font-size: 12.0pt; mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体'>成<span
                                    lang=EN-US><span style='mso-spacerun: yes'>&nbsp;
								</span></span>份：
							</span><span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p></o:p></span>
        </p>
    </td>
    <td width=377 colspan=4
        style='width: 282.75pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p>&nbsp;</o:p></span>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow: 5; height: 22.7pt'>
    <td width=141 colspan=2
        style='width: 105.7pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=right
           style='text-align: right; word-break: break-all'>
							<span
                                    style='font-size: 12.0pt; mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体'>经密<span
                                    lang=EN-US>(</span>根<span lang=EN-US>/cm)</span>：
							</span><span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p></o:p></span>
        </p>
    </td>
    <td width=251 colspan=5
        style='width: 188.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=right
           style='text-align: right; word-break: break-all'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p>&nbsp;</o:p></span>
        </p>
    </td>
    <td width=251 colspan=3
        style='width: 188.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=right
           style='text-align: right; word-break: break-all'>
							<span
                                    style='font-size: 12.0pt; mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体'>重量<span
                                    lang=EN-US>(</span>克<span lang=EN-US>/m)</span>：
							</span><span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p></o:p></span>
        </p>
    </td>
    <td width=377 colspan=4
        style='width: 282.75pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p>&nbsp;</o:p></span>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow: 6; height: 22.7pt'>
    <td width=141 colspan=2
        style='width: 105.7pt; border-top: none; border-left: solid black 1.0pt; border-bottom: double windowtext 1.5pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-alt: solid black .5pt; mso-border-bottom-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=right
           style='text-align: right; word-break: break-all'>
							<span class=GramE><span
                                    style='font-size: 12.0pt; mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体'>纬密</span></span><span
                lang=EN-US
                style='font-size: 12.0pt; mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体'>(</span><span
                style='font-size: 12.0pt; mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体'>根<span
                lang=EN-US>/cm)</span>：
							</span><span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p></o:p></span>
        </p>
    </td>
    <td width=251 colspan=5
        style='width: 188.5pt; border-top: none; border-left: none; border-bottom: double windowtext 1.5pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; mso-border-bottom-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=right
           style='text-align: right; word-break: break-all'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p>&nbsp;</o:p></span>
        </p>
    </td>
    <td width=251 colspan=3
        style='width: 188.5pt; border-top: none; border-left: none; border-bottom: double windowtext 1.5pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; mso-border-bottom-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=right
           style='text-align: right; word-break: break-all'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p>&nbsp;</o:p></span>
        </p>
    </td>
    <td width=377 colspan=4
        style='width: 282.75pt; border-top: none; border-left: none; border-bottom: double windowtext 1.5pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; mso-border-bottom-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p>&nbsp;</o:p></span>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow: 7; height: 22.7pt'>
    <td width=1021 colspan=14
        style='width: 27.0cm; border: solid black 1.0pt; border-top: none; mso-border-top-alt: double windowtext 1.5pt; mso-border-alt: solid black .5pt; mso-border-top-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span
                                    style='font-size: 12.0pt; mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体'>经线原料</span><span
                lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p></o:p></span>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow: 8; height: 22.7pt'>
    <td width=128
        style='width: 95.65pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>A<o:p></o:p></span>
        </p>
    </td>
    <td width=128 colspan=2
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>B<o:p></o:p></span>
        </p>
    </td>
    <td width=128 colspan=3
        style='width: 95.65pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>C<o:p></o:p></span>
        </p>
    </td>
    <td width=128 colspan=2
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>D<o:p></o:p></span>
        </p>
    </td>
    <td width=128
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>E<o:p></o:p></span>
        </p>
    </td>
    <td width=128 colspan=3
        style='width: 95.65pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>F<o:p></o:p></span>
        </p>
    </td>
    <td width=128
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>G<o:p></o:p></span>
        </p>
    </td>
    <td width=128
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>H<o:p></o:p></span>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow: 9; height: 22.7pt'>
    <td width=128
        style='width: 95.65pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=128 colspan=2
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=128 colspan=3
        style='width: 95.65pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=128 colspan=2
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=128
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=128 colspan=3
        style='width: 95.65pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=128
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=128
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow: 10; height: 22.7pt'>
    <td width=1021 colspan=14
        style='width: 27.0cm; border: solid black 1.0pt; border-top: none; mso-border-top-alt: double windowtext 1.5pt; mso-border-alt: solid black .5pt; mso-border-top-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span
                                    style='font-size: 12.0pt; mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体'>纬线原料</span><span
                lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p></o:p></span>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow: 11; height: 22.7pt'>
    <td width=128
        style='width: 95.65pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>A<o:p></o:p></span>
        </p>
    </td>
    <td width=128 colspan=2
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>B<o:p></o:p></span>
        </p>
    </td>
    <td width=128 colspan=3
        style='width: 95.65pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>C<o:p></o:p></span>
        </p>
    </td>
    <td width=128 colspan=2
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>D<o:p></o:p></span>
        </p>
    </td>
    <td width=128
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>E<o:p></o:p></span>
        </p>
    </td>
    <td width=128 colspan=3
        style='width: 95.65pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>F<o:p></o:p></span>
        </p>
    </td>
    <td width=128
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>G<o:p></o:p></span>
        </p>
    </td>
    <td width=128
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'>H<o:p></o:p></span>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow: 12; height: 22.7pt'>
    <td width=128
        style='width: 95.65pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=128 colspan=2
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=128 colspan=3
        style='width: 95.65pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=128 colspan=2
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=128
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=128 colspan=3
        style='width: 95.65pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=128
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=128
        style='width: 95.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .5pt; mso-border-left-alt: solid black .5pt; mso-border-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.7pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-family: 宋体'><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow: 13; height: 72.05pt'>
    <td width=141 colspan=2
        style='width: 105.7pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: double windowtext 1.5pt; mso-border-alt: solid black .5pt; mso-border-top-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 72.05pt'>
        <p class=p0 align=right style='text-align: right'>
							<span style='font-size: 12.0pt; font-family: 宋体'>备<span
                                    lang=EN-US><span style='mso-spacerun: yes'>&nbsp;
								</span></span>注：<span lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=880 colspan=12
        style='width: 659.75pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: double windowtext 1.5pt; mso-border-top-alt: double windowtext 1.5pt; mso-border-bottom-alt: solid black .5pt; mso-border-right-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 72.05pt'>
        <p class=p0 align=left style='text-align: left'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p>&nbsp;</o:p></span>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow: 14; height: 22.15pt'>
    <td width=267 colspan=4
        style='width: 199.95pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.15pt'>
        <p class=p0 align=left style='text-align: left'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p>&nbsp;</o:p></span>
        </p>
    </td>
    <td width=126 colspan=3
        style='width: 94.25pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.15pt'>
        <p class=p0 align=left style='text-align: left'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p>&nbsp;</o:p></span>
        </p>
    </td>
    <td width=628 colspan=7
        style='width: 471.25pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.15pt'>
        <p class=p0 align=left style='text-align: left'>
            <span lang=EN-US style='font-size: 12.0pt; font-family: 宋体'><o:p>&nbsp;</o:p></span>
        </p>
    </td>
</tr>
<tr
        style='mso-yfti-irow: 15; mso-yfti-lastrow: yes; height: 19.85pt'>
    <td width=318 colspan=5
        style='width: 238.35pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.85pt'>
        <p class=p0>
							<span style='font-size: 12.0pt; font-family: 宋体'>复核人：<span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=376 colspan=6
        style='width: 282.0pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.85pt'>
        <p class=p0 align=center style='text-align: center'>
							<span style='font-size: 12.0pt; font-family: 宋体'>采购员：<%=dj.getUserName() %><span
                                    lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
    <td width=327 colspan=3
        style='width: 245.1pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.85pt'>
        <p class=p0 align=right style='text-align: right'>
							<span style='font-size: 12.0pt; font-family: 宋体'>开单日期：<st1:chsdate
                                    IsROCDate="False" IsLunarDate="False" Day="30" Month="12"
                                    Year="2011" w:st="on">
                                <span lang=EN-US><%=kdtime %></span>
                            </st1:chsdate><span lang=EN-US><o:p></o:p></span></span>
        </p>
    </td>
</tr>

<![endif]>
</table>

</div>

<p class=MsoNormal>
    <span lang=EN-US><o:p>&nbsp;</o:p></span>
</p>

</div>

</body>

</html>
<!--endprint1-->