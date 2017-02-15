//选择组合方式
function checksite() {
    //显示所有的方法
    $("td.adtd04 > span").hide();
    //隐藏所有选号
    $("table.numtbTable").hide();
    if (xxtype == 1)//任选复式 
    {
        $("span#sytz").show();
        $("span#sytz > span").show();
        $("table#numtb").show();
        //开启机选
        CloseJiXuan(false);
        if (tztype == 1)//选一
        {
            $("span#zhexplain1").html("（至少选择1个号码投注，选号与开奖号码第1位一致即中奖<font color=red>18</font>元。）");
        }
        else if (tztype == 2)//选二
        {
            $("span#zhexplain1").html("（至少选择2个号码投注，选号与开奖号码任意2位一致即中奖<font color=red>9</font>元。）");
        }
        else if (tztype == 3)//选三
        {
            $("span#zhexplain1").html("（至少选择3个号码投注，选号与开奖号码任意3位一致即中奖<font color=red>28</font>元。）");
        }
        else if (tztype == 4)//选四
        {
            $("span#zhexplain1").html("（至少选择4个号码投注，选号与开奖号码任意4位一致即中奖<font color=red>108</font>元。）");
        }
        else if (tztype == 5)//选五
        {
            $("span#zhexplain1").html("（至少选择5个号码投注，选号与开奖号码全部一致即中奖<font color=red>790</font>元。）");
        }
        else if (tztype == 6)//选六
        {
            $("span#zhexplain1").html("（至少选择6个号码投注，选号任意5位与开奖号码一致即中奖<font color=red>125</font>元。）");
        }
        else if (tztype == 7)//选七
        {
            $("span#zhexplain1").html("（至少选择7个号码投注，选号任意5位与开奖号码一致即中奖<font color=red>36</font>元。）");
        }
        else if (tztype == 8)//选八
        {
            $("span#zhexplain1").html("（至少选择8个号码投注，选号任意5位与开奖号码一致即中奖<font color=red>12</font>元。）");
        }
    }
    if (xxtype == 2)//单式投注
    {
        $("span#sytz").show();
        $("span#sytz > span").show();
        $("table#numtc").show();
        //开启机选
        CloseJiXuan(false);
        if (tztype == 1)//选一
        {
            $("#gsexplain").attr("href", "/Trade/syy/Xml/dg/r1.txt");
            $("span#zhexplain1").html("（选择1个号码投注，选号与开奖号码第1位一致即中奖<font color=red>13</font>元）");
        }
        else if (tztype == 2)//选二
        {
            $("#gsexplain").attr("href", "/Trade/syy/Xml/dg/r2.txt");
            $("span#zhexplain1").html("（选择2个号码投注，选号与开奖号码任意2位一致即中奖<font color=red>9</font>元）");
        }
        else if (tztype == 3)//选三
        {
            $("#gsexplain").attr("href", "/Trade/syy/Xml/dg/r3.txt");
            $("span#zhexplain1").html("（选择3个号码投注，选号与开奖号码任意3位一致即中奖<font color=red>28</font>元）");
        }
        else if (tztype == 4)//选四
        {
            $("#gsexplain").attr("href", "/Trade/syy/Xml/dg/r4.txt");
            $("span#zhexplain1").html("（选择4个号码投注，选号与开奖号码任意4位一致即中奖<font color=red>108</font>元）");
        }
        else if (tztype == 5)//选五
        {
            $("#gsexplain").attr("href", "/Trade/syy/Xml/dg/r5.txt");
            $("span#zhexplain1").html("（选择5个号码投注，选号与开奖号码全部一致即中奖<font color=red>790</font>元）");
        }
        else if (tztype == 6)//选六
        {
            $("#gsexplain").attr("href", "/Trade/syy/Xml/dg/r6.txt");
            $("span#zhexplain1").html("（选择6个号码投注，选号任意5位与开奖号码一致即中奖<font color=red>125</font>元）");
        }
        else if (tztype == 7)//选七
        {
            $("#gsexplain").attr("href", "/Trade/syy/Xml/dg/r7.txt");
            $("span#zhexplain1").html("（选择7个号码投注，选号任意5位与开奖号码一致即中奖<font color=red>28</font>元）");
        }
        else if (tztype == 8)//选八
        {
            $("#gsexplain").attr("href", "/Trade/syy/Xml/dg/r8.txt");
            $("span#zhexplain1").html("（选择8个号码投注，选号任意5位与开奖号码一致即中奖<font color=red>12</font>元）");
        }

    }
    else if (xxtype == 3)//任选胆拖
    {
        $("span#sytz").show();
        $("span#sytz > span").show();
        $("span#c1").hide();
        $("span#c6").hide();
        $("span#c7").hide();
        $("span#c8").hide();
        $("table#numtb_dt").show();
        //开启机选
        CloseJiXuan(true);
        if (tztype == 2)//选二
        {
            $("#dtinfo_1 > font").html("（0＜胆码个数＜2）");
            $("#dtinfo_2 > font").html("（3 ≤胆码＋拖码）");
            $("span#zhexplain1").html("（胆码+拖码至少选择3个号码投注，选号与开奖号码任意2位一致即中奖<font color=red>9</font>元）");
        }
        else if (tztype == 3)//选三
        {
            $("#dtinfo_1 > font").html("（0＜胆码个数＜3）");
            $("#dtinfo_2 > font").html("（4 ≤胆码＋拖码）");
            $("span#zhexplain1").html("（胆码+拖码至少选择4个号码投注，选号与开奖号码任意3位一致即中奖<font color=red>28</font>元）");
        }
        else if (tztype == 4)//选四
        {
            $("#dtinfo_1 > font").html("（0＜胆码个数＜4）");
            $("#dtinfo_2 > font").html("（5 ≤胆码＋拖码）");
            $("span#zhexplain1").html("（胆码+拖码至少选择5个号码投注，选号与开奖号码任意4位一致即中奖<font color=red>108</font>元）");
        }
        else if (tztype == 5)//选五
        {
            $("#dtinfo_1 > font").html("（0＜胆码个数＜5）");
            $("#dtinfo_2 > font").html("（6 ≤胆码＋拖码）");
            $("span#zhexplain1").html("（胆码+拖码至少选择6个号码投注，选号与开奖号码全部一致即中奖<font color=red>790</font>元）");
        }
        else if (tztype == 6)//选六
        {
            $("#dtinfo_1 > font").html("（0＜胆码个数＜6）");
            $("#dtinfo_2 > font").html("（7 ≤胆码＋拖码）");
            $("span#zhexplain1").html("（胆码+拖码至少选择7个号码投注，选号任意5位与开奖号码一致即中奖<font color=red>125</font>元）");
        }
        else if (tztype == 7)//选七
        {
            $("#dtinfo_1 > font").html("（0＜胆码个数＜7）");
            $("#dtinfo_2 > font").html("（8 ≤胆码＋拖码）");
            $("span#zhexplain1").html("（胆码+拖码至少选择8个号码投注，选号任意5位与开奖号码一致即中奖<font color=red>28</font>元）");
        }
        else if (tztype == 8)//选八
        {
            $("#dtinfo_1 > font").html("（0＜胆码个数＜8）");
            $("#dtinfo_2 > font").html("（9 ≤胆码＋拖码）");
            $("span#zhexplain1").html("（胆码+拖码至少选择9个号码投注，选号任意5位与开奖号码一致即中奖<font color=red>12</font>元）");
        }
    }
    else if (xxtype == 4)//前三投注
    {
        $("span#fstz").show();
        if (tztype == 9)//直选复式
        {
            $("table#numta").show();
            $("table#numta > tbody > tr").show();
            $("span#zhexplain1").html("（前3位各选1个号码投注，选号与开奖号码前3位按位一致即中奖<font color=red>1700</font>元）");
            //开启机选
            CloseJiXuan(true);
        }
        else if (tztype == 11)//直选单式
        {
            $("table#numtc").show();
            $("#gsexplain").attr("href", "/Trade/syy/Xml/dg/q3.txt");
            $("span#zhexplain1").html("（前3位各选1个号码投注，选号与开奖号码前3位按位一致即中奖<font color=red>1700</font>元）");
            //开启机选
            CloseJiXuan(false);
        }
        else if (tztype == 12)//组选复式
        {
            $("table#numtb").show();
            $("span#zhexplain1").html("（至少选择3个号码投注，选号包含开奖号码前3位即中奖<font color=red>280</font>元）");
            //开启机选
            CloseJiXuan(true);
        }
        else if (tztype == 13)//组选单式
        {
            $("table#numtc").show();
            $("#gsexplain").attr("href", "/Trade/syy/Xml/dg/q3.txt");
            $("span#zhexplain1").html("（选择3个号码投注，选号包含开奖号码前3位即中奖<font color=red>280</font>元）");
            //开启机选
            CloseJiXuan(false);
        }
    }
    else if (xxtype == 5)// 前二投注
    {
        $("span#2xfstz").show();
        if (tztype == 14)//直选复式
        {
            $("table#numta").show();
            $("table#numta > tbody > tr").show();
            $("table#numta > tbody > tr").eq(2).hide();
            $("span#zhexplain1").html("（前2位各选1个号码投注，选号与开奖号码前2位按位一致即中奖<font color=red>185</font>元）");
            //开启机选
            CloseJiXuan(true);
        }
        else if (tztype == 15)//直选单式
        {
            $("table#numtc").show();
            $("#gsexplain").attr("href", "/Trade/syy/Xml/dg/q2.txt");
            $("span#zhexplain1").html("（前2位各选1个号码投注，选号与开奖号码前2位按位一致即中奖<font color=red>185</font>元）");
            //开启机选
            CloseJiXuan(false);
        }
        else if (tztype == 16)//组选复式
        {
            $("table#numtb").show();
            $("span#zhexplain1").html("（选择2个号码投注，选号包含开奖号码前2位即中<font color=red>80</font>元）");
            //开启机选
            CloseJiXuan(true);
        }
        else if (tztype == 17)//组选单式
        {
            $("table#numtc").show();
            $("#gsexplain").attr("href", "/Trade/syy/Xml/dg/q2.txt");
            $("span#zhexplain1").html("（至少选择2个号码投注，选号包含开奖号码前2位即中奖<font color=red>80</font>元）");
            //开启机选
            CloseJiXuan(false);
        }
    }
}


