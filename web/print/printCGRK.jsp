<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.jiang.bean.CGGLDJGL"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<html>

<head>
    <meta http-equiv=Content-Type content="text/html; charset=x-cp20936">
    <meta name=Generator content="Microsoft Word 12 (filtered)">
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
    <title>森泰家居</title>
    <style>
        <!--
            /* Font Definitions */
        @font-face
        {font-family:宋体;
            panose-1:2 1 6 0 3 1 1 1 1 1;}
        @font-face
        {font-family:"Cambria Math";
            panose-1:2 4 5 3 5 4 6 3 2 4;}
        @font-face
        {font-family:仿宋;
            panose-1:2 1 6 9 6 1 1 1 1 1;}
        @font-face
        {font-family:"\@宋体";
            panose-1:2 1 6 0 3 1 1 1 1 1;}
        @font-face
        {font-family:"\@仿宋";
            panose-1:2 1 6 9 6 1 1 1 1 1;}
            /* Style Definitions */
        p.MsoNormal, li.MsoNormal, div.MsoNormal
        {margin:0cm;
            margin-bottom:.0001pt;
            font-size:12.0pt;
            font-family:宋体;}
        p.MsoHeader, li.MsoHeader, div.MsoHeader
        {mso-style-link:"页眉 Char";
            margin:0cm;
            margin-bottom:.0001pt;
            text-align:center;
            layout-grid-mode:char;
            border:none;
            padding:0cm;
            font-size:9.0pt;
            font-family:宋体;}
        p.MsoFooter, li.MsoFooter, div.MsoFooter
        {mso-style-link:"页脚 Char";
            margin:0cm;
            margin-bottom:.0001pt;
            layout-grid-mode:char;
            font-size:9.0pt;
            font-family:宋体;}
        span.Char
        {mso-style-name:"页眉 Char";
            mso-style-link:页眉;
            font-family:宋体;}
        span.Char0
        {mso-style-name:"页脚 Char";
            mso-style-link:页脚;
            font-family:宋体;}
        p.p0, li.p0, div.p0
        {mso-style-name:p0;
            margin:0cm;
            margin-bottom:.0001pt;
            text-align:justify;
            text-justify:inter-ideograph;
            font-size:10.5pt;
            font-family:"Times New Roman","serif";}
            /* Page Definitions */
        @page WordSection1
        {size:595.3pt 841.9pt;
            margin:1.0cm 1.0cm 14.2pt 1.0cm;
            layout-grid:16.3pt;}
        div.WordSection1
        {page:WordSection1;}
        -->
    </style>
    <script language="javascript" type="text/javascript" >
        function confirmPrint()
        {
            if (confirm('此操作将修改订单状态为采购中，是否确定')) {
                //var id = document.getElementById("cgid").value;
                //var url = "CGGL_dolist?hidden=state&type=DJGLCG&id=" + id;
               // changestatusbycgid(url);
                preview(1);
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
                dataType : 'json',
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

<body lang=ZH-CN style='text-justify-trim:punctuation'>
<%

%>
<div style="margin-left: 900px">
    <img src="images/print_ico.gif" align="absmiddle" onclick="confirmPrint()" onmouseover="cc(this)"/>
    <font size="1"><--打印</font>
</div>
<!--startprint1-->
<div class=WordSection1 style='layout-grid:16.3pt'>

<div align=center>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
       style='border-collapse:collapse'>
<tr style='height:56.6pt'>
    <td width=733 colspan=14 valign=top style='width:550.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:56.6pt'>
        <p class=p0 align=center style='text-align:center;line-height:130%;
  layout-grid-mode:char'><b><span style='font-size:16.0pt;line-height:130%;
  font-family:宋体;letter-spacing:15.0pt'>森泰家居</span></b></p>
        <p class=MsoNormal align=center style='text-align:center;line-height:130%;
  layout-grid-mode:char'><b><span style='font-size:16.0pt;line-height:130%;
  letter-spacing:15.0pt'>采购入库单</span></b></p>
    </td>
</tr>
<tr style='height:17.0pt'>
    <td width=299 colspan=6 style='width:223.9pt;border:none;border-bottom:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt'>
        <p class=p0 style='layout-grid-mode:char'><span style='font-size:12.0pt;
  font-family:仿宋'>供应商名称：<span lang=EN-US>***</span>有限公司</span></p>
    </td>
    <td width=189 colspan=5 style='width:141.8pt;border:none;border-bottom:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt'>
        <p class=p0 align=center style='text-align:center;layout-grid-mode:char'><span
                style='font-size:12.0pt;font-family:仿宋'>质检单号：<span lang=EN-US>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p>
    </td>
    <td width=246 colspan=3 style='width:184.3pt;border:none;border-bottom:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt'>
        <p class=p0 align=right style='text-align:right;layout-grid-mode:char'><span
                style='font-size:12.0pt;font-family:仿宋'>出库单号：<span lang=EN-US>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p>
    </td>
</tr>
<tr style='height:17.0pt'>
    <td width=55 style='width:40.9pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'>系 列</p>
    </td>
    <td width=99 style='width:74.1pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'>原材料型号</p>
    </td>
    <td width=96 colspan=2 style='width:71.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'>供应商型号</p>
    </td>
    <td width=49 style='width:36.5pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'>匹数</p>
    </td>
    <td width=55 colspan=2 style='width:41.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'>采购</p>
        <p class=MsoNormal align=center style='text-align:center'>数量</p>
    </td>
    <td width=57 colspan=2 style='width:43.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'>实挂</p>
        <p class=MsoNormal align=center style='text-align:center'>数量</p>
    </td>
    <td width=64 style='width:47.95pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'>单 价</p>
    </td>
    <td width=104 colspan=3 style='width:77.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'>金 额</p>
    </td>
    <td width=155 style='width:116.6pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'>备<span lang=EN-US>&nbsp;
  </span>注</p>
    </td>
</tr>
<tr style='height:17.0pt'>
    <td width=55 style='width:40.9pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=99 style='width:74.1pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=96 colspan=2 style='width:71.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=49 style='width:36.5pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=55 colspan=2 style='width:41.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=57 colspan=2 style='width:43.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=64 style='width:47.95pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=104 colspan=3 style='width:77.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=155 style='width:116.6pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
</tr>
<tr style='height:17.0pt'>
    <td width=55 style='width:40.9pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=99 style='width:74.1pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=96 colspan=2 style='width:71.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=49 style='width:36.5pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=55 colspan=2 style='width:41.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=57 colspan=2 style='width:43.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=64 style='width:47.95pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=104 colspan=3 style='width:77.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=155 style='width:116.6pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
</tr>
<tr style='height:17.0pt'>
    <td width=55 style='width:40.9pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=99 style='width:74.1pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=96 colspan=2 style='width:71.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=49 style='width:36.5pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=55 colspan=2 style='width:41.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=57 colspan=2 style='width:43.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=64 style='width:47.95pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=104 colspan=3 style='width:77.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=155 style='width:116.6pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
</tr>
<tr style='height:17.0pt'>
    <td width=55 style='width:40.9pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=99 style='width:74.1pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=96 colspan=2 style='width:71.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=49 style='width:36.5pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=55 colspan=2 style='width:41.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=57 colspan=2 style='width:43.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=64 style='width:47.95pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=104 colspan=3 style='width:77.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=155 style='width:116.6pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
</tr>
<tr style='height:17.0pt'>
    <td width=55 style='width:40.9pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=99 style='width:74.1pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=96 colspan=2 style='width:71.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=49 style='width:36.5pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=55 colspan=2 style='width:41.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=57 colspan=2 style='width:43.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=64 style='width:47.95pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=104 colspan=3 style='width:77.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=155 style='width:116.6pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
</tr>
<tr style='height:17.0pt'>
    <td width=55 style='width:40.9pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=99 style='width:74.1pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=96 colspan=2 style='width:71.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=49 style='width:36.5pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=55 colspan=2 style='width:41.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=57 colspan=2 style='width:43.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=64 style='width:47.95pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=104 colspan=3 style='width:77.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=155 style='width:116.6pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
</tr>
<tr style='height:17.0pt'>
    <td width=55 style='width:40.9pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=99 style='width:74.1pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=96 colspan=2 style='width:71.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=49 style='width:36.5pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=55 colspan=2 style='width:41.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=57 colspan=2 style='width:43.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=64 style='width:47.95pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=104 colspan=3 style='width:77.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=155 style='width:116.6pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
</tr>
<tr style='height:17.0pt'>
    <td width=55 style='width:40.9pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=99 style='width:74.1pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=96 colspan=2 style='width:71.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=49 style='width:36.5pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=55 colspan=2 style='width:41.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=57 colspan=2 style='width:43.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=64 style='width:47.95pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=104 colspan=3 style='width:77.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=155 style='width:116.6pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
</tr>
<tr style='height:17.0pt'>
    <td width=55 style='width:40.9pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=99 style='width:74.1pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=96 colspan=2 style='width:71.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=49 style='width:36.5pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=55 colspan=2 style='width:41.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=57 colspan=2 style='width:43.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=64 style='width:47.95pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=104 colspan=3 style='width:77.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
    <td width=155 style='width:116.6pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>
    </td>
</tr>
<tr style='height:22.9pt'>
    <td width=249 colspan=4 style='width:186.7pt;border:solid black 1.0pt;
  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:22.9pt'>
        <p class=p0><span style='font-size:12.0pt;font-family:宋体'>采购总数量：</span></p>
    </td>
    <td width=225 colspan=6 style='width:169.0pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.9pt'>
        <p class=p0><span style='font-size:12.0pt;font-family:宋体'>实挂总数量：</span></p>
    </td>
    <td width=259 colspan=4 style='width:194.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.9pt'>
        <p class=p0><span style='font-size:12.0pt;font-family:宋体'>总金额：</span></p>
    </td>
</tr>
<tr style='height:17.0pt'>
    <td width=55 style='width:40.9pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=p0 align=center style='text-align:center;word-break:break-all'><span
                lang=EN-US style='font-size:12.0pt;font-family:宋体'>&nbsp;</span></p>
    </td>
    <td width=679 colspan=13 style='width:509.1pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=p0 align=center style='text-align:center'><span lang=EN-US
                                                                 style='font-size:12.0pt;font-family:宋体'>&nbsp;</span></p>
    </td>
</tr>
<tr style='height:17.0pt'>
    <td width=184 colspan=3 style='width:137.7pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=p0><span style='font-size:12.0pt;font-family:宋体'>生产部经理：虞经理</span></p>
    </td>
    <td width=208 colspan=5 style='width:156.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=p0 align=center style='text-align:center'><span style='font-size:
  12.0pt;font-family:宋体'>生产部主管：郑主管</span></p>
    </td>
    <td width=152 colspan=4 style='width:114.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=p0 align=center style='text-align:center'><span style='font-size:
  12.0pt;font-family:宋体'>开单员：张三三</span></p>
    </td>
    <td width=190 colspan=2 style='width:142.3pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:17.0pt'>
        <p class=p0 align=right style='text-align:right'><span style='font-size:12.0pt;
  font-family:宋体'>开单日期：<span lang=EN-US>2011/12/30</span></span></p>
    </td>
</tr>
<tr height=0>
    <td width=55 style='border:none'></td>
    <td width=99 style='border:none'></td>
    <td width=30 style='border:none'></td>
    <td width=65 style='border:none'></td>
    <td width=49 style='border:none'></td>
    <td width=1 style='border:none'></td>
    <td width=54 style='border:none'></td>
    <td width=39 style='border:none'></td>
    <td width=19 style='border:none'></td>
    <td width=64 style='border:none'></td>
    <td width=13 style='border:none'></td>
    <td width=56 style='border:none'></td>
    <td width=34 style='border:none'></td>
    <td width=155 style='border:none'></td>
</tr>
</table>

</div>

<p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

</div>
<!--endprint1-->
</body>

</html>
