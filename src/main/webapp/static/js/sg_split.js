var sg_split = {};

//拆分明细初始化
sg_split.init = function(){
	fw.getId("split_close").onclick = sg_split.close;
	fw.ui.drag("split_box", "split_head");
}

//从投注页面显示
sg_split.showFromVote = function(ggm){
	if (trade.baseCount>10000) return !!alert("请选择10000注以下的方案查看！");
	sg_split.ggt = sg_vote.ggtype;					//过关类型
	sg_split.ggm = ggm;								//过关方式
	sg_split.isre = sg_vote.isCutRepeat				//是否去重复
	sg_split.ggmlist = sg.ggm2num[sg_split.ggm];	//过关方式列表
	sg_split.nb = [];
	var oo;
	var xx;
	fw.callEach(sg_vote.nb, function(o, r){
		oo = sg_vote.data[o.row];
		//sg_split.nb[r] = {row:sg_vote.data[o.row].serialNumber, vs:oo.lg, sp:fw.each(o.arr,function(i){return oo.sp[i]}, []), rt:fw.each(o.arr, sg.idx2mr, []), dan:o.dan};
		sg_split.nb[r] = {row:sg_vote.data[o.row].serialNumber, vs:oo.main+' VS '+oo.guest, sp:fw.each(o.arr,function(i){return oo.sp[i]}, []), rt:fw.each(o.arr, sg.idx2mr, []), dan:o.dan};
	});
	sg_split.open();
	sg.from=="info" ? sg.setPos("split_box") : fw.ui.setCenter("split_box");
}

//从隐藏域显示
sg_split.showFromCodes = function(ggm){
	sg_split.ggt = fw.getId("gggroup").value;			//过关类型
	sg_split.ggm = ggm;									//过关方式
	sg_split.isre = !!+fw.getId("IsCutMulit").value		//是否去重复
	sg_split.ggmlist = sg_split.ggt==3 ? fw.each(ggm.split(","), function(s){return sg.type2nm[s].n}).reverse() : sg.ggm2num[sg_split.ggm];
	sg_split.nb = [];
	var aa = sg.parse(fw.getId("codes").value, fw.getId("danma").value);
	var rows = fw.getId("matchList").rows;
	var a;
	fw.callEach(aa, function(o, i){
		a = rows[i].cells;
		switch(trade.playid){
		    case 34:
		    	sg_split.nb[i] = {row:o.row, vs:a[1].innerHTML, rq:a[2].innerHTML, bf:a[3].innerHTML, sp:a[5].innerHTML, rt:a[6].innerHTML, dan:o.dan, colspan_num:7};
		    	break;
		    case 51:
		    	sg_split.nb[i] = {row:o.row, vs:a[1].innerHTML, bcbf:a[2].innerHTML, bf:a[3].innerHTML, sp:a[5].innerHTML, rt:a[6].innerHTML, dan:o.dan, colspan_num:7};
		    	break;
		    default:
		    	sg_split.nb[i] = {row:o.row, vs:a[1].innerHTML, bf:a[2].innerHTML, sp:a[4].innerHTML, rt:a[5].innerHTML, dan:o.dan, colspan_num:6};
		}

	});
	sg_split.open();
	fw.ui.setCenter("split_box");
}

