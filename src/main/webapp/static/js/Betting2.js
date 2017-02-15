var xxtype=1; ////选择类型
var tztype=1; //投注方式
var bdtype=1; //包胆投注方式

var MoveBallClassName = "ball_g"; //鼠标移动到球样式
var SelectBallClassName = "ball_b"; //球被选中样式
var UnSelectClassName = "ball_r"; //球未选中样式

var zhushu=0;//总的注数

var txtgeshu=0;//号码个数
var txtVote="";//投注内容
var qicivalue=1;//选择的期号数
var beishuvalue=1;//选择的倍数
var ServerTime;//服务器时间
var ActiveExpect;//当前期期号
var ActiveExpectOld;//切换期号前当前期期号
var ActiveExpectStartTime;//当前期开售时间
var ActiveExpectEndTime;//当前期停售时间
var ActiveExpectDgendtime;//当前期代购截止时间
var ActiveExpectOpenTime;//当前期开奖时间
var ActiveAllowSell;//当前期是否开卖
var AllAllowExpectNum;//当天剩余期数
var LastOpenExpect;//最近一个开奖期号
var LastOpenexpectOld;//开奖前最近一个开奖期号
var LastOpenCode;//最近一个开奖号码
var StartRemainSecond;//离开售的秒数
var EndRemainSecond;//离停售的秒数
var DgEndRemainSecond;//离代购截止的秒数
var OpenRemainSecond;//离开奖的秒数
var ShowOpenCodeNum = 0;//已经显示的开奖号码的个数
var ShowOpenCodeNumFast = 0;//快速显示开奖号码已经显示的号码个数
var AlreadyShowOpenCode = "";//显示开奖号码时已经显示的号码
var OpenCodeArr = new Array();
var IsCut = false;//是否切换了期号
var IsOpen = false;//是否开奖
var WinOnLoaded = true;//是否第一次打开页面
var ActiveExpectOrder;
var yuexpectnumold = 500;
var yuexpectnumnew = 500;

var issale = 0;
var fasecond = 0;

var LocalSubServerSecond=0;//本地时间-服务器时间 的秒数

var IsGetSysSet = false; //是否已经获取系统信息
var IsGetLocalSubServerSecond = false; //是否已经获取系统信息
var IsGetActiveExpectInfo = false;//是否取当前期信息

var ExpectStateInfo = "数据未准备好，目前不能投注";
var ExpectIsSale = false;

var IsSetQiciDisabled = false;

//var IsLoadTouzhuExpect = false;

var CustomIsSetNotStop = true;



var StartRemainSecondMsg;
var DgEndRemainSecondMsg;
var EndRemainSecondMsg;

var UserSetSound = true;
var FirstLoadTouzhuExpect = true;
var LoadTouzhuTimes = 0;

var beishutdindex=0;



$(function(){
	MenuEven();/*玩法和方式 事件*/
	SelectBallEven();/*选号 事件*/
	Button_Update_Even();/*上传文件按钮 事件*/
	Button_Add_ClearEven();/*"选好了" 和 "清空选区" 按钮 事件*/
	MaindelFun_Even();/*"机选"、"删除" 和 "清空" 按钮 事件*/
	IsZhuihao_ZjStop_Even();/*追号 中奖停止追号 复选框 事件*/
	ZG_HM_PLAN_Even();/*自购 合买 计划倍投 事件*/
	tabDay_Even();/*期号天数 按钮 事件*/
	Plan_Even();
	SelectAll_Expect_Sel_BieShu_Even();/*全选复选框、选择多少期输入框、多少倍  事件*/
	WinningTab_Even()/*中奖排行 标签切换   事件*/
	
	GetSysSet();//取系统参数
	GetTimeComparetoServer(); //取服务器时间
	ShowOpenCode();/*开奖号码*/
	GetOmitted(); /*获取遗漏*/
	ShowActiveExpect();//显示当前期号
	FirstLoadTouzhuExpect = true;
	SelectTouzhuExpectType(1);/*载入期号*/
	GetRanking(1);/*载入中奖排行*/
	loadWinningAndCodeList() //获取最新中奖客户信息和开奖号码列表
	
	$("#TzListMask").css({ height: $("td.adtd08").height(), width: $("td.adtd08").width()})
});

