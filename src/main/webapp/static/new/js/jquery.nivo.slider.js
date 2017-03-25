/*
 * jQuery Nivo Slider v2.6
 * http://nivo.dev7studios.com
 *
 * Copyright 2011, Gilbert Pellegrom
 * Free to use and abuse under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * March 2010
 */

(function($) {

    var NivoSlider = function(element, options){
		//Defaults are below
		var settings = $.extend({}, $.fn.nivoSlider.defaults, options);

        //Useful variables. Play carefully.
        var vars = {
            currentSlide: 0,
            currentImage: '',
            totalSlides: 0,
            randAnim: '',
            running: false,
            paused: false,
            stop: false
        };
    
        //Get this slider
        var slider = $(element);
        slider.data('nivo:vars', vars);
        slider.css('position','relative');
        slider.addClass('nivoSlider');
        
        //Find our slider children
        var kids = slider.children();
        kids.each(function() {
            var child = $(this);
            var link = '';
            if(!child.is('img')){
                if(child.is('a')){
                    child.addClass('nivo-imageLink');
                    link = child;
                }
                child = child.find('img:first');
            }
            //Get img width & height
            var childWidth = child.width();
            if(childWidth == 0) childWidth = child.attr('width');
            var childHeight = child.height();
            if(childHeight == 0) childHeight = child.attr('height');
            //Resize the slider
            if(childWidth > slider.width()){
                slider.width(childWidth);
            }
            if(childHeight > slider.height()){
                slider.height(childHeight);
            }
            if(link != ''){
                link.css('display','none');
            }
            child.css('display','none');
            vars.totalSlides++;
        });
        
        //Set startSlide
        if(settings.startSlide > 0){
            if(settings.startSlide >= vars.totalSlides) settings.startSlide = vars.totalSlides - 1;
            vars.currentSlide = settings.startSlide;
        }
        
        //Get initial image
        if($(kids[vars.currentSlide]).is('img')){
            vars.currentImage = $(kids[vars.currentSlide]);
        } else {
            vars.currentImage = $(kids[vars.currentSlide]).find('img:first');
        }
        
        //Show initial link
        if($(kids[vars.currentSlide]).is('a')){
            $(kids[vars.currentSlide]).css('display','block');
        }
        
        //Set first background
        slider.css('background','url("'+ vars.currentImage.attr('src') +'") no-repeat');

        //Create caption
        slider.append(
            $('<div class="nivo-caption"><h1></h1><p></p></div>').css({ display:'none', opacity:settings.captionOpacity })
        );			
		
		// Process caption function
		var processCaption = function(settings){
			var nivoCaption = $('.nivo-caption', slider);
			if(vars.currentImage.attr('title') != '' && vars.currentImage.attr('title') != undefined){
				var title = vars.currentImage.attr('title');
				var heading  = "";
				
				if(title.substr(0,1) == '#') {
					heading = $("h1",title).html();	
					title = $("p",title).html();						
				}

				if(nivoCaption.css('display') == 'block'){
					nivoCaption.find('h1').fadeOut(settings.animSpeed, function(){
						$(this).html(heading);
						$(this).fadeIn(settings.animSpeed);
					});
					nivoCaption.find('p').fadeOut(settings.animSpeed, function(){
						$(this).html(title);
						$(this).fadeIn(settings.animSpeed);
					});
				} else {
					nivoCaption.find('h1').html(heading);					
					nivoCaption.find('p').html(title);
				}					
				nivoCaption.fadeIn(settings.animSpeed);
			} else {
				nivoCaption.fadeOut(settings.animSpeed);
			}
		}
		
        //Process initial  caption
        processCaption(settings);
        
        //In the words of Super Mario "let's a go!"
        var timer = 0;
        if(!settings.manualAdvance && kids.length > 1){
            timer = setInterval(function(){ nivoRun(slider, kids, settings, false); }, settings.pauseTime);
        }

        //Add Direction nav
        if(settings.directionNav){
            slider.append('<div class="nivo-directionNav"><a class="nivo-prevNav">'+ settings.prevText +'</a><a class="nivo-nextNav">'+ settings.nextText +'</a></div>');
            
            //Hide Direction nav
            if(settings.directionNavHide){
                $('.nivo-directionNav', slider).hide();
                slider.hover(function(){
                    $('.nivo-directionNav', slider).show();
                }, function(){
                    $('.nivo-directionNav', slider).hide();
                });
            }
            
            $('a.nivo-prevNav', slider).live('click', function(){
                if(vars.running) return false;
                clearInterval(timer);
                timer = '';
                vars.currentSlide -= 2;
                nivoRun(slider, kids, settings, 'prev');
            });
            
            $('a.nivo-nextNav', slider).live('click', function(){
                if(vars.running) return false;
                clearInterval(timer);
                timer = '';
                nivoRun(slider, kids, settings, 'next');
            });
        }
        
        //Add Control nav
        if(settings.controlNav){
            var nivoControl = $('<div class="nivo-controlNav"></div>');
            slider.append(nivoControl);
            for(var i = 0; i < kids.length; i++){
                if(settings.controlNavThumbs){
                    var child = kids.eq(i);
                    if(!child.is('img')){
                        child = child.find('img:first');
                    }
                    if (settings.controlNavThumbsFromRel) {
                        nivoControl.append('<a class="nivo-control" rel="'+ i +'"><img src="'+ child.attr('rel') + '" alt="" /></a>');
                    } else {
                        nivoControl.append('<a class="nivo-control" rel="'+ i +'"><img src="'+ child.attr('src').replace(settings.controlNavThumbsSearch, settings.controlNavThumbsReplace) +'" alt="" /></a>');
                    }
                } else {
                    nivoControl.append('<a class="nivo-control" rel="'+ i +'">'+ (i + 1) +'</a>');
                }
                
            }
            //Set initial active link
            $('.nivo-controlNav a:eq('+ vars.currentSlide +')', slider).addClass('active');
            
            $('.nivo-controlNav a', slider).live('click', function(){
                if(vars.running) return false;
                if($(this).hasClass('active')) return false;
                clearInterval(timer);
                timer = '';
                //alert(settings.useTransparentBg);
				if(settings.useTransparentBg===false){
					slider.css('background','url("'+ vars.currentImage.attr('src') +'") no-repeat');
				}else{
					slider.css('background','none');//the line above changed with this one to support alpha png images
				}
				
                vars.currentSlide = $(this).attr('rel') - 1;
                nivoRun(slider, kids, settings, 'control');
            });
        }
        
        //Keyboard Navigation
        if(settings.keyboardNav){
            $(window).keypress(function(event){
                //Left
                if(event.keyCode == '37'){
                    if(vars.running) return false;
                    clearInterval(timer);
                    timer = '';
                    vars.currentSlide-=2;
                    nivoRun(slider, kids, settings, 'prev');
                }
                //Right
                if(event.keyCode == '39'){
                    if(vars.running) return false;
                    clearInterval(timer);
                    timer = '';
                    nivoRun(slider, kids, settings, 'next');
                }
            });
        }
        
        //For pauseOnHover setting
        if(settings.pauseOnHover){
            slider.hover(function(){
                vars.paused = true;
                clearInterval(timer);
                timer = '';
            }, function(){
                vars.paused = false;
                //Restart the timer
                if(timer == '' && !settings.manualAdvance){
                    timer = setInterval(function(){ nivoRun(slider, kids, settings, false); }, settings.pauseTime);
                }
            });
        }
        
        //Event when Animation finishes
        slider.bind('nivo:animFinished', function(){ 
            vars.running = false; 
            //Hide child links
            $(kids).each(function(){
                if($(this).is('a')){
                    $(this).css('display','none');
                }
            });
            //Show current link
            if($(kids[vars.currentSlide]).is('a')){
                $(kids[vars.currentSlide]).css('display','block');
            }
            //Restart the timer
            if(timer == '' && !vars.paused && !settings.manualAdvance){
                timer = setInterval(function(){ nivoRun(slider, kids, settings, false); }, settings.pauseTime);
            }
            //Trigger the afterChange callback
            settings.afterChange.call(this);
        });
        
        // Add slices for slice animations
        var createSlices = function(slider, settings, vars){
            for(var i = 0; i < settings.slices; i++){
				var sliceWidth = Math.round(slider.width()/settings.slices);
				if(i == settings.slices-1){
					slider.append(
						$('<div class="nivo-slice"></div>').css({ 
							left:(sliceWidth*i)+'px', width:(slider.width()-(sliceWidth*i))+'px',
							height:'0px', 
							opacity:'0', 
							background: 'url("'+ vars.currentImage.attr('src') +'") no-repeat -'+ ((sliceWidth + (i * sliceWidth)) - sliceWidth) +'px 0%'
						})
					);
				} else {
					slider.append(
						$('<div class="nivo-slice"></div>').css({ 
							left:(sliceWidth*i)+'px', width:sliceWidth+'px',
							height:'0px', 
							opacity:'0', 
							background: 'url("'+ vars.currentImage.attr('src') +'") no-repeat -'+ ((sliceWidth + (i * sliceWidth)) - sliceWidth) +'px 0%'
						})
					);
				}
			}
        }
		
		// Add boxes for box animations
		var createBoxes = function(slider, settings, vars){
			var boxWidth = Math.round(slider.width()/settings.boxCols);
			var boxHeight = Math.round(slider.height()/settings.boxRows);
			
			for(var rows = 0; rows < settings.boxRows; rows++){
				for(var cols = 0; cols < settings.boxCols; cols++){
					if(cols == settings.boxCols-1){
						slider.append(
							$('<div class="nivo-box"></div>').css({ 
								opacity:0,
								left:(boxWidth*cols)+'px', 
								top:(boxHeight*rows)+'px',
								width:(slider.width()-(boxWidth*cols))+'px',
								height:boxHeight+'px',
								background: 'url("'+ vars.currentImage.attr('src') +'") no-repeat -'+ ((boxWidth + (cols * boxWidth)) - boxWidth) +'px -'+ ((boxHeight + (rows * boxHeight)) - boxHeight) +'px'
							})
						);
					} else {
						slider.append(
							$('<div class="nivo-box"></div>').css({ 
								opacity:0,
								left:(boxWidth*cols)+'px', 
								top:(boxHeight*rows)+'px',
								width:boxWidth+'px',
								height:boxHeight+'px',
								background: 'url("'+ vars.currentImage.attr('src') +'") no-repeat -'+ ((boxWidth + (cols * boxWidth)) - boxWidth) +'px -'+ ((boxHeight + (rows * boxHeight)) - boxHeight) +'px'
							})
						);
					}
				}
			}
		}

        // Private run method
		var nivoRun = function(slider, kids, settings, nudge){
			//Get our vars
			var vars = slider.data('nivo:vars');
            
            //Trigger the lastSlide callback
            if(vars && (vars.currentSlide == vars.totalSlides - 1)){ 
				settings.lastSlide.call(this);
			}
            
            // Stop
			if((!vars || vars.stop) && !nudge) return false;
			
			//Trigger the beforeChange callback
			settings.beforeChange.call(this);

			if(settings.useTransparentBg===false){

				//Set current background before change
				if(!nudge){
					slider.css('background','url("'+ vars.currentImage.attr('src') +'") no-repeat');
				} else {
					if(nudge == 'prev'){
						slider.css('background','url("'+ vars.currentImage.attr('src') +'") no-repeat');
					}
					if(nudge == 'next'){
						slider.css('background','url("'+ vars.currentImage.attr('src') +'") no-repeat');
					}
				}
			}else{
				if(!nudge){//the block above changed with this one to support alpha png images
					slider.css('background','none');
				} else {
					if(nudge == 'prev')
					{
						slider.css('background','none');
					}
					if(nudge == 'next'){
						slider.css('background','none');
					}
				}			
			}
			
			vars.currentSlide++;
            //Trigger the slideshowEnd callback
			if(vars.currentSlide == vars.totalSlides){ 
				vars.currentSlide = 0;
				settings.slideshowEnd.call(this);
			}
			if(vars.currentSlide < 0) vars.currentSlide = (vars.totalSlides - 1);
			//Set vars.currentImage
			if($(kids[vars.currentSlide]).is('img')){
				vars.currentImage = $(kids[vars.currentSlide]);
			} else {
				vars.currentImage = $(kids[vars.currentSlide]).find('img:first');
			}
			
			//Set active links
			if(settings.controlNav){
				$('.nivo-controlNav a', slider).removeClass('active');
				$('.nivo-controlNav a:eq('+ vars.currentSlide +')', slider).addClass('active');
			}
			
			//Process caption
			processCaption(settings);
			
			// Remove any slices from last transition
			$('.nivo-slice', slider).remove();
			
			// Remove any boxes from last transition
			$('.nivo-box', slider).remove();
			
			if(settings.effect == 'random'){
				var anims = new Array('sliceDownRight','sliceDownLeft','sliceUpRight','sliceUpLeft','sliceUpDown','sliceUpDownLeft','fold','fade',
                'boxRandom','boxRain','boxRainReverse','boxRainGrow','boxRainGrowReverse');
				vars.randAnim = anims[Math.floor(Math.random()*(anims.length + 1))];
				if(vars.randAnim == undefined) vars.randAnim = 'fade';
			}
            
            //Run random effect from specified set (eg: effect:'fold,fade')
            if(settings.effect.indexOf(',') != -1){
                var anims = settings.effect.split(',');
                vars.randAnim = anims[Math.floor(Math.random()*(anims.length))];
				if(vars.randAnim == undefined) vars.randAnim = 'fade';
            }
		
			//Run effects
			vars.running = true;
			if(settings.effect == 'sliceDown' || settings.effect == 'sliceDownRight' || vars.randAnim == 'sliceDownRight' ||
				settings.effect == 'sliceDownLeft' || vars.randAnim == 'sliceDownLeft'){
				createSlices(slider, settings, vars);
				var timeBuff = 0;
				var i = 0;
				var slices = $('.nivo-slice', slider);
				if(settings.effect == 'sliceDownLeft' || vars.randAnim == 'sliceDownLeft') slices = $('.nivo-slice', slider)._reverse();
				
				slices.each(function(){
					var slice = $(this);
					slice.css({ 'top': '0px' });
					if(i == settings.slices-1){
						setTimeout(function(){
							slice.animate({ height:'100%', opacity:'1.0' }, settings.animSpeed, '', function(){ slider.trigger('nivo:animFinished'); });
						}, (100 + timeBuff));
					} else {
						setTimeout(function(){
							slice.animate({ height:'100%', opacity:'1.0' }, settings.animSpeed);
						}, (100 + timeBuff));
					}
					timeBuff += 50;
					i++;
				});
			} 
			else if(settings.effect == 'sliceUp' || settings.effect == 'sliceUpRight' || vars.randAnim == 'sliceUpRight' ||
					settings.effect == 'sliceUpLeft' || vars.randAnim == 'sliceUpLeft'){
				createSlices(slider, settings, vars);
				var timeBuff = 0;
				var i = 0;
				var slices = $('.nivo-slice', slider);
				if(settings.effect == 'sliceUpLeft' || vars.randAnim == 'sliceUpLeft') slices = $('.nivo-slice', slider)._reverse();
				
				slices.each(function(){
					var slice = $(this);
					slice.css({ 'bottom': '0px' });
					if(i == settings.slices-1){
						setTimeout(function(){
							slice.animate({ height:'100%', opacity:'1.0' }, settings.animSpeed, '', function(){ slider.trigger('nivo:animFinished'); });
						}, (100 + timeBuff));
					} else {
						setTimeout(function(){
							slice.animate({ height:'100%', opacity:'1.0' }, settings.animSpeed);
						}, (100 + timeBuff));
					}
					timeBuff += 50;
					i++;
				});
			} 
			else if(settings.effect == 'sliceUpDown' || settings.effect == 'sliceUpDownRight' || vars.randAnim == 'sliceUpDown' || 
					settings.effect == 'sliceUpDownLeft' || vars.randAnim == 'sliceUpDownLeft'){
				createSlices(slider, settings, vars);
				var timeBuff = 0;
				var i = 0;
				var v = 0;
				var slices = $('.nivo-slice', slider);
				if(settings.effect == 'sliceUpDownLeft' || vars.randAnim == 'sliceUpDownLeft') slices = $('.nivo-slice', slider)._reverse();
				
				slices.each(function(){
					var slice = $(this);
					if(i == 0){
						slice.css('top','0px');
						i++;
					} else {
						slice.css('bottom','0px');
						i = 0;
					}
					
					if(v == settings.slices-1){
						setTimeout(function(){
							slice.animate({ height:'100%', opacity:'1.0' }, settings.animSpeed, '', function(){ slider.trigger('nivo:animFinished'); });
						}, (100 + timeBuff));
					} else {
						setTimeout(function(){
							slice.animate({ height:'100%', opacity:'1.0' }, settings.animSpeed);
						}, (100 + timeBuff));
					}
					timeBuff += 50;
					v++;
				});
			} 
			else if(settings.effect == 'fold' || vars.randAnim == 'fold'){
				createSlices(slider, settings, vars);
				var timeBuff = 0;
				var i = 0;
				
				$('.nivo-slice', slider).each(function(){
					var slice = $(this);
					var origWidth = slice.width();
					slice.css({ top:'0px', height:'100%', width:'0px' });
					if(i == settings.slices-1){
						setTimeout(function(){
							slice.animate({ width:origWidth, opacity:'1.0' }, settings.animSpeed, '', function(){ slider.trigger('nivo:animFinished'); });
						}, (100 + timeBuff));
					} else {
						setTimeout(function(){
							slice.animate({ width:origWidth, opacity:'1.0' }, settings.animSpeed);
						}, (100 + timeBuff));
					}
					timeBuff += 50;
					i++;
				});
			}  
			else if(settings.effect == 'fade' || vars.randAnim == 'fade'){
				createSlices(slider, settings, vars);
				
				var firstSlice = $('.nivo-slice:first', slider);
                firstSlice.css({
                    'height': '100%',
                    'width': slider.width() + 'px'
                });
    
				firstSlice.animate({ opacity:'1.0' }, (settings.animSpeed*2), '', function(){ slider.trigger('nivo:animFinished'); });
			}          
            else if(settings.effect == 'slideInRight' || vars.randAnim == 'slideInRight'){
				createSlices(slider, settings, vars);
				
                var firstSlice = $('.nivo-slice:first', slider);
                firstSlice.css({
                    'height': '100%',
                    'width': '0px',
                    'opacity': '1'
                });

                firstSlice.animate({ width: slider.width() + 'px' }, (settings.animSpeed*2), '', function(){ slider.trigger('nivo:animFinished'); });
            }
            else if(settings.effect == 'slideInLeft' || vars.randAnim == 'slideInLeft'){
				createSlices(slider, settings, vars);
				
                var firstSlice = $('.nivo-slice:first', slider);
                firstSlice.css({
                    'height': '100%',
                    'width': '0px',
                    'opacity': '1',
                    'left': '',
                    'right': '0px'
                });

                firstSlice.animate({ width: slider.width() + 'px' }, (settings.animSpeed*2), '', function(){ 
                    // Reset positioning
                    firstSlice.css({
                        'left': '0px',
                        'right': ''
                    });
                    slider.trigger('nivo:animFinished'); 
                });
            }
			else if(settings.effect == 'boxRandom' || vars.randAnim == 'boxRandom'){
				createBoxes(slider, settings, vars);
				
				var totalBoxes = settings.boxCols * settings.boxRows;
				var i = 0;
				var timeBuff = 0;
				
				var boxes = shuffle($('.nivo-box', slider));
				boxes.each(function(){
					var box = $(this);
					if(i == totalBoxes-1){
						setTimeout(function(){
							box.animate({ opacity:'1' }, settings.animSpeed, '', function(){ slider.trigger('nivo:animFinished'); });
						}, (100 + timeBuff));
					} else {
						setTimeout(function(){
							box.animate({ opacity:'1' }, settings.animSpeed);
						}, (100 + timeBuff));
					}
					timeBuff += 20;
					i++;
				});
			}
			else if(settings.effect == 'boxRain' || vars.randAnim == 'boxRain' || settings.effect == 'boxRainReverse' || vars.randAnim == 'boxRainReverse' || 
                    settings.effect == 'boxRainGrow' || vars.randAnim == 'boxRainGrow' || settings.effect == 'boxRainGrowReverse' || vars.randAnim == 'boxRainGrowReverse'){
				createBoxes(slider, settings, vars);
				
				var totalBoxes = settings.boxCols * settings.boxRows;
				var i = 0;
				var timeBuff = 0;
				
				// Split boxes into 2D array
				var rowIndex = 0;
				var colIndex = 0;
				var box2Darr = new Array();
				box2Darr[rowIndex] = new Array();
				var boxes = $('.nivo-box', slider);
				if(settings.effect == 'boxRainReverse' || vars.randAnim == 'boxRainReverse' ||
                   settings.effect == 'boxRainGrowReverse' || vars.randAnim == 'boxRainGrowReverse'){
					boxes = $('.nivo-box', slider)._reverse();
				}
				boxes.each(function(){
					box2Darr[rowIndex][colIndex] = $(this);
					colIndex++;
					if(colIndex == settings.boxCols){
						rowIndex++;
						colIndex = 0;
						box2Darr[rowIndex] = new Array();
					}
				});
				
				// Run animation
				for(var cols = 0; cols < (settings.boxCols * 2); cols++){
					var prevCol = cols;
					for(var rows = 0; rows < settings.boxRows; rows++){
						if(prevCol >= 0 && prevCol < settings.boxCols){
							/* Due to some weird JS bug with loop vars 
							being used in setTimeout, this is wrapped
							with an anonymous function call */
							(function(row, col, time, i, totalBoxes) {
								var box = $(box2Darr[row][col]);
                                var w = box.width();
                                var h = box.height();
                                if(settings.effect == 'boxRainGrow' || vars.randAnim == 'boxRainGrow' ||
                                   settings.effect == 'boxRainGrowReverse' || vars.randAnim == 'boxRainGrowReverse'){
                                    box.width(0).height(0);
                                }
								if(i == totalBoxes-1){
									setTimeout(function(){
										box.animate({ opacity:'1', width:w, height:h }, settings.animSpeed/1.3, '', function(){ slider.trigger('nivo:animFinished'); });
									}, (100 + time));
								} else {
									setTimeout(function(){
										box.animate({ opacity:'1', width:w, height:h }, settings.animSpeed/1.3);
									}, (100 + time));
								}
							})(rows, prevCol, timeBuff, i, totalBoxes);
							i++;
						}
						prevCol--;
					}
					timeBuff += 100;
				}
			}
		}
		
		// Shuffle an array
		var shuffle = function(arr){
			for(var j, x, i = arr.length; i; j = parseInt(Math.random() * i), x = arr[--i], arr[i] = arr[j], arr[j] = x);
			return arr;
		}
        
        // For debugging
        var trace = function(msg){
            if (this.console && typeof console.log != "undefined")
                console.log(msg);
        }
        
        // Start / Stop
        this.stop = function(){
            if(!$(element).data('nivo:vars').stop){
                $(element).data('nivo:vars').stop = true;
                trace('Stop Slider');
            }
        }
        
        this.start = function(){
            if($(element).data('nivo:vars').stop){
                $(element).data('nivo:vars').stop = false;
                trace('Start Slider');
            }
        }
        
        //Trigger the afterLoad callback
        settings.afterLoad.call(this);
		
		return this;
    };
        
    $.fn.nivoSlider = function(options) {
    
        return this.each(function(key, value){
            var element = $(this);
            // Return early if this element already has a plugin instance
            if (element.data('nivoslider')) return element.data('nivoslider');
            // Pass options to plugin constructor
            var nivoslider = new NivoSlider(this, options);
            // Store plugin object in this element's data
            element.data('nivoslider', nivoslider);
        });

	};
	
	//Default settings
	$.fn.nivoSlider.defaults = {
		effect: 'random',
		slices: 15,
		boxCols: 8,
		boxRows: 4,
		animSpeed: 500,
		pauseTime: 3000,
		startSlide: 0,
		directionNav: true,
		directionNavHide: true,
		controlNav: true,
		controlNavThumbs: false,
        controlNavThumbsFromRel: false,
		controlNavThumbsSearch: '.png',
		controlNavThumbsReplace: '_thumb.png',
		keyboardNav: true,
		pauseOnHover: true,
		manualAdvance: false,
		captionOpacity: 0.8,
		prevText: 'Prev',
		nextText: 'Next',
		beforeChange: function(){},
		afterChange: function(){},
		slideshowEnd: function(){},
        lastSlide: function(){},
        afterLoad: function(){}
	};
	
	$.fn._reverse = [].reverse;
	
})(jQuery);

