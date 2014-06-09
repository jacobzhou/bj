
function toadd(add) {
	var address = document.getElementById(add).value;
	window.location.href = address;
}

function setTab(n) {
	$("#xhxw1").hide();
	$("#xhxw2").hide();
	$("#xhxw3").hide();
	$("#xhxw4").hide();
	$("#xhxw" + n).show();
	$("#a" + n).style.color = "#D30F0F";
};

function dsm(dom){
	$(dom).find("div").show();
}

function hsm(dom){
	$(dom).find("div").hide();
}


$(document).ready(function() {
	initActiveMenu();
	initSe();
});

var context_path = "";

function displaySubMenu(ITstudy_cn) {  
  var subMenu = $("#" + ITstudy_cn);  
  subMenu.show();  
}  
function hideSubMenu(ITstudy_cn) {  
  var subMenu = $("#" + ITstudy_cn);  
  subMenu.hide();   
}
$(document).ready(function(){
	$("li", $("#top_main_menu")).each(function(){
		$(this).hover(function(){ $(this).addClass("hover"); }, function(){ $(this).removeClass("hover"); });
	});
});

function initActiveMenu() {
	var h = (document.location + "").replace(
			"http://" + document.location.hostname, "").replace(context_path,
			"");
	h = h.substring(h.indexOf("/") + 1);
	var fm = h.substring(0, h.indexOf("/"));
	if (fm == "")
		fm = "index";
	var sm = h.substring(h.indexOf("/") + 1);
	sm = sm.substring(0, sm.indexOf("/") > -1 ? sm.indexOf("/") : sm
			.indexOf("."));
	if (sm == "")
		sm = "index";
	if (!$("#top_menu_" + fm) || !$("#top_menu_" + fm).attr("id"))
		$("#top_menu_index").addClass("active");
	$("#top_menu_" + fm).addClass("active");
}

function initSe() {
	var default_text = "请输入搜索关键字";

	// 使用百度站内搜索
	// var saction =
	// "http://www.baidu.com/s?tn=baiduadv&bs=site%3A%28ylzinfo.com%29+%D2%BD%C1%C6&f=8&rsv_bp=1&wd=site%3A%28ylzinfo.com%29+";
	// 使用google站内搜索
	var saction = "http://www.google.com.kh/search?hl=zh-CN&newwindow=1&biw=1440&bih=805&num=10&lr=&ft=i&cr=&q=";
	$("#top_tsearch_ipt").focus(function() {
		if ($.trim($(this).val()) == default_text)
			$(this).val("");
		$(this).addClass("fcs");

	});
	$("#top_tsearch_ipt").blur(function() {
		if ($.trim($(this).val()) == "")
			$(this).val(default_text);
		$(this).removeClass("fcs");
	});
	$("#fm_tsearch").submit(
			function() {
				if ($.trim($("#top_tsearch_ipt").val()) == default_text
						|| $.trim($("#top_tsearch_ipt").val()) == "")
					return false;
				// window.open(saction +
				// encodeURIComponent($.trim($("#top_tsearch_ipt").val())) +
				// "+site%3Awww.ylzinfo.com");
				// window.open("http://www.cnvet.cn");
				return true;
			});
}

/**
 * 首页焦点图
 */
function indexFocus() {
	this.info = {
		fp_status : 0,
		fp_busy : false,
		fp_wtime : 5000,
		fp_clock : null,
		fp_count : 0,
		namesuf : ""
	};
	var _this = this;
	this.init = function(namesuf, wt) {
		_this.info.namesuf = namesuf;
		_this.info.fp_count = $(".bp", $("#" + _this.info.namesuf + "_bps")).length;
		if (wt)
			_this.info.fp_wtime = wt;
		_this.showFocusPic();
		_this.info.fp_clock = setInterval(function() {
			_this.fp_start();
		}, _this.info.fp_wtime);
		$("#index_fpics_prev")
				.click(
						function() {
							if (!_this.info.fp_busy) {
								_this.info.fp_clock = window
										.clearInterval(_this.info.fp_clock);
								var prev = _this.info.fp_status;
								_this.info.fp_status = _this.info.fp_status == 0 ? (_this.info.fp_count - 1)
										: (_this.info.fp_status - 1);
								_this.showFocusPic(_this.info.fp_status, prev);
								_this.info.fp_clock = setInterval(function() {
									_this.fp_start();
								}, _this.info.fp_wtime);
							}
						});
		$("#index_fpics_next").click(
				function() {
					if (!_this.info.fp_busy) {
						_this.info.fp_clock = window
								.clearInterval(_this.info.fp_clock);
						_this.info.fp_status += 1;
						if (_this.info.fp_status == _this.info.fp_count)
							_this.info.fp_status = 0;
						_this.showFocusPic();
						_this.info.fp_clock = setInterval(function() {
							_this.fp_start();
						}, _this.info.fp_wtime);
					}
				});
		$(".i", $("#" + _this.info.namesuf + "_sps"))
				.each(
						function(i) {
							$(this)
									.click(
											function() {
												if (!_this.info.fp_busy) {
													_this.info.fp_clock = window
															.clearInterval(_this.info.fp_clock);
													_this
															.showFocusPic(
																	i,
																	_this.info.fp_status);
													_this.info.fp_clock = setInterval(
															function() {
																_this
																		.fp_start();
															},
															_this.info.fp_wtime);
												}
											});
						});
	};
	this.showFocusPic = function(current, prev) {
		_this.info.fp_busy = true;
		if (current != undefined) {
			_this.info.fp_status = current;
		} // current index
		var pid = $(".bp:visible", $("#" + _this.info.namesuf + "_bps")).attr(
				"id");
		if (pid)
			pid = pid.substring(pid.lastIndexOf("_") + 1);
		prev = pid ? pid : ((prev != null && prev != "undefind") ? prev : 0);// prev
																				// index
		if (prev != _this.info.fp_status) {
			$("#" + _this.info.namesuf + "_bp_" + prev).animate({
				left : -630
			}, "slow", "", function() {
				$("#" + _this.info.namesuf + "_bp_" + prev).css("left", "0px");
				$("#" + _this.info.namesuf + "_bp_" + prev).hide();
			});
			$("#" + _this.info.namesuf + "_sp_" + prev).removeClass("active");
		}

		$("#" + _this.info.namesuf + "_bp_" + _this.info.fp_status).css("left",
				"630px");
		$("#" + _this.info.namesuf + "_bp_" + _this.info.fp_status).show();
		$("#" + _this.info.namesuf + "_bp_" + _this.info.fp_status).animate({
			left : 0
		}, "slow", "", function() {
			_this.info.fp_busy = false;
		});
		$("#" + _this.info.namesuf + "_title").html(
				$("#" + _this.info.namesuf + "_sp_" + _this.info.fp_status)
						.attr("title"));
		$("#" + _this.info.namesuf + "_sp_" + _this.info.fp_status).addClass(
				"active");
	};
	this.fp_start = function() {
		_this.info.fp_status += 1;
		if (_this.info.fp_status == _this.info.fp_count)
			_this.info.fp_status = 0;
		_this.showFocusPic();
	};
}
$(document).ready(function() {
	// 首页焦点图切换
	if ($("#index_fpics") && $("#index_fpics").attr("id")) {
		var pic_focus = new indexFocus();
		pic_focus.init("index_fpics", 6000);
	}

	// 用户搜索结果，鼠标划过效果
	$(".i", $("#user_search_list")).each(function() {
		$(this).hover(function() {
			$(this).addClass("active");
		}, function() {
			$(this).removeClass("active");
		});
	});
});