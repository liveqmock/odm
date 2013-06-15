<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.jiang.bean.CGGLDJGL"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@ page import="com.jiang.bean.ZLGLYLZL" %>
<%@ page import="com.jiang.bean.RKQR" %>
<html xmlns:v="urn:schemas-microsoft-com:vml"
      xmlns:o="urn:schemas-microsoft-com:office:office"
      xmlns:w="urn:schemas-microsoft-com:office:word"
      xmlns:m="http://schemas.microsoft.com/office/2004/12/omml"
      xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
      xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 12">
<meta name=Originator content="Microsoft Word 12">

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


<title>自加工刺绣出库打印格式</title>
<o:SmartTagType namespaceuri="urn:schemas-microsoft-com:office:smarttags"
                name="chsdate"/>
<!--[if gte mso 9]><xml>
    <o:DocumentProperties>
        <o:Author>shuizhu</o:Author>
        <o:Template>Normal</o:Template>
        <o:LastAuthor>微软用户</o:LastAuthor>
        <o:Revision>2</o:Revision>
        <o:TotalTime>38</o:TotalTime>
        <o:LastPrinted>2011-12-30T04:46:00Z</o:LastPrinted>
        <o:Created>2013-05-19T12:56:00Z</o:Created>
        <o:LastSaved>2013-05-19T12:56:00Z</o:LastSaved>
        <o:Pages>1</o:Pages>
        <o:Words>92</o:Words>
        <o:Characters>528</o:Characters>
        <o:Company>MC SYSTEM</o:Company>
        <o:Lines>4</o:Lines>
        <o:Paragraphs>1</o:Paragraphs>
        <o:CharactersWithSpaces>619</o:CharactersWithSpaces>
        <o:Version>12.00</o:Version>
    </o:DocumentProperties>