/*关闭机选*/
function CloseJiXuan(bl) {
    $("input#btn_jixuan1,input#btn_jixuan5,input#btn_jixuan10").attr("disabled", bl);
}

/*异步上传文件*/
function updatefile() {
    $.ajaxFileUpload({
    url: '/trade/syy/AjaxUpload.asp', //用于文件上传的服务器端请求地址
        secureuri: false, //一般设置为false
        fileElementId: 'UpdateFile', //文件上传空间的id属性  <input type="file" id="file" name="file" />
        dataType: 'xml', //返回值类型 一般设置为json
        success: function(data, status)  //服务器成功响应处理函数
        {

            var err = $(data).find("err");
            if ($(err).attr("type") == "1") {
                if ($(err).attr("msg").length > 0) {
                    alert($(err).attr("msg"));
                }
                var line = "";
                $(data).find("row").each(function(index) {
                    line = line + $(this).attr("line") + "\r";
                });
                $("#pastecontent").val(line);
            }
            else {
                if ($(err).attr("msg").length > 0) {
                    alert($(err).attr("msg"));
                }
                if ($(err).attr("url").length > 0) {
                    location.href = $(err).attr("url");
                }
            }
        },
        error: function(data, status, e)//服务器响应失败处理函数
        {
            alert("上传文件错误，请联系客服，谢谢！");
        }
    })
    return false;
}

/**
 * 手动添加号码
 * @param sign 是否加入投注栏
 */
function add_line_self(sign) {
    var IsEXZXFS2DS = false;
    var linecounts = getlinecounts(xxtype, tztype);
    var codes = joinTZ(linecounts);
    if (codes == "") {
        if (xxtype == "3") //胆拖投注格式错误
        {
            if (!sign) {
            	alert("胆拖投注格式错误,胆码必需少于选号个数，与拖不能相同，胆+拖必需大于选号个数!");
            	return;
            }
        }
        else {
            if (!sign) {
            	alert("请选择号码！");
            	return;
            }
        }
    }
    if (Number(getzhushu_single(codes, xxtype, tztype)) > 0) //计算注数
    {
    	if (sign) {
			var zhushu = Number(getzhushu_single(codes, xxtype, tztype));
			zhushu = zhushu && zhushu > 0 ? zhushu : 0;
			$("#temp_select_zhushu").text(zhushu);
			$("#temp_select_money").text(zhushu * 2);
			return;
		}
        var value = codes;
        var playtypename = getplaytypename();
        var text = "[" + playtypename + "]" + codes;
        add_line(value, text, xxtype, tztype);
        clear_selectedball();
        count_allzhushu();
        show_money();
    }
    else {
        if (sign) {
			$("#temp_select_zhushu").text(0);
			$("#temp_select_money").text(0);
		} else {
			alert("请先选择至少一注投注号码!");
		}
        return;
    }
}







/*单式添加号码*/
function add_paste() {
    formatNum();
    var pastecontent = $("#pastecontent").val();
    var codes = pastecontent;
    if (codes == "") {
        alert("请先选择投注号码");
        return;
    }
    pastecontent = pastecontent.replace(/\r\n/g, "$");
    pastecontent = pastecontent.replace(/\n/g, "$");
    pastecontent = pastecontent.replace(/\s/g, "");
    pastecontent = pastecontent.replace(/(\$)\1+/g, '$1');
    if (pastecontent.substr(pastecontent.length - 1, 1) == "$") {
        pastecontent = pastecontent.substr(0, pastecontent.length - 1);
    }

    var pastecontentArr = pastecontent.split("$");
    var codesshowNum = $("select#codesshow > option").length
    if ((pastecontentArr.length + codesshowNum) > 600) {
        alert("总投注内容不能超过600行");
        return;
    }
    var errzhushu = "";
    var errzhushumsg = " [格式错误]"
    var reg1, reg2;
    if (tztype == 1)//任选一
    {
        reg1 = /^(?:(0?[1-9]|1[01]))$/;
    }
    else if (tztype == 2 || tztype == 15 || tztype == 17)//任选二
    {
        reg1 = /^(?:(0?[1-9]|1[01])[,\|]){1}(?:0?[1-9]|1[01])$/;
    }
    else if (tztype == 3 || tztype == 11 || tztype == 13)//任选三
    {
        reg1 = /^(?:(0?[1-9]|1[01])[,\|]){2}(?:0?[1-9]|1[01])$/;

    }
    else if (tztype == 4)//任选四
    {
        reg1 = /^(?:(0?[1-9]|1[01])[,\|]){3}(?:0?[1-9]|1[01])$/;

    }
    else if (tztype == 5)//任选五
    {
        reg1 = /^(?:(0?[1-9]|1[01])[,\|]){4}(?:0?[1-9]|1[01])$/;

    }
    else if (tztype == 6)//任选六
    {
        reg1 = /^(?:(0?[1-9]|1[01])[,\|]){5}(?:0?[1-9]|1[01])$/;

    }
    else if (tztype == 7)//任选七
    {
        reg1 = /^(?:(0?[1-9]|1[01])[,\|]){6}(?:0?[1-9]|1[01])$/;

    }
    else if (tztype == 8)//任选八
    {
        reg1 = /^(?:(0?[1-9]|1[01])[,\|]){7}(?:0?[1-9]|1[01])$/;

    }

    for (var i = 0; i < pastecontentArr.length; i++) {
        var value1 = pastecontentArr[i];
        if (!reg1.test(value1)) {
            if (errzhushu == "") {
                errzhushu = "第" + (i + 1).toString() + "注";
            }
            else {
                errzhushu = errzhushu + " \n" + "第" + (i + 1).toString() + "注";
            }
            continue;
        }
        if (syydsinfo(value1)) {
            if (errzhushu == "") {
                errzhushu = "存在重复号码，第" + (i + 1).toString() + "注";
            }
            else {
                errzhushu = errzhushu + "、" + "第" + (i + 1).toString() + "注";
            }
            continue;
        }
    }
    if (errzhushu != "") {
        alert(errzhushu + " \n" + "号码有误，请核对！");
        return;
    }
    var linecounts = getlinecounts(xxtype, tztype);
    var playtypename = getplaytypename();
    for (var i = 0; i < pastecontentArr.length; i++) {
        var value = pastecontentArr[i];
        value = (',' + value + ',').replace(/\b(\d)\b/g, '0$1').replace(/^,|,$/g, ''); //重组方案
        var text = "[" + playtypename + "]" + value;
        add_line(value, text, xxtype, tztype);
    }
    $("#pastecontent").val("");
    count_allzhushu();
    show_money();
}
//格式投注
function formatNum() {
    var pastecontent = $("#pastecontent").val();
    if (pastecontent == "") {
        return;
    }
    pastecontent = pastecontent.replace(/[^\d]/g, '');
    var len = pastecontent.length / 2
    var num = ""
    var numtxt = ""
    var n = 0;
    var maxnum = 1;
    var playtypeid = getplaytypeid(xxtype, tztype);
    if (playtypeid == "201") {
        maxnum = 1;
    }
    else if (playtypeid == "202" || playtypeid == "502" || playtypeid == "504") {
        maxnum = 2;
    }
    else if (playtypeid == "203" || playtypeid == "403" || playtypeid == "405") {
        maxnum = 3;
    }
    else if (playtypeid == "204") {
        maxnum = 4;
    }
    else if (playtypeid == "205") {
        maxnum = 5;
    }
    else if (playtypeid == "206") {
        maxnum = 6;
    }
    else if (playtypeid == "207") {
        maxnum = 7;
    }
    else if (playtypeid == "208") {
        maxnum = 8;
    }
    for (var i = 0; i < len; i++) {
        if (i % maxnum == 0) {
            n = 1;
        }
        else {
            n = n + 1;
        }
        if (n < maxnum) {
            num = num + pastecontent.substr(i * 2, 2) + ",";
        }
        else {
            num = num + pastecontent.substr(i * 2, 2);
            numtxt = numtxt + num + "\n";
            num = "";
        }
    }
    $("#pastecontent").val(numtxt);
}

