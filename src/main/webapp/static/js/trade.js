

var trade = {};
trade.ishm = false;				//是否合买
trade.ischase = false;			//是否追号
trade.islogin = true;			//是否登陆
trade.isrt = false;				//是否倒计时
trade.baseCount = 0;			//基本注数
trade.newCount = 0;			    //新增注数
trade.multiple = 1;				//总倍数
trade.isstop = 0;               //是否停止追号
trade.confirm = true;			//是否确认
trade.confirmMsg = false;		//确认消息
trade.debug = false;			//是否调试模式
trade.submiting=false;
trade.kevin = 'haha';

trade.onSubmitBefore =  new Function("return true");
trade.onSubmitBack = new Function("return false");
trade.onShowBack = new Function("return false");
trade.getList = new Function("return ''");		//获取号码列表


/////////////////////////////////公用代码begin/////////////////////
//获取Class
trade.getClass = function(obj, tag, cls){
	var a = [];
	var o = fw.dom.getObjTag(obj, tag);
	for (var i=0,l=o.length;i<l;i++){
		if (o[i].className==cls){
			a.push(o[i]);
		}
	}
	return a;	
}

//获取单选框的值
trade.getRadio = function (name){
	var o = fw.dom.getName(name);
	for(var i=o.length-1;i>-1&&!o[i].checked;i--);
	return i>-1 ? o[i].value : false;
}

//批量获取隐藏域的值
trade.getInput = function(){
	var json = {};
	for (var i=0,a=arguments,l=a.length;i<l;i++){
		json[a[i]] = fw.getId(a[i]) ? fw.getId(a[i]).value : "";
	}
	return json;
}

//批量设置隐藏域的值
trade.setInput = function(json){
	for (var id in json){
		if (fw.getId(id)){
			fw.getId(id).value = json[id];
		}
	}
}

//input集体转换编码
trade.escape = function (a){
	for (var i=0,l=a.length;i<l;i++){
		fw.getId(a[i]) && (fw.getId(a[i]).value = escape(fw.getId(a[i]).value).replace(/\+/g,"%2b"));
	}
}

//批量获取URL的值
trade.getUrl = function(url){
	var json = {};
	url.replace(/[\?\&](\w+)=(\w+)/g,function(s,s1,s2){
		json[s1] = s2;
	});
	return json;
}

//批量设置URL的值
trade.setUrl = function(u, o){
	var a = [];
	for (var i in o){
		a.push(i+"="+o[i]);
	}
	return u + "?" + a.join("&");
}

//检查数字回调
trade.chkNumberBack = function (obj,callBack){
	var s = obj.value.replace(/\D/g,"");
	obj.value = s!="" ? Number(s) : "";
	if (callBack) {
		callBack(obj);
	}
}

//检查数字回调函数
trade.chkNumber = function(cb){
	var _this=this;
	return function(){trade.chkNumberBack(_this,cb)};
}

//格式化数字
trade.formatNum = function (num){
	return Math.round(num*100)/100;
}

//复式组合个数
trade.C = function (arr, num){
    var r = 0;
    (function f(t,a,n){
        if (n==0) return (r+=t);
        for (var i=0,l=a.length; i<=l-n; i++){
            f(t*a[i], a.slice(i+1), n-1);
        }
    })(1,arr,num);
    return r;
}

//复式组合个数_winter
trade.C2 = function (a,n){
	var s = [];
	var r = 0;
	var t;
	for(var i=0,ll=a.length;i<ll;i++){
		var l = s.length;
		for(var j=0;j<l;j++){
			t = s[j].concat(a[i]);
			t.length==n?(r+=fw.array.multiple(t)):s.push(t);
		}
		s.push([[a[i]]]);
	}
	return r;
}

//弹出警告及获取焦点
trade.alert = function(obj, msg){
	alert(msg);
	fw.get(obj).focus();		
	return false;
}

//弹出表单信息
function alertForm(){
	alert(fw.json.tostring(fw.dom.getForm(document.project_form)).replace(/:".*?",/g,"$&\n").slice(1,-1));
}
/////////////////////////////////公用代码end/////////////////////