$(document).ready(function() {
	
	$("#logo").click(function(){window.location="./";});
	
	//handler for subscribe box focus & blur events
	$(".txt_email").focus(function() {
		if($(this).val()=="Enter email address") $(this).val("");
	}).blur(function() {
		if($(this).val()=="") $(this).val("Enter email address");
	});
			
	//handler for search box focus & blur events
	$(".txt_search").focus(function() {
		if($(this).val()=="search") $(this).val("");
	}).blur(function() {
		if($(this).val()=="") $(this).val("search");
	});
	
	//handle search form's submit event
	$(".form_search").submit(function() {
		var search_value = $(".txt_search").val();
		return search_value!=""?true:false;//return false if there is nothing to search by
	});
	
	/*superfish pull-down menu*/
	$('ul.sf-menu').supersubs({minWidth:6,maxWidth:25,extraWidth:1}).superfish({animation:{height:'show'},dropShadows:false,delay:500,speed:'fast',animation:{opacity: 'show', height: 'show'}});
	
	/*autocomplete plugin*/	
	/*please see scripts/autocomplete/demo/index.html for further information and uses*/
	$(".txt_search").autocomplete("scripts/autocomplete/demo/search.php", {
		width: 185,
		selectFirst: true,
		scroll: true,
		scrollHeight: 380,
		max: 10
	});
	
	/*flickr*/
	getLatestFlickrPhotos();

	/*blog social links*/
	blogPostPage();
	
	/*initialize nivo slider*/
	initNivoSlider();
	
	/*home page three box sliding effect*/
	threeBoxSlidingEffect();
	
	/*ajax global handlers*/
	ajaxGlobalHandlers();
	
	/*call simple tabs*/
	$('.tabs a').click(function(){
		switch_tabs($(this));
		return false;
	});
	switch_tabs($('.defaulttab'),'0');
	
	/*call simpe accordion*/
	$(".accordion-large").largeAccordion();	
	
	/*login panel*/
	loginPanel();
	
	/*large accordion hover effect (used in faq page)*/
	$(".accordion-large").find("li").hover(
		function(){
			$(this).stop().animate({backgroundPosition: '20px 0px'},'fast','easeInOutExpo').find("a").css("color","#fff");
		}
		,
		function(){
			//alert($(this).find("a").data("isopen"));
			if($(this).find("a").data("isopen") == "0") { return false; }
			$(this).stop().animate({backgroundPosition: '-670px 0px'},'fast','easeInOutExpo').find("a").css("color","");	
		}
	);

	$("#top_link").click(function(){ $('html, body').animate({scrollTop:0}, 'slow');return false; });
		
});