//去重复
function syydsinfo(k) {
    k = k.replace(/0([1-9])/g, '$1');
    k = k.split(',').sort(function(a, b) { return parseInt(a, 10) - parseInt(b, 10) }).join(',') + ',';
    var syydj = /(\d+,)\1/;
    return syydj.test(k);
}

//得到当前玩法的有效行数
function getlinecounts(type1, type2) {
    var linecounts = 3;
    return linecounts;
}

//拼接投注号码
function joinTZ(linecounts) {
    var tzall = "";
    var tzsingle = ""
    var tzsingletwo = "";
    var tzsingnum = 0;
    var tzsingnumb = 0;
    var tzsingleture = false;
    var tzsinglesprt;
    if (xxtype == 1) //任选复式  选一,选二,.....选八
    {
        tzsingle = ""
        $("tr#tr_vote_1").find("td." + SelectBallClassName).each(function(index) {
            tzsingle = tzsingle + $(this).text() + ","
        })
        tzall = tzsingle.substring(0, tzsingle.length - 1);
    }
    else if (xxtype == 3)//二星组选复式和组选包胆
    {
        tzsingle = ""
        tzsingnum = $("tr#tr_vote_2").find("td." + SelectBallClassName).length;
        $("tr#tr_vote_2").find("td." + SelectBallClassName).each(function(index) {
            tzsingle = tzsingle + $(this).text() + ","
        })
        tzsingle = tzsingle.substr(0, tzsingle.length - 1);
        var tzsinglesprt = tzsingle.split(",");
        tzsingle = tzsingle + ";";

        tzsingletwo = "";
        tzsingnumb = $("tr#tr_vote_3").find("td." + SelectBallClassName).length;
        tzsingleture = false;
        $("tr#tr_vote_3").find("td." + SelectBallClassName).each(function(index) {
            tzsingletwo = tzsingletwo + $(this).text() + ","
            for (var S = 0; S < tzsinglesprt.length; S++) {
                if ($(this).text() == tzsinglesprt[S]) {
                    tzsingleture = true;
                    break;
                }
            }
            if (tzsingleture) {
                return false;
            }
        })
        if (!tzsingleture) //号码重复
        {
            if (tztype == 2)//选二
            {
                if (tzsingnum == 1) {
                    if ((tzsingnum + tzsingnumb) >= 3) {
                        tzall = tzsingle + tzsingletwo;
                        tzall = tzall.substr(0, tzall.length - 1);
                    }
                }

            }
            else if (tztype == 3)//选三
            {
                if (tzsingnum > 0 && tzsingnum < 3) {
                    if ((tzsingnum + tzsingnumb) >= 4) {
                        tzall = tzsingle + tzsingletwo;
                        tzall = tzall.substr(0, tzall.length - 1);
                    }
                }
            }
            else if (tztype == 4)//选四
            {
                if (tzsingnum > 0 && tzsingnum < 4) {
                    if ((tzsingnum + tzsingnumb) >= 5) {
                        tzall = tzsingle + tzsingletwo;
                        tzall = tzall.substr(0, tzall.length - 1);
                    }
                }
            }
            else if (tztype == 5)//选五
            {
                if (tzsingnum > 0 && tzsingnum < 5) {
                    if ((tzsingnum + tzsingnumb) >= 6) {
                        tzall = tzsingle + tzsingletwo;
                        tzall = tzall.substr(0, tzall.length - 1);
                    }
                }
            }
            else if (tztype == 6)//选六
            {
                if (tzsingnum > 0 && tzsingnum < 6) {
                    if ((tzsingnum + tzsingnumb) >= 7) {
                        tzall = tzsingle + tzsingletwo;
                        tzall = tzall.substr(0, tzall.length - 1);
                    }
                }
            }
            else if (tztype == 7)//选七
            {
                if (tzsingnum > 0 && tzsingnum < 7) {
                    if ((tzsingnum + tzsingnumb) >= 8) {
                        tzall = tzsingle + tzsingletwo;
                        tzall = tzall.substr(0, tzall.length - 1);
                    }
                }
            }
            else if (tztype == 8)//选八
            {
                if (tzsingnum > 0 && tzsingnum < 8) {
                    if ((tzsingnum + tzsingnumb) >= 9) {
                        tzall = tzsingle + tzsingletwo;
                        tzall = tzall.substr(0, tzall.length - 1);
                    }
                }
            }
        }
    }
    else if (xxtype == 4)//前三投注
    {
        if (tztype == 9)// 直选复式
        {
            for (var i = 4; i < 7; i++) {
                tzsingle = ""
                $("tr#tr_vote_" + i).find("td." + SelectBallClassName).each(function(index) {
                    tzsingle = tzsingle + $(this).text() + ","
                })
                tzall += tzsingle;
                tzall = tzall.substr(0, tzall.length - 1);
                if (i < 6) {
                    tzall += ";";
                }
            }
        }
        else if (tztype == 12)//组选复式
        {
            tzsingle = ""
            $("tr#tr_vote_1").find("td." + SelectBallClassName).each(function(index) {
                tzsingle = tzsingle + $(this).text() + ","
            })
            tzall = tzsingle.substring(0, tzsingle.length - 1);
        }
    }
    else if (xxtype == 5)//前二投注
    {
        if (tztype == 14)// 直选复式
        {
            for (var i = 4; i < 6; i++) {
                tzsingle = ""
                $("tr#tr_vote_" + i).find("td." + SelectBallClassName).each(function(index) {
                    tzsingle = tzsingle + $(this).text() + ","
                })
                tzall += tzsingle;
                tzall = tzall.substr(0, tzall.length - 1);
                if (i < 5) {
                    tzall += ";";
                }
            }
        }
        else if (tztype == 16)//组选复式
        {
            tzsingle = ""
            $("tr#tr_vote_1").find("td." + SelectBallClassName).each(function(index) {
                tzsingle = tzsingle + $(this).text() + ","
            })
            tzall = tzsingle.substring(0, tzsingle.length - 1);
        }
    }
    return tzall;
}






