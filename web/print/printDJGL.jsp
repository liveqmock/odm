<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.jiang.bean.CGGLDJGL"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>

<html>

<head>
    <meta http-equiv=Content-Type content="text/html; charset=gb2312">
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
            text-align:justify;
            text-justify:inter-ideograph;
            font-size:10.5pt;
            font-family:"Times New Roman","serif";}
        p.MsoHeader, li.MsoHeader, div.MsoHeader
        {mso-style-link:"页眉 Char";
            margin:0cm;
            margin-bottom:.0001pt;
            text-align:center;
            layout-grid-mode:char;
            border:none;
            padding:0cm;
            font-size:9.0pt;
            font-family:"Times New Roman","serif";}
        p.MsoFooter, li.MsoFooter, div.MsoFooter
        {mso-style-link:"页脚 Char";
            margin:0cm;
            margin-bottom:.0001pt;
            layout-grid-mode:char;
            font-size:9.0pt;
            font-family:"Times New Roman","serif";}
        p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
        {margin:0cm;
            margin-bottom:.0001pt;
            text-align:justify;
            text-justify:inter-ideograph;
            font-size:9.0pt;
            font-family:"Times New Roman","serif";}
        p.p0, li.p0, div.p0
        {mso-style-name:p0;
            margin:0cm;
            margin-bottom:.0001pt;
            text-align:justify;
            text-justify:inter-ideograph;
            font-size:10.5pt;
            font-family:"Times New Roman","serif";}
        span.Char
        {mso-style-name:"页眉 Char";
            mso-style-link:页眉;}
        span.Char0
        {mso-style-name:"页脚 Char";
            mso-style-link:页脚;}
            /* Page Definitions */
        @page WordSection1
        {size:21.0cm 841.95pt;
            margin:14.2pt 14.2pt 14.2pt 1.0cm;
            layout-grid:16.3pt;}
        div.WordSection1
        {page:WordSection1;}
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
<%
    CGGLDJGL dj = (CGGLDJGL)request.getAttribute("djgl");
    String gysname = (String)request.getAttribute("gysname");

    SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy/MM/dd");
    String jiaohuo_time = dateformat1.format(dj.getJiaohuo_time());
    String type_num = dj.getType_num();

    String kdtime = dateformat1.format(new Date());
    String beizhu = dj.getBeizhu();
    if(beizhu == null || beizhu.equals("null"))
    {
         beizhu= "";
    }
%>



<body lang=ZH-CN
      style='tab-interval: 21.0pt; text-justify-trim: punctuation' >

<div style="margin-left: 900px">
    <img src="images/print_ico.gif" align="absmiddle" onclick="confirmPrint()" onmouseover="cc(this)"/>
    <font size="1"><--打印</font>
</div>
<input type="hidden" name="cgid" id="cgid" value=<%=dj.getId() %> />


<!--startprint1-->
<div class=WordSection1 style='layout-grid:16.3pt'>

