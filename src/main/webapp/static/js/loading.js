
/*加载系统信息*/
function GetSysSet(){/*
	IsGetSysSet = false;
	$.ajax({
		type: "POST",
		url: "XML/AjaxXml.asp",
		data: {
			action:"getsysset"
		},
		dataType:"xml",
		success: function(data){
			var err = $(data).find("err");
			if($(err).attr("type")=="1")
			{
				var row = $(data).find("row");
				issale = Number($(row).attr("issale"));
				fasecond = Number($(row).attr("fasecond"));
				IsGetSysSet = true;
				
			}
			else
			{
				if($(err).attr("msg").length>0)
				{
					alert($(err).attr("msg"));
				}
				if($(err).attr("url").length>0)
				{
					location.href = $(err).attr("url");
				}
			}
		}
	});
*/}
/*取服务器时间*/
function GetTimeComparetoServer()
{/*
	IsGetLocalSubServerSecond = false;
	$.ajax({
		type: "POST",
		url: "XML/AjaxXml.asp",
		data: {
			action:"gettimecomparetoserver"
		},
		dataType:"xml",
		success: function(data){
			var err = $(data).find("err");
			if($(err).attr("type")=="1")
			{
				var row = $(data).find("row");
				ServerTime = $(row).attr("servertime");
				var date = new Date();
				LocalSubServerSecond = Math.round((Date.parse(date)-Date.parse(ServerTime.replace(/-/g,"/")))/1000);
				LocalSubServerSecond = LocalSubServerSecond-1;
				IsGetLocalSubServerSecond = true;
				GetActiveExpectInfo();
			}
			else
			{
				if($(err).attr("msg").length>0)
				{
					alert($(err).attr("msg"));
				}
				if($(err).attr("url").length>0)
				{
					location.href = $(err).attr("url");
				}
			}
		}
	});
*/}

/*取当前期信息*/
function GetActiveExpectInfo(){/*
	IsGetActiveExpectInfo = false;
	$.ajax({
		type: "POST",
		url: "XML/AjaxXml.asp",
		data: {
			action:"getactiveexpectinfo"
		},
		dataType:"xml",
		success: function(data){
			var err = $(data).find("err");
			if($(err).attr("type")=="1")
			{
				$(data).find("row").each(function(index){
					var dgendtime = $(this).attr("endtime");
					var date = Date.parse(ServerTime.replace(/-/g,"/"));
					var EndOverSecond = Math.round((date-Date.parse(dgendtime.replace(/-/g,"/")))/1000)+parseInt(fasecond);
					if(EndOverSecond<0)
					{
						ActiveExpect = $(this).attr("expect");
						ActiveExpectDgendtime = $(this).attr("endtime");
						return false;
					}
				})
				IsGetActiveExpectInfo = true;
			}
			else
			{
				if($(err).attr("msg").length>0)
				{
					alert($(err).attr("msg"));
				}
				if($(err).attr("url").length>0)
				{
					location.href = $(err).attr("url");
				}
			}
		}
	});
*/}

/*显示遗漏统计*/
function GetOmitted(){/*
	$.ajax({
		type: "POST",
		url: "XML/AjaxXml.asp",
		data: {
			action:"getomitted"
		},
		dataType:"xml",
		success: function(data){
			var err = $(data).find("err");
			if($(err).attr("type")=="1")
			{
				if ($(data).find("row").length > 0)
				{
					$(data).find("row").each(function(index){
						var Omitted = Number($(this).attr("Omitted"))
						if (Omitted<20)
						{
							$("td.yl_1").eq(index).html($(this).attr("Omitted"))
						}
						else
						{
							$("td.yl_1").eq(index).html("<font color='red'>"+$(this).attr("Omitted")+"</font>")
						}
					})
				}
			}
			else
			{
				if($(err).attr("msg").length>0)
				{
					alert($(err).attr("msg"));
				}
				if($(err).attr("url").length>0)
				{
					location.href = $(err).attr("url");
				}
			}
		}
	});
*/}

/*获取最新中奖客户信息和开奖号码列表*/
function loadWinningAndCodeList(){
	GetWinning(); //获取最新中奖客户信息
	GetnCodeList() //获取开奖号码列表
	window.setInterval("GetWinning()",60000);
	window.setInterval("GetnCodeList()",5000);
}