//得到当前玩法的注数
function getzhushu_single(codes, type1, type2) {
	var zs = 0;
	try {
	    var playtypeid = getplaytypeid(type1, type2);
	    //选一复式
	    if (playtypeid == "101") {
	        var linecounts = getlinecounts(type1, type2);
	        var arrcode = codes.split(",");
	        zs = arrcode.length;
	
	    }
	    //任选复式 选二.... 选八
	    else if (playtypeid == "102" || playtypeid == "103" || playtypeid == "104" || playtypeid == "105" || playtypeid == "106" || playtypeid == "107" || playtypeid == "108") {
	        var arrcode = codes.split(",");
	        var n = arrcode.length;
	        if (playtypeid == "102")
	        { var ddbase = 2; }
	        else if (playtypeid == "103")
	        { var ddbase = 3; }
	        else if (playtypeid == "104")
	        { var ddbase = 4; }
	        else if (playtypeid == "105")
	        { var ddbase = 5; }
	        else if (playtypeid == "106")
	        { var ddbase = 6; }
	        else if (playtypeid == "107")
	        { var ddbase = 7; }
	        else if (playtypeid == "108")
	        { var ddbase = 8; }
	        var ddmp = 1;
	        zs = fwmathC(n, ddbase) * ddmp;
	    }
	    //任选单式 选一,选二.... 选八单式
	    else if (playtypeid == "201" || playtypeid == "202" || playtypeid == "203" || playtypeid == "204" || playtypeid == "205" || playtypeid == "206" || playtypeid == "207" || playtypeid == "208") {
	        zs = 1;
	    }
	    //任选胆拖  选二.... 选八
	    else if (playtypeid == "302" || playtypeid == "303" || playtypeid == "304" || playtypeid == "305" || playtypeid == "306" || playtypeid == "307" || playtypeid == "308") //直选和值
	    {
	        var arrcode = codes.split(";");
	        var arrcodea = arrcode[0].split(",");
	        var arrcodeb = arrcode[1].split(",");
	        var cnun = arrcodea.length;
	        var cnum = arrcodeb.length;
	        var ddmp = 1;
	        if (playtypeid == "302")
	        { var numbase = 2; }
	        else if (playtypeid == "303")
	        { var numbase = 3; }
	        else if (playtypeid == "304")
	        { var numbase = 4; }
	        else if (playtypeid == "305")
	        { var numbase = 5; }
	        else if (playtypeid == "306")
	        { var numbase = 6; }
	        else if (playtypeid == "307")
	        { var numbase = 7; }
	        else if (playtypeid == "308")
	        { var numbase = 8; }
	        zs = fwmathC(cnum, numbase - cnun) * ddmp;
	    }
	    if (playtypeid == "401")  //前三直选复式
	    {
	        var arrcode = codes.split(";");
	        var tt1 = arrcode[0].split(",");
	        var tt2 = arrcode[1].split(",");
	        var tt3 = arrcode[2].split(",");
	
	        for (var i = 0; i < tt1.length; i++) {
	            if (tt1[i] == '') continue;
	            for (var k = 0; k < tt2.length; k++) {
	                if (tt2[k] == '') continue;
	                for (var n = 0; n < tt3.length; n++) {
	                    if (tt3[n] == '') continue;
	                    if (tt1[i] != tt3[n] && tt2[k] != tt3[n] && tt1[i] != tt2[k]) {
	                        zs++;
	                    }
	                }
	            }
	        }
	
	
	    }
	    else if (playtypeid == "402")  //前三胆拖
	    {
	
	    }
	    else if (playtypeid == "403")  //前三单式
	    {
	        zs = 1
	
	    }
	    else if (playtypeid == "404")  //前三组选
	    {
	        var arrcode = codes.split(",");
	        var n = arrcode.length;
	        var ddbase = 3;
	        var ddmp = 1;
	        zs = fwmathC(n, ddbase) * ddmp;
	    }
	    else if (playtypeid == "405")  //组选单式
	    {
	        zs = 1
	    }
	    else if (playtypeid == "501") //前二复式
	    {
	        var arrcode = codes.split(";");
	        var tt1 = arrcode[0].split(",");
	        var tt2 = arrcode[1].split(",");
	
	        for (var i = 0; i < tt1.length; i++) {
	            if (tt1[i] == '') continue;
	            for (var k = 0; k < tt2.length; k++) {
	                if (tt2[k] == '') continue;
	                if (tt1[i] != tt2[k]) {
	                    zs++;
	                }
	            }
	        }
	    }
	    else if (playtypeid == "502") //前二单式
	    {
	        zs = 1;
	    }
	    else if (playtypeid == "503") //前二组选复式
	    {
	        var arrcode = codes.split(",");
	        var n = arrcode.length;
	        var ddbase = 2;
	        var ddmp = 1;
	        zs = fwmathC(n, ddbase) * ddmp;
	    }
	    else if (playtypeid == "504") //前二组选单式
	    {
	        zs = 1
	    }
	} catch (e) {
	}
    return zs;
}

//得到当前玩法名
function getplaytypename() {
    var playtypename = "";
    if (xxtype == 1)//复式
    {
        if (tztype == 1) {
            playtypename = "选一复式";
        }
        else if (tztype == 2) {
            playtypename = "选二复式";
        }
        else if (tztype == 3) {
            playtypename = "选三复式";
        }
        else if (tztype == 4) {
            playtypename = "选四复式";
        }
        else if (tztype == 5) {
            playtypename = "选五复式";
        }
        else if (tztype == 6) {
            playtypename = "选六复式";
        }
        else if (tztype == 7) {
            playtypename = "选七复式";
        }
        else if (tztype == 8) {
            playtypename = "选八复式";
        }
    }
    else if (xxtype == 2)//单式
    {
        if (tztype == 1) {
            playtypename = "选一单式";
        }
        else if (tztype == 2) {
            playtypename = "选二单式";
        }
        else if (tztype == 3) {
            playtypename = "选三单式";
        }
        else if (tztype == 4) {
            playtypename = "选四单式";
        }
        else if (tztype == 5) {
            playtypename = "选五单式";
        }
        else if (tztype == 6) {
            playtypename = "选六单式";
        }
        else if (tztype == 7) {
            playtypename = "选七单式";
        }
        else if (tztype == 8) {
            playtypename = "选八单式";
        }
    }
    else if (xxtype == 3) {
        if (tztype == 2) {
            playtypename = "选二胆拖";
        }
        else if (tztype == 3) {
            playtypename = "选三胆拖";
        }
        else if (tztype == 4) {
            playtypename = "选四胆拖";
        }
        else if (tztype == 5) {
            playtypename = "选五胆拖";
        }
        else if (tztype == 6) {
            playtypename = "选六胆拖";
        }
        else if (tztype == 7) {
            playtypename = "选七胆拖";
        }
        else if (tztype == 8) {
            playtypename = "选八胆拖";
        }
    }
    else if (xxtype == 4) {
        if (tztype == 9) {
            playtypename = "前三直选";
        }
        else if (tztype == 10) {
            playtypename = "前三胆拖";
        }
        else if (tztype == 11) {
            playtypename = "前三单式";
        }
        else if (tztype == 12) {
            playtypename = "前三组选";
        }
        else if (tztype == 13) {
            playtypename = "前三组选单式";
        }
    }
    else if (xxtype == 5) {
        if (tztype == 14) {
            playtypename = "前二直选";
        }
        else if (tztype == 15) {
            playtypename = "前二单式";
        }
        else if (tztype == 16) {
            playtypename = "前二组选";
        }
        else if (tztype == 17) {
            playtypename = "前二组选单式";
        }
    }
    return playtypename;
}


//通过选择类型和投注类型得到玩法ID
function getplaytypeid(type1, type2) {
    var playtypeid = "";
    if (type1 == 1)//直选
    {
        if (type2 == 1) {
            playtypeid = "101";
        }
        else if (type2 == 2) {
            playtypeid = "102";
        }
        else if (type2 == 3) {
            playtypeid = "103";
        }
        else if (type2 == 4) {
            playtypeid = "104";
        }
        else if (type2 == 5) {
            playtypeid = "105";
        }
        else if (type2 == 6) {
            playtypeid = "106";
        }
        else if (type2 == 7) {
            playtypeid = "107";
        }
        else if (type2 == 8) {
            playtypeid = "108";
        }
    }
    else if (type1 == 2)//单式
    {
        if (type2 == 1) {
            playtypeid = "201";
        }
        else if (type2 == 2) {
            playtypeid = "202";
        }
        else if (type2 == 3) {
            playtypeid = "203";
        }
        else if (type2 == 4) {
            playtypeid = "204";
        }
        else if (type2 == 5) {
            playtypeid = "205";
        }
        else if (type2 == 6) {
            playtypeid = "206";
        }
        else if (type2 == 7) {
            playtypeid = "207";
        }
        else if (type2 == 8) {
            playtypeid = "208";
        }
    }
    else if (type1 == 3) {
        if (type2 == 2) {
            playtypeid = "302";
        }
        else if (type2 == 3) {
            playtypeid = "303";
        }
        else if (type2 == 4) {
            playtypeid = "304";
        }
        else if (type2 == 5) {
            playtypeid = "305";
        }
        else if (type2 == 6) {
            playtypeid = "306";
        }
        else if (type2 == 7) {
            playtypeid = "307";
        }
        else if (type2 == 8) {
            playtypeid = "308";
        }
    }
    else if (type1 == 4)//前三投注
    {
        if (type2 == 9) {
            playtypeid = "401";
        }
        else if (type2 == 10) {
            playtypeid = "402";
        }
        else if (type2 == 11) {
            playtypeid = "403";
        }
        else if (type2 == 12) {
            playtypeid = "404";
        }
        else if (type2 == 13) {
            playtypeid = "405";
        }
    }
    else if (type1 == 5)//前二投注
    {
        if (type2 == 14) {
            playtypeid = "501";
        }
        else if (type2 == 15) {
            playtypeid = "502";
        }
        else if (type2 == 16) {
            playtypeid = "503";
        }
        else if (type2 == 17) {
            playtypeid = "504";
        }
    }

    return playtypeid;
}



