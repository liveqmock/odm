var bXmlHttpSupport = (typeof XMLHttpRequest != "undefined" || window.ActiveXObject);

if (typeof XMLHttpRequest == "undefined" && window.ActiveXObject) {
	function XMLHttpRequest() {
    	var arrSignatures = ["MSXML2.XMLHTTP.5.0", "MSXML2.XMLHTTP.4.0",
    	"MSXML2.XMLHTTP.3.0", "MSXML2.XMLHTTP",
		"Microsoft.XMLHTTP"];
		for (var i=0; i < arrSignatures.length; i++) {
			try {        
				var oRequest = new ActiveXObject(arrSignatures[i]);            
				return oRequest;        
			} catch (oError) {/*ignore*/ }
		}
    	throw new Error("MSXML is not installed on your system.");               
	}
}        
function ajaxRequest(url, param, callBackFunction) {
	try{
		if(bXmlHttpSupport) {
	    	var sUrl = url + '?date='+new Date();
			var oRequest = new XMLHttpRequest();
			oRequest.onreadystatechange = function() {
				if(oRequest.readyState == 4) {
					callBackFunction(oRequest);
				}
			};
			oRequest.open('POST', sUrl);
			oRequest.setRequestHeader("Content-Type", "application/json");
			oRequest.send(param);
		}
	}catch(e){
			
	}
}