$(window).scroll(function() {
   if($(window).scrollTop() + $(window).height() == $(document).height()) {
	   $("#top_link").fadeIn("fast");
   }else{
	   $("#top_link").fadeOut("fast");
   }
});

/*occurs whenever dom changed too*/
/*very important. runs after @font-faces loaded*/
$(window).bind("load", function() {
	make_two_column_same_size();
	
	inPageAnimations();
});

function initNivoSlider(){
	$('#slider3').nivoSlider({
		pauseTime:5000,
		pauseOnHover:false,
		directionNav:true,			
		controlNavThumbs:false,
		controlNavThumbsFromRel:false,
		useTransparentBg:false
	});	
}

function inPageAnimations(){
	//add fade effect to object with given css class names
	$(".paging-wrapper>a").mouseover(function(){$(this).fadeTo('fast',0.60);}).mouseout(function(){$(this).fadeTo('fast',1);});
	
	/*animate objects with given selectors*/
    $('.gray-link-button').mouseover(function() {
        $(this).animate( { paddingLeft:"20px" }, { queue:false, duration:300 });
    }).mouseout(function() {    
        $(this).animate( { paddingLeft:"10px" }, { queue:true, duration:300 });
    });
}
/*
	make_two_column_same_size()
	keep two div in same size with this function
*/
function make_two_column_same_size(){

	try{
		var side_bar_h = $(".side_bar").css("height","auto").height();
		var page_content_h = $(".page-content").css("height","auto").height();

		if($(".side_bar").data("originalh") == undefined){
			$(".side_bar").data("originalh",side_bar_h);
			$(".page-content").data("originalh",page_content_h);		
		}else{
			var side_bar_h_s = $(".side_bar").data("originalh");
			var page_content_h_s = $(".page-content").data("originalh");
			if(page_content_h_s>=page_content_h && arguments[0]=="1" ) { side_bar_h = side_bar_h_s;page_content_h=page_content_h_s; }
			//alert(side_bar_h_s+"--"+side_bar_h);
			//if(side_bar_h_s>side_bar_h) { side_bar_h=side_bar_h_s;alert("he"); }
		}
		//alert(page_content_h+"--"+side_bar_h);
		if(parseInt(side_bar_h)>parseInt(page_content_h)){
			$(".page-content").css("height",(parseInt(side_bar_h)+extra_pixel())+"px");
		}else if(parseInt(side_bar_h)<parseInt(page_content_h)){
			$(".side_bar").css("height",(parseInt(page_content_h)+extra_pixel())+"px");
		}	
	}catch(ex){}finally{}	
}