//组合个数
function fwmathC(n, m) {
    var n1 = 1, n2 = 1;
    for (var i = n, j = 1; j <= m; n1 *= i--, n2 *= j++);
    return n1 / n2;
}

//通过玩法ID得到玩法名
function getpalynamebyid(id) {
    var palyname = "";
    if (id == "101") {
        palyname = "选一复式";
    }
    else if (id == "102") {
        palyname = "选二复式";
    }
    else if (id == "103") {
        palyname = "选三复式";
    }
    else if (id == "104") {
        palyname = "选四复式";
    }
    else if (id == "105") {
        palyname = "选五复式";
    }
    else if (id == "106") {
        palyname = "选六复式";
    }
    else if (id == "107") {
        palyname = "选七复式";
    }
    else if (id == "108") {
        palyname = "选八复式";
    }
    else if (id == "201") {
        palyname = "选一单式";
    }
    else if (id == "202") {
        palyname = "选二单式";
    }
    else if (id == "203") {
        palyname = "选三单式";
    }
    else if (id == "204") {
        palyname = "选四单式";
    }
    else if (id == "205") {
        palyname = "选五单式";
    }
    else if (id == "206") {
        palyname = "选六单式";
    }
    else if (id == "207") {
        palyname = "选七单式";
    }
    else if (id == "208") {
        palyname = "选八单式";
    }
    else if (id == "301") {
        palyname = "选一胆托";
    }
    else if (id == "302") {
        palyname = "选二胆拖";
    }
    else if (id == "303") {
        palyname = "选三胆拖";
    }
    else if (id == "304") {
        palyname = "选四胆拖";
    }
    else if (id == "305") {
        palyname = "选五胆拖";
    }
    else if (id == "306") {
        palyname = "选六胆拖";
    }
    else if (id == "307") {
        palyname = "选七胆拖";
    }
    else if (id == "308") {
        palyname = "选八胆拖";
    }
    else if (id == "401") {
        palyname = "前三直选";
    }
    else if (id == "402") {
        palyname = "前三胆拖";
    }
    else if (id == "403") {
        palyname = "前三单式";
    }
    else if (id == "405") {
        palyname = "前三组选";
    }
    else if (id == "406") {
        palyname = "前三组选单式";
    }
    else if (id == "501") {
        palyname = "前二直选";
    }
    else if (id == "502") {
        palyname = "前二单式";
    }
    else if (id == "503") {
        palyname = "前二组选";
    }
    else if (id == "504") {
        palyname = "前二组选单式";
    }
    return palyname;
}

//向投注框里添加一行号码
function add_line(value, text, type1, type2) {
    $("select#codesshow").append("<option value='" + value + "|" + type1 + "|" + type2 + "'>" + text + "</option>");
}

//统计投注框里的号码注数
function count_allzhushu() {
    zhushu = 0;
    $("select#codesshow > option").each(function() {
        var value = $(this).val();
        var valueArr = value.split("|");
        var code = valueArr[0];
        var type1 = Number(valueArr[1]);
        var type2 = Number(valueArr[2]);
        var num = getzhushu_single(code, type1, type2)
        if (num == 0) {
            return false;
        }
        else {
            zhushu += num;
        }
    });
}

//统计选择的期号数、每期投注金额、总金额并显示
function show_money() {
    var singlezhushu = zhushu;
    $("#zhushushow2").text(singlezhushu)
    $("#moneyshow2").text(singlezhushu * 2)


    var expectlistsuc1 = $("#expectlistsuc1").val();
    var expectlistsuc2 = $("#expectlistsuc2").val();
    var expectlistsuc3 = $("#expectlistsuc3").val();
    var beishulistsuc1 = $("#beishulistsuc1").val();
    var beishulistsuc2 = $("#beishulistsuc2").val();
    var beishulistsuc3 = $("#beishulistsuc3").val();

    var expectlistsuc = JoinExpect(expectlistsuc1, expectlistsuc2, expectlistsuc3);
    var beishulistsuc = JoinBeishu(beishulistsuc1, beishulistsuc2, beishulistsuc3);

    //alert(beishulistsuc);
    var expectlistsucArr = expectlistsuc.split(",");
    var beishulistsucArr = beishulistsuc.split(",");

    var expectnum = 0;
    var allmoney = 0;
    if (expectlistsuc.length > 0) {
        expectnum = expectlistsucArr.length;
    }

    $("#TzList > table > tbody > tr > td > input[name=beishu_show]").each(function() {
        var value = Number($(this).val());
        $(this).next().text(value * singlezhushu * 2)
    });
    for (var i = 0; i < expectlistsucArr.length; i++) {
        var expectmoney = beishulistsucArr[i] * 2 * singlezhushu;
        allmoney = allmoney + expectmoney;
    }
    $("#expectnumshow").text(expectnum)
    $("#moneyshow3").text(allmoney)

    if (expectnum > 1) {
        $("#IsZhuihao").attr("checked", true);
    }
    else {
        $("#IsZhuihao").attr("checked", false);
    }
    $("#batchexpectsel").val(expectnum);
    SetIsStop();
}

//清除用户选择的号码
function clear_selectedball() {
    $("td.ball_r").removeClass(SelectBallClassName);
	$("#temp_select_zhushu").text(0);
	$("#temp_select_money").text(0);
}

//机选N注号码
function select_jxmuti(num) {
    var IsEXZXFS2DS = false;
    var linecounts = getlinecounts(xxtype, tztype);

    var playtypename = getplaytypename();
    for (var i = 1; i <= num; i++) {
        var codes = select_jxsingle(linecounts, IsEXZXFS2DS);
        var value = codes;
        var text = "[" + playtypename + "]" + codes;
        add_line(value, text, xxtype, tztype);
    }
    count_allzhushu();
    show_money();
}