//从确认页隐藏域显示
sg_split.showFromCkCodes = function(ggm){
	sg_split.ggt = fw.getId("gggroup").value;			//过关类型
	sg_split.ggm = ggm;									//过关方式
	sg_split.isre = !!+fw.getId("IsCutMulit").value		//是否去重复
	sg_split.ggmlist = sg_split.ggt==3 ? fw.each(ggm.split(","), function(s){return sg.type2nm[s].n}).reverse() : sg.ggm2num[sg_split.ggm];
	sg_split.nb = [];
	var aa = sg.parse(fw.getId("codes").value, fw.getId("danma").value);
	var rows = fw.getId("matchList").rows;
	var a;
	fw.callEach(aa, function(o, i){
		a = rows[i].cells;
		switch(trade.playid){
		    case 34:
		    	sg_split.nb[i] = {row:o.row, vs:a[1].innerHTML, rq:a[2].innerHTML, rt:(a[3].getAttribute('codes')||a[3].innerHTML), dan:o.dan, colspan_num:5};
		    	break;
		    case 51:
		    	sg_split.nb[i] = {row:o.row, vs:a[1].innerHTML, rt:(a[2].getAttribute('codes')||a[2].innerHTML), dan:o.dan, colspan_num:5};
		    	break;
		    default:
		    	sg_split.nb[i] = {row:o.row, vs:a[1].innerHTML, rt:(a[2].getAttribute('codes')||a[2].innerHTML), dan:o.dan, colspan_num:4};
		}

	});
	sg_split.open();
	fw.ui.setCenter("split_box");
}

//从文件显示
sg_split.showFromFile = function(ggm, file){
	file = trade.baseUrl + "/pages/trade/bjdc/readfile.php?" + file;
	sg_split.viewMore = sg_split.viewMore2;
	if (fw.getId("matchList").tagName=="TABLE") sg_split.showCodes=sg_split.showCodes2;

	fw.callFile(file, function(str){
		if (/保密/.test(str)) return alert(str);
		sg_split.ggm = ggm;									//过关方式
		sg_split.ggmlist = sg.ggm2num[sg_split.ggm];
		sg_split.nb = [];

		sg_split.singlelist = fw.each(str.split(/\n/),function(s){if(fw.trim(s)!="")return s},[]);
		sg_split.open();
		fw.ui.setCenter("split_box");
	});
}

//打开
sg_split.open = function(){
	sg_split.d = [];
	sg_split.t = [];
	fw.dom.insertRows2("split_more", '<tr><th colspan="6" height="100">方案明细加载中，请稍候...</th></tr>', true);
	if (sg_split.ggt==3) sg_split.isre=true;
	fw.getId("split_box").style.display = "block";
	window.setTimeout("sg_split.showCodes(),sg_split.viewMore()", 1);
}

//显示投注内容
sg_split.showCodes = function(){
	var html = [];

	var fd = function(isd){return isd ? '<span class="red">√</span>' : '×'};
	fw.callEach(sg_split.nb, function(o, i){
		o.rq = o.rq?'</td><td>'+o.rq:'';
		o.bcbf  = o.bcbf?'</td><td>'+o.bcbf:'';
		o.bf = o.bf?'</td><td>'+o.bf:'';
        o.sp = o.sp?'</td><td>'+o.sp:'';
        colspan_num = o.colspan_num?o.colspan_num:6;
		//html[i] = '<tr class="td6"><td>'+o.row+'</td><td>'+o.vs+o.rq+o.bcbf+o.bf+'</td><td>'+o.sp+'</td><td>'+o.rt+'</td><td>'+fd(o.dan)+'</td></tr>';
    html[i] = '<tr class="td6"><td>'+o.row+'</td><td>'+o.vs+o.rq+o.bcbf+o.bf+o.sp+'</td><td>'+o.rt+'</td><td>'+fd(o.dan)+'</td></tr>';
		sg_split[o.dan?"d":"t"].push(o.row + ":[" + o.rt + "]");
	});
	var s = sg_split.ggt==1 ? " -- " : (sg_split.isre?"是":"否");
	//html.push('<tr><td colspan="'+colspan_num+'" class="td5">过关方式：<span class="red">'+sg_split.ggm+'</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+(sg_split.ggt==2?'是否去重复：<span class="red">'+s+'</span>':'')+'</td></tr>');
	html.push('<tr><td colspan="'+colspan_num+'" class="td5">过关方式：<span class="red">'+sg_split.ggm+'</span></td></tr>');
	html = html.join("");
	fw.dom.insertRows2("split_codes", html, true);
}

