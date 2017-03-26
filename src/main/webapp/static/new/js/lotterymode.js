var Right={};
var Mode={};
Mode.News=function(){//首页新闻
	$('#topInfoTab li').click(function(){
		$(this).parent().children().removeClass("active");
		$(this).addClass("active");
		$('.promotionText>div').hide();
		var ind = $(this).index();
		if(2==ind){
			$('#tophelp').show();
		}else if(1==ind){
			if($('#topForecast ul').text().indexOf("暂无新闻")>=0){
				Loaddata('xw');
			}
			$('#topForecast').show();
		}else{
			$('#topNotice').show();
		}
	});
}
Mode.Open=function(){//全国开奖
	$('#awardListTab dd:not(end)').click(function(){
		var i = $(this).index();
		$('#awardListTab dd').removeClass('active');
		$(this).addClass('active');
		$('#awardList01,#awardList02').hide();
		if (1==i){
			$('#awardList01').show();
		}else if(2==i){
			$('#awardList02').show();
		}
	});
}