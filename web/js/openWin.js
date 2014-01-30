/*
 * JavaScript Document
 * @public: 弹出页面窗口	
 * @author: lianmenglm@gmail.com
 * @date: 2011.07.01
 */

/*弹出页面窗口方式二*/
function showWindow(sURL, width, height) {
	var iWidth = width + 50;	//弹出窗口的宽度;
	var iHeight = height + 50;	//弹出窗口的高度;
	var iTop = (window.screen.availHeight - 30 - iHeight) / 2;	//获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;	//获得窗口的水平位置;
	//window.showModalDialog(encodeURI(sURL), window, 'dialogWidth='+width+'px;dialogHeight='+height+'px;scroll=auto');
	window.showModalDialog(encodeURI(sURL), window, 'dialogWidth='+width+'px;dialogHeight='+height+'px;dialogLeft='+iLeft+'px;dialogTop='+iTop+'px;scroll=auto');
}

/*弹出页面窗口方式二 - 带分页*/
function showWindowInPage(pageUrl, params, title, width, height) {
	var paramsNew = params.replace(/&/g, '$');//全局替换
	var sUrl = "/include/window/openWin/iFrame.jsp?pageUrl="+pageUrl+"&params="+paramsNew+"&jspTitle="+title;
	showWindow(sUrl, width, height);
}

/*弹出页面窗口方式一*/
function openWindow(sURL, title, width, height) {
	var pageURL = sURL+"&width="+width+"&height="+height;
	var iWidth = width + 50;	//弹出窗口的宽度;
	var iHeight = height + 50;	//弹出窗口的高度;
	var iTop = (window.screen.availHeight - 30 - iHeight) / 2;	//获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;	//获得窗口的水平位置;
	window.open(sURL, title, 'height='+iHeight+',innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
}


/*
ShowModalDialog函数的功能：
打开一个子窗口，并且可与父窗口相互传递数据，它与window.open的最大区别就在于由ShowModalDialog打开子窗口后，父窗口将不能操作。
使用方法：
vReturnValue = window.showModalDialog(sURL [, vArguments] [, sFeatures])
参数说明：
sURL
必选参数，类型：字符串。用来指定对话框要显示的文档的URL。
vArguments
可选参数，类型：变体。用来向对话框传递参数。传递的参数类型不限，包括数组等。对话框通过window.dialogArguments来取得传递进来的参数。
sFeatures
可选参数，类型：字符串。用来描述对话框的外观等信息，可以使用以下的一个或几个，用分号“;”隔开。
     dialogHeight 对话框高度，不小于100px，IE4中dialogHeight 和 dialogWidth 默认的单位是em，而IE5中是px，为方便其见，在定义modal方式的对话框时，用px做单位。
　　 dialogWidth: 对话框宽度。
　　 dialogLeft: 距离桌面左的距离。
　　 dialogTop: 离桌面上的距离。
　　 center: {yes | no | 1 | 0 }：窗口是否居中，默认yes，但仍可以指定高度和宽度。
　　 help: {yes | no | 1 | 0 }：是否显示帮助按钮，默认yes。
　　 resizable: {yes | no | 1 | 0 } ［IE5+］：是否可被改变大小。默认no。
　　 status: {yes | no | 1 | 0 } ［IE5+］：是否显示状态栏。默认为yes[ Modeless]或no  [Modal]。
     scroll:{ yes | no | 1 | 0 | on | off }：指明对话框是否显示滚动条。默认为yes。
参数传递方法：
父窗口向子窗口传递参数采用ShowModalDialog的第2个参数即可，父窗口要获取子窗口传回的参数则可通过ShowModalDialog函数的返回值获取。
子窗口获取父窗口参数的方法为采用子窗口window对象dialogArguments属性获取，例如：
var a=window.dialogArguments;
子窗口向父窗口返回参数采用window.returnValue属性，如：
window.returnValue=1;
window.close();
*/
