//搜索文本提示
$(document).ready(function(){
	$(function(){
	$(".search-ipt,.mail-ipt").focus(function(){
	$(this).addClass("ipt-focus");
	if($(this).val() ==this.defaultValue){
	$(this).val("");
	}
	}).blur(function(){
	$(this).removeClass("ipt-focus");
    if ($(this).val() == '') {
	$(this).val(this.defaultValue);
	}
	else{$(this).addClass("ipt-focus");}
	});
	})
	$('.news-items dl').hover(function(){
	   $(this).toggleClass('hover')
	})
	$('.svbox').hover(function(){
	   $(this).toggleClass('hover')
	})
	$('.cn-map li').hover(function(){
	   $(this).toggleClass('hover')
	})
})


//导航下拉菜单
var mouseover_tid = [];
var mouseout_tid = [];
$(document).ready(function(){
	$('.nav .m').parent().each(function(index){
		$(this).hover(
			function(){
				var _self = this;
				clearTimeout(mouseout_tid[index]);
				mouseover_tid[index] = setTimeout(function() {
					$(_self).find('.submenu').slideDown(200);
					$(_self).find('.submenu li:last').addClass('last')
					if($(_self).className!="current"){
					$(_self).addClass("current")
					}
				}, 100);
			},
 			function(){
				var _self = this;
				clearTimeout(mouseover_tid[index]);
				mouseout_tid[index] = setTimeout(function() {
					$(_self).find('.submenu').slideUp(200);
					$(_self).removeClass("current")
				}, 50);
			}
		);
	});

    $('.nav .m2').parent().each(function(index){
        $(this).hover(
            function(){
                var _self = this;
                var _submenu2 = $(this).find('.submenu2');
                clearTimeout(mouseout_tid[index]);
                mouseover_tid[index] = setTimeout(function() {
                    _submenu2.animate({'width':'show'});
                    _submenu2.find('.submenu2 li:last').addClass('last')
                    if($(_self).className!="current"){
                        $(_self).addClass("current")
                    }
                }, 100);
            },
            function(){
                var _self = this;
                var _submenu2 = $(this).find('.submenu2');
                clearTimeout(mouseover_tid[index]);
                mouseout_tid[index] = setTimeout(function() {
                    _submenu2.animate({'width':'hide'});
                    $(_self).removeClass("current")
                }, 50);
            }
        );
    });
});


$(document).ready(function(){
	$('.service-items li').hover(function(){
	   $(this).toggleClass('hover')
	})
	$('.team-list dl').hover(function(){
	   $(this).toggleClass('hover')
	})
})



//单选框美化
eval(function(p,a,c,k,e,d){e=function(c){return(c<a?"":e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)d[e(c)]=k[c]||e(c);k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1;};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p;}(';(5($,s,8){2 j=\'U\',P=s.P,u={g:\'S\',o:\'\',d:\'T\'};5 r(c,9){1.c=c;1.9=$.Z({},u,9);1.12=u;1.V=j;1.B()};5 J(c){c.h(\'a, 4\').x(\'Y D\',5(e){e.X();2 p=$(1).W(\'.y\');2 7=p.h(\'7\');2 z=p.h(\'a\');i(7.b(\'l\')==\'11\'){$(\'7[C="\'+7.b(\'C\')+\'"]\').L(5(10,0){$(0).v(\'6\').m().h(\'a\').R(\'6\')})};i(7.b(\'6\')!==8){7.v(\'6\').w()}M{7.b(\'6\',\'6\').w()};z.1e(\'6\')});c.h(\'a\').x(\'1f\',5(e){i(e.1c===1d){$(1).D()}})};r.1j.B=5(){2 0=$(1.c);0.1i(\'1h\',\'1g\');2 E=0.3(\'l\')!==8?0.3(\'l\'):0.b(\'l\');2 4=0.3(\'4\')!==8?0.3(\'4\'):\'\';2 g=0.3(\'A\')!==8?\'4\'+0.3(\'A\'):\'4\'+1.9.g;2 o=0.3(\'F\')!==8?0.3(\'F\'):1.9.o;2 d=0.3(\'d\')!==8?0.3(\'d\'):1.9.d;2 O=[\'15\'+E,g,o,d].K(\' \');0.16(\'<N q="y \'+O+\'"></N>\').m().13();2 f=[];2 t=0.b(\'6\')!==8?\'6\':\'\';i(g===\'14\'){f.k(\'<a G="#" q="\'+t+\'"></a>\');f.k(\'<4 I="\'+0.b(\'H\')+\'">\'+4+\'</4>\')}M{f.k(\'<4 I="\'+0.b(\'H\')+\'">\'+4+\'</4>\');f.k(\'<a G="#" q="\'+t+\'"></a>\')};0.m().17(f.K(\'\\n\'));J(0.m())};$.1a[j]=5(9){1.L(5(){i(!$.3(1,\'Q\'+j)){$.3(1,\'Q\'+j,1b r(1,9))}});18 1}}(19,s));',62,82,'el|this|var|data|label|function|checked|input|undefined|options||attr|element|color||dom|labelPosition|find|if|pluginName|push|type|parent||customClass|clickedParent|class|Plugin|window|isChecked|defaults|removeAttr|change|on|clearfix|fakeCheckable|labelposition|init|name|click|classType|customclass|href|id|for|addCheckableEvents|join|each|else|li|containerClasses|document|plugin_|removeClass|right|blue|Checkable|_name|closest|preventDefault|touchstart|extend|index|radio|_defaults|html|labelright|pretty|wrap|append|return|jQuery|fn|new|keyCode|32|toggleClass|keyup|none|display|css|prototype'.split('|'),0,{}))



