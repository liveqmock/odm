<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>采购开单</title>
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
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />
<link type="text/css" rel="stylesheet" href="CSS/table.css" />
</head>
<body onunload="closeMe() ">
	<form name="form1" method="post" action="DisPatch_getUrl?i=1&j=0" id="form1">

		<div>

			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				id="tabs">
				<tr>
					<td class="tabs" style="width: 5px;"></td>
					<td class="tabs" style="width: 100px;"><font color="white">采购开单</font>
						<span></span></td>
					<td class="tabs"></td>
				</tr>
			</table>

		</div>
		<div style="height: 30px"></div>


		<div id="UpdatePanel1">

			<table align="center">
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" width="400" align="center"
							class="tb">
							<tr>
								<td align="center" class="td1">供应商单位名称</td>
								<td width="240" class="td2"><input
									name="gongyingshangmingchenText" type="text"
									id="gongyingshangmingchenText"
									style="width: 180px; position: relative" /> <font color="red">*</font></td>
							</tr>
							<tr>
								<td align="center" class="td1">供应商型号</td>
								<td width="240" class="td2"><input
									name="gongyingshangxinghaoText" type="text"
									id="gongyingshangxinghaoText"
									style="width: 180px; position: relative" /> <font color="red">*</font></td>
							</tr>
							<tr>
								<td align="center" class="td1">采购单号</td>
								<td width="240" class="td2"><input name="danhaoText"
									type="text" value="CG1205101435" readonly="readonly"
									id="danhaoText" disabled="disabled"
									style="width: 180px; position: relative" /> <font color="red">*</font></td>
							</tr>
							<tr>
								<td align="center" class="td1">型号</td>
								<td width="240" class="td2"><input name="xinghaoText"
									type="text" id="xinghaoText"
									style="width: 180px; position: relative" /> <font color="red">*</font>

								</td>

							</tr>

							<tr>
								<td align="center" class="td1" style="height: 30px">类型</td>
								<td width="240" class="td2" style="height: 30px"><select
									name="DLleixing" id="DLleixing" class="a2"
									style="position: relative">
										<option value="原料">原料</option>
										<option value="半成品">半成品</option>
										<option value="成品">成品</option>
										<option value="商品">商品</option>
										<option selected="selected" value="--请选择--">--请选择--</option>

								</select> <font color="red">*</font></td>
							</tr>
							<tr>
								<td align="center" class="td1">采购数量</td>
								<td width="240" class="td2"><input name="shuliangText"
									type="text" autocomplete="off" id="shuliangText"
									style="width: 180px; position: relative" /></td>

							</tr>
							<tr>
								<td align="center" class="td1">交货日期</td>
								<td width="240" class="td2"><input name="jiaohuoText"
									type="text" id="jiaohuoText" class="Wdate"
									onClick="WdatePicker()"
									style="width: 180px; position: relative" /></td>
							</tr>
							<tr>
								<td align="center" class="td1">操作人</td>
								<td width="240" class="td2"><input name="caozuorenText"
									type="text" value="1" readonly="readonly" id="caozuorenText"
									disabled="disabled" style="width: 180px; position: relative" />
								</td>
							</tr>
							<tr>
								<td align="center" class="td1">备注</td>
								<td width="240" class="td2"><textarea name="beizhuText"
										rows="2" cols="20" id="beizhuText"
										style="height: 100px; width: 180px; position: relative"></textarea>
								</td>
							</tr>

						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td width="400" style="height: 26px;" align="center"><input
									type="image" name="imgbtnSure" id="imgbtnSure"
									onmouseover="ChangeImage(this,'images/Sure2.gif')"
									onmouseout="ChangeImage(this,'images/Sure1.gif')"
									src="images/Sure1.gif"
									style="border-width: 0px; position: relative" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