</xml><![endif]-->
<!--[if gte mso 9]><xml>
    <w:WordDocument>
        <w:SpellingState>Clean</w:SpellingState>
        <w:GrammarState>Clean</w:GrammarState>
        <w:TrackMoves>false</w:TrackMoves>
        <w:TrackFormatting/>
        <w:DrawingGridVerticalSpacing>561.6 磅</w:DrawingGridVerticalSpacing>
        <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>
        <w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>
        <w:ValidateAgainstSchemas/>
        <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
        <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
        <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
        <w:DoNotPromoteQF/>
        <w:LidThemeOther>EN-US</w:LidThemeOther>
        <w:LidThemeAsian>ZH-CN</w:LidThemeAsian>
        <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
        <w:Compatibility>
            <w:DontUseIndentAsNumberingTabStop/>
            <w:FELineBreak11/>
            <w:WW11IndentRules/>
            <w:DontAutofitConstrainedTables/>
            <w:AutofitLikeWW11/>
            <w:HangulWidthLikeWW11/>
            <w:UseNormalStyleForList/>
            <w:UseFELayout/>
        </w:Compatibility>
        <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
        <m:mathPr>
            <m:mathFont m:val="Cambria Math"/>
            <m:brkBin m:val="before"/>
            <m:brkBinSub m:val="&#45;-"/>
            <m:smallFrac m:val="off"/>
            <m:dispDef/>
            <m:lMargin m:val="0"/>
            <m:rMargin m:val="0"/>
            <m:defJc m:val="centerGroup"/>
            <m:wrapIndent m:val="1440"/>
            <m:intLim m:val="subSup"/>
            <m:naryLim m:val="undOvr"/>
        </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
    <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
                    DefSemiHidden="false" DefQFormat="false" LatentStyleCount="267">
        <w:LsdException Locked="false" QFormat="true" Name="Normal"/>
        <w:LsdException Locked="false" QFormat="true" Name="heading 1"/>
        <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                        QFormat="true" Name="heading 2"/>
        <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                        QFormat="true" Name="heading 3"/>
        <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                        QFormat="true" Name="heading 4"/>
        <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                        QFormat="true" Name="heading 5"/>
        <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                        QFormat="true" Name="heading 6"/>
        <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                        QFormat="true" Name="heading 7"/>
        <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                        QFormat="true" Name="heading 8"/>
        <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                        QFormat="true" Name="heading 9"/>
        <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                        QFormat="true" Name="caption"/>
        <w:LsdException Locked="false" QFormat="true" Name="Title"/>
        <w:LsdException Locked="false" QFormat="true" Name="Subtitle"/>
        <w:LsdException Locked="false" QFormat="true" Name="Strong"/>
        <w:LsdException Locked="false" QFormat="true" Name="Emphasis"/>
        <w:LsdException Locked="false" Priority="99" SemiHidden="true"
                        Name="Placeholder Text"/>
        <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
        <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
        <w:LsdException Locked="false" Priority="61" Name="Light List"/>
        <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
        <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
        <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
        <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
        <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
        <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
        <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
        <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
        <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
        <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
        <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
        <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
        <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
        <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
        <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
        <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
        <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
        <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
        <w:LsdException Locked="false" Priority="99" SemiHidden="true" Name="Revision"/>
        <w:LsdException Locked="false" Priority="34" QFormat="true"
                        Name="List Paragraph"/>
        <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
        <w:LsdException Locked="false" Priority="30" QFormat="true"
                        Name="Intense Quote"/>
        <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
        <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
        <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
        <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
        <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
        <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
        <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
        <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
        <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
        <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
        <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
        <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
        <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
        <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
        <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
        <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
        <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
        <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
        <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
        <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
        <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
        <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
        <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
        <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
        <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
        <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
        <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
        <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
        <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
        <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
        <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
        <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
        <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
        <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
        <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
        <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
        <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
        <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
        <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
        <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
        <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
        <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
        <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
        <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
        <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
        <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
        <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
        <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
        <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
        <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
        <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
        <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
        <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
        <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
        <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
        <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
        <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
        <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
        <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
        <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
        <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
        <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
        <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
        <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
        <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
        <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
        <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
        <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
        <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
        <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
        <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
        <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
        <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
        <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
        <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
        <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
        <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
        <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
        <w:LsdException Locked="false" Priority="19" QFormat="true"
                        Name="Subtle Emphasis"/>
        <w:LsdException Locked="false" Priority="21" QFormat="true"
                        Name="Intense Emphasis"/>
        <w:LsdException Locked="false" Priority="31" QFormat="true"
                        Name="Subtle Reference"/>
        <w:LsdException Locked="false" Priority="32" QFormat="true"
                        Name="Intense Reference"/>
        <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
        <w:LsdException Locked="false" Priority="37" SemiHidden="true"
                        UnhideWhenUsed="true" Name="Bibliography"/>
        <w:LsdException Locked="false" Priority="39" SemiHidden="true"
                        UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
    </w:LatentStyles>
</xml><![endif]--><!--[if !mso]><object
        classid="clsid:38481807-CA0E-42D2-BF39-B33AF135CC4D" id=ieooui></object>