//初始化
trade.init = function(){
	if (trade.obj) return;
	trade.obj = fw.dom.getToObject(
		"ischase",					//是否追号
		"multiple",					//倍数输入框
		"baseCount",				//基本注数
		"newCount",					//新增基本注数
		"showCount",				//倍数或期数
		"caseMoney"					//方案金额
	);
	trade.multiple = trade.obj.multiple ? Number(trade.obj.multiple.value) : 1;
	
	fw.getId("lotid") && (trade.lotid=Number(fw.getId("lotid").value));
	fw.getId("playid") && (trade.playid=Number(fw.getId("playid").value));	
	fw.getId("responseJson") && fw.object.merge(trade, fw.json.parse(fw.getId("responseJson").value));
	trade.isrt = fw.getId("diffDay") && fw.getId("diffTime");
	trade.isrt && reverTime.init( "diffDay", "diffTime", trade.serverTime, trade.endTime);

	fw.callEach([
		{ obj:"periodSelection", handle:trade.chgBuyPeriod, evt:"change" },			//选择认购的期号
		{ obj:"backBtn", handle:function(){history.back()} },						//返回修改		
		{ obj:"submitCaseBtn", handle:trade.onSubmit },								//提交方案
		{ obj:"submitCaseBtnb", handle:trade.onSubmitb }	
	], trade.addEvent);
	
	trade.addInputEvent("multiple", trade.chkMultiple);								//检查倍数
	window.hm && hm.init();
	window.chase && chase.init();
	window.list && list.init();
	//window.yl && yl.init(); 
	window.init && window.init();
	//trade.Resize = new Function("return");
	trade.setResize();	
}

//添加事件
trade.addEvent = function (o){
	if (!o.obj||!fw.get(o.obj)){
		return false;
	}
	var obj = fw.get(o.obj);
	//fw.dom.addEvent(obj, o.evt||"click", o.handle);	
	fw.dom.addEvent(obj, o.evt||"click", function(){o.handle.call(obj)});
}

trade.addInputEvent = function(obj, handle){
	if (!obj||!fw.get(obj)){
		return false;
	}
	obj = fw.get(obj);
	fw.dom.addEvent(obj, "input", handle);
	fw.dom.addEvent(obj, "keyup", handle);
	//fw.dom.addEvent(obj, "propertychange", handle);
	fw.dom.addEvent(obj, "change", handle);
	fw.dom.addEvent(obj, "blur", handle);
	fw.dom.addEvent(obj, "beforepaste", handle);
}

//提交方案回调
trade.onSubmit = function(){
	document.project_form.action ="/Trade/SubmitH.html";
	trade.chkLogin(trade.chkForm);
}
trade.onSubmitb = function(){
	// document.project_form.action ="/Trade/SubmitZ.asp";
	document.project_form.action ="bet/buy2";
	trade.chkLogin(trade.chkForm);
}
//计算金额
trade.calMoney = function (count){
	return fw.conv.formatRMB(count * trade.singlePrice);
}

//格式化RMB
trade.formatRMB = function(m){
	if (Number(m)==0){
		return "￥0.00";
	}else if(Number(m)<0.01){
		return "￥0.01";
	}else if (/^(\d+\.\d{2})[1-9]+$/.test(String(m))){
		m = Number(RegExp.$1) + 0.01;
	}
	return fw.conv.formatRMB(m);
}

