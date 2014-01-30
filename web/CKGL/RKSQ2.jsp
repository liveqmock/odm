<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

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
<script type="text/javascript" src="js/ChangeImageJS.js"></script>
<link rel="stylesheet" href="CSS/flexigrid.css" type="text/css"></link>
<link rel="stylesheet" href="CSS/flexigrid.pack.css" type="text/css"></link>
<link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="CSS/table.css" />
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />

<script type="text/javascript" src=js/validate/jquery.validate.js></script>
<script type="text/javascript" src=js/validate/jquery.form.js></script>
<script type="text/javascript" src=js/validate/valid.js></script>
<link type="text/css" rel="stylesheet" href="js/validate/validate.css" />
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
    </script>

<script type="text/javascript">
	/**  
	 * 自定义验证规则——增加对select的验证  
	 */
	$.validator.addMethod("selectNone", // name验证方法名   
	function(value, element) // 验证规则   
	{
		if (value == "--请选择--") // select默认值需要设置为"none"(当然可以自定义其他值）   
		{
			return false;
		} else {
			return true;
		}
	}, "必须选择一项" // 默认验证消息（自定义规则信息的国际化是否不起作用？）   
	);
	$.validator.addMethod("compareDate", function(value, element, param) {
         var date1 = new Date();
         var reg = new RegExp("-", "g");//g表示替换所有  
         var date2 = new Date(Date.parse(value.replace(reg, "/")));
         var x = date1 < date2;
         return date1 < date2;
     },"必须大于今天");
	
	$(document).ready(function() {
		var validator = $("#form1").validate({
			debug : true, //调试模式取消submit的默认提交功能  
			errorClass : "haha",//默认为错误的样式类为：error  
			focusInvalid : true,
			onfocusout : function(element) {
				$(element).valid();
			},
			onkeyup : function(element) {
				$(element).valid();
			},
			submitHandler : function(form) {
				form.submit();
			},
			rules : {
				gystype : {
					selectNone : "ss"
				},
				gysname : {
					required : true
				},
				jiaohuoText : {
					required : true,
					compareDate : true
				},
				totalnum : {
					required : true,
					number : true,
					min : 1
				}
			},
			messages : {
				gystype : {
					selectNone : "请选择类型"
				},
				gysname : {
					required : "请输入供应商名称"
				},
				jiaohuoText : {
					required : "请输入交货日期",
					compareDate : "必须大于今天"
				},
				totalnum : {
					number : "请输入数字",
					required : "请输入数量",
					min : "数量必须大于 1"
				}
			},
			errorPlacement : function(error, element) { //验证消息放置的地方  
				error.appendTo(element.parent("td").next("td"));
			},
			highlight : function(element, errorClass) { //针对验证的表单设置高亮  
				$(element).addClass(errorClass);
			}/*,
			success : function(label) {
				label.addClass("valid").text("");
			}*/
		});
		$("button").click(function() {
			validator.resetForm();
		});
	});
	function backMenu() {
		var f = document.createElement("form");
		f.action = "DisPatch_getUrl?i=1&j=0";
		f.target = "mainframe";
		f.method = "post";
		document.body.appendChild(f);
		f.submit();
	}
	function enableselect()
	{
		var ui1 = document.getElementById("hide1");
		var ui2 = document.getElementById("hide2");
		var ui3 = document.getElementById("hide3");
		var ui4 = document.getElementById("hide4");
		var gt = document.getElementById("rukutype");

		var value = gt.value;
		if(value == "采购入库")
		{
			ui1.style.display="";//显示
			ui2.style.display="none";//隐藏
			ui3.style.display="none";
			ui4.style.display="none";
		}
		if(value == "自加工生产入库")
		{
			ui1.style.display="none";//显示
			ui2.style.display="";//隐藏
			ui3.style.display="none";
			ui4.style.display="none";
		}
		if(value == "外加工生产入库")
		{
			ui1.style.display="none";//显示
			ui2.style.display="none";//隐藏
			ui3.style.display="";
			ui4.style.display="none";
		}
		if(value == "样本生产入库")
		{
			ui1.style.display="none";//显示
			ui2.style.display="none";//隐藏
			ui3.style.display="none";
			ui4.style.display="";
		}
		if(value == "--请选择--")
		{
			ui1.style.display="none";//
			ui2.style.display="none";//隐藏
			ui3.style.display="none";
			ui4.style.display="none"; 
		}
	}

    function isconfirm()
    {
        alert("a");
        confirm('是否确认该单据布匹入库？');
        return false;
    }
</script>