//机选一注号码
function select_jxsingle(linenum, IsEXZXFS2DS) {
    //var linecounts=getlinecounts(xxtype,tztype);
    var codeArr = new Array();
    var code;
    var jxmax;
    jxmax = 11;

    if (tztype == 1)//选一单式
    {
        codeArr[0] = getRndNum(1, jxmax);
        if (codeArr[0] < 10) { codeArr[0] = "0" + codeArr[0] }
        code = codeArr.sort().join(",");
    }
    if (tztype == 2 || tztype == 15 || tztype == 17)//选二单式
    {
        codeArr[0] = getRndNum(1, jxmax);
        codeArr[1] = getRndNum(1, jxmax);
        while (codeArr[0] == codeArr[1]) {
            codeArr[0] = getRndNum(1, jxmax);
            codeArr[1] = getRndNum(1, jxmax);
        }
        if (codeArr[0] < 10) { codeArr[0] = "0" + codeArr[0] }
        if (codeArr[1] < 10) { codeArr[1] = "0" + codeArr[1] }
        code = codeArr.sort().join(",");
    }
    if (tztype == 3 || tztype == 11 || tztype == 13)//选三单式
    {
        codeArr[0] = getRndNum(1, jxmax);
        codeArr[1] = getRndNum(1, jxmax);
        codeArr[2] = getRndNum(1, jxmax);
        while ((codeArr[0] == codeArr[1]) || (codeArr[1] == codeArr[2]) || (codeArr[0] == codeArr[2])) {
            codeArr[0] = getRndNum(1, jxmax);
            codeArr[1] = getRndNum(1, jxmax);
            codeArr[2] = getRndNum(1, jxmax);
        }
        if (codeArr[0] < 10) { codeArr[0] = "0" + codeArr[0] }
        if (codeArr[1] < 10) { codeArr[1] = "0" + codeArr[1] }
        if (codeArr[2] < 10) { codeArr[2] = "0" + codeArr[2] }
        code = codeArr.sort().join(",");
    }
    if (tztype == 4)//选四单式
    {
        codeArr[0] = getRndNum(1, jxmax);
        codeArr[1] = getRndNum(1, jxmax);
        codeArr[2] = getRndNum(1, jxmax);
        codeArr[3] = getRndNum(1, jxmax);
        while ((codeArr[0] == codeArr[1]) || (codeArr[0] == codeArr[2]) || (codeArr[0] == codeArr[3]) || (codeArr[1] == codeArr[2]) || (codeArr[1] == codeArr[3]) || (codeArr[2] == codeArr[3])) {
            codeArr[0] = getRndNum(1, jxmax);
            codeArr[1] = getRndNum(1, jxmax);
            codeArr[2] = getRndNum(1, jxmax);
            codeArr[3] = getRndNum(1, jxmax);
        }
        if (codeArr[0] < 10) { codeArr[0] = "0" + codeArr[0] }
        if (codeArr[1] < 10) { codeArr[1] = "0" + codeArr[1] }
        if (codeArr[2] < 10) { codeArr[2] = "0" + codeArr[2] }
        if (codeArr[3] < 10) { codeArr[3] = "0" + codeArr[3] }
        code = codeArr.sort().join(",");
    }
    if (tztype == 5)//选五单式
    {
        codeArr[0] = getRndNum(1, jxmax);
        codeArr[1] = getRndNum(1, jxmax);
        codeArr[2] = getRndNum(1, jxmax);
        codeArr[3] = getRndNum(1, jxmax);
        codeArr[4] = getRndNum(1, jxmax);
        while ((codeArr[0] == codeArr[1]) || (codeArr[0] == codeArr[2]) || (codeArr[0] == codeArr[3]) || (codeArr[0] == codeArr[4]) || (codeArr[1] == codeArr[2]) || (codeArr[1] == codeArr[3]) || (codeArr[1] == codeArr[4]) || (codeArr[2] == codeArr[3]) || (codeArr[2] == codeArr[4]) || (codeArr[3] == codeArr[4])) {
            codeArr[0] = getRndNum(1, jxmax);
            codeArr[1] = getRndNum(1, jxmax);
            codeArr[2] = getRndNum(1, jxmax);
            codeArr[3] = getRndNum(1, jxmax);
            codeArr[4] = getRndNum(1, jxmax);
        }
        if (codeArr[0] < 10) { codeArr[0] = "0" + codeArr[0] }
        if (codeArr[1] < 10) { codeArr[1] = "0" + codeArr[1] }
        if (codeArr[2] < 10) { codeArr[2] = "0" + codeArr[2] }
        if (codeArr[3] < 10) { codeArr[3] = "0" + codeArr[3] }
        if (codeArr[4] < 10) { codeArr[4] = "0" + codeArr[4] }
        code = codeArr.sort().join(",");
    }
    if (tztype == 6)//选六单式
    {
        codeArr[0] = getRndNum(1, jxmax);
        codeArr[1] = getRndNum(1, jxmax);
        codeArr[2] = getRndNum(1, jxmax);
        codeArr[3] = getRndNum(1, jxmax);
        codeArr[4] = getRndNum(1, jxmax);
        codeArr[5] = getRndNum(1, jxmax);
        while ((codeArr[0] == codeArr[1]) || (codeArr[0] == codeArr[2]) || (codeArr[0] == codeArr[3]) || (codeArr[0] == codeArr[4]) || (codeArr[0] == codeArr[5]) || (codeArr[1] == codeArr[2]) || (codeArr[1] == codeArr[3]) || (codeArr[1] == codeArr[4]) || (codeArr[1] == codeArr[5]) || (codeArr[2] == codeArr[3]) || (codeArr[2] == codeArr[4]) || (codeArr[2] == codeArr[5]) || (codeArr[3] == codeArr[4]) || (codeArr[3] == codeArr[5]) || (codeArr[4] == codeArr[5])) {
            codeArr[0] = getRndNum(1, jxmax);
            codeArr[1] = getRndNum(1, jxmax);
            codeArr[2] = getRndNum(1, jxmax);
            codeArr[3] = getRndNum(1, jxmax);
            codeArr[4] = getRndNum(1, jxmax);
            codeArr[5] = getRndNum(1, jxmax);
        }
        if (codeArr[0] < 10) { codeArr[0] = "0" + codeArr[0] }
        if (codeArr[1] < 10) { codeArr[1] = "0" + codeArr[1] }
        if (codeArr[2] < 10) { codeArr[2] = "0" + codeArr[2] }
        if (codeArr[3] < 10) { codeArr[3] = "0" + codeArr[3] }
        if (codeArr[4] < 10) { codeArr[4] = "0" + codeArr[4] }
        if (codeArr[5] < 10) { codeArr[5] = "0" + codeArr[5] }
        code = codeArr.sort().join(",");
    }

    if (tztype == 7)//选七单式
    {
        codeArr[0] = getRndNum(1, jxmax);
        codeArr[1] = getRndNum(1, jxmax);
        codeArr[2] = getRndNum(1, jxmax);
        codeArr[3] = getRndNum(1, jxmax);
        codeArr[4] = getRndNum(1, jxmax);
        codeArr[5] = getRndNum(1, jxmax);
        codeArr[6] = getRndNum(1, jxmax);
        while ((codeArr[0] == codeArr[1]) || (codeArr[0] == codeArr[2]) || (codeArr[0] == codeArr[3]) || (codeArr[0] == codeArr[4]) || (codeArr[0] == codeArr[5]) || (codeArr[0] == codeArr[6]) || (codeArr[1] == codeArr[2]) || (codeArr[1] == codeArr[3]) || (codeArr[1] == codeArr[4]) || (codeArr[1] == codeArr[5]) || (codeArr[1] == codeArr[6]) || (codeArr[2] == codeArr[3]) || (codeArr[2] == codeArr[4]) || (codeArr[2] == codeArr[5]) || (codeArr[2] == codeArr[6]) || (codeArr[3] == codeArr[4]) || (codeArr[3] == codeArr[5]) || (codeArr[3] == codeArr[6]) || (codeArr[4] == codeArr[5]) || (codeArr[4] == codeArr[6]) || (codeArr[5] == codeArr[6])) {
            codeArr[0] = getRndNum(1, jxmax);
            codeArr[1] = getRndNum(1, jxmax);
            codeArr[2] = getRndNum(1, jxmax);
            codeArr[3] = getRndNum(1, jxmax);
            codeArr[4] = getRndNum(1, jxmax);
            codeArr[5] = getRndNum(1, jxmax);
            codeArr[6] = getRndNum(1, jxmax);
        }
        if (codeArr[0] < 10) { codeArr[0] = "0" + codeArr[0] }
        if (codeArr[1] < 10) { codeArr[1] = "0" + codeArr[1] }
        if (codeArr[2] < 10) { codeArr[2] = "0" + codeArr[2] }
        if (codeArr[3] < 10) { codeArr[3] = "0" + codeArr[3] }
        if (codeArr[4] < 10) { codeArr[4] = "0" + codeArr[4] }
        if (codeArr[5] < 10) { codeArr[5] = "0" + codeArr[5] }
        if (codeArr[6] < 10) { codeArr[6] = "0" + codeArr[6] }
        code = codeArr.sort().join(",");
    }

    if (tztype == 8)//选八单式
    {
        codeArr[0] = getRndNum(1, jxmax);
        codeArr[1] = getRndNum(1, jxmax);
        codeArr[2] = getRndNum(1, jxmax);
        codeArr[3] = getRndNum(1, jxmax);
        codeArr[4] = getRndNum(1, jxmax);
        codeArr[5] = getRndNum(1, jxmax);
        codeArr[6] = getRndNum(1, jxmax);
        codeArr[7] = getRndNum(1, jxmax);
        while ((codeArr[0] == codeArr[1]) || (codeArr[0] == codeArr[2]) || (codeArr[0] == codeArr[3]) || (codeArr[0] == codeArr[4]) || (codeArr[0] == codeArr[5]) || (codeArr[0] == codeArr[6]) || (codeArr[0] == codeArr[7]) || (codeArr[1] == codeArr[2]) || (codeArr[1] == codeArr[3]) || (codeArr[1] == codeArr[4]) || (codeArr[1] == codeArr[5]) || (codeArr[1] == codeArr[6]) || (codeArr[1] == codeArr[7]) || (codeArr[2] == codeArr[3]) || (codeArr[2] == codeArr[4]) || (codeArr[2] == codeArr[5]) || (codeArr[2] == codeArr[6]) || (codeArr[2] == codeArr[7]) || (codeArr[3] == codeArr[4]) || (codeArr[3] == codeArr[5]) || (codeArr[3] == codeArr[6]) || (codeArr[3] == codeArr[7]) || (codeArr[4] == codeArr[5]) || (codeArr[4] == codeArr[6]) || (codeArr[4] == codeArr[7]) || (codeArr[5] == codeArr[6]) || (codeArr[5] == codeArr[7]) || (codeArr[6] == codeArr[7])) {
            codeArr[0] = getRndNum(1, jxmax);
            codeArr[1] = getRndNum(1, jxmax);
            codeArr[2] = getRndNum(1, jxmax);
            codeArr[3] = getRndNum(1, jxmax);
            codeArr[4] = getRndNum(1, jxmax);
            codeArr[5] = getRndNum(1, jxmax);
            codeArr[6] = getRndNum(1, jxmax);
            codeArr[7] = getRndNum(1, jxmax);
        }
        if (codeArr[0] < 10) { codeArr[0] = "0" + codeArr[0] }
        if (codeArr[1] < 10) { codeArr[1] = "0" + codeArr[1] }
        if (codeArr[2] < 10) { codeArr[2] = "0" + codeArr[2] }
        if (codeArr[3] < 10) { codeArr[3] = "0" + codeArr[3] }
        if (codeArr[4] < 10) { codeArr[4] = "0" + codeArr[4] }
        if (codeArr[5] < 10) { codeArr[5] = "0" + codeArr[5] }
        if (codeArr[6] < 10) { codeArr[6] = "0" + codeArr[6] }
        if (codeArr[7] < 10) { codeArr[7] = "0" + codeArr[7] }
        code = codeArr.sort().join(",");
    }


    return code;
}
//生成一个min到max的随机整数
function getRndNum(min, max) {
    return Math.round((max - min) * Math.random() + min);
}

