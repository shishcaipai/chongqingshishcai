var hm = {};
hm.perMoney = 0;
hm.buyMoney = 0;
hm.buyNum   = 0;
hm.fenshu   = 0;
hm.baodi    = 0;
hm.minBaodi = 0.02;
hm.init = function(){
  hm.obj = fw.dom.getToObject(
    "divideCount",					//分成份数
    "perMoney",						//每份金额
    "buyCount",						//认购份数
    "buyScale",						//认购比例
    "buyMoney",						//认购金额
    "buyUser",						//认购网友
    "isbaodi",						//是否保底
    "baodiCount",					//保底份数
    "baodiScale",					//保底比例
    "baodiMoney",					//保底金额
    "caseDescription",	            //方案描述
    'chkViewMore'        //可选填信息
  );
  if(!hm.obj.divideCount){
    hm.buyMoney = parseInt(fw.get('totalmoney').value);
    return;
  }
  hm.obj.divideCount.onkeyup = hm.obj.divideCount.onblur = function(){//分成份数
    this.value = this.value.replace(/\D/g, '');
    if(this.value == ''){
      hm.obj.perMoney.innerHTML = '￥0.00';
      hm.perMoney = 0;//每份金额
      hm.fenshu = 0;//分成份数
      return;
    }else{
      hm.fenshu = this.value;
      hm.perMoney = fw.get('totalmoney').value*1/hm.fenshu;
      hm.obj.perMoney.innerHTML = '￥'+(hm.perMoney).toFixed(2);
    }
    if(hm.obj.buyCount.value != '')buyCheck.call(hm.obj.buyCount);
    if(hm.obj.isbaodi.checked)bdCheck.call(hm.obj.baodiCount);
  }
  if(hm.obj.divideCount.value != ''){
    hm.fenshu = parseInt(hm.obj.divideCount.value);
    hm.perMoney = fw.get('totalmoney').value*1/hm.fenshu;
    hm.obj.perMoney.innerHTML = '￥'+(hm.perMoney).toFixed(2);
  }
  hm.obj.buyCount.onkeyup = hm.obj.buyCount.onblur = buyCheck;
  function buyCheck(){//认购份数
    this.value = this.value.replace(/\D/g, '');
    if(this.value == ''){
      hm.obj.buyMoney.innerHTML = '￥0.00';
      hm.buyMoney = 0;//认购金额
      hm.buyNum = 0;
      return;
    }else{
      hm.buyNum = parseInt(this.value);
      hm.buyMoney = hm.perMoney*hm.buyNum;
      hm.obj.buyMoney.innerHTML = '￥'+(hm.buyMoney).toFixed(2);
      hm.obj.buyScale.innerHTML = (hm.fenshu>0?(parseInt(this.value/hm.fenshu*10000+0.5)/100):0)+'%';
    }
  }
  hm.obj.isbaodi.onclick = function(){//是否保底
    hm.obj.baodiMoney.innerHTML = '￥0.00';
    hm.obj.baodiScale.innerHTML = '0%';
    if(!this.checked){
      hm.obj.baodiCount.value = 0;
      hm.obj.baodiCount.disabled = true;
    }else{
      hm.obj.baodiCount.disabled = false;
      hm.obj.baodiCount.select();
    }
  }
  hm.obj.baodiCount.onkeyup = hm.obj.baodiCount.onblur = bdCheck;
  function bdCheck(){//保底份数
    this.value = this.value.replace(/\D/g, '');
    if(this.value == ''){
      hm.obj.baodiMoney.innerHTML = '￥0.00';
      hm.baodi = 0;
      return;
    }else{
      hm.baodi = hm.perMoney*this.value;
      hm.obj.baodiMoney.innerHTML = '￥'+(hm.baodi).toFixed(2);
      hm.obj.baodiScale.innerHTML = (hm.fenshu>0?(parseInt(this.value/hm.fenshu*10000+0.5)/100):0)+'%';
    }
  }
}