//改变购买期号
trade.chgBuyPeriod = function(){
	var a = this.value.split("|");
	trade.period = a[0];
	trade.endTime = a[1];
	fw.setHTML("currentPeriod", trade.period);		//当前期号
	fw.getId("expect").value = trade.period;		//隐藏域的期号
	
	fw.setHTML("stopTime", trade.endTime);			//截止时间
	
	trade.isrt && reverTime.start(trade.endTime);
	trade.ischase&&chase.obj.list && chase.start(trade.period);
	if (fw.getId("show_list_div")&&fw.getId("show_page_div")){
		if(fw.getId("state_term")){
		    fw.getId("state_term").value = a[2];
		    trade.ismath ? szpl.refreshMathName() : list.search_term();
		}else{
			//alert(fw.getId("expect").value);
			list.show_data();
		}
	}else if(trade.ismath){
		szpl.refreshMath();
	}
	fw.getId("fqurl") && list.chkStopTime();
	if (fw.getId("submitCaseBtn")){
		var img = reverTime.count>0 ? "button02.jpg" : "button02_b.jpg";		
		fw.getId("submitCaseBtn").src = trade.baseUrl + "/images/static/public/" + img;
	}
	window.gg && (location=fw.string.urlset(location.href,"expect", trade.period));
}

//获取总注数
trade.getTotalCount = function (){
	return trade.baseCount * (trade.ischase?chase.getData().mp:trade.multiple);
}

//检查倍数
trade.chkMultiple = function(){
	trade.chkNumberBack(trade.obj.multiple);
	if (trade.multiple==trade.obj.multiple.value)return;
	trade.multiple = trade.obj.multiple.value;
	if (trade.ischase){
		chase.updateEach();
	}
	trade.multiple = Number(trade.multiple);
	trade.showTotalCount();
}

//改变数据区信息
trade.updateInfo = function (){
	if (trade.ischase){
		chase.updateEachMoney();
	}
	trade.showTotalCount();
}

//显示总注数
trade.showTotalCount = function (){
	var money = trade.getTotalCount() * trade.singlePrice;
	fw.setHTML('baseCount',trade.formatNum(trade.baseCount));
	fw.setHTML('newCount',trade.formatNum(trade.baseCount));
	fw.setHTML("showCount", trade.ischase ? chase.getData().count : trade.multiple);
	fw.setHTML('caseMoney',trade.formatRMB(money));
	fw.setHTML("baseMoney", trade.calMoney(trade.baseCount));
	fw.setHTML("caseMoney2", trade.formatRMB(money));
	trade.onShowBack(money);
}

//表单验证
trade.chkForm = function() {
	alert("--------"+trade.submiting());
    if (trade.submiting) return !!alert("请不要重复提交！");
    if (fw.getId("agreement") && !fw.getId("agreement").checked) {
        return !!alert("同意《投注协议》才能投注！");
    } else if (trade.isrt && reverTime.count < 1) {
        return !!alert("对不起，已经过了上传方案的截止时间，！");
    } else if (!trade.onSubmitBefore()) {
        return false;
    }
    var count = trade.getTotalCount();
    var money = count * trade.singlePrice;
    if (fw.getId("tradeList") && fw.getId("tradeList").options.length == 0) {
        return !!alert("投注内容不能为空！");
    } else if (trade.ischase && count < 1) {
        return !!alert("请至少选择1期追号！");
    } else if (!trade.ischase && trade.obj.multiple && trade.obj.multiple.value == "") {
        return trade.alert("multiple", "倍数不能为空！");
    } else if (!trade.ischase && trade.multiple <= 0) {
        return trade.alert("multiple", "倍数必须为大于0的整数！");
    } else if (trade.ishm && fw.getId("caseTitle") && fw.getId("caseTitle").value == "") {
        return trade.alert("caseTitle", "方案标题不能为空！");
    }
    trade.setInput({
        codes: trade.getList(), 				//号码列表
        zhushu: trade.baseCount, 			//基本注数
        zhushu: trade.newCount, 			//新增基本注数
        totalmoney: money, 					//总金额	
        ischase: Number(trade.ischase)			//是否追号
    });
    var form = document.project_form;
    var mode = "";
    if (form.getAttribute("mode") && form.getAttribute("mode") == "ajax") mode = "ajax";
    else if (form.getAttribute("ajax") && form.getAttribute("ajax") == "0") mode = "form";
    else if (fw.getId("upfile")) mode = "iframe";

    if (form.action.indexOf("project_postsuc_yt.php") > -1) { //预投
        if (!confirm("请确认您所选的方案内容")) return;
        return trade.submitBy("form", form);
    }

    if (trade.ischase) { //追号
        var o = chase.getData();
        trade.setInput({
            expect_list: o.nl.join(","), 	//期号列表
            beishu_list: o.ml.join(","), 	//倍数列表
            isstop: fw.getId("isstop") ? (fw.getId("isstop").checked ? 1 : 0) : 0
        });
    }
  
    //2013-2-25判断大于800注禁止提交
    if (count > 800) {
        alert("投注注数不能超过800注！");
        trade.clearPaner();
        return;
    }
    
    if (trade.ishm) { //合买
        var o = hm.chkForm(money);
        if (!o) return;
        o.isset_buyuser == 1 && (fw.getId("buyUser").value = "all");
        trade.lotid == 9 && o.isset_buyuser--;
        trade.setInput({
            isbaodi: o.isbd, 				//是否保底
            isset_buyuser: o.isset_buyuser		//是否设置招股对象
        });
        var s = fw.getId("buyMoney") ? "，您认购" + fw.getId("buyMoney").innerHTML + "元" : "";
        if (trade.confirm && !confirm(trade.confirmMsg || "本次合买金额" + trade.calMoney(count) + "元" + s + "，是否发起？")) return;
        return trade.submitBy(mode == "" ? "form" : mode, form);
    }
    
    if (trade.confirm && !confirm(trade.confirmMsg || "本次购彩金额" + trade.calMoney(count) + "元，是否发起？")) return;
    if (mode != "") return trade.submitBy(mode, form);
    trade.onSubmitBack = trade.submitSuccess;

    return trade.submitBy(mode == "" ? "form" : mode, form);
    //form.action = trade.baseUrl + "/pages/trade/ajax/suc/project_fqsuc_fs.php";
    //trade.submitBy("ajax", form);
}

