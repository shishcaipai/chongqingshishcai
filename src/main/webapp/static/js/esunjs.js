var esunjs = {};

//初始化
esunjs.init = function(){
	esunjs.handle = {};
	esunjs.domain = "";
	if (/trade/i.test(location.hostname)){
		if (document.referrer){
			var s = document.referrer.split(/\/+/)[1];
			if (!/trade/i.test(s)){
				fw.cookie.set("esunjs.domain", s);
				return esunjs.domain=s;
			}
		}
		esunjs.domain = fw.cookie.get("esunjs.domain");		
	}
}
esunjs.init();

//设置domain
esunjs.setDomain = function(){
	var ifr = top.document.getElementsByName("iframe_msg");
	if (ifr.length>0){
		return esunjs.domain = ifr[0].src.split(/\/+/)[1];
	}
	esunjs.domain = "trade.500wan.com";
}

//跨域执行JS语句
esunjs.callJs = function (cmd, arg){
	var url = "http://" + esunjs.domain + "/js/public/callJs.html";
	var obj = fw.getId("iframe_rnd") || fw.append(fw.dom.getTag("head")[0],"iframe",{style:{id:"iframe_rnd",display:"none"}});
	obj.src = esunjs.setUrl(url, {cmd:cmd,arg:arg}, true);
}

//调整iframe高度
esunjs.setHeight = function(name, h){
	h += "px";	
	with (document.getElementsByName(name)[0].style) height!=h && (height=h);
}

//登陆回调
esunjs.loginBack = function (){
	fw.object.callEach(esunjs.handle, function(v){esunjs.callJs(v)});
}

//添加登陆回调事件
esunjs.addHandle = function (handle){
	if (!esunjs.handle[handle]) esunjs.handle[handle]=handle;
}