//下拉框美化 2013-01-15
jQuery.fn.extend({
	selectbox: function(options) {
		return this.each(function() {
			new jQuery.SelectBox(this, options);
		});
	}
});


/* pawel maziarz: work around for ie logging */
if (!window.console) {
	var console = {
		log: function(msg) {
	 }
	}
}
/* */

jQuery.SelectBox = function(selectobj, options) {

	var opt = options || {};
	opt.inputClass = opt.inputClass || "selectbox";
	opt.containerClass = opt.containerClass || "select-menu";
	opt.hoverClass = opt.hoverClass || "current";
	opt.currentClass = opt.selectedClass || "selected"
	opt.debug = opt.debug || false;

	var elm_id = selectobj.id;
	var active = -1;
	var inFocus = false;
	var hasfocus = 0;
	//jquery object for select element
	var $select = $(selectobj);
	// jquery container object
	var $container = setupContainer(opt);
	//jquery input object
	var $input = setupInput(opt);

	// hide select and append newly created elements
	$select.hide().before($input).before($container);


	init();

	$input
	.click(function(){
    if (!inFocus) {
		  $container.toggle();
		}
	})
	.focus(function(){
	   if ($container.not(':visible')) {
	       inFocus = true;
	       $container.show();
		   $container.parent().addClass('select-active')
	   }
	})
	.keydown(function(event) {
		switch(event.keyCode) {
			case 38: // up
				event.preventDefault();
				moveSelect(-1);
				break;
			case 40: // down
				event.preventDefault();
				moveSelect(1);
				break;
			//case 9:  // tab
			case 13: // return
				event.preventDefault(); // seems not working in mac !
				$('li.'+opt.hoverClass).trigger('click');
				break;
			case 27: //escape
			  hideMe();
			  $container.parent().removeClass('select-active')
			  break;
		}
	})
	.blur(function() {
		if ($container.is(':visible') && hasfocus > 0 ) {
			if(opt.debug) console.log('container visible and has focus')
		} else {
			hideMe();
			$container.parent().removeClass('select-active')
		}
	});


	function hideMe() {
		hasfocus = 0;
		$container.hide();
	}

	function init() {
		$container.append(getSelectOptions($input.attr('id'))).hide();
		var width = $input.css('width');
		//$container.width(width);
    }

	function setupContainer(options) {
		var container = document.createElement("div");
		$container = $(container);
		$container.attr('id', elm_id+'_container');
		$container.addClass(options.containerClass);

		return $container;
	}

	function setupInput(options) {
		var input = document.createElement("input");
		var $input = $(input);
		$input.attr("id", elm_id+"_input");
		$input.attr("type", "text");
		$input.addClass(options.inputClass);
		$input.attr("autocomplete", "off");
		$input.attr("readonly", "readonly");
		$input.attr("tabIndex", $select.attr("tabindex")); // "I" capital is important for ie

		return $input;
	}

	function moveSelect(step) {
		var lis = $("li", $container);
		if (!lis) return;

		active += step;

		if (active < 0) {
			active = 0;
		} else if (active >= lis.size()) {
			active = lis.size() - 1;
		}

		lis.removeClass(opt.hoverClass);

		$(lis[active]).addClass(opt.hoverClass);
	}

	function setCurrent() {
		var li = $("li."+opt.currentClass, $container).get(0);
		var ar = (''+li.id).split('_');
		var el = ar[ar.length-1];
		$select.val(el);
		$input.val($(li).html());
		return true;
	}

	// select value
	function getCurrentSelected() {
		return $select.val();
	}

	// input value
	function getCurrentValue() {
		return $input.val();
	}

	function getSelectOptions(parentid) {
		var select_options = new Array();
		var ul = document.createElement('ul');
		$select.children('option').each(function() {
			var li = document.createElement('li');
			li.setAttribute('id', parentid + '_' + $(this).val());
			li.innerHTML = $(this).html();
			if ($(this).is(':selected')) {
				$input.val($(this).html());
				$(li).addClass(opt.currentClass);
			}
			ul.appendChild(li);
			$(li)
			.mouseover(function(event) {
				hasfocus = 1;
				if (opt.debug) console.log('over on : '+this.id);
				jQuery(event.target, $container).addClass(opt.hoverClass);
			})
			.mouseout(function(event) {
				hasfocus = -1;
				if (opt.debug) console.log('out on : '+this.id);
				jQuery(event.target, $container).removeClass(opt.hoverClass);
			})
			.click(function(event) {
			  var fl = $('li.'+opt.hoverClass, $container).get(0);
				if (opt.debug) console.log('click on :'+this.id);
				$('li.'+opt.currentClass).removeClass(opt.currentClass);
				$(this).addClass(opt.currentClass);
				setCurrent();
				$container.parent().removeClass('select-active')
				hideMe();
			});
		});
		return ul;
	}

};