//获取列表中的投注号码
function get_codeshow() {
    var codes = "";
    $("#codesshow > option").each(function() {
        var valueArr = $(this).val().split("|");
        var code = valueArr[0];
        var type1 = Number(valueArr[1]);
        var type2 = Number(valueArr[2]);
        var playtypeid = getplaytypeid(type1, type2);
        codes = codes + "[" + playtypeid + "]" + code + "$"
    });
    codes = codes.substr(0, codes.length - 1);
    return codes;
}


//验证提交数据是否合法
function checkData(checkType) {
    var codes = get_codeshow();
    if (codes == "") {
        alert("您还没有选择号码");
        return;
    }
    if ((codes.length - codes.replace(/\$/g, "").length) > 600) {
        alert("投注内容不能超过600行");
        return;
    }
    if (Number(zhushu) <= 0) {
        alert("您选择的号码不正确");
        return;
    }
    if ($("input[name=confirmxy]").attr("checked") == false) {
        alert("同意《用户合买代购协议》才能投注");
        return;
    }

    var FirstPlayStr = codes.substring(0, 5).replace("[", "\\[");
    var re = new RegExp(FirstPlayStr, "g")
    var codeArr = codes.split("$");
    var playname = "";
    var cs = codes.replace(re, "")

    if (codes.length - cs.length < codeArr.length * 5) {
        playname = "混投";
    }
    else {
        playname = getpalynamebyid(codes.substring(1, 4));
    }

    var expectlistsuc1 = $("#expectlistsuc1").val();
    var expectlistsuc2 = $("#expectlistsuc2").val();
    var expectlistsuc3 = $("#expectlistsuc3").val();
    var beishulistsuc1 = $("#beishulistsuc1").val();
    var beishulistsuc2 = $("#beishulistsuc2").val();
    var beishulistsuc3 = $("#beishulistsuc3").val();

    var expectlistsuc = JoinExpect(expectlistsuc1, expectlistsuc2, expectlistsuc3);
    var beishulistsuc = JoinBeishu(beishulistsuc1, beishulistsuc2, beishulistsuc3);
    //alert(expectlistsuc+"|"+beishulistsuc);
    if (expectlistsuc == "" || beishulistsuc == "") {
        alert("请选择您要投注的期号");
        return;
    }
    var allmoney = $("#moneyshow3").text();
    var expectnum = $("#expectnumshow").text();
    var lotteryTypeId = $('#lotteryTypeId').text();
	var phase = $('#phase').text();
	
    if (confirm("请确认您的投注信息\n\r\n\r玩法：" + playname + "\n\r期数：共" + expectnum + "期\n\r金额：" + allmoney + "元")) {
        $("#btn_SubmitZ,#btn_SubmitHM,#btn_SubmitPath").attr("disabled", true)
        var ZjCut = 0;
        if ($("#ZjStop").attr("checked")) {
            ZjCut = 1;
        }
        if (checkType == "zg") {
            $.ajax({
                type: "POST",
                url: "bet/buy",
                dataType : "json",
                data: {
                    allmoney: allmoney,
                    // buyExpect: buyExpect,
                    codes: codes,
                    expectlistsuc: expectlistsuc,
                    beishulistsuc: beishulistsuc,
                    ZjCut: ZjCut,
					lotteryTypeId:lotteryTypeId,
					phase:phase,
					t : Math.random()
                },
                success: function(data) {
					try {
						data = eval(data);
					} catch (e) {
						alert('会话超时，请重新登陆');
						window.location = '';
					}
					if (data && data.statusCode && data.statusCode == 200) {
						
	                    //清空
                        zhushu = 0; //注数清0
                        clear_expectbeishu(); //清空倍数期号
                        $("#codesshow > option").remove(); //投注内容清空
                        FirstLoadTouzhuExpect = true;
                        SelectTouzhuExpectType(1);
                        $("#selectallbieshu").val(1);
                        $("#set_beishu").val(1);
						$("#btn_SubmitZ,#btn_SubmitHM,#btn_SubmitPath").attr("disabled",false);
						
						if(confirm("投注成功！\n是否立即查看投注记录？")) {
							window.open("betDetail?betId=" + data.message, "_blank");
						}
					}
                	/*
                	if (data == '') {
                        //window.frames["login"].location.reload();
                        //清空
                        zhushu = 0; //注数清0
                        clear_expectbeishu(); //清空倍数期号
                        $("#codesshow > option").remove(); //投注内容清空
                        FirstLoadTouzhuExpect = true;
                        SelectTouzhuExpectType(1);
                        $("#selectallbieshu").val(1);
                        $("#set_beishu").val(1);
                        $("#btn_SubmitZ,#btn_SubmitHM,#btn_SubmitPath").attr("disabled", false);
                        alert("发起成功");
                	} else {
                		alert('会话超时，请重新登陆');
						window.location = '';
                	}
                	*/
                },
                error:function(XMLHttpRequest, textStatus, errorThrown) {
                	var s = XMLHttpRequest.responseText;
                	if (s == '') {
						window.location = '';
					}
					var errorJson = JSON.parse(s);
					if (errorJson.message == "用户可用余额不足") {
						window.location = "myAccount?type=pay";
					}
					$("#btn_SubmitZ,#btn_SubmitHM,#btn_SubmitPath").attr("disabled",false);
					s = eval("(" + s + ")");
					alert(s.message);
				}
            });
        }
        else {
        	var _data = {
					allmoney:allmoney,
					codes:codes,
					expectlistsuc:expectlistsuc, // 注意，这里为了测试，先写死了
					beishulistsuc:beishulistsuc,
					ZjCut:ZjCut,
					lotteryTypeId:lotteryTypeId,
					phase:phase,
					t : Math.random()
				}
			
			buyTogetherSubmit(_data);
        }
    }

}

function buyTogetherSubmit(data) {
	var form = '<form action="bet/buyTogetherStep1" method="post" id="tmpForm">';
	
	for (var name in data) {
	var val = eval('data.' + name);
	form += '<input type="text" name="' + name + '" value="' + val + '">';
	}
	form += '</form>';
	$('body').append(form);
	$('#tmpForm').submit();
	
};

/*计划倍投*/
function checkplan() {

    var codes = get_codeshow();
    if (codes == "") {
        alert("您还没有选择号码");
        return;
    }
    if ((codes.length - codes.replace(/\$/g, "").length) > 600) {
        alert("投注内容不能超过600行");
        return;
    }
    if (Number(zhushu) <= 0) {
        alert("您选择的号码不正确");
        return;
    }
    if ($("input[name=confirmxy]").attr("checked") == false) {
        alert("同意《用户合买代购协议》才能投注");
        return;
    }
    var FirstPlayStr = codes.substring(0, 5).replace("[", "\\[");
    var re = new RegExp(FirstPlayStr, "g")
    var codeArr = codes.split("$");
    var playname = "";
    var cs = codes.replace(re, "")

    if (codes.length - cs.length < codeArr.length * 5) {
        alert("混投,不能计划倍投!");
        return;
    }


    //取方案类别
    var valuenew = $("#codesshow > option:first-child").val();
    var valueArrnew = valuenew.split("|");
    var type1 = valueArrnew[1];
    var type2 = valueArrnew[2];
    var playtypeid = getplaytypeid(Number(type1), Number(type2));

    // 方案注数
    var zhushunum = $("#zhushushow2").text();
    var buyExpect = $("#buyExpectShow").text();
    $("#zhushunum").val(zhushunum)
    $("#codes").val(codes);
    $("#buyExpect").val(buyExpect);
    $("#playtypeid").val(playtypeid);
    $("#formh8").attr("action", "Project.asp");
    $("#formh8").submit();

}