//获取Class
esunjs.getClass = function(obj, tag, cls){
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
esunjs.getRadio = function (name){
	var o = fw.dom.getName(name);
	for(var i=o.length-1;i>-1&&!o[i].checked;i--);
	return i>-1 ? o[i].value : false;
}

//获取元素绝对位置
esunjs.getXy = function (o){
	o = fw.get(o);
	for(var _pos={x:0,y:0};o;o=o.offsetParent){
		_pos.x+=o.offsetLeft;
		_pos.y+=o.offsetTop;
	};
	return _pos;
}

//获取元素绝对位置
esunjs.getXy2 = function (o){
	o = fw.get(o);
	var _pos = {x:0, y:0, x2:o.offsetWidth, y2:o.offsetHeight};
	while(o=o.offsetParent){
		_pos.x += o.offsetLeft;
		_pos.y += o.offsetTop;
	};
	_pos.x2 += _pos.x;
	_pos.y2 += _pos.y;
	return _pos;
}

//批量获取隐藏域的值
esunjs.getInput = function(){
	var json = {};
	for (var i=0,a=arguments,l=a.length;i<l;i++){
		json[a[i]] = fw.getId(a[i]) ? fw.getId(a[i]).value : "";
	}
	return json;
}

//批量设置隐藏域的值
esunjs.setInput = function(json){
	for (var id in json){
		if (fw.getId(id)){
			fw.getId(id).value = json[id];
		}
	}
}

//input集体转换编码
esunjs.escape = function (a){
	for (var i=0,l=a.length;i<l;i++){
		fw.getId(a[i]) && (fw.getId(a[i]).value = escape(fw.getId(a[i]).value).replace(/\+/g,"%2b"));
	}
}

//批量获取URL的值
esunjs.getUrl = function(url){
	var json = {};
	url.replace(/[\?\&](\w+)=(\w+)/g,function(s,s1,s2){
		json[s1] = s2;
	});
	return json;
}

//批量设置URL的值
esunjs.setUrl = function(u, o, bm){
	var a = [], s;
	for (var i in o){
		s = bm ? escape(o[i]) : o[i];
		a.push(i+"="+s);
	}
	return u + "?" + a.join("&");
}

//检查数字回调
esunjs.chkNumberBack = function (obj,callBack){
	var s = obj.value.replace(/\D/g,"");
	obj.value = s!="" ? Number(s) : "";
	if (callBack) {
		callBack(obj);
	}
}

//检查数字回调函数
esunjs.chkNumber = function(cb){
	var _this=this;
	return function(){esunjs.chkNumberBack(_this,cb)};
}

//格式化数字
esunjs.formatNum = function (num){
	return Math.round(num*100)/100;
}

//计算串
esunjs.C = function (a, num) {
	if (typeof(a[0])=="number") a=fw.array.getNum(a);
	if (typeof(num)=="number") num=[num];
    var r = 0;
    var n = a.length;
    var ff = function (n,i){ return Math.pow(a[i][0],n) * fw.math.C(a[i][1],n) };
    (function f(t,i){
        if(i==n){
            if (fw.array.getIdx(num, fw.array.add(t))>-1) r += fw.array.multiple(fw.each(t,ff,[]));
            return;
        }
        for(var j=0; j<=a[i][1]; j++) f(t.concat(j), i+1);
    })([], 0);
    return r;
}

//弹出警告及获取焦点
esunjs.alert = function(obj, msg){
	alert(msg);
	fw.get(obj).focus();		
	return false;
}

//设置Body的HTML
esunjs.setTbodyHTML = function (tid, html){
	var tb = fw.get(tid);
	fw.dom.clearChild(tb);
	fw.dom.insertRows2(tb, html);
}

//打开模态窗口	
esunjs.openWin = function (strurl,width,height){
	if (fw.isff){
		return window.open(strurl,"","width="+width+",height="+height)
	}
	window.showModalDialog(strurl,window,"help: No; resizable: No; status: No;scrollbars:No;center: Yes;dialogWidth:"+width+"px;dialogHeight:"+height+"px;");
}

//获取某天属于今年第几周
esunjs.getWeek = function (dtObj){
	var f = function (d, m){
		var i = d.getDate();
		var w = d.getDay();
		while((d=new Date(d.setDate(i+=m))).getDay()!=1);
		return d;
	}
	var d = dtObj ? fw.date.format(dtObj) : new Date();
	var y = d.getFullYear();
	var sd = new Date(y, 0, 1);
	var ed = new Date(y, d.getMonth(), d.getDate());
	return (f(ed,-1)-f(sd,1)) / 604800000 + 2;
}

//日期格式化
esunjs.fmtDate = function (d, fmt){
	var f = function(m, n){return m>9?m:fw.conv.formatNo(m,n)};
	fmt = fmt.replace(/y+/i, function(s){return fw.conv.formatNo(d.getFullYear(),s.length)});
	fmt = fmt.replace(/M+/i, function(s){return f(d.getMonth()+1,s.length)});
	fmt = fmt.replace(/d+/i, function(s){return f(d.getDate(),s.length)});
	fmt = fmt.replace(/h+/i, function(s){return f(d.getHours(),s.length)});
	fmt = fmt.replace(/m+/i, function(s){return f(d.getMinutes(),s.length)});
	fmt = fmt.replace(/s+/i, function(s){return f(d.getSeconds(),s.length)});
	return fmt;	
}

//ajax提交
esunjs.submitByAjax = function(form, cb, bmObj){
	bmObj && trade.escape(bmObj);
	var json = {
		url : form.action,
		form : form,
		onsuccess : cb || false,
		onfail : function (){
			alert("提交失败！");
			trade.graySubmit(false);
		}	
	};
	fw.ajax.request(json);
}

//弹出表单信息
function alertForm(){
	alert(fw.json.tostring(fw.dom.getForm(document.project_form)).replace(/:".*?",/g,"$&\n").slice(1,-1));
}

//获取顶层窗口
esunjs.getTopWin = function(win){
	var a = [win.name];
	while(win.parent!=top) a.push((win=win.parent).name);
	return "top." + a.reverse().join(".") + ".";
}


//弹出层
esunjs.div = function (objList, st, getUrl){
	var me = this;
	this.getUrl = getUrl;
	this.st = st;
	//trade.islimit = true;
	fw.callEach(objList, function(obj){
		fw.get(obj).onclick = function(){me.showHide()};
	});
}

//显示或隐藏限号
esunjs.div.prototype.showHide = function (){
	if (!this.obj) return this.show();
	this.obj.style.display!="none" ? this.close() : this.show();
}

//显示限号
esunjs.div.prototype.update = function (){
	var u = this.getUrl();
	if (!this.obj){
		var st = fw.object.merge({position:"absolute",display:"none", overflow:"hidden"}, this.st);
		this.obj = fw.append(document.body, "div", {style:st});
	}
	fw.setHTML(this.obj, '<iframe src="'+this.getUrl()+'" width="100%" height="100%" frameBorder="0" scrolling="no"></iframe>');
	//fw.ui.drag(this.obj);		
}

//显示限号
esunjs.div.prototype.show = function (){
	this.update();
	var o = esunjs.getXy("sdaddmoneylist");	
	this.obj.style.left = o.x + this.st.left + "px";
	this.obj.style.top = o.y + this.st.top + "px";	
	this.obj.style.display = "";
}

//关闭限号
esunjs.div.prototype.close = function (){
	this.obj.style.display = "none";
}