/*ancient browser support. sorry.*/
function extra_pixel(){
	return ($.browser.msie && ($.browser.version == 7.0 || $.browser.version == 8.0))?1:0;	
}

/*inline message box*/
function inlineMsgBox(target,type,msg,size)
{
	var titles = Array();
	titles["succes"] = "SUCCESS!";
	titles["error"] = "ERROR!";
	titles["warning"] = "WARNING!";
	titles["information"] = "INFORMATION!";

	size = size=="full"?"948":size;

	//html template can be found in static/message-box.html
	var box='<div class="message-box '+type+'" '+(parseInt(size)>0?'style="width:'+size+'px"':"")+'>';
	box  += '	<div class="line">';
	box  += '		<span>'+ titles[type] +'</span><span>' + msg + '</span>';
	box  += '	</div>';
	box  += '	<div class="close"></div>';
	box  += '</div>';
	
	$(target).append(box);
	
	$(".close").click(function(){
		$(this).parent().fadeTo("fast",0.0,function(){ $(this).remove(); });
	});
}

/*flickr images*/
/*
set=PHOTOSET ID
nsid=USER ID (get your flickr id here: http://get-flickr-id.ubuntu4life.com/ )
*/
function getLatestFlickrPhotos(){
	var j=0;
	
	if($("#images").length<1) {return false;} 
	try{
		$.getJSON("http://api.flickr.com/services/feeds/photoset.gne?set=72157623994027261&nsid=29468339@N02&lang=en-us&format=json&jsoncallback=?", function(data){
			$.each(data.items, function(i,item){
				j++;
				$("<img/>").css("margin-right",(parseInt(j)==4?"0":"5")+"px").attr("src", item.media.m).attr("width","60").attr("height","60").appendTo("#images")
				.wrap("<a href='" + item.link + "'></a>");
				if(i==7){return false;} //stop after 8 item
				if(parseInt(j)==4) {j=0;$("<div class=\"clear10\"></div>").appendTo("#images");} //add clear
	
			});
		});
	}catch(e){}finally{}
}