/*玩法和方式 事件*/
function MenuEven(){
	/*方式 事件*/
	$("td.adtd04 input[type='radio']").click(function(){
		var a_index = Number($(this).val());
		if (a_index >= 0)
		{
			tztype = a_index;
			checksite();
		}
	})
	
	/*玩法 事件*/
	$("td.adtd02 > a").click(function(){
		
		$("td.adtd02 > a").removeClass("menu2");
		$(this).addClass("menu2");
		//获取玩法
		var a_index = Number($(this).attr("value"));
		if (a_index > 0)
		{
			xxtype = a_index;
			if(a_index == 1)//任选复式 
			{
				tztype = 1;
				$("#playcode").val("c1");
			}
			else if(a_index == 2)//单式投注
			{
				tztype = 1;
				$("#playcode").val("c2");
			}
			else if(a_index == 3)//胆拖投注
			{
				tztype = 2;
				$("#playcode").val("c3");
			}
			else if(a_index == 4)//前三投注
			{
				tztype = 9;
				$("#playcode").val("c4");
			}
			else if(a_index == 5)//前二投注
			{
				tztype = 14;
				$("#playcode").val("c5");
			}
			$("td.adtd04 input[type='radio'][value='"+tztype+"']").click();
		}
	})
	
	//默认选中一个玩法
	$("td.adtd02 > a").eq(0).click()
}

/*选择号码 事件*/
function SelectBallEven(){
	$("td.ball_r,td.ball_r_1").mouseover(function(){
		if (!$(this).hasClass(SelectBallClassName))
		{
			$(this).addClass(MoveBallClassName);
		}
	}).mouseout(function(){
		$(this).removeClass(MoveBallClassName);
	}).click(function(){
		if (!$(this).hasClass(SelectBallClassName))
		{
			$(this).removeClass(MoveBallClassName);
			$(this).addClass(SelectBallClassName);
		}
		else
		{
			$(this).removeClass(SelectBallClassName);
			$(this).addClass(MoveBallClassName);
		}
		
		add_line_self(true);
	    
	});
	$("tr#tr_vote_1 > td > span,tr#tr_vote_4 > td > span,tr#tr_vote_5 > td > span,tr#tr_vote_6 > td > span").click(function(){
		var value = $(this).text();
		var tr = $(this).parent().parent()
		
		switch (value){
			case "全":
				$(tr).find("td.ball_r").removeClass(SelectBallClassName).addClass(SelectBallClassName);
				break;
			case "大":
				$(tr).find("td.ball_r").removeClass(SelectBallClassName).each(function(index){
					if(index > 4){
						$(this).addClass(SelectBallClassName);
					}
				});
				break;
			case "小":
				$(tr).find("td.ball_r").removeClass("ball_b").each(function(index){
					if(index < 5){
						$(this).addClass(SelectBallClassName);
					}
				});
				break;
			case "奇":
				$(tr).find("td.ball_r").removeClass(SelectBallClassName);
				$(tr).find("td.ball_r:even").addClass(SelectBallClassName); 
				break;
			case "偶":
				$(tr).find("td.ball_r").removeClass(SelectBallClassName);
				$(tr).find("td.ball_r:odd").addClass(SelectBallClassName);
				break;
			case "清":
				$(tr).find("td.ball_r").removeClass(SelectBallClassName);
				break;
			default: 
				break;
		}
	});
}

/*上传文件按钮 事件*/
function Button_Update_Even(){
	$("input#button_Update").click(function(){
		var showimg = $("#UpdateFile").val();
		if(showimg.length==0)
		{
			alert("必须选择文件!只能是TXT|txt|Txt|txT|TxT文件！");
			return;
		}
		var i=showimg.lastIndexOf(".TXT");
		var ii=showimg.lastIndexOf(".txt");
		var iii=showimg.lastIndexOf(".Txt");
		var iiii=showimg.lastIndexOf(".txT");
		var iiiii=showimg.lastIndexOf(".TxT");
	  
		if((i<0)&&(ii<0)&&(iii<0)&&(iiii<0)&&(iiiii<0))
		{
			alert("必须是TXT|txt|Txt|txT|TxT文件格式!");
			return;
		}
		updatefile()
	});
}


/*"选好了" 和 "清空选区" 按钮 事件*/
function Button_Add_ClearEven(){
	$("input#button_add").click(function(){
		if (xxtype!=2 &&(tztype!=11 && tztype!=13 && tztype!=15 && tztype!=17))
		{
			add_line_self();//手动添加号码
		}
		else
		{
			add_paste();//单式添加号码
		}
	});
	$("input#button_clear").click(function(){
		clear_selectedball()
	});
}


