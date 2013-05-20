<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>客户</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" language="javascript"
	src="js/jquery-fn-tab.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="js/jquery.corners.min.js"></script>
<script type="text/javascript" src="js/flexigrid.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/ChangeImageJS.js"></script>
<link rel="stylesheet" href="CSS/flexigrid.css" type="text/css"></link>
<link rel="stylesheet" href="CSS/flexigrid.pack.css" type="text/css"></link>
<link rel="stylesheet" href="skin/WdatePicker.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="CSS/table.css" />
<link type="text/css" rel="stylesheet" href="CSS/Menu_Right.css" />

</head>
<body >

<div style="height: 6px">
	</div>
	<div>
	<table cellpadding="0" cellspacing="0" width="100%" align="center"
		style="border: #b9c2d3 solid 1px; top: 4px">
		<tr>
			<td width="132" align="center" class="td1">供应商名称 </td>
			<td width="140" class="td2" >
			<input type="text" name="gongyingname"  id="gongyingname"/>
			</td>
			<td width="132" align="center" class="td1">类型</td>
			<td width="140" class=""><select name="leixing"
				id="leixing" class="a2" style="position: relative">
					<option selected="selected" value="--请选择--">--请选择--</option>
					<option value="原料">原料</option>
					<option value="半成品">半成品</option>
					<option value="成品">成品</option>
					<option value="商品">商品</option>

			</select></td>

			<td width="80" class="td2"><input type="image"
				onmouseover="ChangeImage(this,'images/Search2.gif')"
				onmouseout="ChangeImage(this,'images/Search1.gif')"
				src="images/Search1.gif" onclick="gridFlash();"
				style="border-width: 0px; position: relative;" /></td>
		</tr>

	</table>
	
	</div>

<div style="height: 6px">
	</div>
	<div>
		<table id="flex1" style="display: none;font-size: 12px;" style="top:7px"></table>
		<input id="hidden" type="hidden" name="hidden" value="manage" />
	</div>
</body>



<script>   
function gridFlash(){
	$("#flex1").flexOptions({params: [
	                                  {name:'gongyingname', value:$("#gongyingname").val()},
	                                  {name:'leixing', value:$("#leixing").val()}
	                                  ]}).flexReload();
}  

  $("#flex1").flexigrid(
  {    
		//    联系人  电话  手机  传真  开户行帐号  E_mail  开票名称 
  url: 'CGGL_dolist?hidden=manage&type=GYSGL',  
  dataType: 'json',   
  colModel : [
	  {display: 'id', name : 'id', width : 10, sortable : true, align: 'center',hide: true},
      {display: '名称', name : 'gongyingname', width : 140, sortable : false, align: 'center',hide: false},   
      {display: '型号', name : 'leixing', width : 100, sortable : false, align: 'center'},   
      {display: '联系人', name : 'seller', width : 80, sortable : false, align: 'center'},   
      {display: '电话', name : 'telephone', width : 100, sortable : false, align: 'center'},      
      {display: '手机', name : 'phone', width :100, sortable : false, align: 'center'},    
      {display: '开户行账号', name : 'khhzh1', width : 140, sortable : false, align: 'center'},    
      {display: 'Email', name : 'email', width : 180, sortable : false, align: 'center'},    
      {display: '开户行名称', name : 'kpaddress1', width: 140, sortable : false, align: 'center'}                                                                 
      ],   
  buttons : [   
      {name: '添加', bclass: 'add', onpress : button},   
      {name: '删除', bclass: 'delete', onpress : button},   
      {name: '修改', bclass: 'edit', onpress : button},                  
      {separator: true}   
      ],   
  /*searchitems : [   
      {display: '信息编号', name : 'id', isdefault: true},   
      {display: '信息标题', name : 'id'},   
      {display: '信息类别', name : 'id'},   
      {display: '发布作者', name : 'id'}   
      ],   */
  sortname: "id",   
  sortorder: "desc",   
  usepager: true,   
  resizable: false,
  title: '供应商管理',   
  useRp: true,  
  rp: 12,   
  rpOptions : [ 12, 15, 20, 30, 50 ],
  width:  'auto',
  height: 340,
  showToggleBtn : false,
  onError:
	  function()
	  {
	      alert("登陆超时，请重新登陆!");
		  location.href="/odm/index.jsp";
	  },
  checkbox:true
  }   
  );   
  function button(com,grid)   
  {   
	  var hidden = document.getElementById("hidden");
	  
      if (com=='删除')   
          {   
              hidden.value="delete";   

              if($('.trSelected',grid).length==0){   
                  alert("请选择要删除的数据");   
              }else{   
                  if(confirm('是否删除这 ' + $('.trSelected',grid).length + ' 条记录吗?'))   
                  {   
                    var  id ="";   
                    for(var i=0;i<$('.trSelected',grid).length;i++){   
                      if(i==$('.trSelected',grid).length-1){   
                          id += "id="+$('.trSelected',grid).find("td:first").eq(i).text();   
                      } else {   
                          id += "id="+$('.trSelected',grid).find("td:first").eq(i).text()+"&";   
                      }   
                    }
                    var url = "CGGL_dolist?hidden=delete&type=GYSGL&"+id;
                    del(url);
                }   
             }   
          }   
      else if (com=='添加')   
          {   
              hidden.value="add";  
  			 location.href = "DisPatch_getAddJsp?a=1&b=0";
          }   
      else if (com=='修改')   
      {   
		  hidden.value="modify";  
          if($(".trSelected").length==1){   
        	  window.location.href =  "CGGL_dolist?hidden=premodify&type=GYSGL&id="+$('.trSelected', grid).find("td").eq(0).text();
          }else if($(".trSelected").length>1){   
              alert("请选择一个修改,不能同时修改多个");   
          }else if($(".trSelected").length==0){   
              alert("请选择一个您要修改的信息");
          }   
      }   
  }    
  
  /** 
   * 删除记录 
   */  
  function del(url) {  
      $.ajax({  
          url: url,  
          type: 'POST',  
          dataType: 'json',  
          success: function() {  
                  $('#flex1').flexReload();  
          }  
      });  
  }
</script>
</html>