/*switch betwen popular & related posts*/
function blogPostPage(){
	divSwap(".other-posts-link",".other-posts-list");
	
	divSwap(".post-sub-link",".comments-trackbacks-list");	
}

function divSwap(o1,o2){
	$(o1).each(function(index){
	
		$(this).click(function(){
			var t = $(this);
			t.parent().find("a").removeClass("gray-only").addClass("not-active");t.removeClass("not-active").addClass("gray-only");
			$(o2+":visible").stop(true,true).fadeTo("fast",0.0,
				function(){
					$(this).hide();
					$(t.attr("rel")).stop(true,true).fadeTo("fast",1);
				}
			);
			return false;
		});
		
	});
	
}


/*home page three box sliding effect*/
function threeBoxSlidingEffect(){
	if($.browser.msie && ($.browser.version == 7.0 || $.browser.version == 8.0)){
		$(".home-three-box-sliding-image").parent().mouseenter(function(){
			$(".home-three-box-sliding-image",this).stop().css({backgroundPositionY: '0px'}). 
			animate({backgroundPositionY: '-183px'}); 
		}).mouseleave(function(){
			$(".home-three-box-sliding-image",this).stop().animate( {backgroundPositionY:"0px"} );
		});	
	}else{
		$(".home-three-box-sliding-image").parent().mouseenter(function(){
			$(".home-three-box-sliding-image",this).stop().css({backgroundPosition: '0px 0px'}). 
			animate({backgroundPosition: '0px -183px'}); 
		}).mouseleave(function(){
			$(".home-three-box-sliding-image",this).stop().animate( {backgroundPosition:"0px 0px"} );
		});		
	}
}