hm.setPerMoney = function (count, money){
  var money2 = money * 100;
  while(count<money && money2%count){
    count++;
  }
  if (window.confirm("分成的份数除不尽方案总金额,可能会造成误差,系统建议您分成"+count+"份,要分成"+count+"份吗?")){
    hm.obj.divideCount.value = count;
    hm.fenshu = count;
    hm.perMoney = money / count;
    hm.obj.perMoney.innerHTML = trade.formatRMB(hm.perMoney);
    hm.calInfo(hm.obj.buyCount, hm.obj.buyMoney, hm.obj.buyScale);
    hm.calInfo(hm.obj.baodiCount, hm.obj.baodiMoney, hm.obj.baodiScale);
    return true;
  }
  return false;
}
hm.calInfo = function (objCount, objMoney, objScale){
	var count = Number(objCount.value);
	objMoney.innerHTML = trade.formatRMB(count*hm.perMoney);
	fw.setHTML(objScale, Math.floor((hm.fenshu>0?count/hm.fenshu:0)*10000)/100 + "%");
}
hm.checkForm = function(){
	

  var money = fw.get('totalmoney').value;
  var n = hm.obj.divideCount.value;//认购份数
  var rg = Number(hm.obj.buyCount.value);
  var bd = Number(hm.obj.baodiCount.value);
  var isbd = hm.obj.isbaodi.checked ? 1 : 0;
  // var isset_buyuser = fw.dom.getName("zgdx")[0].checked ? 1 : 2;
	// if(isset_buyuser==1 && fw.getId("buyUser"))fw.getId("buyUser").value="all";
	
 if(/^[^QQqq交流群①②③④⑤⑥⑦⑧⑨0123456789零一二三四五六七八九壹贰叁肆伍陆柒捌玖拾零]*$/.test(fw.get('caseDescription').value)){
	 
	}
	else
	{ return trade.alert(hm.obj.caseDescription, "非法字符！");
		}
  if (hm.obj.divideCount.value==""){
    return trade.alert(hm.obj.divideCount, "您要分成的份数不能为空！");
  }else if (n<1){
    return trade.alert(hm.obj.divideCount, "您要分成的份数必须大于等于1！");
  }else if (money/n<1){
    return trade.alert(hm.obj.divideCount, "每份金额必须大于等于1！");
  }else if (hm.obj.buyCount.value==""){
    return trade.alert(hm.obj.buyCount, "您要认购的份数不能为空！");
  }else if(rg<n*0.02){
    return trade.alert(hm.obj.buyCount, "您要认购的份数至少应该为所分份数的2% ("+Math.ceil(n*0.02)+"份)！");
  }else if (rg>n){
    return trade.alert(hm.obj.buyCount, "您要认购的份数不能大于所分的份数！");
  } else if (rg/n<hm.minBuy){
    return trade.alert(hm.obj.buyCount, "认购金额至少为总金额的"+hm.minBuy*100+"%,至少"+trade.formatRMB(money*hm.minBuy)+"元！");
  }else if (isbd&&(hm.obj.baodiCount.value=="" || hm.obj.baodiCount.value*1<1)){
    return trade.alert(hm.obj.baodiCount, "您要保底的份数不能为空！");
  }else if (isbd&&bd>n){
    return trade.alert(hm.obj.baodiCount, "您要保底的份数不能大于所分的份数！");
  } else if (isbd && bd/n<hm.minBaodi){
    return trade.alert(hm.obj.baodiCount, "保底金额至少为总金额的"+hm.minBaodi*100+"% ("+Math.ceil(n*hm.minBaodi)+"份)！");
  }else if (isbd&&rg+bd>n){
    return !!alert("您要认购的份数和保底的份数之和不能大于所分的份数！");
  }else if(hm.obj.chkViewMore.checked){
    /*if(fw.get('zg1').checked && !(/^[\w\-\u4e00-\u9fa5]+(?:,[\w\-\u4e00-\u9fa5]+)*$/.test(fw.trim(hm.obj.buyUser.value)))){
      return trade.alert(hm.obj.buyUser, '限定网友的格式不对!');
    }*/
	
  }
  if(fw.get('caseTitle').value == ''){
    fw.get('caseTitle').value = fw.get('caseTitle').getAttribute('default');
  }
  if(fw.get('caseDescription').value == ''){
      fw.get('caseDescription').value = '欢迎大家参与我的合买单！' //fw.get('caseDescription').getAttribute('default');
  }
  /*else if (hm.obj.chkViewMore.checked){
    if(fw.get('caseTitle').value == '' || fw.get('caseDescription').value == ''){
      return !!alert('方案标题和方案描述不能为空!');
    }
    if(fw.get('zg1').checked && !(/^[\w\-\u4e00-\u9fa5]+(?:,[\w\-\u4e00-\u9fa5]+)*$/.test(fw.trim(hm.obj.buyUser.value)))){
      return trade.alert(hm.obj.buyUser, '限定网友的格式不对!');
    }
  }*/
  if (money*100%n){
    return hm.setPerMoney(n, money);
  }
  return true;
}

