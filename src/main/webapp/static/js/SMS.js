var SMS = {};
SMS.inited = false;
SMS.init = function(){
	(function(){
		if(this.inited)return;
		this.diy = false;
		document.body.style.height = '100%';
		this.sms_mask = document.createElement('iframe');
		with(this.sms_mask){
			id = 'sms_mask';
			style.display = 'none';
			style.position = 'absolute';
			style.zIndex = '99999';
			style.filter = 'alpha(opacity=1)';
			style.opacity = 0.01;
			style.top = '0px';
			style.left = '0px';
			style.width = '100%';
		}
		this.sms_mask.style.height = (Math.max(document.body.scrollHeight, document.documentElement.scrollHeight)+40)+'px';
		document.body.insertBefore(this.sms_mask, document.body.firstChild);

		this.sms_iframe = document.createElement('iframe');
        this.sms_iframe.setAttribute('scrolling','no');
		with(this.sms_iframe){
			style.position = 'absolute';
			id = name = 'sms_iframe';
			frameBorder = 'no';
			src = '/js/public/SMS.html';
			style.display = 'none'
			style.left = '50%';
			style.marginLeft = '-258px';
			style.width = '514px';
			style.height = '338px';
			style.zIndex = '1000000';
		}
		document.body.insertBefore(this.sms_iframe, document.body.firstChild);
		var diy = document.getElementById('SMSDIY');
		if(diy){
			diy.onclick = function(){
				SMS.showDiy();
				return false;
			}
		}
		this.inited = true;
		
		SMS.clickToSeeNotice = false;
		SMS.showJkRiskNotice();
		if (document.getElementById('xianhao_notice')) { //查看《投注风险须知》
			document.getElementById('xianhao_notice').onclick = function() {
				SMS.clickToSeeNotice = true;
				SMS.showJkRiskNotice();
				return false;
			}
		}
	}).call(SMS);
}
SMS.getTopPos = function(v,b){
  var sh = document.body.clientHeight, st = Math.max(document.body.scrollTop,document.documentElement.scrollTop);
  try{
    if(location.href.toLowerCase().indexOf('trade/ssc/trade.php') == -1)throw '非时时彩不需要修正高度.';
    parent.document.body.clientHeight, st = Math.max(parent.document.body.scrollTop,parent.document.documentElement.scrollTop);
    if(parent.document.compatMode=="CSS1Compat"){
      sh = parent.document.documentElement.clientHeight;
    }
    st = st - 160;
  }catch(e){}
   b=b||0;
   return st+150+'px'
};
SMS.showDiy = function(){
	(function(v){
		if(!this.inited)this.init();
		this.diy = true;
		if(this.sms_iframe.src.toLowerCase().indexOf('smsdiy.html')==-1){
			this.sms_iframe.style.height = '435px';
			this.sms_iframe.src = '/js/public/SMSDIY.html';
		}
		this.sms_iframe.style.top = SMS.getTopPos(0);
		try{
			this.setInfo(v || trade.getSMSInfo(1));
		}catch(e){
			this.setInfo('请选号');
		}
		this.sms_mask.style.display = this.sms_iframe.style.display = '';
	}).apply(SMS, arguments);
}
SMS.show = function(){
	(function(v){
		if(!this.inited)this.init();
		this.diy = false;
		if(this.sms_iframe.src.toLowerCase().indexOf('sms.html')==-1){
			this.sms_iframe.style.height = '340px';
			this.sms_iframe.src = '/js/public/SMS.html';
		}
		this.sms_iframe.style.top = SMS.getTopPos(1);
		try{
			this.setInfo(v || trade.getSMSInfo(0));
		}catch(e){
			this.setInfo('请选号');
		}
		this.sms_mask.style.display = this.sms_iframe.style.display = '';
	}).apply(SMS, arguments);
};

/**
 * 显示投注风险须知弹出层
 */