/*获取最新中奖客户信息*/
function GetWinning(){/*
	$.ajax({
		type: "POST",
		url: "XML/AjaxXml.asp",
		data: {
			action:"getwinning"
		},
		dataType:"xml",
		success: function(data){
			var err = $(data).find("err");
			if($(err).attr("type")=="1")
			{
				var WinningHeight = 30
				var WinningHtml= ""
				var WinningCount= $(data).find("row").length
				if (WinningCount > 0)
				{
					var i = 0;
					WinningHtml="<ul>"
					$(data).find("row").each(function(index){
						i = index;
						if (index%3 == 0)
						{
							WinningHtml = WinningHtml + "<li>"
						}
						WinningHtml = WinningHtml + "<span>恭喜<font color='#FF0000' style='font-weight:bold;'>"+$(this).attr("winning")+"</font>"
						WinningHtml = WinningHtml + "喜中 ("+$(this).attr("issue")+"期)"
						WinningHtml = WinningHtml + "<font color='#FF0000'>"+$(this).attr("bonus")+"</font>元</span>"
						if ((index+1)%3 == 0)
						{
							WinningHtml = WinningHtml + "</li>"
						}
					})
					if ((i+1)%3 != 0)
					{
						WinningHtml = WinningHtml + "</li>"
					}
					WinningHtml = WinningHtml +"</ul>"
					$("div.latest").html(WinningHtml)
					//$("div.latest").marquee({  direction: "up", speed:30, step: 1,  pause: 1000  }); 
					//$("#WinningDiv > ul").height(WinningBoxHeight)
					//new Marquee("WinningDiv",0,1,$("#WinningDiv").width(),30,30,4000,500)
				}
			}
			else
			{
				if($(err).attr("msg").length>0)
				{
					alert($(err).attr("msg"));
				}
				if($(err).attr("url").length>0)
				{
					location.href = $(err).attr("url");
				}
			}
		}
	});
*/}
/*获取开奖号码列表*/
function GetnCodeList()
{/*
    $.ajax({
        type: "POST",
        url: "XML/AjaxXml.asp",
        data: {
            action: "getncodelist"
        },
        dataType: "xml",
        success: function(data) {
            var err = $(data).find("err");
            if ($(err).attr("type") == "1") {
                var CodeHtml = ""
                $(data).find("row").each(function(index) {
                    CodeHtml = CodeHtml + "<tr>"
                    var tarr = new Array();



                    tarr = $(this).attr("tm").split(' ');
                    var sarr = new Array();
                    sarr = tarr[1].split(':');

                    

                    if (index == 0) {


                        $("#activeexpectshow1").html("<span id='buyExpectShow'>" + $(this).attr("issue") + "</span> ");
                        var arr = new Array();

                        arr = $(this).attr("awardNum").split(',');
                       
                        var zhi = "";
                        var hm = "";

                        for (var i = 0; i < arr.length; i++) {
                            zhi += "<span class='yhzt_hongqiu'>" + arr[i] + "</span>";

                            hm += "&nbsp" + arr[i] + "&nbsp"
                        }
                        zhi = "&nbsp;&nbsp;<span>" + $(this).attr("q3") + "</span>&nbsp" + zhi + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>" + $(this).attr("h3") + "</span>" 加上组三组六


                        $("#kjhm").html(zhi);
                        var time = new Array();
                        time = $(this).attr("tm").split(':');
                        $("#kjsj").html("开奖时间：" + time[1] + ":" + time[2] + ":" + time[3]);
                        $("#qssj").html(time[1] + ":" + time[2] + ":" + time[3]);

                      var qh = $(this).attr("issue");
                          qh = qh.substring(8) 
                         CodeHtml = CodeHtml + "<td class='yhzt_y04_01'>" + qh + "</td>"
                         CodeHtml = CodeHtml + "<td class='yhzt_y04_01'>" + $(this).attr("issue") + "</td>"
                        CodeHtml = CodeHtml + "<td class='yhzt_y04_01'><font color='red'>" + sarr[0] + ":" + sarr[1] + "</font></td>"
                        //  CodeHtml = CodeHtml +"<td class='yhzt_y04_02'>" + hm + "</td>"
                        CodeHtml = CodeHtml + "<td class='yhzt_y04_02'>" + $(this).attr("q3") + hm + $(this).attr("h3") + "</td>" 加上组三组六
                    }
                    else {

                        var arr = new Array();
                        var hm = ""
                        arr = $(this).attr("awardNum").split(',');
                        for (var i = 0; i < arr.length; i++) {
                            hm += "&nbsp" + arr[i] + "&nbsp"
                        }
						
                    var qh = $(this).attr("issue");
                        qh = qh.substring(8) 
						 CodeHtml = CodeHtml + "<td class='yhzt_y04_01'>" + qh + "</td>"  
                         CodeHtml = CodeHtml + "<td class='yhzt_y04_01'>" + $(this).attr("issue") + "</td>"
                        CodeHtml = CodeHtml + "<td class='yhzt_y04_01'>" + sarr[0] + ":" + sarr[1] + "</td>"
                        CodeHtml = CodeHtml + "<td class='yhzt_y04_02'>" + $(this).attr("q3") + hm + $(this).attr("h3") + "</td>" 加上组三组六
                    }
                    CodeHtml = CodeHtml + "</tr>"
                })
                $("#CodeListTable > tbody").html(CodeHtml)
            }
            else {
                if ($(err).attr("msg").length > 0) {
                    alert($(err).attr("msg"));
                }
                if ($(err).attr("url").length > 0) {
                    location.href = $(err).attr("url");
                }
            }
        }
    });
*/}