//服务案例
function showcases() {
  $('.case-items dd').hide();
  $('.case-items dd').children('.current').parent().show();
  $('.case-items dd:first').show();
  $('.case-items dl dt').click(
    function() {
      var checkElement = $(this).next();
      if((checkElement.is('dd')) && (checkElement.is(':visible'))) {
        checkElement.slideUp(200);
		checkElement.parent().removeClass('current')
        }
      if((checkElement.is('dd')) && (!checkElement.is(':visible'))) {
        // $('.case-items dd:visible').slideUp(200);
		// $('.case-items dd:visible').parent().removeClass('current')
        checkElement.slideDown(200);
				checkElement.parent().addClass('current')
        return false;
        }
      }
    );
  }
$(document).ready(
   function() {showcases();
   }
);



Array.prototype.remove = function() {
  var what, a = arguments, L = a.length, ax;
  while (L && this.length) {
      what = a[--L];
      while ((ax = this.indexOf(what)) !== -1) {
          this.splice(ax, 1);
      }
  }
  return this;
};


$(function(){
  $.isBlank = function(obj){
    return(!obj || $.trim(obj) === "");
  };
// multi-level selector

  $('select.multi-level').live('change', function() {
    $selector = $(this);

    $('#' + $selector.attr("aim_id")).val($selector.val());

    $.ajax({
      type: "get",
      url: '/admin/catalogs/selects?id=' + $selector.val() + '&otype=' + $selector.attr("otype") + '&aim_id=' + $selector.attr("aim_id"),
      beforeSend: function(XMLHttpRequest){
        $selector.nextAll().remove();
      },
      success: function(data, textStatus){
        if (data.length > 0) {
          $selector.nextAll().remove();
          $selector.parent().append(data);
        }
      },
      complete: function(XMLHttpRequest, textStatus){

      //HideLoading();
      },
      error: function(){

      //请求出错处理
      }
    });
  }); 

  // 日期时间控件
  $('.my97_date').click(function() {
    WdatePicker({dateFmt:'yyyy-MM-dd'});
  });

  $('.my97_time').click(function() {
    WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});
  });
})