/*ajax global handlers*/
function ajaxGlobalHandlers(){

	/*GLOBAL AJAX HANDLERS*/
	jQuery(document).ajaxStart(function() {
		$("#loading_wrap").fadeIn("fast");
	});
	jQuery(document).ajaxStop(function() {
		$("#loading_wrap").fadeOut("fast");
	});
	jQuery(document).ajaxError(function(e, xhr, settings, exception) {
		$("#loading_wrap").fadeOut("fast");
		//alert('error in: ' + settings.url + ' \n' + 'error:\n' + xhr.responseText);
	});
	/*GLOBAL AJAX HANDLERS END*/	
}

/*horizontal mini slider*/
(function($){
    $.fn.extend({
        horizontalSlider: function(options) {
 
            var defaults = {				
				slideHeight:222,
				slideWidth:222,
				paddings:0,
				nextBtn:'',
				previousBtn:'',
				slidingDiv:'.sliding-div'
            };
			
			var options = $.extend(defaults, options);
			
            return this.each(function() {
				var $this=$(this);

				var currentSlide=0;
				
				var slidingDiv = $this.find(options.slidingDiv);
				
				var slideCount = slidingDiv.find("div").length;

				slidingDiv.css("width",((slideCount*options.slideWidth)+(slideCount*options.paddings))+"px"); //set sliding div width to total item count * item width

				$this.find("div:eq(0)").css("width",options.slideWidth+"px");				

				options.nextBtn.click(function(){
					if(currentSlide<(slideCount-1)){currentSlide++;}else{currentSlide=0;}
					slidingDiv.stop().animate({"left":"-"+((currentSlide*options.slideHeight)+(options.paddings*currentSlide))+"px"});
					return false;
				});		
				
				options.previousBtn.click(function(){
					if(currentSlide>0){currentSlide--;}else{currentSlide=slideCount-1;}
					slidingDiv.stop().animate({"left":"-"+((currentSlide*options.slideHeight)+(options.paddings*currentSlide))+"px"});
					return false;
				});							
            });
        }
    });
})(jQuery);