/*显示开奖号码*/
function ShowOpenCode(){/*
    $.ajax({
        type: "POST",
        url: "XML/AjaxXml.asp",
        data: {
            action: "showopencode"
        },
        dataType: "xml",
        success: function(data) {
            var err = $(data).find("err");
            if ($(err).attr("type") == "1") {
                if ($(data).find("row").length > 0) {
                    var row = $(data).find("row");

                    LastOpenExpect = $(row).attr("expect");
                    LastOpenCode = $(row).attr("opencode");
                    if (LastOpenExpect != LastOpenexpectOld && LastOpenexpectOld != null && LastOpenexpectOld != "") {
                        IsOpen = true;
                    }
                    LastOpenexpectOld = LastOpenExpect;
                    var expect = $(row).attr("expect");
                    var opencode = $(row).attr("opencode");
                   
                    $("#tbshowopenexpect").text(expect);
                    $("#tbshowopencode").text(opencode);
                }
            }
            else {
                if ($(err).attr("msg").length > 0) {
                    alert($(err).attr("msg"));
                }
                if ($(err).attr("url").length > 0) {
                    location.href = $(err).attr("url");
                }
            }
        }
    });
*/}




var times_showActiveExpect = 0;
var times_ShowOpenCode = 0;
var times_ShowColdCode = 0;
/*显示当前期信息*/
function ShowActiveExpect()
{
	if (!IsGetSysSet || !IsGetLocalSubServerSecond || !IsGetActiveExpectInfo ||!ActiveExpectDgendtime)
	{
		setTimeout("ShowActiveExpect()",1000);
		return;
	}
	MinusSeconds();
	
	times_showActiveExpect++;
	if (times_showActiveExpect%60==0)
	{
		GetSysSet();
	}
	times_ShowOpenCode++;
	if (times_ShowOpenCode%30==0)
	{
		ShowOpenCode();
		GetOmitted(); //获取遗漏
		times_ShowOpenCode=0;
	}
	
	/*======当选中的是今天，且第一行的期号和当前期号不一致时候刷新期号  开始=====*/
	var TouzhuExpectType = $("#TouzhuExpectType").val();
	var FirstTourzhuExpect;
	if($("input[name=expect_hidden]").length > 0)
	{
		FirstTourzhuExpect = $("input[name=expect_hidden]").first().val();
	}
	if(FirstTourzhuExpect!=null)
	{
		if(TouzhuExpectType==1 && FirstTourzhuExpect!=ActiveExpect)
		{
			SelectTouzhuExpectType(1);
		}
	}
	/*======当选中的是今天，且第一行的期号和当前期号不一致时候刷新期号  结束=====*/
	
	if(issale==0)
	{
		ExpectStateInfo = "暂停销售";
		ExpectIsSale = false;
		$("#activeexpectdesc").html("<span class=STYLE5>&nbsp;&nbsp;暂停销售</span>")
		$("#RemainSecond").html("<H1>暂停销售</H1>")
		setTimeout("ShowActiveExpect()",1000);
		return;
	}	


//关闭倒计时2013-1-7b
var funarr=[]
funarr.push("");
//关闭倒计时窗口
function ColseCountdownWin(divid,sytime,sysecond,funindex,fun)
{
	if(funindex){}
	else
	{
		funarr.push(fun);
		funindex = funarr.length-1;
	}
	var ColseCountdown = Number($('#'+sysecond).val())
	if(ColseCountdown <=1)
	{
		$('#'+sysecond).val(10)
		/*$('#'+divid).dialog('close');*/
		$('#'+divid).style.display = "none";
		$('#'+divid).find('#'+sytime).text('10秒后自动关闭');
		
		if(funarr[funindex])
		{
			fun = funarr[funindex];
			fun();
		}
	}
	else
	{
		ColseCountdown = ColseCountdown - 1
		$('#'+sysecond).val(ColseCountdown)
		$('#'+sytime).text(ColseCountdown+'秒后自动关闭');
		window.setTimeout("ColseCountdownWin('"+divid+"','"+sytime+"','"+sysecond+"',"+funindex+")",1000)
	}
}
//关闭倒计时2013-1-7e

	
	if(DgEndRemainSecond>0) //售卖中，截止倒计时
	{
		//显示当前期期号
	    $("#activeexpectshow").html("第<font color='#FF3300'><b><span id='buyExpectShow'>" + ActiveExpect + "</span></b></font>期 ");
	   
		ExpectStateInfo = "售卖中";
		ExpectIsSale = true;
		if(DgEndRemainSecond>1800)
		{
		    $("#activeexpectdesc").html("<span class=STYLE5>距投注截止还有：</span>")
			
			$("#RemainSecond").html(DgEndRemainSecondMsg);
		}
		else
		{
			$("#activeexpectdesc").html("<span class=STYLE5>距投注截止还有：</span>")
			$("#RemainSecond").html(DgEndRemainSecondMsg);
		}
		setTimeout("ShowActiveExpect()",1000);
		return;
	}
	else
	{
		ExpectStateInfo = "请等待开售";
		ExpectIsSale = false;
		$("#activeexpectdesc").html("请等待开售")
		$("#RemainSecond").html("");
		FirstLoadTouzhuExpect = true;
		clear_expectbeishu();
		GetTimeComparetoServer();
		$("#dqqh").html(ActiveExpect);
    	openLayer('test', 'test_con');
		
	}
	setTimeout("ShowActiveExpect()",1000);
}