//提交方式
trade.submitBy = function(mode, form){
	trade.graySubmit(true);
	trade.debug && alertForm();
	if (mode=="ajax") trade.submitByAjax(form);
	else if (mode=="form") form.submit();
	else if (mode=="iframe") fw.ui.uploadFile(form, true);
}

//提交成功回调
trade.submitBack = function(o){
	trade.graySubmit(false);
	trade.debug && alert(fw.json.tostring(o));
	trade.onSubmitBack(o);
}

//是否灰掉提交按钮
trade.graySubmit = function(b){
	trade.submiting = b;
	fw.getId("submitCaseBtn") && (fw.getId("submitCaseBtn").disabled=b);
	fw.getId("submitCaseBtn0") && (fw.getId("submitCaseBtn0").disabled=b);
	fw.getId("submitCaseBtn1") && (fw.getId("submitCaseBtn1").disabled=b);
	fw.getId("submitCaseBtn2") && (fw.getId("submitCaseBtn2").disabled=b);
	fw.getId("submitCaseBtn3") && (fw.getId("submitCaseBtn3").disabled=b);
}

//ajax提交
trade.submitByAjax = function(form){
	var isbm = trade.lotid==9;
	isbm && trade.escape(["codes","danma","title","content","setbuyuser","ggtypename"]);
	var json = {
		url : form.action,
		form : form,
		onsuccess : trade.submitBack,
		onfail : function (){
			alert("提交失败！");
			trade.graySubmit(false);
		}	
	};
	isbm && (json.charset="GB2312");
	fw.ajax.request(json);
}

//提交成功回调函数(大部分彩种)
trade.submitSuccess = function (result){
	//alert(result);
	var o = typeof(result)=="string" ? fw.json.parse(result): result;
	if(o.msgmode==0){
		alert(o.msg);
		trade.graySubmit(false);		
		try{
			loginmsg.document.location.reload(1);
		}catch(e){
			try{
				top.frmUserLongin.document.location.reload(1);
			}catch(e){}
		}
		trade.clearPaner();
	}else{
		if(o.msgmode==1)
		{
			switch(o.errcode)
			{
				case 0:
					document.location.href = trade.baseUrl + "/pages/trade/main/"+o.headerurl;
					break;
				case -10:
				case -20:
				case -30:
				case -1000:
					alert(o.msg);
					trade.graySubmit(false);
								
					break;
				case -40:
				    alert(o.msg);
				    document.location.href = trade.baseUrl + "/pages/trade/main/"+o.headerurl;	
				    break;
			}
		}else{
			if(o.msgmode==2){
				if(o.errcode==0){
					alert(o.msg);
					document.location.href = trade.baseUrl + "/pages/info/main/"+o.headerurl;
				}else{
					if(o.errcode==-40){
					    alert(o.msg);
				        document.location.href = trade.baseUrl + "/pages/info/main/"+o.headerurl;
					} else {
						alert(o.msg);
					}
				}
			}	
		}
	}
}