/*"机选"、“删除” 和 "清空" 按钮 事件*/
function MaindelFun_Even(){
	//删除按钮 事件
	$("input#btn_delline").click(function(){
		if($("select#codesshow > option:selected").length > 0)
		{
			$("select#codesshow > option:selected").remove();
			count_allzhushu();
			show_money();
		}
		else
		{
			alert("请先选择一行要删除的投注内容");
		}
	});
	//清空按钮 事件
	$("input#btn_clearall").click(function(){
		$("select#codesshow").empty();
		zhushu = 0;
		show_money();
	});
	//机选一注按钮 事件
	$("input#btn_jixuan1").click(function(){
		select_jxmuti(1);
	});
	//机选五注按钮 事件
	$("input#btn_jixuan5").click(function(){
		select_jxmuti(5);
	});
	//机选十注按钮 事件
	$("input#btn_jixuan10").click(function(){
		select_jxmuti(10);
	});
}
/*追号 中奖停止追号 复选框 事件*/
function IsZhuihao_ZjStop_Even(){
	
	/*追号 复选框 事件*/
	$("#IsZhuihao").change(function(){
		if($(this).attr("checked")) {
		    document.getElementById("myhsow").style.display = "block";
			$("#ZjStop").attr("checked",CustomIsSetNotStop)
			$("#ZjStop").attr("disabled",false)
		}
		else {
		    document.getElementById("myhsow").style.display = "none";
			$("#ZjStop").attr("checked",false)
			$("#ZjStop").attr("disabled",true)
			clear_expectbeishu();
			FirstLoadTouzhuExpect = true;
			SelectTouzhuExpectType(1);
		}
	})
	
	/*中奖后停止追号 复选框 事件*/
	$("#ZjStop").change(function(){
		CustomIsSetNotStop = $(this).attr("checked")
	})
	
}
/*自购 合买 和计划倍投 按钮 事件*/
function ZG_HM_PLAN_Even()
{
	/*自购 按钮 事件*/
	$("#btn_SubmitZ").click(function(){
//		checkData("zg");
		alert("暂停销售");
	});
	/*合买 按钮 事件*/
	$("#btn_SubmitHM").click(function(){
//		checkData("hm");
		alert("暂停销售");
	});
	/*计划倍投 按钮 事件*/
	$("#btn_SubmitPath").click(function(){
		checkplan();
	});
}

/*期号天数 按钮 事件*/
function tabDay_Even()
{
	$("#expectheadtd1,#expectheadtd2,#expectheadtd3").click(function(){
		if (!$(this).hasClass("tab1"))
		{
			$("#zhDiv").show();
			$("#btDiv").hide();
			$("#expectheadtd1,#expectheadtd2,#expectheadtd3,#btTab").removeClass("tab1");
			$(this).addClass("tab1");
			var index = $(this).index();
			SelectTouzhuExpectType(index+1);
		}
	});
}

/*计划倍投 事件*/
function Plan_Even()
{
	/*计划倍投 选中事件*/
	$("#btTab").click(function(){
	  
		
		if (!$(this).hasClass("tab1"))
		{
			
			$("#zhDiv").hide();
			$("#btDiv").show();
			$("#expectheadtd1,#expectheadtd2,#expectheadtd3,#btTab").removeClass("tab1");
			$(this).addClass("tab1");
			//JoinExpectBeishuBT();
	        ShowMoney();//2013-1-24
	
		}
		
	});
	
	/*选项事件*/
	$("input[name=rdoWinCondition]").click(function(){
		$("input[name=NumInput2]").attr("disabled",true);
		$(this).parent().find("input").attr("disabled",false);
		
	})
	
	/*输入框事件*/
	$("input[name=NumInput],input[name=NumInput2]").keyup(function(){
		$(this).val($(this).val().replace(/[^\d]/g,''));
		var num = Number($(this).val());
		if (num < 1)
		{
			$(this).val(1)
		}
	});
	
	/*计划倍投事件*/
	$("#btnCalc").click(function(){
		
		CheckPlanN();
	})
	
	
}