</head>
<%
String danhao = "";
String rukutype = "--请选择--";
String pingzheng = "";
if(danhao.equals(""))
{
	  Random rdm = new Random(System.currentTimeMillis());
      int intRd = Math.abs(rdm.nextInt())%9999+1;
      SimpleDateFormat formater = new SimpleDateFormat("yyMMdd");
      danhao =  "RK"+formater.format(new Date())+String.format("%04d", intRd); 
}

%>
<body  onload="enableselect();">
	<div>

		<table border="0" cellpadding="0" cellspacing="0" width="820px"
			id="tabs">
			<tr>
				<td class="tabs" align="center"><font color="white">入库申请</font>
				</td>
				<td class="tabs"></td>
			</tr>
		</table>
	</div>

	<div style="height: 6px"></div>
	<div>

		<TABLE cellpadding="0" cellspacing="0" width="816px" align="center"
			style="border: #b9c2d3 solid 1px; top: 4px">
			<tr>
				<td align="center" class="td1">入库单号 </td>
				<td  class="td2"><input type="text" name="danhao" id="danhao"
				onfocus="this.blur()" readonly="readonly"  style="color:gray" 
				 value=<%=danhao %>></input>
				</td>
				<td  align="center" class="td1">入库凭据 </td>
				<td  align="center" class="td2">
				
				<select onchange="enableselect()"  
							id="rukutype"  name="rukutype" >
							<%
							String values[] = {"采购入库","自加工生产入库","外加工生产入库","样本生产入库","--请选择--"};
							for(int i=0;i<values.length;i++){
							%>
								<OPTION value="<%=values[i]%>" <%if (values[i].equals(rukutype)) {%> selected <%} %> ><%=values[i]%></OPTION>
							<%}%>
				</select>
				</td>
				
				<td>
					<div id="hide1" style="display:none">
				<select  class="flexselect"  id="xinghao1" 
							name="pingzhengnum" >
					<%
							Map<String, List<String>> strs = new HashMap<String, List<String>>();
							if (null != session.getAttribute("type_nums")) {
								strs = (Map<String, List<String>>) session.getAttribute("type_nums");
							}
							List<String> str1 = strs.get("str1");
							for(int i=0;i<str1.size();i++)
							{
							%>
							<option <%if(str1.get(i).equals(pingzheng)) {%> selected<%}%> ><%=str1.get(i) %></option>
							<%	
							}
							%>
							</select></div>
						<div id="hide2"   style="display:none">
							<select id="xinghao2" 
							name="pingzhengnum"  >
							<%
							List<String> str2 = strs.get("str2");
							for(int i=0;i<str2.size();i++)
							{
							%>
							<option <%if(str2.get(i).equals(pingzheng)) {%> selected<%}%> ><%=str2.get(i) %></option>
							<%	
							}
							%>
							</select>
							</div>	
							
						<div id="hide3"   style="display:none">
							<select  id="xinghao3" 
							name="pingzhengnum"  >
							<%
							List<String> str3 = strs.get("str3");
							for(int i=0;i<str3.size();i++)
							{
							%>
							<option <%if(str3.get(i).equals(pingzheng)) {%> selected<%}%> ><%=str3.get(i) %></option>
							<%	
							}
							%>
							</select>
							</div>
							
						<div id="hide4"  style="display:none" >
							<select   id="xinghao4" 
							name="pingzhengnum" >
							<%
							List<String> str4 = strs.get("str4");
							for(int i=0;i<str4.size();i++)
							{
							%>
							<option <%if(str4.get(i).equals(pingzheng)) {%> selected<%}%> ><%=str4.get(i) %></option>
							<%	
							}
							%>
							</select>
							</div>
						</td>
						<td>&nbsp;</td>
				<td  align="center" class="td2" style="height: 24px">
		    <input type="submit" name="ID" value="开始入库" onclick="isconfirm()" id="ID" />
            </td>
			</tr>
			<tr></tr>

		</TABLE>

	</div>

	<div style="height: 6px"></div>
	<div>
		
	</div>
</body>