// date 可以是时间对象也可以是字符串，如果是后者，形式必须为: yyyy-mm-dd hh:mm:ss 其中分隔符不定。"2006年12月29日 16点01分23秒" 也是合法的
function DateAdd(interval, number, date) {
    number = parseInt(number);
    if (typeof (date) == "string") {
        date = date.split(/\D/);
        --date[1];
        eval("var date = new Date(" + date.join(",") + ")");
    }
    if (typeof (date) == "object") {
        var date = date
    }
    switch (interval) {
        case "y": date.setFullYear(date.getFullYear() + number); break;
        case "m": date.setMonth(date.getMonth() + number); break;
        case "d": date.setDate(date.getDate() + number); break;
        case "w": date.setDate(date.getDate() + 7 * number); break;
        case "h": date.setHours(date.getHour() + number); break;
        case "n": date.setMinutes(date.getMinutes() + number); break;
        case "s": date.setSeconds(date.getSeconds() + number); break;
        case "l": date.setMilliseconds(date.getMilliseconds() + number); break;
    }
    return date;
}

//日期转化为字符串格式： yyyy-mm-dd
function DateToStr(dt) {
    var str = "";
    if (dt.getFullYear) {
        var y, m, d;
        y = dt.getFullYear();
        m = dt.getMonth() + 1;  //1-12
        if (m < 10) {
            m = "0" + m.toString();
        }

        d = dt.getDate();
        if (d < 10) {
            d = "0" + d.toString();
        }
        str = "" + y + "-" + m + "-" + d;
    }
    return str;
}

//时间转化为字符串格式： yyyy-mm-dd hh:nn
function TimeToStr(dt) {
    var str = "";
    if (dt.getFullYear) {
        var y, m, d;
        y = dt.getFullYear();
        m = dt.getMonth() + 1;  //1-12
        //alert(m);
        if (m < 10) {
            m = "0" + m.toString();
        }

        d = dt.getDate();
        if (d < 10) {
            d = "0" + d.toString();
        }
        h = dt.getHours();
        if (h < 10) {
            h = "0" + h.toString();
        }
        n = dt.getMinutes();
        if (n < 10) {
            n = "0" + n.toString();
        }
        str = "" + y + "-" + m + "-" + d + " " + h + ":" + n;
    }
    return str;
}
//控制倍数输入框
function control_beishu(obj, isshowmoney) {

    var tr = $(obj).parent().parent()
    var beishu_show = $(tr).find("input[name=beishu_show]");
    $(beishu_show).attr("disabled", $(obj).attr("checked") ? false : true);
    var topbeishu;
    if (FirstLoadTouzhuExpect) {
        topbeishu = 1;
    }
    else {
        topbeishu = isshowmoney;
    }
    if ($(obj).attr("checked")) {
        $(beishu_show).val(topbeishu)
    }
    else {
        $("#selectallexpect").attr("checked", false);
        $(beishu_show).val(0);
    }
}

//设置倍数和期号
function SetTozhuExpect() {
    var TouzhuExpectType = Number($("#TouzhuExpectType").val());
    if (TouzhuExpectType == 1 && FirstLoadTouzhuExpect) {
        var checkbeishu = $("#tbshowtozhuexpect > tbody > tr > td > input[name=checkbeishu]").first();
        $(checkbeishu).attr("checked", true);
        control_beishu(checkbeishu, 1);
        JoinExpectBeishu();
        FirstLoadTouzhuExpect = false;
    }
    var expectlistsuc = "";
    var beishulistsuc = "";
    if (TouzhuExpectType == 1) {
        expectlistsuc = $("#expectlistsuc1").val();
        beishulistsuc = $("#beishulistsuc1").val();
    }
    else if (TouzhuExpectType == 2) {
        expectlistsuc = $("#expectlistsuc2").val();
        beishulistsuc = $("#beishulistsuc2").val();
    }
    else if (TouzhuExpectType == 3) {
        expectlistsuc = $("#expectlistsuc3").val();
        beishulistsuc = $("#beishulistsuc3").val();
    }
    var expectlistsucArr = expectlistsuc.split(",");

    var beishulistsucArr = beishulistsuc.split(",");
    for (var i = 0; i < expectlistsucArr.length; i++) {
        if ($("#tbshowtozhuexpect > tbody > tr > td > input[name='expect_hidden'][value='" + expectlistsucArr[i] + "']").length > 0) {
            var tr = $("#tbshowtozhuexpect > tbody > tr > td > input[name='expect_hidden'][value='" + expectlistsucArr[i] + "']").parent().parent()
            var checkbeishu = $(tr).eq(0).find("input[name='checkbeishu']").attr("checked", true);
            control_beishu(checkbeishu, Number(beishulistsucArr[i]));
        }
    }
    JoinExpectBeishu();
    show_money();
}


//取期号倍数
function JoinExpectBeishu() {
    var BeishuExpectListSuc = GetBeishuExpectListSuc();
    var ArrBeishuExpectListSuc = BeishuExpectListSuc.split("|");
    var expectlistsuc = ArrBeishuExpectListSuc[0];
    var beishulistsuc = ArrBeishuExpectListSuc[1];
    var TouzhuExpectType = Number($("#TouzhuExpectType").val());
    if (TouzhuExpectType == 1) {
        $("#expectlistsuc1").val(expectlistsuc);
        $("#beishulistsuc1").val(beishulistsuc);
    }
    else if (TouzhuExpectType == 2) {
        $("#expectlistsuc2").val(expectlistsuc);
        $("#beishulistsuc2").val(beishulistsuc);
    }
    else if (TouzhuExpectType == 3) {
        $("#expectlistsuc3").val(expectlistsuc);
        $("#beishulistsuc3").val(beishulistsuc);
    }
    //alert(middle.document.all("beishulistsuc1").value);
}

//获取已经投注了的期号和对应倍数
function GetBeishuExpectListSuc() {
    var beishulistsuc = "";
    var expectlistsuc = "";
    $("#tbshowtozhuexpect > tbody > tr > td > input[name=beishu_show]").each(function() {
        var value = $(this).val();
        if (Number(value) > 0) {
            beishulistsuc += value + ",";
            expectlistsuc += $(this).parent().find("input[name=expect_hidden]").val() + ",";
        }
    });
    beishulistsuc = beishulistsuc.substring(0, beishulistsuc.length - 1);
    expectlistsuc = expectlistsuc.substring(0, expectlistsuc.length - 1);
    return expectlistsuc + "|" + beishulistsuc;
}

//根据是否追号设置中奖后是否停止追号
function SetIsStop() {
    if ($("#IsZhuihao").attr("checked")) {
        $("#ZjStop").attr("checked", CustomIsSetNotStop);
        $("#ZjStop").attr("disabled", false)
    }
    else {
        $("#ZjStop").attr("checked", false)
        $("#ZjStop").attr("disabled", true)
    }
}

function JoinExpect(expectlistsuc1, expectlistsuc2, expectlistsuc3) {
    var expectlistsuc = "";
    if (expectlistsuc1.length > 0) {
        expectlistsuc = expectlistsuc1;
    }
    if (expectlistsuc2.length > 0) {
        if (expectlistsuc.length > 0) {
            expectlistsuc = expectlistsuc + ",";
        }
        expectlistsuc = expectlistsuc + expectlistsuc2;
    }
    if (expectlistsuc3.length > 0) {
        if (expectlistsuc.length > 0) {
            expectlistsuc = expectlistsuc + ",";
        }
        expectlistsuc = expectlistsuc + expectlistsuc3;
    }
    return expectlistsuc;
}

function JoinBeishu(beishulistsuc1, beishulistsuc2, beishulistsuc3) {
    var beishulistsuc = "";
    if (beishulistsuc1.length > 0) {
        beishulistsuc = beishulistsuc1;
    }
    if (beishulistsuc2.length > 0) {
        if (beishulistsuc.length > 0) {
            beishulistsuc = beishulistsuc + ",";
        }
        beishulistsuc = beishulistsuc + beishulistsuc2;
    }
    if (beishulistsuc3.length > 0) {
        if (beishulistsuc.length > 0) {
            beishulistsuc = beishulistsuc + ",";
        }
        beishulistsuc = beishulistsuc + beishulistsuc3;
    }
    return beishulistsuc;
}

function clear_expectbeishu() {
    $("#expectlistsuc1").val("");
    $("#beishulistsuc1").val("");
    $("#expectlistsuc2").val("");
    $("#beishulistsuc2").val("");
    $("#expectlistsuc3").val("");
    $("#beishulistsuc3").val("");
}