fw.onReady(trade.init);
function chkForm(o){
  if (fw.getId("agreement")&&!fw.getId("agreement").checked){
		return !!alert("您好，您需要阅读并且同意《用户合买代购协议》，才能够使用我们的服务。");
	}
  //hm.setStatus();//禁用提交按钮,防止重复点击2013-1-23
  if(fw.get('divideCount') == null){//代购
    hm.checkUserStatus(function(){
      var buynum = fw.getId('buynum').value;      //方案金额
      var allnum = parseFloat(fw.getId('allnum').value);
      var totalmoney = parseFloat(fw.getId("totalmoney").value);    //认购总金额
      var onemoney = fixPerMoney(totalmoney/allnum);
      var ishm = parseFloat(fw.getId("ishm").value);
      if(buynum == ''){
        alert('认购份数不能为空1!');
        hm.setStatus(false);
        return false;
      }
      if(buynum <= 0){
        alert('认购份数不能必须为大于1的整数2!');
        hm.setStatus(false);
        return false;
      }
	  alert('ok')
			/*if(typeof SMS != 'undefined'){
				trade.SUBMIT = function(){
                    SMS.wait();//ldh add 2010-5-17
                    o.submit();
                }
				hm.setStatus(false);
				SMS.show();
			}else{*/
				var conStr = ishm==0?("您本次代购金额"+(totalmoney.toFixed(2))+"元，请确认"):("方案总金额为"+(totalmoney.toFixed(2))+"元，分成"+ allnum +"份，\n\n每份"+onemoney+"，您认购"+ buynum +"份，请确认！");
				if(confirm(conStr)){
					o.submit();
				}else{
					hm.setStatus(false);
				}
			//}
    });
  }else{//合买
    if(hm.checkForm()){
     
					var conStr = "方案总金额为"+fw.conv.formatRMB(fw.get('totalmoney').value)+"元，分成"+ hm.fenshu +"份，\n\n每份"+fw.conv.formatRMB(hm.perMoney)+"元，您认购"+ hm.buyNum +"份，请确认！";
					if(window.confirm(conStr))
					{
						// if(hm.obj.buyUser.value == '')hm.obj.buyUser.value = 'all';
						o.submit();
						return;
					}else{
                           hm.setStatus(false);
                          }
					
    }else{
      hm.setStatus(false);
    }
  }
}

hm.chkRepeatSub = function(CallBack){
	var config = {
		url: '/pages/trade/ajax/data/repeat_submit.php',
		method: 'POST',
		async : true,
		arg: {
			lotid:trade.lotid,
			playid:trade.playid,
			expect:trade.period,
			codes:encodeURIComponent(fw.getId("codes").value),
			ggtype: fw.getId("sgtype").value
		},
		onsuccess:function(json){
			json = fw.json.parse(json);
			if(json.status==1){
				hm.setStatus(false);
				if(window.confirm('您在'+json.addtime+'已经发起了相同号码的方案，是否继续发起？\n\n(点"确定"继续提交方案,点"取消"返回修改)\n\n')){
					CallBack();
			    }
				return false;
			}
			CallBack();
		}
	};
	fw.ajax.request(config);
}