function delCookie(name)//删除cookie  
{
document.cookie = name + "=;expires=" + (new Date(0)).toGMTString();
}


/*获取当前期号*/
function addCookie(objName, objValue, objHours) {      //添加cookie  
    var str = objName + "=" + escape(objValue);
    if (objHours > 0) {                               //为时不设定过期时间，浏览器关闭时cookie自动消失  
        var date = new Date();
        var ms = objHours * 3600 * 1000;
        date.setTime(date.getTime() + ms);
        str += ";path=/trade; expires=" + date.toGMTString();
    }
    document.cookie = str;
}

//计算离各时间还有多少秒
function MinusSeconds()
{
	var date = new Date();
	DgEndRemainSecond = Math.round((Date.parse(ActiveExpectDgendtime.replace(/-/g,"/"))-Date.parse(date))/1000+LocalSubServerSecond)-parseInt(fasecond);
	var m = Math.floor(DgEndRemainSecond/60);
	if (m<10)
	{
		//m = "0"+m;
		m = m;
	}
	var s = DgEndRemainSecond%60;
	if(s<10)
	{
		s = s;
}

DgEndRemainSecondMsg = m + "<span style=font-size:14px;color:#666;>分</span>" + s + "<span style=font-size:14px;color:#666;>秒</span>";



}