<style>
    st1\:*{behavior:url(#ieooui) }
</style>
<![endif]-->
<style>
    <!--
        /* Font Definitions */
    @font-face
    {font-family:宋体;
        panose-1:2 1 6 0 3 1 1 1 1 1;
        mso-font-alt:SimSun;
        mso-font-charset:134;
        mso-generic-font-family:auto;
        mso-font-pitch:variable;
        mso-font-signature:3 680460288 22 0 262145 0;}
    @font-face
    {font-family:"Cambria Math";
        panose-1:0 0 0 0 0 0 0 0 0 0;
        mso-font-charset:1;
        mso-generic-font-family:roman;
        mso-font-format:other;
        mso-font-pitch:variable;
        mso-font-signature:0 0 0 0 0 0;}
    @font-face
    {font-family:仿宋;
        panose-1:2 1 6 9 6 1 1 1 1 1;
        mso-font-charset:134;
        mso-generic-font-family:modern;
        mso-font-pitch:fixed;
        mso-font-signature:-2147482945 953122042 22 0 262145 0;}
    @font-face
    {font-family:"\@宋体";
        panose-1:2 1 6 0 3 1 1 1 1 1;
        mso-font-charset:134;
        mso-generic-font-family:auto;
        mso-font-pitch:variable;
        mso-font-signature:3 680460288 22 0 262145 0;}
    @font-face
    {font-family:"\@仿宋";
        panose-1:2 1 6 9 6 1 1 1 1 1;
        mso-font-charset:134;
        mso-generic-font-family:modern;
        mso-font-pitch:fixed;
        mso-font-signature:-2147482945 953122042 22 0 262145 0;}
        /* Style Definitions */
    p.MsoNormal, li.MsoNormal, div.MsoNormal
    {mso-style-unhide:no;
        mso-style-qformat:yes;
        mso-style-parent:"";
        margin:0cm;
        margin-bottom:.0001pt;
        mso-pagination:widow-orphan;
        font-size:12.0pt;
        font-family:宋体;
        mso-bidi-font-family:宋体;}
    p.MsoHeader, li.MsoHeader, div.MsoHeader
    {mso-style-unhide:no;
        mso-style-link:"页眉 Char";
        margin:0cm;
        margin-bottom:.0001pt;
        text-align:center;
        mso-pagination:widow-orphan;
        tab-stops:center 207.65pt right 415.3pt;
        layout-grid-mode:char;
        border:none;
        mso-border-bottom-alt:solid windowtext .75pt;
        padding:0cm;
        mso-padding-alt:0cm 0cm 1.0pt 0cm;
        font-size:9.0pt;
        font-family:宋体;
        mso-bidi-font-family:宋体;}
    p.MsoFooter, li.MsoFooter, div.MsoFooter
    {mso-style-unhide:no;
        mso-style-link:"页脚 Char";
        margin:0cm;
        margin-bottom:.0001pt;
        mso-pagination:widow-orphan;
        tab-stops:center 207.65pt right 415.3pt;
        layout-grid-mode:char;
        font-size:9.0pt;
        font-family:宋体;
        mso-bidi-font-family:宋体;}
    p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
    {mso-style-noshow:yes;
        mso-style-unhide:no;
        margin:0cm;
        margin-bottom:.0001pt;
        mso-pagination:widow-orphan;
        font-size:9.0pt;
        font-family:宋体;
        mso-bidi-font-family:宋体;}
    p.p0, li.p0, div.p0
    {mso-style-name:p0;
        mso-style-unhide:no;
        margin:0cm;
        margin-bottom:.0001pt;
        text-align:justify;
        text-justify:inter-ideograph;
        mso-pagination:widow-orphan;
        font-size:10.5pt;
        font-family:"Times New Roman","serif";
        mso-fareast-font-family:宋体;}
    span.10
    {mso-style-name:10;
        mso-style-unhide:no;
        mso-ansi-font-size:10.0pt;
        mso-bidi-font-size:10.0pt;
        font-family:"Times New Roman","serif";
        mso-ascii-font-family:"Times New Roman";
        mso-hansi-font-family:"Times New Roman";
        mso-bidi-font-family:"Times New Roman";}
    span.Char
    {mso-style-name:"页眉 Char";
        mso-style-unhide:no;
        mso-style-locked:yes;
        mso-style-link:页眉;
        mso-ansi-font-size:9.0pt;
        mso-bidi-font-size:9.0pt;
        font-family:宋体;
        mso-ascii-font-family:宋体;
        mso-hansi-font-family:宋体;
        mso-bidi-font-family:宋体;}
    span.Char0
    {mso-style-name:"页脚 Char";
        mso-style-unhide:no;
        mso-style-locked:yes;
        mso-style-link:页脚;
        mso-ansi-font-size:9.0pt;
        mso-bidi-font-size:9.0pt;
        font-family:宋体;
        mso-ascii-font-family:宋体;
        mso-hansi-font-family:宋体;
        mso-bidi-font-family:宋体;}
    span.SpellE
    {mso-style-name:"";
        mso-spl-e:yes;}
    span.GramE
    {mso-style-name:"";
        mso-gram-e:yes;}
    .MsoChpDefault
    {mso-style-type:export-only;
        mso-default-props:yes;
        mso-fareast-font-family:宋体;}
        /* Page Definitions */
    @page
    {mso-page-border-surround-header:no;
        mso-page-border-surround-footer:no;
        mso-footnote-separator:url("原材料质检单.files/header.htm") fs;
        mso-footnote-continuation-separator:url("原材料质检单.files/header.htm") fcs;
        mso-endnote-separator:url("原材料质检单.files/header.htm") es;
        mso-endnote-continuation-separator:url("原材料质检单.files/header.htm") ecs;}
    @page WordSection1
    {size:841.9pt 595.3pt;
        mso-page-orientation:landscape;
        margin:1.0cm 36.55pt 14.2pt 36.55pt;
        mso-header-margin:36.0pt;
        mso-footer-margin:36.0pt;
        mso-paper-source:0;
        layout-grid:15.6pt;}
    div.WordSection1
    {page:WordSection1;}
    -->
</style>
<script language="javascript" type="text/javascript" >
    function confirmPrint()
    {

        if (confirm('此操作将修改订单状态为已入库，是否确定')) {
            var id = document.getElementById("cgid").value;
            var url = "CKGL_dolist?hidden=modify&type=RK_CG_RKPRINT&caigou_id=" + id;
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
                window.opener.location.href="DisPatch_getAddJsp?a=2&b=14";
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
                window.opener.location.href="DisPatch_getAddJsp?a=2&b=14";
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
    String company = "宜纺家居";
    String gongyingshangname = "";
    String zhijianid = "";
    String kaidanyuan = "";
    String gysxinghao = "";
    String djid = "";
    SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy/MM/dd");
    String currentDate = dateformat1.format(new Date());
    if(null != (String)request.getAttribute("gysname"))
    {
        gongyingshangname =(String)request.getAttribute("gysname");
    }
    com.jiang.bean.User user = null;
    int  jj = -1;
    if(null != session.getAttribute("user"))
    {
        user = (com.jiang.bean.User)session.getAttribute("user") ;

        if(user.getCompany().contains("0"))
        {
            company = "森泰家居";
        }
        kaidanyuan = user.getRealName();

    }
    if(null != session.getAttribute("rukudanhao"))
    {
        zhijianid = (String)session.getAttribute("rukudanhao");
    }
    CGGLDJGL dj = new CGGLDJGL();
    if(null != (CGGLDJGL)request.getAttribute("djgl"))
    {
        dj = (CGGLDJGL)request.getAttribute("djgl");
        if(dj.getGyspinming() != null)
            gysxinghao = dj.getGyspinming();
        djid = dj.getCaigou_id();
    }

    //所有布匹信息
    List bupis = new ArrayList();
    if(null != (List)request.getAttribute("cgrkbupis"))
    {
        bupis = (List)request.getAttribute("cgrkbupis");
    }

    //
    ZLGLYLZL ylzl = new ZLGLYLZL();
    String xilie = "";
    String typenum = "";
    String guige = "";
    String zhongliang = "";
    if(null != (ZLGLYLZL)request.getAttribute("ylzl"))
    {
        ylzl = (ZLGLYLZL)request.getAttribute("ylzl");
        if(ylzl.getXilie()!=null)xilie = ylzl.getXilie();
        if(ylzl.getType_num()!=null)typenum = ylzl.getType_num();
        if(ylzl.getGuige()!=null)guige = ylzl.getGuige();
    }

%>

<body lang=ZH-CN style='tab-interval:21.0pt'>

<input type=hidden name="cgid" id="cgid" value=<%=djid%> />
<div style="margin-left: 900px">
    <img src="images/print_ico.gif" align="absmiddle" onclick="confirmPrint()" onmouseover="cc(this)"/>
    <font size="1"><--打印</font>
</div>


<!--startprint1-->

<div class=WordSection1 style='layout-grid:15.6pt'>

<div align=center>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
       style='margin-left:-104.05pt;border-collapse:collapse;mso-padding-alt:0cm 5.4pt 0cm 5.4pt'>
<tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:25.5pt'>
    <td width=994 colspan=19 style='width:745.85pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:25.5pt'>
        <p class=p0 align=center style='text-align:center;line-height:130%;
  layout-grid-mode:char;mso-layout-grid-align:none'><b style='mso-bidi-font-weight:
  normal'><span style='font-size:16.0pt;line-height:130%;font-family:宋体;
  letter-spacing:15.0pt'><%=company%><span lang=EN-US><o:p></o:p></span></span></b></p>
        <p class=p0 align=center style='text-align:center;line-height:130%;
  layout-grid-mode:char;mso-layout-grid-align:none'><b style='mso-bidi-font-weight:
  normal'><span style='font-size:16.0pt;line-height:130%;font-family:宋体;
  letter-spacing:15.0pt'>原材料入库单</span></b><b><span lang=EN-US style='font-size:
  14.0pt;line-height:130%;font-family:宋体'><o:p></o:p></span></b></p>
    </td>
</tr>
<tr style='mso-yfti-irow:1;height:12.0pt'>
    <td width=436 colspan=10 style='width:327.35pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
        <p class=MsoNormal><span style='font-family:仿宋'>供应商名称：<span lang=EN-US><%=gongyingshangname%></span>有限公司<span
                lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=558 colspan=9 style='width:418.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
        <p class=MsoNormal align=right style='text-align:right'><span lang=EN-US
                                                                      style='font-size:10.0pt;font-family:仿宋'><span
                style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span></span><span lang=EN-US style='font-size:10.5pt;font-family:仿宋'><span
                style='mso-spacerun:yes'>&nbsp;&nbsp;</span></span><span style='font-size:
  10.5pt;font-family:仿宋'>入库单单号：<span lang=EN-US><%=zhijianid%><o:p></o:p></span></span></p>
    </td>
</tr>
<tr style='mso-yfti-irow:2;height:14.25pt'>
    <td width=80 style='width:43.55pt;border:solid black 1.0pt;mso-border-alt:
  solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>布匹编号<span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=58 style='width:43.55pt;border:solid black 1.0pt;mso-border-alt:
  solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>系 列<span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=64 style='width:48.1pt;border:solid black 1.0pt;border-left:none;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>原材料<span lang=EN-US><o:p></o:p></span></span></p>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>型号<span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=82 style='width:61.15pt;border:solid black 1.0pt;border-left:none;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>规格<span lang=EN-US>/</span>幅宽<span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=62 style='width:46.4pt;border:solid black 1.0pt;border-left:none;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>供应商<span lang=EN-US><o:p></o:p></span></span></p>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>型号<span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=65 colspan=3 style='width:48.5pt;border:solid black 1.0pt;
  border-left:none;mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>机台号<span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=64 style='width:47.7pt;border:solid black 1.0pt;border-left:none;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>供应商<span lang=EN-US><o:p></o:p></span></span></p>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'><span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=61 colspan=3 style='width:45.7pt;border:solid black 1.0pt;
  border-left:none;mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>采购<span lang=EN-US><o:p></o:p></span></span></p>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>米数<span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=46 style='width:34.65pt;border:solid black 1.0pt;border-left:none;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>质量<span lang=EN-US><o:p></o:p></span></span></p>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>等级<span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=107 colspan=2 style='width:140.25pt;border:solid black 1.0pt;
  border-left:none;mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>品质状况<span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=167 colspan=2 style='width:125.15pt;border:solid black 1.0pt;
  border-left:none;mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>备注<span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=64 style='width:48.1pt;border:solid black 1.0pt;border-left:none;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>检验员<span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=75 style='width:56.6pt;border:solid black 1.0pt;border-left:none;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'>检验日期<span lang=EN-US><o:p></o:p></span></span></p>
    </td>
</tr>


<%--开始--%>
<%
    for (int i=0;i<bupis.size();i++){
        RKQR rk = (RKQR)bupis.get(i);
        String jyy = "";
        String jytime = "";
        String jitaihao = "";
        String shiguamishu = "";
        String pingzhi = "";
        String beizhu = "";
        String bupiid = "";
        if(rk.getBupi_id() != null)
            bupiid = rk.getBupi_id();
//        if(rk.getJitaihao() != null)
//            jitaihao = rk.getJitaihao()+"";
        if(rk.getMishu() != null)
            shiguamishu = rk.getMishu()+"";
//        if(rk.getPinzhi() != null)
//            pingzhi = rk.getPinzhi();
        if(rk.getBeizhu() != null)
            beizhu = rk.getBeizhu();
        if(rk.getApply_man() != null)
            jyy = rk.getApply_man();
        if(rk.getApply_time() != null)
            jytime = new SimpleDateFormat("yyyy-mm-dd").format(rk.getApply_time());
%>
<tr style='mso-yfti-irow:3;height:14.25pt'>
    <td width=80 style='width:43.55pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span class=SpellE><span
                lang=EN-US style='font-size:10.5pt'><%=bupiid%></span></span><span lang=EN-US
                                                                                   style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=58 style='width:43.55pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span class=SpellE><span
                lang=EN-US style='font-size:10.5pt'><%=xilie%></span></span><span lang=EN-US
                                                                                  style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=64 style='width:48.1pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black .5pt;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span class=SpellE><span
                lang=EN-US style='font-size:10.5pt'><%=typenum%></span></span><span lang=EN-US
                                                                                    style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=82 style='width:61.15pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black .5pt;mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US
                                                                        style='font-size:10.5pt'><%=guige%><o:p></o:p></span></p>
    </td>
    <td width=62 style='width:46.4pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black .5pt;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span class=SpellE><span
                lang=EN-US style='font-size:10.5pt'><%=gysxinghao%></span></span><span lang=EN-US
                                                                                       style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=65 colspan=3 style='width:48.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black .5pt;mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US
                                                                        style='font-size:10.5pt'><%=jitaihao%><o:p></o:p></span></p>
    </td>
    <td width=64 style='width:47.7pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black .5pt;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US
                                                                        style='font-size:10.5pt'><%=gongyingshangname%><o:p></o:p></span></p>
    </td>
    <td width=61 colspan=3 style='width:45.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black .5pt;mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US
                                                                        style='font-size:10.5pt'><%=shiguamishu%><o:p></o:p></span></p>
    </td>
    <td width=46 style='width:34.65pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black .5pt;mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span class=SpellE><span
                lang=EN-US style='font-size:10.5pt'><%=zhongliang%></span></span><span lang=EN-US
                                                                                       style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=107 colspan=2 style='width:140.25pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black .5pt;mso-border-left-alt:solid black .5pt;
  mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span class=GramE><span
                style='font-size:9.0pt'><%=pingzhi%></span></span></p>
    </td>
    <td width=167 colspan=2 style='width:125.15pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black .5pt;mso-border-left-alt:solid black .5pt;
  mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span class=SpellE><span
                lang=EN-US style='font-size:10.5pt'><%=beizhu%></span></span><span
                lang=EN-US style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=64 style='width:48.1pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black .5pt;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'><%=jyy%><span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=75 style='width:56.6pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black .5pt;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US
                                                                        style='font-size:10.5pt'><%=jytime%><o:p></o:p></span></p>
    </td>
</tr>

<%--结束--%>   <%}%>


<%--开始--%>
<%
    int size = bupis.size() >10?0:10-bupis.size();
    for (int i=0;i<size;i++){
%>
<tr style='mso-yfti-irow:3;height:14.25pt'>
    <td width=80 style='width:43.55pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span class=SpellE><span
                lang=EN-US style='font-size:10.5pt'></span></span><span lang=EN-US
                                                                        style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=58 style='width:43.55pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span class=SpellE><span
                lang=EN-US style='font-size:10.5pt'></span></span><span lang=EN-US
                                                                        style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=64 style='width:48.1pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black .5pt;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span class=SpellE><span
                lang=EN-US style='font-size:10.5pt'></span></span><span lang=EN-US
                                                                        style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=82 style='width:61.15pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black .5pt;mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US
                                                                        style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=62 style='width:46.4pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black .5pt;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span class=SpellE><span
                lang=EN-US style='font-size:10.5pt'></span></span><span lang=EN-US
                                                                        style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=65 colspan=3 style='width:48.5pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black .5pt;mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US
                                                                        style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=64 style='width:47.7pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black .5pt;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US
                                                                        style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=61 colspan=3 style='width:45.7pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black .5pt;mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US
                                                                        style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=46 style='width:34.65pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black .5pt;mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span class=SpellE><span
                lang=EN-US style='font-size:10.5pt'></span></span><span lang=EN-US
                                                                        style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=107 colspan=2 style='width:140.25pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black .5pt;mso-border-left-alt:solid black .5pt;
  mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span class=GramE><span
                style='font-size:9.0pt'></span></span></p>
    </td>
    <td width=167 colspan=2 style='width:125.15pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black .5pt;mso-border-left-alt:solid black .5pt;
  mso-border-alt:solid black .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span class=SpellE><span
                lang=EN-US style='font-size:10.5pt'></span></span><span
                lang=EN-US style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
    <td width=64 style='width:48.1pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black .5pt;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span
                style='font-size:10.5pt'><span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=75 style='width:56.6pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black .5pt;
  mso-border-left-alt:solid black .5pt;mso-border-alt:solid black .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:14.25pt'>
        <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US
                                                                        style='font-size:10.5pt'><o:p></o:p></span></p>
    </td>
</tr>

<%--结束--%>   <%}%>



<p class=MsoNormal align=center style='text-align:center'><span lang=EN-US
                                                                style='font-size:10.5pt'><o:p>&nbsp;</o:p></span></p>
</td>
</tr>
<tr style='mso-yfti-irow:30;height:8.15pt'>
    <td width=122 colspan=2 style='width:91.65pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:8.15pt'>
        <p class=p0><span lang=EN-US style='font-size:7.5pt;font-family:宋体'><o:p>&nbsp;</o:p></span></p>
    </td>
    <td width=148 colspan=3 style='width:111.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:8.15pt'>
        <p class=p0><span lang=EN-US style='font-size:7.5pt;font-family:宋体'><o:p>&nbsp;</o:p></span></p>
    </td>
    <td width=165 colspan=4 style='width:123.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:8.15pt'>
        <p class=p0><span lang=EN-US style='font-size:7.5pt;font-family:宋体'><o:p>&nbsp;</o:p></span></p>
    </td>
    <td width=77 colspan=4 style='width:57.85pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:8.15pt'>
        <p class=p0><span lang=EN-US style='font-size:7.5pt;font-family:宋体'><o:p>&nbsp;</o:p></span></p>
    </td>
    <td width=482 colspan=6 style='width:361.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:8.15pt'>
        <p class=p0><span lang=EN-US style='font-size:7.5pt;font-family:宋体'><o:p>&nbsp;</o:p></span></p>
    </td>
</tr>
<tr style='mso-yfti-irow:31;mso-yfti-lastrow:yes;height:12.0pt'>
    <td width=285 colspan=6 style='width:213.75pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
        <p class=p0 align=left style='text-align:left'><span style='font-family:宋体'>生产部经理：   <span
                lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=275 colspan=8 style='width:206.55pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
        <p class=p0 align=left style='text-align:left'><span style='font-family:宋体'>生产部主管：<span
                class=GramE>   </span><span lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=192 colspan=2 style='width:143.95pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
        <p class=p0 align=left style='text-align:left'><span style='font-family:宋体'>开单员：<%=kaidanyuan%>   <span
                lang=EN-US><o:p></o:p></span></span></p>
    </td>
    <td width=242 colspan=3 style='width:181.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
        <p class=p0 align=right style='text-align:right'><span style='font-family:
  宋体'>开单日期：<st1:chsdate Year="2011" Month="12" Day="30" IsLunarDate="False"
                        IsROCDate="False" w:st="on"><span lang=EN-US><%=currentDate%></span></st1:chsdate><span
                lang=EN-US><o:p></o:p></span></span></p>
    </td>
</tr>
<![if !supportMisalignedColumns]>
<tr height=0>
    <td width=58 style='border:none'></td>
    <td width=60 style='border:none'></td>
    <td width=76 style='border:none'></td>
    <td width=60 style='border:none'></td>
    <td width=5 style='border:none'></td>
    <td width=13 style='border:none'></td>
    <td width=37 style='border:none'></td>
    <td width=60 style='border:none'></td>
    <td width=41 style='border:none'></td>
    <td width=1 style='border:none'></td>
    <td width=16 style='border:none'></td>
    <td width=45 style='border:none'></td>
    <td width=9 style='border:none'></td>
    <td width=37 style='border:none'></td>
    <td width=96 style='border:none'></td>
    <td width=63 style='border:none'></td>
    <td width=89 style='border:none'></td>
    <td width=54 style='border:none'></td>
    <td width=68 style='border:none'></td>
</tr>
<![endif]>
</table>

</div>

<p class=p0><span lang=EN-US style='font-size:12.0pt;font-family:宋体'><o:p>&nbsp;</o:p></span></p>

</div>
<!--endprint1-->
</body>

</html>