//显示投注内容2
sg_split.showCodes2 = function(){
	fw.getId("split_codes").parentNode.deleteRow(0);
	fw.dom.clearChild("split_codes");
	for (var i=0,a=fw.getId("matchList").rows; i<a.length; i++){
		fw.getId("split_codes").appendChild(a[i].cloneNode(1));
	};
}

//显示拆分明细
sg_split.viewMore = function(){
	var dn = sg_split.d.length;

	var ad = function(t){return sg_split.d.concat(t)};
	var f = function(d, t){
		var a = [];
		fw.callEach(sg_split.ggmlist, function(n){
			a = a.concat( n>dn ? fw.each(fw.math.CR(t,n-dn),ad) : fw.math.CR(d,n) );
		});
		return a;
	}
	var m = sg_split.ggt==3 ? sg.ggm2num[sg_split.ggm.split(",")[0]][0] : sg.ggm2num[sg_split.ggm][0];
	var r = sg_split.isre ? f(sg_split.d, sg_split.t) : fw.each(fw.math.CR(sg_split.t,m-dn),ad);
	var ll = r.length - 4;
	var html = [];
	var count = 0;
	var g, tt, n;
	fw.callEach(r, function(a,i){
		tt = fw.each(a, function (s){return s.split(",").length}, []);
		n = sg_split.isre ? fw.array.multiple(tt) : esunjs.C(tt, sg_split.ggmlist);
		if (i<100||i>ll){
			g = sg_split.isre ? sg.num2ggm[a.length] : sg_split.ggm;
			html[i] = '\
			<tr>\
				<td class="td6">' + (i+1) + '</td>\
				<td class="td6" align="left">' + a.join("/") + '</td>\
				<td class="td6">' + g + '</td>\
				<td class="td6">' + n + '</td>\
				<td class="td6">' + trade.multiple + '</td>\
				<td class="td6">' + trade.calMoney(n*trade.multiple) + '</td>\
			</tr>';
		}else if(i==100){
			html[i] = '<tr><td class="td6" colspan="7" align="center">.................................</td></tr>';
		}
		count += n;
	});
	html.push('\
 	<tr>\
		<td class="td5"><div align="right">共计：&nbsp;</div></td>\
		<td class="td5">&nbsp;</td>\
		<td class="td5">&nbsp;</td>\
		<td class="td5"><span class="red">'+count+'</span>注</td>\
		<td class="td5"><span class="red">'+trade.multiple+'</span>倍</td>\
		<td class="td5"><span class="red" style="font-weight:bold;">'+trade.calMoney(count*trade.multiple)+'</span>元</td>\
	</tr>');
	fw.dom.insertRows2("split_more", html.join(""), true);
}

//显示拆分明细2
sg_split.viewMore2 = function(){
	var html=[], count=sg_split.singlelist.length, n=1;
	fw.callEach(sg_split.singlelist, function(s, i){
		html.push('\
			<tr>\
				<td class="td6">' + (i+1) + '</td>\
				<td class="td6" align="left">' + s.split(" ").join("/") + '</td>\
				<td class="td6">' + sg_split.ggm + '</td>\
				<td class="td6">' + n + '</td>\
				<td class="td6">' + trade.multiple + '</td>\
				<td class="td6">' + trade.calMoney(n*trade.multiple) + '</td>\
			</tr>');
	});
/*
	html.push('\
 	<tr>\
		<td class="td5"><div align="right">共计：&nbsp;</div></td>\
		<td class="td5">&nbsp;</td>\
		<td class="td5">&nbsp;</td>\
		<td class="td5"><span class="red">'+count+'</span>注</td>\
		<td class="td5"><span class="red">'+trade.multiple+'</span>倍</td>\
		<td class="td5"><span class="red" style="font-weight:bold;">'+trade.calMoney(count*trade.multiple)+'</span>元</td>\
	</tr>');
*/
	fw.dom.insertRows2("split_more", html.join(""), true);
}

//关闭
sg_split.close = function(){
	fw.getId("split_box").style.display = "none";
}