$.fn.tabs = function(tabList, tabTxt, options) {
	var _tabList = $(this).find(tabList);
	var _tabTxt = $(this).find(tabTxt);
	var tabListLi = _tabList.find("li");
	var defaults = {
		currentTab : 0,
		defaultClass : "current",
		isAutoPlay : false,
		stepTime : 2000,
		switchingMode : "c"
	};
	var o = $.extend({}, defaults, options);
	var _isAutoPlay = o.isAutoPlay;
	var _stepTime = o.stepTime;
	var _switchingMode = o.switchingMode;
	_tabList.find("li:eq(" + o.currentTab + ")").addClass(o.defaultClass);
	_tabTxt.children("div").each(function(i) {
		$(this).attr("id", "wp_div" + i);
	}).eq(o.currentTab).css({
		"display" : "block"
	});
	tabListLi.each(function(i) {
		$(tabListLi[i]).mouseover(function() {
			if (_switchingMode == "o") {
				$(this).click();
			}
			_isAutoPlay = false;
		});
		$(tabListLi[i]).mouseout(function() {
			_isAutoPlay = true;
		})
	});
	_tabTxt.each(function(i) {
		$(_tabTxt[i]).mouseover(function() {
			_isAutoPlay = false;
		});
		$(_tabTxt[i]).mouseout(function() {
			_isAutoPlay = true;
		})
	});
	tabListLi.each(function(i) {
		$(tabListLi[i]).click(
				function() {
					if ($(this).className != o.defaultClass) {
						$(this).addClass(o.defaultClass).siblings()
								.removeClass(o.defaultClass);
					}
					if ($.browser.msie) {
						_tabTxt.children("div").eq(i).siblings().css({
							"display" : "none"
						});
						_tabTxt.children("div").eq(i).fadeIn(600);
					} else {
						_tabTxt.children("div").eq(i).css({
							"display" : "block"
						}).siblings().css({
							"display" : "none"
						});
					}
				})
	});
	function selectMe(oo) {
		if (oo != null && oo.html() != null && _isAutoPlay) {
			oo.click();
		}
		if (oo.html() == null) {
			selectMe(_tabList.find("li").eq(0));
		} else {
			window.setTimeout(selectMe, _stepTime, oo.next());
		}
	}
	if (_isAutoPlay) {
		selectMe(_tabList.find("li").eq(o.currentTab));
	}
	return this;
};
var userName = "wbpbest";
function hello(_name) {
	alert("hello," + _name);
}
var __sti = setInterval;
window.setInterval = function(callback, timeout, param) {
	var args = Array.prototype.slice.call(arguments, 2);
	var _cb = function() {
		callback.apply(null, args);
	}
	__sti(_cb, timeout);
}
var __sto = setTimeout;
window.setTimeout = function(callback, timeout, param) {
	var args = Array.prototype.slice.call(arguments, 2);
	var _cb = function() {
		callback.apply(null, args);
	}
	__sto(_cb, timeout);
}

$(document).ready(function() {
	$("#ex01").tabs(".ContactMenu", ".ContactBox", {
		currentTab : 0,
		switchingMode : 'o'
	});
	$("#ex01").find(".exContent2").tabs(".ContactMenu2", ".ContactBox2", {
		currentTab : 0,
		isAutoPlay : true
	});
	$("#ex02").tabs(".tabTitle", ".tabBox", {
		currentTab : 1,
		isAutoPlay : true,
		switchingMode : 'c'
	});
});