//清除投注信息
trade.clearPaner = function(){
	xh.clearList();
	xh.clearNumberList();
	trade.multiple = fw.getId("multiple").value = 1;
	fw.getId("ischase") && !(fw.getId("ischase").checked=false) && chase.chkChase();
	fw.getId("addMoney") && !(fw.getId("addMoney").checked=false) && ssq.addMoney();
}

//判断用户是否登陆
trade.chkLogin = function (callBack){
	if (trade.islogin) return callBack(true);
	
	var chkLogin = function (result){
		result = fw.json.parse(result)
		if(result){
			trade.islogin = true;
			callBack(result);
		}else{
			alert("您还没有登录,请登录后再提交！");
			try{
				loginmsg.document.getElementById("u").focus();
			}catch(e){
				try{
					top.frmUserLongin.document.getElementById("u").focus();
				}catch(e){}
			}
		}
	}
	//fw.callFile(trade.baseUrl+"/chkLoginUserId.asp?"+fw.math.random(10000,100000), chkLogin);
}

//倒计时
var reverTime = {
	//@parameters 相差天数,相差时间,服务器时间,截止时间	
	init : function (dayObj, timeObj, serverTime, stopTime){
		this.offset = fw.date.format(serverTime).getTime() - new Date().getTime();
		this.obj = {
			day : fw.get(dayObj),
			time : fw.get(timeObj)
		};
		this.f = function(n){ return fw.conv.formatNo(n,2) };
		this.timer = null;
		this.start(stopTime);
	},
	//倒计时开始
	start : function(st){
		window.clearInterval(this.timer);
		var now = new Date().getTime() + this.offset;
		this.count = Math.floor((fw.date.format(st).getTime()-now)/1000)+1;	//总秒数
		this.run();	
		this.timer = window.setInterval(fw.bind(this,this.run), 1000);
	},
	//运行倒计时
	run : function (){
   		var o = this.diff(this.count--);
   		if (this.obj.day.innerHTML!=o.day){
    		this.obj.day.innerHTML = o.day;
   		}
   		if (o.hour!=0||o.minut!=0||o.second!=0||this.obj.time.innerHTML!="00:00:00"){
			this.obj.time.innerHTML = this.f(o.hour) + "<span style=font-size:12px;color:#666;>时</span>" + this.f(o.minute) +"<span style=font-size:12px;color:#666;>分</span>"+ this.f(o.second) +"<span style=font-size:12px;color:#666;>秒</span>";
   		}
	},
	//返回日期差距
	diff : function (t){
		return t>0 ? {
			day : Math.floor(t/86400),
			hour : Math.floor(t%86400/3600),
			minute : Math.floor(t%3600/60),
			second : Math.floor(t%60)
		} : {day:0,hour:0,minute:0,second:0};
	}
};

 //显示更多
trade.showMoreDiv = function (num){
	objname = "more_code"+num;
	objname2 = "more_str"+num;
	if(fw.getId(objname).style.display=='none'){
		fw.getId(objname2).innerHTML = "隐藏";
		fw.getId(objname).style.display = 'block';
	}
	else
	{
		fw.getId(objname2).innerHTML = "更多";
		fw.getId(objname).style.display = 'none';
	}
}

