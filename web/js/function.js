google_ad_client = "pub-4988990012436832";
/* 728x90, 10-2-3 */
google_ad_slot = "7119947099";
google_ad_width = 728;
google_ad_height = 90;

function getFooter()
{

	var html="";
	html+=unescape("%3Cscript src='http://pagead2.googlesyndication.com/pagead/show_ads.js' type='text/javascript'%3E%3C/script%3E");
	html+="<div style='margin-top:30px;width:100%;' align='center'>";
		html+="<h1>CopyRight @2009 <a href='http://www.open-lib.com/'><u>open-lib.com</u></a>, Inc. All Rights Reserved</h1>";
	html+="</div>";

	html+="<div style='display:none;margin:auto;width:100%;' align='center'>";
			var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
			html+=unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E");
			html+=unescape("%3Cscript src='http://s83.cnzz.com/stat.php?id=1572068&web_id=1572068&show=pic1' charset='gb2312' type='text/javascript'%3E%3C/script%3E");
			html+=unescape("%3Cscript src='http://js.tongji.linezing.com/1269031/tongji.js' type='text/javascript'%3E%3C/script%3E");
	html+="</div>";
	document.write(html);

	try {
	var pageTracker = _gat._getTracker("UA-1475799-4");
	pageTracker._trackPageview();
	} catch(err) {}
}