SMS.showJkRiskNotice = function(){
	(function(v){
		if (!this.inited) {
			this.init();
		}
		if (/dlc\/(index.php|$)/.test(document.URL)) { //11选5
			if (fw.cookie.get('agree_dlc') == 1 && SMS.clickToSeeNotice == false) {
				return;
			}
			this.sms_iframe.src = '/js/public/risk_notice_dlc.html';
			this.sms_iframe.style.height = '325px';
		} else if (document.URL.indexOf('ssc/trade.php') != -1) { //时时彩
			if (fw.cookie.get('agree_ssc') == 1 && SMS.clickToSeeNotice == false) {
				return;
			}
			this.sms_iframe.src = '/js/public/risk_notice_ssc.html';
			this.sms_iframe.style.height = '325px';
		} else if (SMS.clickToSeeNotice == true) {
			if (fw.get('lotid').value == 5) { //排列三
				this.sms_iframe.src = '/js/public/risk_notice_pls.html';
			} else if (fw.get('lotid').value == 7) { //福彩3D
				this.sms_iframe.src = '/js/public/risk_notice_sd.html';
			} else {
				return;
			}
			this.sms_iframe.style.height = '290px';
		} else {
			return;
		}
		this.sms_iframe.style.width  = '450px';
		this.sms_iframe.style.top    = SMS.getTopPos(1);
		if (document.URL.indexOf('ssc/trade.php') != -1) {
			this.sms_iframe.style.top = parseInt(this.sms_iframe.style.top) + 10 + 'px';
		}
		this.sms_mask.style.display  = this.sms_iframe.style.display = '';
	}).apply(SMS, arguments);
};

SMS.wait=function (){
    this.sms_iframe.src ='about:blank';
    SMS.iswait = true;
	(function(v){
		if(!this.inited)this.init();
		this.diy = false;
        this.sms_iframe.src = '/js/public/SMS_wait.html';
        this.sms_iframe.style.height = '140px';
		this.sms_iframe.style.top = SMS.getTopPos(1,50);
		this.sms_mask.style.display = this.sms_iframe.style.display = ''; 
	}).apply(SMS, arguments);    
};
SMS.hide = function(){
	(function(v){
		if(!this.inited)this.init();
        this.sms_iframe.src ='about:blank';
		this.sms_iframe.style.width = '514px';  //还原宽度
		this.sms_mask.style.display = this.sms_iframe.style.display = 'none';
		trade.graySubmit && trade.graySubmit(false);
		trade.setSubmitEnabled && trade.setSubmitEnabled();
	}).apply(SMS, arguments);
};
SMS.hideWait = function (){
   if(SMS.iswait){
       SMS.hide();
       SMS.iswait = false
   }; 
};
SMS.filter = ',5,10001,4,8,28,1,9,17,15,10000,';
SMS.setInfo = function(m){
	try{
		if(!SMS.sms_iframe)return;
		var K=30, id=document.getElementById('lotid');
		//logo=(id && SMS.filter.indexOf(','+id.value+',')!=-1)?'/images/trade/alert/logo_jiangxi.gif':'/images/trade/alert/logo_chongqing.gif';
		//if(typeof syydj != 'undefined')logo = '/images/trade/alert/logo_shandong.gif';
		//if(id && id.value=='9')logo = '/images/trade/alert/logo_tianjin.gif';
		//if(id && id.value=='45')logo = '/images/trade/alert/logo_jiangxi.gif';
		var L = setInterval(function(){
			if(K-- < 0)clearInterval(L);
			var root = SMS.sms_iframe.contentWindow.document;
            if(SMS.sms_iframe.src.toLowerCase().indexOf('sms_wait')+1)
                return;
			if(!SMS.diy){
 				var ischase = document.getElementById('ischase');
				try{SMS.sms_iframe.style.height = ((ischase.checked || ischase.value==1)?'452px':'352px')}catch(e){}
				try{root.getElementById('ZH').style.display = ((trade.lotid!=29 && (ischase.checked || ischase.value==1))?'':'none');}catch(e){}
			}
			try{root.getElementById('info').value = m;}catch(e){}
			//try{root.getElementById('SMSLogo').src = logo;}catch(e){}
		}, 100);
	}catch(e){
		alert('设置短信提示层内容失败.\n原因:'+e.description);
	}
}
trade.addInit(SMS.init);