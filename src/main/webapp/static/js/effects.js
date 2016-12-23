// JavaScript Document
$(document).ready(function() {
   //pub part 
   var puba = $('#pub .title a');
   $.each(puba,function(i){
	  $(this).click(function(){
		 puba.removeClass('hover'); 
		$(this).addClass('hover'); 
		$('#pub .lp1_box > div').hide();
		$('#pub .lp1_box > div:eq('+i+')').show();
	  })   
   });

 //任选九样式首页
 $('#tzlist a').attr('href','javascript:void(0)').click(function(){
	$(this).toggleClass('hover');	 
 })
 
 
 // 任选9内页 全选样式
 $('.cen_table td label').click(function(){
	$(this).toggleClass("hover");	 
 })
	
	
 $('#slides1').slides({
	container:'cots',	
	preload: false, 
	play:5000
 })	
 
 $('.datepicker').datepicker();
	
});


//调出登录提示框
function showlogin() {$('#dialog').fadeIn();}
//关闭登录提示框
function closelogin() {$('#dialog').fadeOut();}


//tzlist alert 请参考 新浪爱彩
function dialog(){ //可定义参数 m,a,b等
	var winw = $(window).width();  //获取屏幕宽度
	var winh = $(window).height(); //获取屏幕高度
	//#########################m,a,b处理程序#########################
	var opa = '<div class="opacity">'+
			  '<div class="dialog">'+
    	      '<div class="diatitle">'+
			  '<em>提示</em>'+
			  '<a href="#">关闭</a>'+
			  '</div>'+
              '<div class="diabox">'+
        	  'm,a,b'+  //次数可以根据函数传参来定义要显示的数据
       		  '</div>'+
              '</div>'+
              '</div>';
	//$('.opacity').width(winw).height(winh).fadeIn(400);
}