/*very simple accordion*/
(function($){
	$.fn.extend({
		largeAccordion: function() {
			
			return this.each(function() {
				$("li",this).each(function(index) {

					$("a:first-child",this).data("isopen","1");
					
					$("a:first-child",this).click(function(){
						$(this).parent().css("background-position","20px 0px");
						
						$(this).data("isopen",($(this).data("isopen")=="1"?"0":"1")).css("background-position","0px "+ ($(this).data("isopen")=="1"?"-40":"0") +"px");
						
						//alert($("div",$(this).parent()).outerHeight(true));
						//$("div",$(this).parent()).css("height",$("div",$(this).parent()).outerHeight(true)+"px");
						$("div",$(this).parent()).slideToggle("fast",function(){
							try{
								make_two_column_same_size("1"); //try to fix left and right column height issues
							}catch(e){}finally{}
						});
						
						
						return false;
					});
				});							
			});
		}
	});
})(jQuery);

/*very simple tabs*/
function switch_tabs(obj)
{
	var id = obj.attr("rel");	

	if(arguments[1]=="0"){//if page is just loading try to prevent page shaking (slide up/down effects)
		obj.addClass("selected-tab");
		$('#'+id).show();
	}else{
		$('.tab-content:visible').slideUp("fast",function(){
			$('.tabs a').removeClass("selected-tab");
			$('#'+id).slideDown("fast",function(){
				try{
					make_two_column_same_size(); //try to fix left and right column height issues
				}catch(e){}finally{}	
			});
			obj.addClass("selected-tab");
		});
	}
}

/*login panel*/
function loginPanel(){
	$panel = $("#login_panel");
	$content = $("#content",$panel);
	$links = $("#signin_register",$panel);
	
	$content.data("status","0");
	$links.find("a").click(function(){
		var h = 1;
		if($content.data("status")=="0"){
			h=195;$content.data("status","1");$(this).css("background-position","0px 0px");$(this).html("&nbsp;");/*$content.css("background-color","transparent");$content.addClass("transparent-background");*/
		}else{
			$content.data("status","0");$(this).css("background-position","0px -18px");$(this).html("&nbsp;");
		}
		$content.stop().animate({"height":h+"px"},"slow","easeInOutExpo");
		return false;
	});	
}