/*全选复选框、选择多少期输入框、多少倍  事件*/
function SelectAll_Expect_Sel_BieShu_Even()
{
	// 全选复选框
	$("#selectallexpect").change(function(){
		var check = $(this).attr("checked");
		$("#tbshowtozhuexpect > tbody > tr > td > input[name=checkbeishu]").attr("checked",check);
		$("#tbshowtozhuexpect > tbody > tr > td > input[name=beishu_show]").attr("disabled",!check);
		if (check)
		{
			$("#tbshowtozhuexpect > tbody > tr > td > input[name=beishu_show]").val($("#selectallbieshu").val())
		}
		else
		{
			$("#tbshowtozhuexpect > tbody > tr > td > input[name=beishu_show]").val(0)
		}
		JoinExpectBeishu();
		show_money();
	})
	/*输入期数文本框键盘事件*/
	$("#batchexpectsel").keyup(function(){
		$(this).val($(this).val().replace(/[^\d]/g,''));
		var num = Number($(this).val());
		if (num < 1)
		{
			$(this).val(1)
			num = 1;
		}
		$("#tbshowtozhuexpect > tbody > tr > td > input[name=checkbeishu]").attr("checked",false);
		$("#tbshowtozhuexpect > tbody > tr > td > input[name=beishu_show]").attr("disabled",true).val(0);	
		$("#tbshowtozhuexpect > tbody > tr > td > input[name=checkbeishu]").each(function(index){
			if (index<num)
			{
				$(this).attr("checked",true);
				$(this).parent().next().find("input[name=beishu_show]").attr("disabled",false).val($("#selectallbieshu").val());
			}
			else
			{
				return false;
			}
		});
		$("#selectallexpect").attr("checked",false);
		JoinExpectBeishu();
		show_money();
	})
	
	/*输入倍数文本框键盘事件*/
	$("#selectallbieshu").change(function(){
		$(this).val($(this).val().replace(/[^\d]/g,''));
		var num = Number($(this).val());
		if (num < 1)
		{
			$(this).val(1)
			num = 1;
		}
		$("#tbshowtozhuexpect > tbody > tr > td > input[name=beishu_show]").each(function(index){
			if(!$(this).attr("disabled"))
			{
				$(this).val($("#selectallbieshu").val());
			}
		});
		JoinExpectBeishu();
		show_money();
    })
    $("#set_beishu").keyup(function() {
        $(this).val($(this).val().replace(/[^\d]/g, ''));
        var num = Number($(this).val());
        if (num < 1) {
            $(this).val(1)
            num = 1;
        }
        $("#selectallbieshu").val($("#set_beishu").val());
        $("#tbshowtozhuexpect > tbody > tr > td > input[name=beishu_show]").each(function(index) {
            if (!$(this).attr("disabled")) {
                $(this).val($("#set_beishu").val());
            }
        });
        JoinExpectBeishu();
        show_money();
    })
}
//快捷投注
function getqishu(obj) {




    var whichObj;
    var getCK = document.getElementsByName('checkbeishu');
    var wb = document.getElementsByName('beishu_show');
    var j = 0;

    for (var i = 0; i < obj; i++) {
        if (getCK.length == i)
            break;
        whichObj = getCK[i];
        if (whichObj.type == "checkbox") {
            whichObj.checked = true;
            var check = $(getCK[i]).attr("checked");
            if (check) {
                $(wb[i]).val($("#selectallbieshu").val());
                $(wb[i]).attr("disabled", !check);
            }
            else {
                $(wb[i]).val($("#selectallbieshu").val());
            }
            JoinExpectBeishu();
            show_money();
            j++;
        }
    }

    for (var s = j; s < getCK.length; s++) {
        whichObj = getCK[s];
        if (whichObj.type == "checkbox") {
            whichObj.checked = false;
            $(wb[s]).val(0);
            $(wb[s]).attr("disabled", check);
        }
        JoinExpectBeishu();
        show_money();
    }
}
/*checkbeishu复选框 和 beishu_show 事件*/
function Check_Show_BeiShu_Even(){
	/*checkbeishu复选框 选择事件*/
	$("#TzList > table > tbody > tr > td > input[name=checkbeishu]").change(function(){
		var check = $(this).attr("checked");
		var beishu_show = $(this).parent().next().find("input[name=beishu_show]");
		$(beishu_show).attr("disabled",!check);
		if(check)
		{
			$(beishu_show).val($("#selectallbieshu").val());
		}
		else
		{
			$(beishu_show).val(0);
		}
		
		$("#selectallexpect").attr("checked",false);
		JoinExpectBeishu();
		show_money();
	});
	/*beishu_show 输入事件*/
	$("#TzList > table > tbody > tr > td > input[name=beishu_show]").change(function(){
		$(this).val($(this).val().replace(/[^\d]/g,''));
		var num = Number($(this).val());
		if (num < 1)
		{
			$(this).val(1)
		}
		JoinExpectBeishu();
		show_money();
	});
}

/*中奖排行 标签切换   事件*/
function WinningTab_Even()
{
	$("#WinningTab > li").click(function(){
		if (!$(this).hasClass("tab3"))
		{
			$("#WinningTab > li").removeClass("tab3");
			$(this).addClass("tab3");
			var index = $(this).index();
			GetRanking(index+1);
		}
	});
}