hm.checkUserStatus = function(CallBack){
  fw.callFile(trade.baseUrl+"/pages/trade/inc/zcyh_index.php?"+Math.random(), function(json){
    if(!trade.userInfo){
      try{
        var login = parent.document.getElementById('loginmsg');
        if(login)login.contentWindow.location.reload(true);
      }catch(e){}
    }
    trade.userInfo = json = fw.json.parse(json);
    if(trade.userInfo.status == 0 || trade.userInfo.userName==''){//用户未登陆
      if(trade.newTip){
        window.alert("您还没有登录,请登录后再提交！");
        try{loginmsg.document.getElementById("u").focus();}catch(e){
          try{top.frmUserLongin.document.getElementById("u").focus();}catch(e){}
        }
      }else{
        TIPS.login();
      }
      hm.setStatus(false);
      return ;
    }
    var money = hm.buyMoney+hm.baodi;
    var ui = fw.get('showUserInfo');
    if(ui){
      ui.innerHTML = '<span class="font5">“'+trade.userInfo.userName+'”</span>，目前您的账户余额是<span class="red">'+fw.conv.formatRMB(trade.userInfo.userMoney)+'</span>元．【<img src="/images/static/public/oicn_chongzhi.gif"> <a href="/pages/useraccount/addmoney/add.php" target="_blank">账户充值</a>】';
    }
    if (((typeof trade.ISHM !='undefined'&&trade.ISHM==0)||window.hm) && json.userMoney<money){
      var u = "http://passport.500wan.com/pages/useraccount/addmoney/add.php";
      hm.setStatus(false);
      if(trade.newTip)return window.confirm('您的可投注余额不足，请先充值！\n\n(点"确定"跳到充值页面,点"取消"返回修改)\n\n') && window.open(u);
      return TIPS.money();
    }
    //CallBack();
    hm.chkRepeatSub(CallBack);
  });
}
hm.showMore = function(){
  fw.getId('xt').style.display=this.checked?'block':'none';
  fw.get('caseTitle').value = fw.get('caseTitle').getAttribute('default') || '';
  fw.get('caseDescription').value = fw.get('caseDescription').getAttribute('default') || '';
  fw.get('zg0').checked = true;
  fw.get('buyUser').value = '';
  fw.get('zg').style.display = 'none';
}
hm.setStatus = function(s){
  var btn_submit = fw.getId('btn_submit');
  if(btn_submit) { btn_submit.disabled = ((typeof s == 'undefined') ? true :s ); }
}
function fixPerMoney(n){
	var iMoney = parseFloat(n.toFixed(2));
	return (iMoney<n?(iMoney+0.01):iMoney).toFixed(2);
}
function OpenSplit(ggtype,baseUrl){
	var strvote = fw.getId("codes").value;
	var strdanma = fw.getId("danma").value;
	var expect = fw.getId("expect").value;
	var beishu = fw.getId("beishu").value;
	var playid = fw.getId("playid").value;
	var IsCutMulit = 1;
	IsCutMulit = fw.getId("IsCutMulit").value;
	var url2 = baseUrl + "/pages/trade/bjdc/code_sp_list.php?";
	url2 += "codes="+escape(strvote).replace(/\+/g,"%2B");
	url2 += "&danma="+escape(strdanma).replace(/\+/g,"%2B");
	url2 += "&sgtypename="+ggtype;
	url2 += "&beishu="+beishu;
	url2 += "&IsCutMulit="+IsCutMulit;
	url2 += "&expect="+expect;
	url2 += "&playid="+playid;
	window.open(url2,'','help: No; resizable: No; status: No;scrollbars:No;center: Yes;dialogWidth:500px;dialogHeight:500px');
}