/*设置投注期号类别*/
function SelectTouzhuExpectType(value)
{
	$("#TouzhuExpectType").val(value);
	ShowTozhuExpect();	
}
/*显示投注期号*/
function ShowTozhuExpect()
{
	var CurrDate = ServerTime;
//	if(CurrDate==null)
//	{
//		setTimeout("ShowTozhuExpect()",500);
//		return;
//	}
//	var Tomorrow = DateToStr(DateAdd("d",1,CurrDate));
//	var AfterTomorrow = DateToStr(DateAdd("d",1,Tomorrow));
	
	$("#expectheadtd1").text("今日可选期号");
	$("#expectheadtd2").text("明天可选期号");
//	$("#expectheadtd2").text(Tomorrow);
//	$("#expectheadtd3").text(AfterTomorrow);
	
	var TouzhuExpectType = Number($("#TouzhuExpectType").val());
	var DayExpectType;
	if (TouzhuExpectType == 1)
	{
		DayExpectType = "todayexpect";
	}
	else if (TouzhuExpectType == 2)
	{
		DayExpectType = "tomorrowexpect";
	}
	else if (TouzhuExpectType == 3)
	{
		DayExpectType = "aftertomorrowexpect";
	}
	$("#TzListMask").show();
	if($("#btDiv").is(":hidden"))
    {  Check_Show_BeiShu_Even();
        SetTozhuExpect();
     }
	/*$.ajax({
	    type: "POST",
	    url: "XML/AjaxXml.asp",
	    data: {
	        action: DayExpectType
	    },
	    dataType: "xml",
	    success: function(data) {
	        var err = $(data).find("err");
	        if ($(err).attr("type") == "1") {
	            $("#tbshowtozhuexpect > tbody").empty();
				$("#btStartList").empty();
	            $("#selectallexpect").attr("checked", false);
	            j = 0;
	            var tr = "";
				var sellist=""
	            $(data).find("row").each(function(index) {

	                var qihao = $(this).attr("expect");

	                var dgendtime = $(this).attr("endtime");


	                var date = Date.parse(ServerTime.replace(/-/g, "/"));
	                EndOverSecond = Math.round((date - Date.parse(dgendtime.replace(/-/g, "/"))) / 1000);
	                //不显示已经截止的期号
	                if (EndOverSecond > 0 || (ActiveExpect != null && qihao < ActiveExpect)) {
	                    return true;
	                }
	                j = j + 1
	                var fasecond = parent.fasecond;
	                var dgendtime2 = Date.parse(dgendtime.replace(/-/g, "/")) / 1000 - fasecond;
	                dgendtime2 = new Date(dgendtime2 * 1000);
	                dgendtime2 = TimeToStr(dgendtime2);

	                tr = tr + "<tr>";
	                tr = tr + "<td width='140' style=' text-indent:1em'>"
	                if (j == 1 && TouzhuExpectType == 1) {
	                    tr = tr + "<input type='checkbox' name='checkbeishu'><font color='red'>" + qihao.substr(2, 10) + "[当前期]</font>";

	                 

	                    //	                   
	                    //	                    delCookie("ssc");
	                    //	                    addCookie("ssc", qihao.substr(2, 10), 1);


	                }
	                else {
	                    tr = tr + "<input type='checkbox' name='checkbeishu'>" + qihao.substr(2, 10);
	                }
	                tr = tr + "</td>";
	                tr = tr + "<td align='left' width='160'>";
	                tr = tr + "倍数：<input type='text' name='beishu_show' value='0' size='4' maxlength='4'  disabled/> <font color='red'>0</font>元<input type='hidden' name='expect_hidden' value='" + qihao + "'>";
	                tr = tr + "</td>";
	                //					tr = tr + "<td align='middle'>" + dgendtime.substr(0, 16) + "<input type=hidden name=dgendtime value='" + dgendtime + "'></td>";
	                tr = tr + "</tr>";
					 //2013-1-24
		         if(j == 1)
					{
						sellist = sellist + "<option value='"+qihao+"'>["+j+"]"+qihao+"(当前期号)</option>"
					}
					else
					{
						sellist = sellist + "<option value='"+qihao+"'>["+j+"]"+qihao+"</option>"
					}
	            });
	            $("#tbshowtozhuexpect > tbody").html(tr);
				$("#btStartList").html(sellist);
				
	            //绑定复选框和输入框事件
	          
	         
			  if($("#btDiv").is(":hidden"))
	           {  Check_Show_BeiShu_Even();
	               SetTozhuExpect();
	            }
	           
				
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
	    error: function(XMLHttpRequest, textStatus, errorThrown) {
	        alert("获取期号错误，请刷新！")
	    },
	    complete: function(XMLHttpRequest, textStatus) {
	        $("#TzListMask").hide()
	    }
	});*/
}




/*中奖排行*/
function GetRanking(Ranking){/*
	$("#WinningMask").show();
	$.ajax({
		type: "POST",
		url: "XML/AjaxXml.asp",
		data: {
			action:"getranking",
			Ranking:Ranking
		},
		dataType:"xml",
		success: function(data){
			var err = $(data).find("err");
			if($(err).attr("type")=="1")
			{
				var CodeHtml=""
				$(data).find("row").each(function(index){
					CodeHtml = CodeHtml + "<tr>"
					CodeHtml = CodeHtml + "<td>"+(index+1)+"</td>"
					CodeHtml = CodeHtml + "<td>"+$(this).attr("winning")+"</td>"
					CodeHtml = CodeHtml + "<td style='color:red'>"+$(this).attr("bonus")+"</td>"
					CodeHtml = CodeHtml + "</tr>"
				});
				$("#WinningTable > tbody").html(CodeHtml)
				$("#WinningTable > tbody > tr:even >td").css("background","#FFFFFF")
			}
			else
			{
				if($(err).attr("msg").length>0)
				{
					alert($(err).attr("msg"));
				}
				if($(err).attr("url").length>0)
				{
					location.href = $(err).attr("url");
				}
			}
		},
		complete:function (XMLHttpRequest, textStatus){
			$("#WinningMask").hide();
		}
	});
*/}