/*
* fun:显示或者关闭用户历史战绩和奖牌
* add:liudh
*/
trade.showUserInfo=function(contentURL){
	var __win=document.getElementById('sfz');
	var _iframe=document.getElementById('isfz');
	if(!contentURL)return(__win.style.display="none");
	_iframe.contentWindow.document.body.innerHTML="";
	var SrollTop=Math.max(document.body.scrollTop,document.documentElement.scrollTop);
    _iframe.src=contentURL;
    __win.style.display="block";
    __win.style.top=SrollTop+40+"px";		
}

/*
* file控件输入控制 (add: ldh)
*/
trade.upfile={
	noWrite:function(){
		if(this.__file)
		this.__file.onpaste=this.__file.onkeydown=function(){return false};
		return this;
	},
	noOpen:function(flag){
		if(this.__file)
		if(flag||flag==void(0)){
			this.__file.setAttribute("disabled","disabled");
			this.reset();
		}	
		else{
			this.__file.removeAttribute("disabled");}
		return this;
	},
	reset:function(){
		var form=document.createElement('form');
		document.body.appendChild(form);
		var pos=this.__file.nextSibling;
		form.appendChild(this.__file);
		form.reset();
		pos.parentNode.insertBefore(this.__file,pos);
		document.body.removeChild(form);
	},
	init:function(id){
		this.__file="object"==typeof(id)?id:document.getElementById(id);
		this.noWrite();		
		return this;
	}
 }
 
//获取元素绝对位置
trade.getXy = function (o){
	o = fw.get(o);
	for(var _pos={x:0,y:0};o;o=o.offsetParent){
		_pos.x+=o.offsetLeft;
		_pos.y+=o.offsetTop;
	};
	return _pos;
}

//自适应高度
trade.setResize = function(){
//	if (self==top) return;
//	var f = function (u,i){
//		var obj = fw.getId("grandson_iframe"+i)||fw.append(document.getElementsByTagName("head")[0], "iframe", {id:"grandson_iframe"+i,style:{display:"none"}});
//		obj.src = "http://"+u+"cp.com/js/info/autoHeight.html?" + document.documentElement[fw.isie?"scrollHeight":"offsetHeight"];
//	}
//	trade.Resize = function(){ fw.callEach(["www.","news.",""],f); }
//	trade.Resize();
//	fw.dom.addEvent(window, "load", trade.Resize);
}

//调试信息开关（双击）
document.ondblclick = function(){
	if (!fw.event.getEvent().altKey) return;
	alert("调试模式已"+["关闭","打开"][Number(trade.debug=!trade.debug)]);
	document.body.setAttribute("oncontextmenu", "return "+trade.debug);
	fw.isie && (document.body.oncontextmenu = function(){return trade.debug});
	trade.addSelectAllBtn();
}

//增加全选按钮
trade.addSelectAllBtn = function(){
	if (fw.getId("quanxuan")){
		with(fw.getId("quanxuan").style)display=display!=""?"":"none";
		return;
	}
	var obj = fw.create("button", {id:"quanxuan", html:"全选"});
	window.gg && (obj.onclick=gg.onSelectAll);
	var ol = fw.getId("mathList") || fw.getId("numberList");
	var po = ol.parentNode.parentNode;
	po.insertBefore(obj, po.lastChild);
}

//光标跳到某行
trade.setLine = function (Id,i){
	var e =document.getElementById(Id);
	var va=(e.value+"\n").replace(/\n+$/,"\n");
	var s1=va.match(eval("/^(.+\\n){"+(i-1)+"}/ig"));
	if(!s1)return;
	var s2=va.match(eval("/^(.+\\n){"+(i)+"}/ig"));
	var count=va.match(/.+\n/ig).length+5;
	var startPos=s1[0].length;
	var endPos=s2[0].length;
	if(e.createTextRange){
		var r =e.createTextRange();
		r.collapse();
		r.moveStart('character',startPos-i+1);
		r.moveEnd('character',endPos-startPos-1);
		r.select(); 
	}else{
		e.selectionStart=startPos;
		e.selectionEnd=endPos;
		e.scrollTop=e.scrollHeight/count*(i-1);
		e.focus();
	}
};