<script>
	$("#flex1").flexigrid({

		url : 'CGGL_dolist?hidden=manage&type=CKGL',
		dataType : 'json',
		colModel : [ {
			display : 'id',
			name : 'id',
			width : 10,
			sortable : true,
			align : 'center',
			hide : true
		}, {
			display : '型号 ',
			name : 'type_num',
			width : 130,
			sortable : false,
			align : 'center',
			hide : false
		}, {
			display : '仓库类型',
			name : 'bptype',
			width : 110,
			sortable : false,
			align : 'center'
		}, {
			display : '布匹类型',
			name : 'ckname',
			width : 50,
			sortable : false,
			align : 'center'
		}, {
			display : '可用米数 ',
			name : 'KY_num',
			width : 110,
			sortable : false,
			align : 'center'
		}, {
			display : '总米数',
			name : 'num',
			width : 90,
			sortable : false,
			align : 'center'
		}, {
			display : '价格',
			name : 'c',
			width : 110,
			sortable : false,
			align : 'center'
		}, {
			display : '品级 ',
			name : 'zhiliangdengji',
			width : 100,
			sortable : false,
			align : 'center'
		} ],
		buttons : [ {
			name : '添加',
			bclass : 'add',
			onpress : button
		}, {
			name : '删除',
			bclass : 'delete',
			onpress : button
		}, {
			name : '修改',
			bclass : 'edit',
			onpress : button
		}, {
			separator : true
		} ],
		/*searchitems : [   
		    {display: '信息编号', name : 'id', isdefault: true},   
		    {display: '信息标题', name : 'id'},   
		    {display: '信息类别', name : 'id'},   
		    {display: '发布作者', name : 'id'}   
		    ],   */
		sortname : "id",
		sortorder : "desc",
		usepager : true,
		resizable : false,
		title : '仓库管理',
		useRp : true,
		rp : 12,
		rpOptions : [ 12, 15, 20, 30, 50 ],
		width : 820,
		height : 340,
		showToggleBtn : false,
        pagestat : '显示 {from} 到 {to} 条 共 {total} 条数据',
        pagetext : '第',
        outof : '共',
        findtext : 'Find',
        procmsg : '正在查询, 请等待 ...',
        query : '',
        qtype : '',
        nomsg : '没有符合要求的数据',
		checkbox : true
	});

	function contextmenu(row) {//右键菜单对应方法

		var menu = {
			width : 150,
			items : [

			{
				text : "查看",
				icon : "css/images/add.png",
				alias : "contextmenu-view",
				action : contextMenuItem_click
			},

			{
				text : "编辑",
				icon : "css/images/add.png",
				alias : "contextmenu-edit",
				action : contextMenuItem_click
			},

			{
				text : "删除",
				icon : "css/images/add.png",
				alias : "contextmenu-delete",
				action : contextMenuItem_click
			},

			{
				text : "刷新",
				icon : "css/images/add.png",
				alias : "contextmenu-reflash",
				action : contextMenuItem_click
			}

			]

		};

		function contextMenuItem_click(target) {

			var id = $(target).attr("id").substr(3);

			var cmd = this.data.alias;

			var ch = $.browser.msie ? target.ch : target.getAttribute("ch");

			var cell = ch.split("_FG$SP_");

			if (cmd == "contextmenu-view") {

				alert("编辑，产品编号=" + id);

			}

			else if (cmd == "contextmenu-edit") {

				//alert("编辑，产品编号=" + id);

				location = '/UnitPosition/Edit/' + id;

			}

			else if (cmd == "contextmenu-delete") {

				var name = cell[11];

				if (confirm("你确认要删除工作经历信息 [" + name + "] 吗？")) {

					//alert("删除，产品编号=" + id);

					location = '/UnitPosition/Delete/' + id;

				}

			}

			else {

				$("#grdProList").flexReload();

			}

		}

		$("#grdProList").contextmenu(menu);

	}

	function button(com, grid) {
		var hidden = document.getElementById("hidden");

		if (com == '删除') {
			hidden.value = "delete";

			if ($('.trSelected', grid).length == 0) {
				alert("请选择要删除的数据");
			} else {
				if (confirm('是否删除这 ' + $('.trSelected', grid).length + ' 条记录吗?')) {
					var id = "";
					for ( var i = 0; i < $('.trSelected', grid).length; i++) {
						if (i == $('.trSelected', grid).length - 1) {
							id += "id="
									+ $('.trSelected', grid).find("td:first")
											.eq(i).text();
						} else {
							id += "id="
									+ $('.trSelected', grid).find("td:first")
											.eq(i).text() + "&";
						}
					}
					var url = "CGGL_dolist?hidden=delete&" + id;
					del(url);
				}
			}
		} else if (com == '添加') {
			hidden.value = "add";
			location.href = "DisPatch_getUrl?i=1&j=1";
		} else if (com == '修改') {
			hidden.value = "modify";
			if ($(".trSelected").length == 1) {
				window.location.href = "infoAdd.jsp?hidden=" + hidden.value
						+ "&id="
						+ $('.trSelected', grid).find("td").eq(0).text();
			} else if ($(".trSelected").length > 1) {
				alert("请选择一个修改,不能同时修改多个");
			} else if ($(".trSelected").length == 0) {
				alert("请选择一个您要修改的信息");
			}
		}
	}

	/** 
	 * 删除记录 
	 */
	function del(url) {
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			success : function() {
				$('#flex1').flexReload();
			}
		});
	}
</script>
</html>