<div align=center>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=714
       style='width:535.25pt;border-collapse:collapse'>
    <tr style='height:60.0pt'>
        <td width=714 colspan=7 valign=top style='width:535.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:60.0pt'>
            <p class=p0 align=center style='text-align:center;layout-grid-mode:char'><b><span
                    lang=EN-US style='font-size:18.0pt;font-family:宋体;letter-spacing:15.0pt'>&nbsp;</span></b></p>
            <p class=p0 align=center style='text-align:center;layout-grid-mode:char'><b><span
                    style='font-size:18.0pt;font-family:宋体;letter-spacing:15.0pt'>宜纺家居</span></b></p>
            <p class=p0 align=center style='text-align:center;layout-grid-mode:char'><b><span
                    style='font-size:18.0pt;font-family:宋体;letter-spacing:15.0pt'>原材料采购单</span></b></p>
            <p class=p0 align=center style='text-align:center;layout-grid-mode:char'><b><span
                    lang=EN-US style='font-size:16.0pt;font-family:宋体;letter-spacing:15.0pt'>&nbsp;</span></b></p>
        </td>
    </tr>
    <tr style='height:19.85pt'>
        <td width=353 colspan=3 style='width:264.85pt;border:none;border-bottom:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:19.85pt'>
            <p class=p0 style='layout-grid-mode:char'><span style='font-size:14.0pt;
  font-family:仿宋'>供应商名称：<span lang=EN-US><%=dj.getGongyingname()%></span>家居有限公司</span></p>
        </td>
        <td width=361 colspan=4 valign=bottom style='width:270.4pt;border:none;
  border-bottom:solid black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:19.85pt'>
            <p class=p0 align=right style='text-align:right;layout-grid-mode:char'><span
                    style='font-size:12.0pt;font-family:仿宋'>采购单号：<span lang=EN-US><%=dj.getCaigou_id()%></span></span></p>
        </td>
    </tr>
    <tr style='height:22.7pt'>
        <td width=134 style='width:100.55pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0 align=right style='text-align:right'><span style='font-size:12.0pt;
  font-family:宋体'>原材料型号</span><span style='font-size:12.0pt;font-family:宋体'>： </span></p>
        </td>
        <td width=219 colspan=2 style='width:164.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>&nbsp;<%=dj.getType_num()%></span></p>
        </td>
        <td width=142 colspan=2 style='width:106.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0 align=right style='text-align:right;word-break:break-all'><span
                    style='font-size:12.0pt;font-family:宋体'>采购数量</span><span style='font-size:
  12.0pt;font-family:宋体'>：</span></p>
        </td>
        <td width=219 colspan=2 style='width:164.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>&nbsp;<%=dj.getCG_totalnum()%></span></p>
        </td>
    </tr>
    <tr style='height:22.7pt'>
        <td width=134 style='width:100.55pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0 align=right style='text-align:right'><span style='font-size:12.0pt;
  font-family:宋体'>供应商型号：</span></p>
        </td>
        <td width=219 colspan=2 style='width:164.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>&nbsp;</span></p>
        </td>
        <td width=142 colspan=2 style='width:106.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0 align=right style='text-align:right;word-break:break-all'><span
                    style='font-size:12.0pt;font-family:宋体'>交货日期：</span></p>
        </td>
        <td width=219 colspan=2 style='width:164.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>&nbsp;<%=jiaohuo_time%></span></p>
        </td>
    </tr>
    <tr style='height:22.7pt'>
        <td width=134 style='width:100.55pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0 align=right style='text-align:right'><span style='font-size:12.0pt;
  font-family:宋体'>规格<span lang=EN-US>/</span>幅宽</span><span style='font-size:
  12.0pt;font-family:宋体'>：<span lang=EN-US> </span></span></p>
        </td>
        <td width=219 colspan=2 style='width:164.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>&nbsp;</span></p>
        </td>
        <td width=142 colspan=2 style='width:106.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0 align=right style='text-align:right;word-break:break-all'><span
                    style='font-size:12.0pt;font-family:宋体'>成<span lang=EN-US>&nbsp; </span>份：</span></p>
        </td>
        <td width=219 colspan=2 style='width:164.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>&nbsp;</span></p>
        </td>
    </tr>
    <tr style='height:22.7pt'>
        <td width=134 style='width:100.55pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0 align=right style='text-align:right;word-break:break-all'><span
                    style='font-size:12.0pt;font-family:宋体'>经密<span lang=EN-US>(</span>根<span
                    lang=EN-US>/cm)</span>：</span></p>
        </td>
        <td width=219 colspan=2 style='width:164.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0 align=right style='text-align:right;word-break:break-all'><span
                    lang=EN-US style='font-size:12.0pt;font-family:宋体'>&nbsp;</span></p>
        </td>
        <td width=142 colspan=2 style='width:106.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0 align=right style='text-align:right;word-break:break-all'><span
                    style='font-size:12.0pt;font-family:宋体'>重量<span lang=EN-US>(</span>克<span
                    lang=EN-US>/m)</span>：</span></p>
        </td>
        <td width=219 colspan=2 style='width:164.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>&nbsp;</span></p>
        </td>
    </tr>
    <tr style='height:22.7pt'>
        <td width=134 style='width:100.55pt;border-top:none;border-left:solid black 1.0pt;
  border-bottom:double windowtext 1.5pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0 align=right style='text-align:right;word-break:break-all'><span
                    style='font-size:12.0pt;font-family:宋体'>纬密<span lang=EN-US>(</span>根<span
                    lang=EN-US>/cm)</span>：</span></p>
        </td>
        <td width=219 colspan=2 style='width:164.3pt;border-top:none;border-left:
  none;border-bottom:double windowtext 1.5pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0 align=right style='text-align:right;word-break:break-all'><span
                    lang=EN-US style='font-size:12.0pt;font-family:宋体'>&nbsp;</span></p>
        </td>
        <td width=142 colspan=2 style='width:106.3pt;border-top:none;border-left:
  none;border-bottom:double windowtext 1.5pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0 align=right style='text-align:right;word-break:break-all'><span
                    lang=EN-US style='font-size:12.0pt;font-family:宋体'>&nbsp;</span></p>
        </td>
        <td width=219 colspan=2 style='width:164.1pt;border-top:none;border-left:
  none;border-bottom:double windowtext 1.5pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:22.7pt'>
            <p class=p0><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>&nbsp;</span></p>
        </td>
    </tr>
    <tr style='height:72.05pt'>
        <td width=134 style='width:100.55pt;border:solid black 1.0pt;border-top:none;
  padding:0cm 5.4pt 0cm 5.4pt;height:72.05pt'>
            <p class=p0 align=right style='text-align:right'><span style='font-size:12.0pt;
  font-family:宋体'>备<span lang=EN-US>&nbsp; </span>注：</span></p>
        </td>
        <td width=580 colspan=6 style='width:434.7pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:72.05pt'>
            <p class=p0 align=left style='text-align:left'><span lang=EN-US
                                                                 style='font-size:12.0pt;font-family:宋体'>&nbsp;<%=beizhu%></span></p>
        </td>
    </tr>
    <tr style='height:22.15pt'>
        <td width=353 colspan=3 style='width:264.85pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:22.15pt'>
            <p class=p0 align=left style='text-align:left'><span lang=EN-US
                                                                 style='font-size:12.0pt;font-family:宋体'>&nbsp;</span></p>
        </td>
        <td width=84 style='width:63.3pt;padding:0cm 5.4pt 0cm 5.4pt;height:22.15pt'>
            <p class=p0 align=left style='text-align:left'><span lang=EN-US
                                                                 style='font-size:12.0pt;font-family:宋体'>&nbsp;</span></p>
        </td>
        <td style='border:none;padding:0cm 0cm 0cm 0cm' width=276 colspan=3><p class='MsoNormal'>&nbsp;</td>
    </tr>
    <tr style='height:19.85pt'>
        <td width=268 colspan=2 style='width:201.05pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:19.85pt'>
            <p class=p0><span style='font-size:12.0pt;font-family:宋体'>复核人： </span></p>
        </td>
        <td width=265 colspan=4 style='width:7.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:19.85pt'>
            <p class=p0 style='margin-left:-80.0pt;text-indent:77.75pt'><span
                    style='font-size:12.0pt;font-family:宋体'>采购员：<%=dj.getUserName()%></span></p>
        </td>
        <td width=181 style='width:135.75pt;padding:0cm 5.4pt 0cm 5.4pt;height:19.85pt'>
            <p class=p0 align=right style='margin-left:-63.2pt;text-align:right'><span
                    style='font-size:12.0pt;font-family:宋体'>开单时间：<span lang=EN-US><%=kdtime%></span></span></p>
        </td>
    </tr>
    <tr height=0>
        <td width=134 style='border:none'></td>
        <td width=134 style='border:none'></td>
        <td width=85 style='border:none'></td>
        <td width=84 style='border:none'></td>
        <td width=57 style='border:none'></td>
        <td width=38 style='border:none'></td>
        <td width=181 style='border:none'></td>
    </tr>
</table>

</div>

<p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

</div>
<!--endprint1-->
</body>

</html>


