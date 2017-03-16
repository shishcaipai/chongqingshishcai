//选择组合方式

function checksite()
{
	//显示所有的方法
	$("td.adtd04 > span").hide();
	//隐藏所有选号
	$("table.numtbTable").hide();
	if (xxtype == 7)//五星通选
	{
		$("span#selfs").show();
		$("span#selds").show();
    	if(tztype == 1)//复式
		{
			$("table#numtb").show();
			$("table#numtb > tbody > tr").show();
			$("font#div_yl_1,font#div_yl_2,font#div_yl_3,font#div_yl_4,font#div_yl_5,tr#tr_yl_1,tr#tr_yl_2,tr#tr_yl_3,tr#tr_yl_4,tr#tr_yl_5").show();
			$("span#zhexplain1").html("（通吃3个奖级，1注号码5次中奖机会，单注奖金高达<font color=red>20440</font>元）");
			//开启机选
			CloseJiXuan(false);
		}
		else if(tztype == 2)//单式
		{
			$("table#numtc").show();
			$("span#zhexplain1").html("（通吃3个奖级，1注号码5次中奖机会，单注奖金高达<font color=red>20440</font>元）");
			//开启机选
			CloseJiXuan(false);
		}
		
	}
	if (xxtype == 1)//五星投注
	{
	    $("span#selfs").show();
	    $("span#selds").show();

	    if (tztype == 1)//复式
	    {
	        $("table#numtb").show();
	        $("table#numtb > tbody > tr").show();
	        $("font#div_yl_1,font#div_yl_2,font#div_yl_3,font#div_yl_4,font#div_yl_5,tr#tr_yl_1,tr#tr_yl_2,tr#tr_yl_3,tr#tr_yl_4,tr#tr_yl_5").show();
	        $("span#zhexplain1").html("（从00000~99999中选一个五位数为一个投注号码，单注奖金<font color=red>100000</font>元）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 2)//单式
	    {
	        $("table#numtc").show();
	        $("span#zhexplain1").html("（单注与开奖号码相对应， 单注奖金<font color=red>100000</font> 元）");
	        //开启机选
	        CloseJiXuan(false);
	    }

	}
	else if (xxtype == 2)//三星直选
	{
	    $("span#selfs").show();
	    $("span#selds").show();
	    $("span#selex3xzhfx").show();
	    $("span#selex3xzxhz").show();

	    if (tztype == 1)//复式
	    {
	        $("table#numtb").show();
	        $("table#numtb > tbody > tr").show();
	        $("table#numtb > tbody > tr").eq(0).hide();
	        $("table#numtb > tbody > tr").eq(1).hide();
	        $("font#div_yl_3,font#div_yl_4,font#div_yl_5,tr#tr_yl_3,tr#tr_yl_4,tr#tr_yl_5").show();
	        $("span#zhexplain1").html("（从000~999中选一个三位数为一个投注号码，单注奖金<font color='red'>1800</font>元）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 2)//单式
	    {
	        $("table#numtc").show();
	        $("a#gsexplain").attr("href", "/Trade/SSL/Xml/dg/sx.txt");
	        $("span#zhexplain1").html("(单注与开奖号码相对应， 单注奖金<font color=red>1800</font> 元）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 18)//和值
	    {
	        $("table#numtb_3xzxhz").show();
	        $("span#zhexplain1").html("（百、十、个位号码之和，单注奖金<font color=red>1800</font>元 ）");
	        //开启机选
	        CloseJiXuan(true);
	    }
	}
	
	else if (xxtype == 12)//三星直选
	{

	    $("span#selfs").show();
	    $("span#selds").show();
	    $("span#selex3xzhfx").show();
	    $("span#selex3xzxhz").show();
	    if (tztype == 1)//复式
	    {
	        $("table#numtb").show();
	        $("table#numtb > tbody > tr").show();
	        $("table#numtb > tbody > tr").eq(3).hide();
	        $("table#numtb > tbody > tr").eq(4).hide();
	        $("font#div_yl_3,font#div_yl_4,font#div_yl_5,tr#tr_yl_3,tr#tr_yl_4,tr#tr_yl_5").show();
	        $("span#zhexplain1").html("（从000~999中选一个三位数为一个投注号码，单注奖金<font color='red'>1800</font>元）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 2)//单式
	    {
	        $("table#numtc").show();
	        $("a#gsexplain").attr("href", "/Trade/SSL/Xml/dg/sx.txt");
	        $("span#zhexplain1").html("(单注与开奖号码相对应， 单注奖金<font color=red>1800</font> 元）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 18)//和值
	    {
	        $("table#numtb_3xzxhz").show();
	        $("span#zhexplain1").html("（百、十、个位号码之和，单注奖金<font color=red>1800</font>元 ）");
	        //开启机选
	        CloseJiXuan(true);
	    }
	}
	else if (xxtype == 8 || xxtype == 13)// 三星组选
	{

	
	    // $("span#selds").show();
	    $("span#selex3xz3").show();
	    $("span#selex3xz6").show();
	    $("span#selex3xbd").show();
	    $("span#selex3xhz").show();
	    $("span#selex3xz3hz").show();
	    $("span#selex3xz6hz").show();

	    if (tztype == 11)//组三
	    {
	        $("table#numtb_3xz3fs").show();
	        $("span#zhexplain1").html("（开奖号码中任2个数字相同，所选号码与开奖号码相同且顺序不限，单注奖金<font color=red>600</font>元。）");
	        $("#zhexplain4").html("(至少选2个号码)");
	        //开启机选
	        CloseJiXuan(true);
	    }
	    else if (tztype == 12)//组六
	    {
	        $("table#numtb_3xz3fs").show();
	        $("span#zhexplain1").html("（开奖号码3个数字各不相同，所选号码与开奖号码相同且顺序不限，单注奖金<font color=red>300</font>元）");
	        $("#zhexplain4").html("(至少选3个号码)");
	        //开启机选
	        CloseJiXuan(true);
	    }
	    else if (tztype == 13)//包胆
	    {
	        $("table#numtb_3xbdfs").show();
	        $("table#numtb_3xbdfs > tbody > tr > td > input:first").click();
	        $("span#zhexplain1").html("（包胆奖金与开奖号码相对应，豹子<font color=red>1800 </font>/ 组三<font color=red>600</font> / 组六<font color=red>300</font>）");
	        //开启机选
	        CloseJiXuan(true);
	    }
	    else if (tztype == 14)//组选和值
	    {
	        $("table#numtb_3xzxhz").show();
	        $("span#zhexplain1").html("（和值奖金与开奖号码相对应，豹子<font color=red>1800</font> / 组三<font color=red>600</font> / 组六<font color=red>300</font>）");
	        //开启机选
	        CloseJiXuan(true);
	    }
	    else if (tztype == 22)//组三和值
	    {
	        $("table#numtb_3xzxz3hz").show();
	        $("span#zhexplain1").html("（开奖号码为组三且百、十、个之和与所选和值相同，单注奖金为<font color=red>600</font>元 ）");
	        //开启机选
	        CloseJiXuan(true);
	    }
	    else if (tztype == 23)//组六和值
	    {
	        $("table#numtb_3xzxz6hz").show();
	        $("span#zhexplain1").html("（开奖号码为组六且百、十、个之和与所选和值相同，单注奖金为<font color=red>300</font>元 ）");
	        //开启机选
	        CloseJiXuan(true);
	    }
	    else if (tztype == 2)//单式
	    {
	        $("table#numtc").show();
	        $("a#gsexplain").attr("href", "/Trade/SSL/Xml/dg/sx.txt");
	        $("span#zhexplain1").html("（单注与开奖号码相对应， 组三<font color=red>600</font> / 组六<font color=red>300</font>）");
	        //开启机选
	        CloseJiXuan(true);
	    }
	}


	else if (xxtype == 14)//前二
	{
	    $("span#touzhufangshi_1").show();
	    $("span#selfs").show();
	    $("span#selds").show();
	    $("span#selex2xfshzds").show();
	    if (tztype == 1)//二星直选复式
	    {
	        $("table#numtb").show();
	        $("table#numtb > tbody > tr").hide();
	        $("table#numtb > tbody > tr").eq(0).show();
	        $("table#numtb > tbody > tr").eq(1).show();
	        $("font#div_yl_4,font#div_yl_5,tr#tr_yl_4,tr#tr_yl_5").show();
	        $("span#zhexplain1").html("（从00~99中选一个二位数为一个投注号码，单注奖金<font color=red>180</font>元）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 2)//二星直选单式
	    {
	        $("table#numtc").show();
	        $("a#gsexplain").attr("href", "/Trade/SSL/Xml/dg/ex.txt");
	        $("span#zhexplain1").html("（单注与开奖号码相对应，单注奖金<font color=red>180</font>元）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 20)//二星直选和值         
	    {
	        $("table#numtb_2xzxhz").show();
	        $("span#zhexplain1").html("（所选和值与开奖号码十、个位之和相同，奖金<font color=red>180</font>元）");
	        //开启机选
	        CloseJiXuan(true);
	    }
	    else if (tztype == 7)//二星组选复式         
	    {
	        $("table#numtb_2xzxfs").show();
	        $("td#zhexplain3").html("(2≤选号个数≤7)");
	        $("span#zhexplain1").html("（任选2至7个不同数字进行投注，不包含对子，兑奖不排序，单注奖金<font color=red>90</font>元）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 8)//二星组选单式         
	    {
	        $("table#numtc").show();
	        $("a#gsexplain").attr("href", "/Trade/SSL/Xml/dg/ex.txt");
	        $("span#zhexplain1").html("（开奖号码不排序，奖金<font color=red>90</font>元）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 9)//二星组选和值         
	    {
	        $("table#numtb_2xzxhz").show();
	        $("span#zhexplain1").html("（十、个位两个号码之和，开奖号码不排序，奖金<font color=red>90</font>元，开奖号码为对子奖金<font color=red>180</font>元）");
	        //开启机选
	        CloseJiXuan(true);
	    }
	    else if (tztype == 21)//二星组选包胆         
	    {
	        $("table#numtb_2xzxfs").show();
	        $("td#zhexplain3").html("(1≤个数≤2)");
	        $("span#zhexplain1").html("（选择1或2个胆，进行投注，奖金<font color=red>90</font>元，开奖号码为对子奖金<font color=red>180</font>元。）");
	        //开启机选
	        CloseJiXuan(true);
	    }
	}
	
	
	
	

	else if (xxtype == 3)// 二星投注
	{
	    $("span#touzhufangshi_1").show();
	    $("span#selfs").show();
	    $("span#selds").show();
	    $("span#selex2xfshzds").show();
	    if (tztype == 1)//二星直选复式
	    {
	        $("table#numtb").show();
	        $("table#numtb > tbody > tr").hide();
	        $("table#numtb > tbody > tr").eq(3).show();
	        $("table#numtb > tbody > tr").eq(4).show();
	        $("font#div_yl_4,font#div_yl_5,tr#tr_yl_4,tr#tr_yl_5").show();
	        $("span#zhexplain1").html("（从00~99中选一个二位数为一个投注号码，单注奖金<font color=red>180</font>元）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 2 )//二星直选单式
	    {
	        $("table#numtc").show();
	        $("a#gsexplain").attr("href", "/Trade/SSL/Xml/dg/ex.txt");
	        $("span#zhexplain1").html("（单注与开奖号码相对应，单注奖金<font color=red>180</font>元）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 20)//二星直选和值         
	    {
	        $("table#numtb_2xzxhz").show();
	        $("span#zhexplain1").html("（所选和值与开奖号码十、个位之和相同，奖金<font color=red>180</font>元）");
	        //开启机选
	        CloseJiXuan(true);
	    }
	    else if (tztype == 7)//二星组选复式         
	    {
	        $("table#numtb_2xzxfs").show();
	        $("td#zhexplain3").html("(2≤选号个数≤7)");
	        $("span#zhexplain1").html("（任选2至7个不同数字进行投注，不包含对子，兑奖不排序，单注奖金<font color=red>90</font>元）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 8)//二星组选单式         
	    {
	        $("table#numtc").show();
	        $("a#gsexplain").attr("href", "/Trade/SSL/Xml/dg/ex.txt");
	        $("span#zhexplain1").html("（开奖号码不排序，奖金<font color=red>90</font>元）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 9)//二星组选和值         
	    {
	        $("table#numtb_2xzxhz").show();
	        $("span#zhexplain1").html("（十、个位两个号码之和，开奖号码不排序，奖金<font color=red>90</font>元，开奖号码为对子奖金<font color=red>180</font>元）");
	        //开启机选
	        CloseJiXuan(true);
	    }
	    else if (tztype == 21)//二星组选包胆         
	    {
	        $("table#numtb_2xzxfs").show();
	        $("td#zhexplain3").html("(1≤个数≤2)");
	        $("span#zhexplain1").html("（选择1或2个胆，进行投注，奖金<font color=red>90</font>元，开奖号码为对子奖金<font color=red>180</font>元。）");
	        //开启机选
	        CloseJiXuan(true);
	    }
	}
	else if (xxtype == 4)// 一星投注
	{
	    $("span#selfs").show();
	    $("table#numtb").show();
	    $("table#numtb > tbody > tr").hide();
	    $("table#numtb > tbody > tr").eq(4).show();
	    $("font#div_yl_5,tr#tr_yl_5").show();
	    $("span#zhexplain1").html("（从0~9中选一个一位数为一个投注号码，单注奖金<font color=red>18</font>元）");
	    //开启机选
	    CloseJiXuan(false);
	}
	else if (xxtype == 10)// 不定位
	{
	    $("span#selbdw").show();
	    $("table#numtb").show();
	    $("table#numtb > tbody > tr").hide();
	    $("table#numtb > tbody > tr").eq(4).show();
	    $("font#div_yl_5,tr#tr_yl_5").show();
	    $("span#zhexplain1").html("（从0~9中选一个一位数或者多个投注号码，单注奖金<font color=red>6.6</font>元）");
	    //开启机选
	    CloseJiXuan(true);
	}


	else if (xxtype == 11)// 定位胆
	{
	    $("table#numtb").show();
	    $("table#numtb > tbody > tr").show();

	    $("span#zhexplain1").html("（从0~9中选一个一位数或者多个投注号码，单注奖金<font color=red>18</font>元）");
	    //开启机选
	    CloseJiXuan(true);
	}

	else if (xxtype == 5)//组合投注
	{
	    $("span#selwxzh").show();
	    $("span#selsxzh").show();
	    $("span#selexzh").show();
	    if (tztype == 3)//五星组合
	    {
	        $("table#numtb").show();
	        $("table#numtb > tbody > tr").show();
	        $("font#div_yl_1,font#div_yl_2,font#div_yl_3,font#div_yl_4,font#div_yl_5,tr#tr_yl_1,tr#tr_yl_2,tr#tr_yl_3,tr#tr_yl_4,tr#tr_yl_5").show();
	        $("span#zhexplain1").html("（例如投4+5+6+7+8，共8元，由45678(五星)、678(三星)、78(二星)、8(一星)构成）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 4)//三星组合
	    {
	        $("table#numtb").show();
	        $("table#numtb > tbody > tr").show();
	        $("table#numtb > tbody > tr").eq(0).hide();
	        $("table#numtb > tbody > tr").eq(1).hide();
	        $("font#div_yl_3,font#div_yl_4,font#div_yl_5,tr#tr_yl_3,tr#tr_yl_4,tr#tr_yl_5").show();
	        $("span#zhexplain1").html("（例如投6+7+8，共6元，由678(三星)、78(二星)、8(一星)构成）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	    else if (tztype == 5)//二星组合
	    {
	        $("table#numtb").show();
	        $("table#numtb > tbody > tr").hide();
	        $("table#numtb > tbody > tr").eq(3).show();
	        $("table#numtb > tbody > tr").eq(4).show();
	        $("font#div_yl_4,font#div_yl_5,tr#tr_yl_4,tr#tr_yl_5").show();
	        $("span#zhexplain1").html("（例如投：7+8，共4元，由以下2注：78(二星)、8(一星)构成）");
	        //开启机选
	        CloseJiXuan(false);
	    }
	}
	else if (xxtype == 6)//大小单双
	{
	    $("span#selfs").show();
	    $("table#numta").show();
	    $("span#zhexplain1").html("（从个、十位中任选一种性质组成1注投注号码，单注奖金<font color=red>4</font>元）");
	    //开启机选
	    CloseJiXuan(false);
	}
	else if (xxtype == 9)//三星胆拖
	{
	    $("span#selex3xz3dt").show();
	    $("table#selex3xz6dt").show();
	    $("table#selex3xzxdt").show();
	    $("table#numtb_3xz3fsdt").show();
	    //开启机选
	    CloseJiXuan(true);
	    if (zhtype == 15) {
	        $("td#dtinfo_1 > font").html("（胆码个数=1）");
	        $("td#dtinfo_2 > font").html("（1≤拖码个数≤9）");
	        $("span#zhexplain1").html("（胆码＋拖码，与中奖号码相同即中奖，单注奖金<font color='red'>580</font>元。）");
	    }
	    else if (zhtype == 16) {
	        $("td#dtinfo_1 > font").html("（1≤胆码个数≤2）");
	        $("td#dtinfo_2 > font").html("（4≤胆码＋拖码）");
	        $("span#zhexplain1").html("（胆码＋拖码，与中奖号码相同即中奖，单注奖金<font color='red'>280</font>元。）");
	    }
	    else if (zhtype == 19) {
	        $("td#dtinfo_1 > font").html("（0＜胆码个数≤2）");
	        $("td#dtinfo_2 > font").html("（3 ≤胆码＋拖码）");
	        $("span#zhexplain1").html("（胆码＋拖码，号码和顺序皆与中奖号码相同即中奖(不含组三)，奖金<font color='red'>1800</font>元。）");
	    }
	}
}


/*关闭机选*/
function CloseJiXuan(bl)
{
	$("input#btn_jixuan1,input#btn_jixuan5,input#btn_jixuan10").attr("disabled",bl);
}



/**
 * 手动添加号码
 * @param sign 是否加入投注栏
 */
function add_line_self(sign) {
	var IsEXZXFS2DS = false;
	var linecounts = getlinecounts(xxtype, tztype);
	var codes = joinTZ(linecounts);
	

	if (codes=="")
	{
		if (!sign) {
			alert("请选择号码！");
			return;
		}
	}
	if ((xxtype == 8 || xxtype == 13) && tztype == 11)  //组三
	{
		var arrCodes = codes.split(",");
		if(arrCodes.length < 2)
		{
			if (!sign) {
				alert("组三最少选择二个号码");
				return;
			}
		}
	}
	else if ((xxtype == 8 || xxtype == 13) && tztype == 12)  //组六
	{
		var arrCodes = codes.split(",");
		if(arrCodes.length < 3)
		{
			if (!sign) {
				alert("组六最少选择三个号码");
				return;
			}
		}
	}
	else if ((xxtype == 8 || xxtype == 13) && tztype == 13)  //组选包胆
	{
	    var arrCodes = codes.split(",");
 
		if (bdtype == 1)
		{
			if(arrCodes.length!=1)
			{
				if (!sign) {
					alert("包一胆只能选择一个号码");
					return;
				}
			}
		}
		else {
		
		 
			if(arrCodes.length!=2)
			{
				if (!sign) {
					alert("包二胆只能选择二个号码,每行一个!");
					return;
				}
			}
		}
	}
	else if(xxtype == 9 && tztype == 15) //组三包胆
	{
		if (codes=="")
		{
			if (!sign) {
				alert("投注格式错误,组三胆拖投注只能1个胆,胆与拖不能相同!");
				return;  
			}
		}
	} 
	else if(xxtype == 9 && tztype == 16) //组六包胆
	{
		if (codes=="")
		{
			if (!sign) {
				alert("投注格式错误,组六胆拖投注最多2个胆,胆+拖必需大于等于4,胆与拖不能相同!");
				return;  
			}
		}
	}
	else if(xxtype == 9 && tztype == 19) //三星直选胆拖
	{
		if (codes=="")
		{
			if (!sign) {
				alert("投注格式错误,直选胆拖投注最多2个胆,胆+拖必需大于等于3,胆与拖不能相同!");
				return;  
			}
		}
	}  
	else if(xxtype == 2 && tztype == 17) //三星直选
	{
		var arrCodes = codes.split(",");
		if(arrCodes.length<3)
		{
			if (!sign) {
				alert("三星直选组合复式最少选择三个号码");
				return;
			}
		}
	}
	else if(xxtype == 3 && tztype == 21 ) //二星组选包胆
	{
		var arrCodes = codes.split(",");
		if(arrCodes.length>2)
		{
			if (!sign) {
				alert("二星组选包胆最多选择二个号码");
				return;
			}
		}
    }


	if (Number(getzhushu_single(codes,xxtype,tztype))>0) //计算注数
	{

	
		if((xxtype == 3||xxtype == 14) && tztype == 7)
		{
			var arrCodes = codes.split(",");
			if(arrCodes.length<2 || arrCodes.length>7)
			{
				if (!sign) {
					alert("请选择2到7个号码进行投注");
					return;
				}
			}
			if(arrCodes.length==2  && xxtype == 3)//2个号码转为二星组选单式
			{
				tztype = "7";
				IsEXZXFS2DS = true;
			}
			
			if(arrCodes.length==2 && xxtype == 14)//2个号码转为二星组选单式2013-1-14
			{
				tztype = "8";
				IsEXZXFS2DS = true;
			}
		}
		else if((xxtype == 3||xxtype == 14) && (tztype == 9 || tztype == 20)) //二星和值
		{
			
		}
		else if ((xxtype == 3 || xxtype == 14) && tztype == 21) //二星组选包胆
		{
			
		}
		else if (xxtype == 8 || xxtype == 13) //三星组选号码不变
		{
			
		}
		else if(xxtype == 9) //三星胆拖号码不变
		{
			
		}
		else if(xxtype == 2 && (tztype == 17 || tztype == 18) ) //三星号码不变
		{
			
		}
	
		else if (xxtype == 10)//不定位
		{
		    codes = codes;
		}

		else if (xxtype == 11)//定位胆
		{
		 

		    for (var i = 0; i < 5 - linecounts; i++) {
		        codes = "-," + codes;
		    }


		}
		else if (xxtype == 12 && tztype==1) {//前三直选复式
		 //2013-4-15新增b
//		 	var arrCodesS = codes.split(",");
//		    for (var i = 0; i < arrCodesS.length; i++) {
//		     var j=i+1 
//			 if (arrCodesS[i].length>8)
//			{	
//			alert ("第"+j+"行选择了"+arrCodesS[i].length);
//			return;
//			} 
//		}
		 
		//2013-4-15新增e	   
		   
		    for (var i = 0; i < 2; i++) {
		        codes = codes + ",-";
			   }
		
		}	
		
		else if (xxtype == 14 && tztype == 1) {//前二
		    for (var i = 0; i < 3; i++) {
		        codes = codes + ",-";
		    }
		}
		else if (xxtype == 12 && tztype==18) {//前和值

		codes = codes;
		
		    
		}
		else if (xxtype != 6) {

	
	
			for(var i=0;i<5-linecounts;i++)
			{
				codes = "-,"+codes;
			}

        }
       
		var value = codes;
		if(xxtype == 6) 
		{
			value=value.replace(/大/g,"2").replace(/小/g,"1").replace(/单/g,"5").replace(/双/g,"4");
		}
		var playtypename=getplaytypename();
		var text = "["+playtypename+"]"+codes;
		//2013-1-27测试
		//alert("单倍注数");
		//2013-4-5单次投注注数不能大于512注b
		//alert(getzhushu_single(value,xxtype,tztype));
		if (Number(getzhushu_single(value,xxtype,tztype))>900) //计算注数
		{
		//	alert(Number(getzhushu_single(value,xxtype,tztype))*2+"元");
			if (!sign) {
				alert("单注金额不能超过1800元");	
				return;
			}
		}
		
		else{
			
			if(IsEXZXFS2DS)//恢复二星组选复式
			{
				tztype = "7";
			}
			
			if (sign) {
				var zhushu = Number(getzhushu_single(value,xxtype,tztype));
				zhushu = zhushu && zhushu > 0 ? zhushu : 0;
				$("#temp_select_zhushu").text(zhushu);
				$("#temp_select_money").text(zhushu * 2);
				return;
			}
			
	  //2013-4-5单次投注注数不能大于512注e	
			add_line(value,text,xxtype,tztype);
			
			clear_selectedball();
			
			//count_allzhushu();
	        ShowMoney();
			//show_money();//替换
		}
	}
	else
	{
	    //alert("请先选择至少一注投注号码" + codes + "--" + xxtype + "--" + tztype);
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
function add_paste()
{
	formatNum();
	var pastecontent = $("#pastecontent").val();


	
	var codes = pastecontent;


	if(codes == "")
	{
		alert("请先选择投注号码");
		return;
	}
	pastecontent = pastecontent.replace(/\r\n/g,"$");
	pastecontent = pastecontent.replace(/\n/g,"$");
	pastecontent = pastecontent.replace(/\s/g,"");
	pastecontent = pastecontent.replace(/(\$)\1+/g, '$1');
	
	if(pastecontent.substr(pastecontent.length-1,1)=="$")
	{
		pastecontent = pastecontent.substr(0,pastecontent.length-1);
	}
	var pastecontentArr = pastecontent.split("$");


	
	var codesshowNum = $("select#codesshow >option").length
	if(pastecontentArr.length+codesshowNum>600)
	{
		alert("总投注内容不能超过600行");
		return;
	}
	
	var errzhushu = "";
	var errzhushumsg = " [格式错误]"
	var reg1, reg2;


	//alert("aa"+xxtype + "__" + xxtype)

	if(xxtype == 1 || xxtype == 7)
	{
		reg1 = /^(?:(?:[0-9]),){4}(?:[0-9])\s*$/;
		reg2 = /^\d{5}\s*$/;
	}
	else if (xxtype == 2 || xxtype==12)
	{
		reg1 = /^(?:(?:[0-9]),){2}(?:[0-9])\s*$/;
		reg2 = /^\d{3}\s*$/;
	}

	else if (xxtype == 3 || xxtype == 14)
	{
		reg1 = /^(?:(?:[0-9]),)(?:[0-9])\s*$/;
		reg2 = /^\d{2}\s*$/;
	}
	else if (xxtype == 8 || xxtype == 13) {   
	   
	   
	   
	   
		reg1 = /^(?:(?:[0-9]),){2}(?:[0-9])\s*$/;
		reg2 = /^\d{3}\s*$/;
	}
	for(var i=0;i<pastecontentArr.length;i++) {



	      
	    var value1 = pastecontentArr[i];

		if(!reg1.test(value1)&&!reg2.test(value1))
		{
			if(errzhushu=="")
			{
				errzhushu = "第"+(i+1).toString()+"注";
			}
			else
			{
				errzhushu = errzhushu+" \n"+"第"+(i+1).toString()+"注";
			}
			continue;
		}
		if (xxtype == 8 || xxtype == 13) //组选单式要过滤三个号码相同的情况
		{

		    
	    	var lsstr=value1
			lsstr=lsstr.replace(/,/g,"");
	    	a = lsstr.substr(0,1)
			b = lsstr.substr(1,1)
			c = lsstr.substr(2,1)
			if (a==b && b==c)
			{
		
		    	if(errzhushu=="")
				{
					errzhushu = "第"+(i+1).toString()+"注";
				}
				else
				{
					errzhushu = errzhushu+"、"+"第"+(i+1).toString()+"注";
				}
			
			}
		}
		if ((xxtype == 3 || xxtype == 14) && tztype == 8) //2星组组选单式
		{
			var lsstr=value1
			sstr=lsstr.replace(/,/g,"");
			a = lsstr.substr(0,1)
			b = lsstr.substr(1,1)
			if (a==b)
			{
				if(errzhushu=="")
				{
					errzhushu = "第"+(i+1).toString()+"注";
				}
				else
				{
					errzhushu = errzhushu+"、"+"第"+(i+1).toString()+"注";
				}
			}
		}
		
	}
	if(errzhushu!="")
	{
		alert(errzhushu+" \n"+"号码有误，请核对！");
		return;
	}
	var linecounts=getlinecounts(xxtype,tztype);
	var playtypename = getplaytypename();

	//alert(pastecontentArr)

	for(var i=0;i<pastecontentArr.length;i++) {

	    var value = pastecontentArr[i];		
		
		
		if(reg2.test(value))
		{
		    if ((xxtype == 3 || xxtype == 14) && tztype == 8)
			{
			    value = value.split("").sort().join(",");

			
			}
			else
			{
				value=value.split("").join(",");
			}
		}
		if ((xxtype == 3 || xxtype == 14) && tztype == 8) //2星组组选单式
		{
		  
		}
		if (xxtype == 8 || xxtype == 13)
		{ }
		else if (xxtype == 12) {
		    for (var j = 0; j < 2; j++) {
		        value = value + ",-";
		    }
		}
		else if (xxtype == 14) {
		for (var j = 0; j < 4 - linecounts; j++) {
		    value =value + ",-";
		}
		}
		else if (xxtype != 6) {
		    for (var j = 0; j < 5 - linecounts; j++) {
		        value = "-," + value;
		    }
		}	
		var text = "["+playtypename+"]"+value;
		add_line(value,text,xxtype,tztype);
	}
	$("#pastecontent").val("");
	//count_allzhushu();
	ShowMoney();
	//show_money();//替换
}

//格式投注
function formatNum(){
    var pastecontent = $("#pastecontent").val();


   
	if (pastecontent==""){
		return;
	}
	pastecontent=pastecontent.replace(/[^\d]/g,'');
	var len= pastecontent.length
	var num=""
	var numtxt=""
	var n=0;
	var maxnum = 1;

	var playtypeid = getplaytypeid(xxtype, tztype);
	
	//alert(xxtype + "--" + tztype + "--" + playtypeid)
	
	if(playtypeid == "112" || playtypeid == "124")
	{
		maxnum=5;
	}
	else if (playtypeid == "113" || playtypeid == "703" || playtypeid == "421" || playtypeid=="426")
	{
		maxnum=3;
	}
	else if (playtypeid == "114" || playtypeid == "117" || playtypeid == "434" || playtypeid == "437")
	{
		maxnum=2;
	}



	for(var i=0; i<len; i++) {

	   // alert(n + "--" + maxnum)
		if(i%maxnum==0)
		{
			n=1;
		}
		else
		{
			n = n + 1;
		}
		if(n<maxnum)
		{
			num = num + pastecontent.substr(i,1)+",";
		}
		else 
		{
			num = num + pastecontent.substr(i,1);
			numtxt = numtxt + num + "\n";
			num = "";
		}
	}
	$("#pastecontent").val(numtxt);
}



//得到当前玩法的有效行数
function getlinecounts(type1,type2) {

   
	var linecounts = 5;
	if(type1 == 1 || type1== 7)//五星投注和五星通选
	{
		linecounts=5;
	}
	else if(type1 == 8) //三星组选
	{
	   	if(type2 == 11) //组三
		{
			linecounts=2;
		}
		else if (type2 == 12) //组六
		{
			linecounts=3;
	    }
		else if (type2 == 13) //包胆
		{
			if(bdtype==1)
			{
				linecounts=1;
			}
			else
			{
				linecounts=2;	
		    }
		}
		else if (type2 == 14) //和值
		{
			linecounts=1;	
		}
		else if (type2 == 15) //组三胆拖
		{
			linecounts=1;	
		}
		else if (type2 == 16) //组六胆拖
		{
			linecounts=1;	
		}
		else if (type2 == 2) //单式
		{
			linecounts=3;	
		}
    }


    else if (type1 == 13) //前三组选
    {
        if (type2 == 11) //组三
        {
            linecounts = 2;
        }
        else if (type2 == 12) //组六
        {
            linecounts = 3;
        }
        else if (type2 == 13) //包胆
        {
            if (bdtype == 1) {
                linecounts = 1;
            }
            else {
                linecounts = 2;
            }
        }
        else if (type2 == 14) //和值
        {
            linecounts = 1;
        }
        else if (type2 == 15) //组三胆拖
        {
            linecounts = 1;
        }
        else if (type2 == 16) //组六胆拖
        {
            linecounts = 1;
        }
        else if (type2 == 2) //单式
        {
            linecounts = 3;
        }
    }
    	
    else if(type1 == 9) //三星胆拖
	{
		linecounts=3;	
	}
	else if(type1=="2") 	
	{
		linecounts=3;
	}
	else if(type1 == 3) 
	{
		if(type2 == 7)
		{
			linecounts=2;
		}
		else if(type2 == 8)
		{
			linecounts=2;
		}
		else if(type2 == 9)
		{
			linecounts=1;
		}
		else
		{
			linecounts=2;
		}
	}
	else if(type1 == 4) 
	{
		linecounts=1;
    }
    else if (type1 == 10) {//不定位
        linecounts = 1;
    }
    else if (type1 == 11) {//定位胆
        linecounts = 5;
    }
    else if (type1 == 12) {//前三
        linecounts = 1;

    }
    else if (type1 == 14) {//前二
        linecounts = 1;

    }
	else if(type1 == 5) 
	{
		if(type2 == 3) 
		{
			linecounts=5;
		}
		else if(type2 == 4) 
		{
			linecounts=3;
		}
		else if(type2 == 5) 
		{
			linecounts=2;
		}
	}
	else if(type1 == 6) 
	{
		linecounts=2;
}


	return linecounts;
}

//拼接投注号码
function joinTZ(linecounts) {


	var tzall="";
	var tzsingle = ""
	var tzsingletwo = "";
	var tzsingnum = 0;
	var tzsingnumb = 0;
	var tzsingleture = false;
	var tzsinglesprt;

	//alert(xxtype + "__" + tztype)
	
	if(xxtype == 6) //大小单双
	{
		tzsingle = ""
		$("tr#tr_vote_6,tr#tr_vote_7").each(function(index){
			tzsingle =$(this).find("td."+SelectBallClassName).text();
			tzall += tzsingle;
			if (index<1)
			{
				tzall += ",";
			}
		})
	}
	else if ((xxtype == 3 || xxtype == 14) && (tztype == 7 || tztype == 21))//二星组选复式和组选包胆
	{


		tzsingle = ""
		$("tr#tr_vote_8").find("td."+SelectBallClassName).each(function(index){
			tzsingle = tzsingle + $(this).text()+","
		})
		tzall = tzsingle.substring(0,tzsingle.length-1);
    }


	else if((xxtype == 3 || xxtype == 14)&& (tztype == 9 || tztype == 20)) //二星直选/组选和值
	{


	
		tzsingle = ""
		$("tr#tr_vote_9").find("td."+SelectBallClassName).each(function(index){
			tzsingle = tzsingle + $(this).text()+","
		})
		tzall = tzsingle.substring(0, tzsingle.length - 1);
		
	
    }

    	
	else if ((xxtype == 8 || xxtype == 13) && (tztype == 11 || tztype == 12)) //三星组选 组三和组六
	{
	 
		tzsingle = ""
		$("tr#tr_vote_10").find("td."+SelectBallClassName).each(function(index){
			tzsingle = tzsingle + $(this).text()+","
		})
		tzall = tzsingle.substring(0, tzsingle.length - 1);
		
    }



    else if ((xxtype == 8 || xxtype == 13) && tztype == 13) //三星组选包胆
	{
		tzsingle = "";
		tzsingletwo = "";


		
		if (bdtype==1)
		{
			$("tr#tr_vote_11").find("td."+SelectBallClassName).each(function(index){
				tzsingle = tzsingle + $(this).text()+","
			})
			tzall = tzsingle.substring(0,tzsingle.length-1);
		}
		else
		{
			if($("tr#tr_vote_11").find("td."+SelectBallClassName).length ==1)
			{
				tzsingle = $("tr#tr_vote_11").find("td."+SelectBallClassName).text()
			}
			if($("tr#tr_vote_12").find("td."+SelectBallClassName).length ==1)
			{
				tzsingletwo = $("tr#tr_vote_12").find("td."+SelectBallClassName).text()
            }
            if (tzsingletwo != "") {
                tzall = tzsingle + "," + tzsingletwo;
            }
            else {
                tzall = tzsingle;
            }
            
		
		}
	}
	else if ((xxtype == 8 || xxtype == 13) && tztype == 14) //三星组选和值
	{
		tzsingle = "";
		$("tr#tr_vote_13,tr#tr_vote_14").find("td."+SelectBallClassName).each(function(index){
			tzsingle = tzsingle + $(this).text()+","
		})
		tzall = tzsingle.substring(0,tzsingle.length-1);
	}
	else if ((xxtype == 8 || xxtype == 13) && tztype == 22) //三星组三和值
	{
		tzsingle = "";
		$("tr#tr_vote_18,tr#tr_vote_19").find("td."+SelectBallClassName).each(function(index){
			tzsingle = tzsingle + $(this).text()+","
		})
		tzall = tzsingle.substring(0,tzsingle.length-1);
	}
	else if ((xxtype == 8 || xxtype == 13) && tztype == 23) //三星组六和值
	{
		tzsingle = "";
		$("tr#tr_vote_20,tr#tr_vote_21").find("td."+SelectBallClassName).each(function(index){
			tzsingle = tzsingle + $(this).text()+","
		})
		tzall = tzsingle.substring(0,tzsingle.length-1);
	}
	else if(xxtype == 9 && tztype == 15) //三星组三胆拖
	{
		tzsingle = "";
		tzsingnum = $("tr#tr_vote_15").find("td."+SelectBallClassName).length;
		tzsingle = tzsingle + $("tr#tr_vote_15").find("td."+SelectBallClassName).text()+";"
		if(tzsingnum==1)
		{
			tzsingletwo = "";
			tzsingnumb = 0;
			tzsingleture = false;
			tzsingnum=$("tr#tr_vote_16").find("td."+SelectBallClassName).length;
			$("tr#tr_vote_16").find("td."+SelectBallClassName).each(function(index){
				tzsingletwo = tzsingletwo + $(this).text()+","
				if (($(this).text() + ";")==tzsingle)
				{
					tzsingleture = true;
					return false;
				}
			})
			if(tzsingleture)
			{
				tzall="";
			}
			else
			{
				if ((tzsingnum+tzsingnumb) >= 2)
				{
					tzall = tzsingle + tzsingletwo;
		        	tzall = tzall.substr(0,tzall.length-1);
				}
				else
				{
					tzall = ""; 
				}
			}
		}
		else {
		
		
			tzall = ""; 
		}
	}
	else if(xxtype == 9 && tztype == 16) //三星组六胆拖
	{
		tzsingle = "";
		tzsingnum=$("tr#tr_vote_15").find("td."+SelectBallClassName).length;
		$("tr#tr_vote_15").find("td."+SelectBallClassName).each(function(index){
			tzsingle = tzsingle + $(this).text()+","
		})
		tzsingle = tzsingle.substr(0,tzsingle.length-1);
		tzsinglesprt = tzsingle.split(",");
		tzsingle = tzsingle + ";";
		if(tzsingnum > 0 && tzsingnum <= 2)
		{
			tzsingletwo = "";
			tzsingnumb = 0;
			tzsingleture = false;
			tzsingnum=$("tr#tr_vote_16").find("td."+SelectBallClassName).length;
			$("tr#tr_vote_16").find("td."+SelectBallClassName).each(function(index){
				tzsingletwo = tzsingletwo + $(this).text()+","
				for (var S=0;S<tzsinglesprt.length;S++)
				{
					if ($(this).text() == tzsinglesprt[S])
					{
						tzsingleture=true;
						break;
					}
				}
				if (tzsingleture)
				{
					return false;
				}
			})
			if(tzsingleture)
			{
				tzall="";
			}
			else
			{
				if ((tzsingnum+tzsingnumb)>=4)
				{
					tzall = tzsingle + tzsingletwo;
		        	tzall = tzall.substr(0,tzall.length-1);
				}
				else
				{
					tzall = ""; 
				}
			}
		}
		else
		{
			tzall = ""; 
		}
	}
	else if(xxtype == 9 && tztype == 19) //三星直选胆拖
	{
		tzsingle = "";
		tzsingnum=$("tr#tr_vote_15").find("td."+SelectBallClassName).length;
		$("tr#tr_vote_15").find("td."+SelectBallClassName).each(function(index){
			tzsingle = tzsingle + $(this).text()+","
		})
		tzsingle = tzsingle.substr(0,tzsingle.length-1);
		tzsinglesprt = tzsingle.split(",");
		tzsingle = tzsingle + ";";
		if(tzsingnum > 0 && tzsingnum <= 2)
		{
			tzsingletwo = "";
			tzsingnumb = 0;
			tzsingleture = false;
			tzsingnum=$("tr#tr_vote_16").find("td."+SelectBallClassName).length;
			$("tr#tr_vote_16").find("td."+SelectBallClassName).each(function(index){
				tzsingletwo = tzsingletwo + $(this).text()+","
				for (var S=0;S<tzsinglesprt.length;S++)
				{
					if ($(this).text() == tzsinglesprt[S])
					{
						tzsingleture=true;
						break;
					}
				}
				if (tzsingleture)
				{
					return false;
				}
			})
			if(tzsingleture)
			{
				tzall="";
			}
			else
			{
				if ((tzsingnum+tzsingnumb)>=3)
				{
					tzall = tzsingle + tzsingletwo;
		        	tzall = tzall.substr(0,tzall.length-1);
				}
				else
				{
					tzall = ""; 
				}
			}
		}
		else
		{
			tzall = ""; 
		}
	}
	else if(xxtype == 2 && tztype == 17)  //三星直选 组合
	{
		tzsingle = "";
		$("tr#tr_vote_17").find("td."+SelectBallClassName).each(function(index){
			tzsingle = tzsingle + $(this).text()+","
		})
		tzall = tzsingle.substring(0,tzsingle.length-1);
	}
	else if(xxtype == 2 && tztype == 18) //三星直选和值
	{
		tzsingle = "";
		$("tr#tr_vote_13,tr#tr_vote_14").find("td."+SelectBallClassName).each(function(index){
			tzsingle = tzsingle + $(this).text()+","
		})
		tzall = tzsingle.substring(0,tzsingle.length-1);
    }
    
    else if (xxtype == 12 && tztype == 1) //前三
    {
        
    
        for (var i =1; i < 4; i++) {
            tzsingle = "";



            $("tr#tr_vote_" + i.toString()).find("td." + SelectBallClassName).each(function(index) {
                tzsingle = tzsingle + $(this).text()
            })
            tzall += tzsingle;

           
            if (i < 3) {
                tzall += ",";
            }

        }

    }


    else if (xxtype == 14 && tztype == 1) //前二
    {


        for (var i = 1; i < 3; i++) {
            tzsingle = "";



            $("tr#tr_vote_" + i.toString()).find("td." + SelectBallClassName).each(function(index) {
                tzsingle = tzsingle + $(this).text()
            })
            tzall += tzsingle;

            if (i < 2) {
                tzall += ",";
            }
        }
        

    }
    
    else if (xxtype == 12 && tztype == 18) //三星直选和值
    {
        tzsingle = "";
        $("tr#tr_vote_13,tr#tr_vote_14").find("td." + SelectBallClassName).each(function(index) {
            tzsingle = tzsingle + $(this).text() + ","
        })
        tzall = tzsingle.substring(0, tzsingle.length - 1);

        
    }
	else {


	 
		for (var i = 6 - linecounts; i < 6; i++)
		{
		    tzsingle = "";

        
		  
			$("tr#tr_vote_"+i.toString()).find("td."+SelectBallClassName).each(function(index){
				tzsingle = tzsingle + $(this).text()
			})
			tzall += tzsingle;

		
			if (i < 5)
			{
				tzall += ",";
			}
			
		}
    }

    //alert(tzall)
	return tzall;
}

//得到当前玩法的注数
function getzhushu_single(codes,type1,type2) {

    //alert(type1 + "---" + type2);
   
	var zs = 0;

	try {
		var playtypeid = getplaytypeid(type1, type2);
		//alert(playtypeid)
	
		if (playtypeid == "116" || playtypeid == "433")//二星组选复式
		{
			var l = codes.split(",").length;
			zs = l*(l-1)/2;
		}
		else if (playtypeid == "117" || playtypeid == "434")//二星组选单式
		{
			zs = 1;
		}
		else if (playtypeid == "118" || playtypeid == "435")//二星组选和值
		{
			var arrcode = codes.split(",");	
			for (var i=0; i<arrcode.length; i++)
			{
				zs += zhs_exzxhz[arrcode[i]];
			}
		}
		else if (playtypeid == "315" || playtypeid == "415")  //组三
		{
			var arrcode = codes.split(",");	
			var n = arrcode.length;
			var ddbase = 2;
			var ddmp = 2;
			zs = fwmathC(n,ddbase)*ddmp;
	    }
	    else if (playtypeid == "313" || playtypeid == "424")  //组三单式
		{
			zs = 1;
	    }
	    else if (playtypeid == "316" || playtypeid == "416")  //组六
		{
			var arrcode = codes.split(",");	
			var n = arrcode.length;
			 var ddbase=3;
			var ddmp=1;
			zs=fwmathC(n,ddbase)*ddmp;
	    }
	    else if (playtypeid == "314" || playtypeid == "425")  //组六单式
		{
			zs = 1;
	    }
		else if(playtypeid == "317")  //组选包胆
		{
			var arrcode = codes.split(",");
			var n = arrcode.length;
			if(n==1){
				zs=55
			}
			else if(n==2){
				zs=10
			}
			else{
				zs=0 
			}
	    }
	    else if (playtypeid == "318" || playtypeid == "418")//三星组选和值
		{
			var arrcode = codes.split(",");	
			for (var i=0; i<arrcode.length; i++)
			{
				zs += zhs_ex3xzxhz[arrcode[i]];
			}
		}
		else if (playtypeid == "705" || playtypeid == "419")//三星组三和值
		{
			var arrcode = codes.split(",");	
			for (var i=0; i<arrcode.length; i++)
			{
				zs += zhs_ex3xz3hz[arrcode[i]];
			}
		}
		else if (playtypeid == "706" || playtypeid == "420")//三星组六和值
		{
			var arrcode = codes.split(",");	
			for (var i=0; i<arrcode.length; i++)
			{
				zs += zhs_ex3xz6hz[arrcode[i]];
			}
		}
		else if(playtypeid == "701")  //组三胆拖
		{
			var arrcode = codes.split(";");
			var arrcodea = arrcode[0].split(",");
			var arrcodeb = arrcode[1].split(",");
			var cnun = arrcodea.length;
			var cnum = arrcodeb.length;
			var ddmp=2;
			var numbase=2;
			zs=fwmathC(cnum,numbase-cnun)*ddmp;
	    }
		else if(playtypeid == "702")  //组六胆拖
		{
			var arrcode = codes.split(";");
			var arrcodea = arrcode[0].split(",");
			var arrcodeb = arrcode[1].split(",");
			var cnun = arrcodea.length;
			var cnum = arrcodeb.length;
			var ddmp=1;
			var numbase=3;
			zs=fwmathC(cnum,numbase-cnun)*ddmp;
	    }
		else if(playtypeid == "703")  //组选单式
		{
			zs = 1;	
		}
		else if(playtypeid=="319")  //直选组合复式
		{
			var arrcode = codes.split(",");	
			var n = arrcode.length;
			var ddbase=3;
			var ddmp=6;
			zs=fwmathC(n,ddbase)*ddmp;	
		}
		else if (playtypeid == "304" || playtypeid == "708")//三星直选和值
		{
			var arrcode = codes.split(",");	
			for (var i=0; i<arrcode.length; i++)
			{
				zs += zhs_ex3xhz[arrcode[i]];
			}
		}
		else if(playtypeid=="704")  //直选胆拖
		{
			var arrcode = codes.split(";");
			var arrcodea = arrcode[0].split(",");
			var arrcodeb = arrcode[1].split(",");
			var cnun = arrcodea.length;
			var cnum = arrcodeb.length;
			var ddmp=6;
			var numbase=3;
			zs=fwmathC(cnum,numbase-cnun)*ddmp;
	    }
		else if(playtypeid=="305") //二星直选和值
		{
			var arrcode = codes.split(",");	
			for (var i=0; i<arrcode.length; i++)
			{
				zs += zhs_ex2xcxhz[arrcode[i]];
			 }
	    }
	    else if (playtypeid == "432") //二星直选和值
	    {
	        var arrcode = codes.split(",");
	        for (var i = 0; i < arrcode.length; i++) {
	            zs += zhs_ex2xcxhz[arrcode[i]];
	        }
	    }
		else if(playtypeid=="311") //二星组选包胆
		{
			var arrcode = codes.split(",");	
			zs += arrcode.length*10;
	    }
	
	    else if (playtypeid == "121") //定位胆
	    {
	
	
	
	        var arrcode = codes.split(",");
	
	        for (var i = 0; i < arrcode.length; i++) {
	
	            zs += arrcode[i].length;
	            
	        }
	    
	    }
	
		
		else {
	
	
		    var linecounts = getlinecounts(type1, type2);
	
		    var arrcode = codes.split(",");
	
		    //alert(arrcode.length);
			zs = 1;
		
			for (var i=0; i<arrcode.length; i++)
			{
			    zs *= arrcode[i].length;
			   
			    
			    
			   
			}
			
			if(playtypeid=="108")
			{
				zs *= 4;
			}
			else if(playtypeid=="109")
			{
				zs *= 3;
			}
			else if(playtypeid=="110")
			{
				zs *= 2;
			}
		}
		
	} catch (e) {
	}

	return zs;
}

//得到当前玩法名
function getplaytypename()
{
    var playtypename = "";

    //alert("x:"+xxtype +"---t-"+tztype);

    if (tztype == 1)//复式
    {
        if (xxtype == 1) {
            playtypename = "五星复式";
        }
        else if (xxtype == 2) {
            playtypename = "三星复式";
        }
        else if (xxtype == 3) {
            playtypename = "二星复式";
        }
        else if (xxtype == 14) {
            playtypename = "前二星复式";
        }
        else if (xxtype == 4) {
            playtypename = "一星复式";
        }
        else if (xxtype == 6) {
            playtypename = "大小单双";
        }
        else if (xxtype == 7) {
            playtypename = "五星通选";
        }
        else if (xxtype == 11) {
            playtypename = "定位胆";
        }
        else if (xxtype == 12) {
            playtypename = "前三复式";
        }
    }
    else if (tztype == 2)//单式
    {
        if (xxtype == 1) {
            playtypename = "五星单式";
        }
        else if (xxtype == 2) {
            playtypename = "后三直选单式";
        }
        else if (xxtype == 12) {
            playtypename = "前三直选单式";
        }
        else if (xxtype == 3) {
            playtypename = "二星直选单式";
        }
        else if (xxtype == 14) {
            playtypename = "前二直选单式";
        }
        if (xxtype == 7) {
            playtypename = "五星通选单式";
        }
        if (xxtype == 8 && tztype == 2) {
            playtypename = "后三星组选单式";
        }
        if (xxtype == 13 && tztype == 2) {
            playtypename = "前三星组选单式";
        }
    }
    else if (tztype == 3) {
        if (xxtype == 5) playtypename = "五星组合";
    }
    else if (tztype == 4) {
        if (xxtype == 5) playtypename = "三星组合";
    }
    else if (tztype == 5) {
        if (xxtype == 5) playtypename = "二星组合";
    }
    else if (xxtype == 3 && tztype == 7) {
        playtypename = "二星组选复式";
    }
    else if (xxtype == 14 && tztype == 7) {
        playtypename = "前二组选复式";
    }
    else if (xxtype == 14 && tztype == 8) {
        playtypename = "前二组选单式";
    }
    else if (xxtype == 3 && tztype == 8) {
        playtypename = "二星组选单式";
    }
    else if (xxtype == 3 && tztype == 9) {
        playtypename = "二星组选和值";
    }
    else if (xxtype == 14 && tztype == 9) {
        playtypename = "前二组选和值";
    }
    else if (tztype == 11 && xxtype == 13) {
        playtypename = "前三组三";
    }
    else if (tztype == 11 && xxtype == 8) {

        playtypename = "后三组三";
    }
    else if (tztype == 12 && xxtype == 13) {

        playtypename = "前三组六";
    }
    else if (tztype == 12 && xxtype == 8) {

        playtypename = "后三组六";
    }
    else if (tztype == 13) {
        playtypename = "包胆";
    }
    else if (tztype == 14 && xxtype == 13) {
        playtypename = "前三星组选和值";
    }
    else if (tztype == 14 && xxtype == 8) {
        playtypename = "后三星组选和值";
    }
    else if (tztype == 15) {
        playtypename = "三星组三胆拖";
    }
    else if (tztype == 16) {
        playtypename = "三星组六胆拖";
    }
    else if (tztype == 17) {
        playtypename = "三星组合复式";
    }
    else if (xxtype == 2 && tztype == 18) {

        playtypename = "后三和值";
    }
    else if (xxtype == 12 && tztype == 18) {
        playtypename = "前三和值";
    }
    else if (tztype == 19) {
        playtypename = "三星直选胆拖";
    }
    else if (xxtype == 14 && tztype == 20) {
        playtypename = "前二直选和值";
    }
    else if (xxtype == 3 && tztype == 20) {
        playtypename = "二星直选和值";
    }
    else if (xxtype == 3 && tztype == 21) {
        playtypename = "二星组选包胆";
    }
    else if (xxtype == 14 && tztype == 21) {
        playtypename = "前二组选包胆";
    }
    else if (xxtype == 13 && tztype == 110) {
        playtypename = "前组三单式";
    }
    else if (xxtype == 13 && tztype == 120) {
        playtypename = "前组六单式";
    }
    else if (xxtype == 8 && tztype == 110) {
        playtypename = "组三单式";
    }
    else if (xxtype == 8 && tztype == 120) {
        playtypename = "组六单式";
    }
    else if (tztype == 22 && xxtype == 13) {
        playtypename = "前三星组三和值";
    }
    else if (tztype == 22 && xxtype == 8) {
        playtypename = "后三星组三和值";
    }
    else if (tztype == 23 && xxtype == 13) {
        playtypename = "前三星组六和值";
    }
    else if (tztype == 23 && xxtype == 8) {
        playtypename = "后三星组六和值";
    }
    else if (tztype == 24) {//不定位
        playtypename = "前三不定位";
    }
    else if (tztype == 25) {//不定位
        playtypename = "后三不定位";
    }

   
	return playtypename;
}


//通过选择类型和投注类型得到玩法ID
function getplaytypeid(type1,type2) {


   // alert(type1 + "----" + type2)

	var playtypeid = "";
	if (type2 == 1) {
	    if (type1 == 1) {
	        playtypeid = "104";
	    }
	    else if (type1 == 2) {
	        playtypeid = "105";
	    }
	    else if (type1 == 3) {
	        playtypeid = "106";
	    }
	    else if (type1 == 14) {//前二星复式
	        playtypeid = "431";
	    }
	    else if (type1 == 4) {
	        playtypeid = "107";
	    }
	    else if (type1 == 6) {
	        playtypeid = "111";
	    }
	    else if (type1 == 7) {
	        playtypeid = "124";
	    }
	    else if (type1 == 11) {//定位胆
	        playtypeid = "121";
	    }
	    else if (type1 == 12) {//前三复试
	        playtypeid = "125";
	    }

	}
	
	else if (type2 == 2) {
	    if (type1 == 1) {
	        playtypeid = "112";
	    }
	    else if (type1 == 2) {//后三单式
	        playtypeid = "113";
	    }
	    else if (type1 == 3) {
	        playtypeid = "114";
	    }
	    else if (type1 == 14) {
	        playtypeid = "437";
	    }
	    else if (type1 == 7) {
	        playtypeid = "124";
	    }
	    else if (type1 == 8) {
	        playtypeid = "703";
	    }
	    else if (type1 == 13) {//前三星组选单式
	        playtypeid = "426";
	    }
	    else if (type1 == 12) {//前三单式
	        playtypeid = "421";
	    }
	}
	else if (type2 == 3) {
	    if (type1 == 5) {
	        playtypeid = "108";
	    }
	}
	else if (type2 == 4) {
	    if (type1 == 5) {
	        playtypeid = "109";
	    }
	}
	else if (type2 == 5) {
	    if (type1 == 5) {
	        playtypeid = "110";
	    }
	}
	else if (type1==3&&type2 == 7) {
	    playtypeid = "116";
	}
	else if (type1 == 3 && type2 == 8) {
	    playtypeid = "117";
	}
	else if (type1 == 3 && type2 == 9) {
	    playtypeid = "118";
	}


	else if (type1 == 14 && type2 == 7) {
	    playtypeid = "433";
	}
	else if (type1 == 14 && type2 == 8) {
	    playtypeid = "434";
	}
	else if (type1 == 14 && type2 == 9) {
	    playtypeid = "435";
	}
	
	else if (type1==8&&type2 == 11)//组三
	{
	    playtypeid = "315";
	}
	else if (type1 == 13 && type2 == 11)//组三
	{
	    playtypeid = "415";
	}
	else if (type1 == 8 && type2 == 12)//组六
	{
	    playtypeid = "316";
	}
	else if (type1 == 13 && type2 == 12)//组六
	{
	    playtypeid = "416";
	}
	else if (type1 == 8 && type2 == 13) //组选包胆
	{
	    playtypeid = "317";
	}
	else if (type1 == 13 && type2 == 13) //组选包胆
	{
	    playtypeid = "417";
	}
	else if (type1 == 8 && type2 == 14) //组选合值
	{
	    playtypeid = "318";
	}
	else if (type1 == 13 && type2 == 14) //组选合值
	{
	    playtypeid = "418";
	}
	else if (type2 == 15) //组三胆拖
	{
	    playtypeid = "701";
	}
	else if (type2 == 16) //组六胆拖
	{
	    playtypeid = "702";
	}
	else if (type2 == 17) //三星直选组合
	{
	    playtypeid = "319";
	}
	else if (type1==2&&type2 == 18) //后三和值
	{
	       playtypeid = "304";
	}
	else if (type1 == 12 && type2 == 18) //前三和值
	{
	    playtypeid = "708";
	}
	else if (type2 == 19) //三星直选胆拖
	{
	    playtypeid = "704";
	}
	else if (type1==3&&type2 == 20) //二星直选和值
	{
	    playtypeid = "305";
	}
	else if (type1==14&&type2 == 20) //二星直选和值
	{
	    playtypeid = "432";
	}
	else if (type1 == 14 && type2 == 21) //二星组选包胆
	{
	    playtypeid = "311";
	}
	else if (type1 == 14 && type2 == 21) //前二星组选包胆
	{
	    playtypeid = "436";
	}
	else if (type1 == 8 && type2 == 110) //组三单式
	{
	    playtypeid = "313";
	}
	else if (type1 == 8 && type2 == 120) //组六单式
	{
	    playtypeid = "314";
	}
	else if (type1 == 13 && type2 == 110) //组三单式
	{
	    playtypeid = "424";
	}
	else if (type1 == 13 && type2 == 120) //组六单式
	{
	    playtypeid = "425";
	}
	else if (type1 == 8 && type2 == 22) //三星组三和值
	{
	    playtypeid = "705";
	}
	else if (type1 == 13 && type2 == 22) //三星组三和值
	{
	    playtypeid = "419";
	}
	else if (type1 == 8 && type2 == 23) //三星组六和值
	{
	    playtypeid = "706";
	}
	else if (type1 == 13 && type2 == 23) //三星组六和值
	{
	    playtypeid = "420";
	}
	else if (type2 == 24) {//前三不定位
	    playtypeid = "120";
	}
	else if (type2 == 25) {//后三不定位
	    playtypeid = "119";
	}

  
    
	return playtypeid;
}



//组合个数
function fwmathC(n,m)
{
	var n1=1, n2=1;
	for (var i=n,j=1; j<=m; n1*=i--,n2*=j++);
	return n1/n2;
}

//通过玩法ID得到玩法名
function getpalynamebyid(id) {


	var palyname="";
	if(id=="104")
	{
		palyname="五星复式";
	}
	else if(id=="105")
	{
		palyname="三星复式";
	} 
	else if(id=="106")
	{
		palyname="二星复式";
    }
    else if (id == "431") {
        palyname = "前二星复式";
    }
	else if(id=="107")
	{
		palyname="一星复式";
    }
 
 	else if(id=="108")
	{
		palyname="五星组合";
	}
	else if(id=="109")
	{
		palyname="三星组合";
	} 
	else if(id=="110")
	{
		palyname="二星组合";
	}
	else if(id=="111")
	{
		palyname="大小单双";
	}
	else if(id=="112")
	{
		palyname="五星单式";
	}
	else if(id=="113")
	{
		palyname="后三直选单式";
    }
    else if (id == "421") {
        palyname = "前三直选单式";
    }
	else if(id=="114")
	{
		palyname="二星直选单式";
    }
    else if (id == "437") {
        palyname = "前二直选单式";
    }
	else if(id=="115")
	{
		palyname="混投";
	}
	else if(id=="116")
	{
		palyname="二星组选复式";
    }
    
	else if(id=="117")
	{
		palyname="二星组选单式";
	}
	else if(id=="118")
	{
		palyname="二星组选和值";
    }



    else if (id == "433") {
        palyname = "前二组选复式";
    }

    else if (id == "434") {
        palyname = "前二组选单式";
    }
    else if (id == "435") {
        palyname = "前二组选和值";
    }
    
    
	else if(id=="124")
	{
		palyname="五星通选";
	}
	else if(id=="315")
	{
		palyname="组三";
	}
	else if(id=="316")
	{
		palyname="组六";
	}
	else if(id=="313")
	{
		palyname="组三单式";
	}
	else if(id=="314")
	{
	    palyname="组六单式";
    }
    else if (id == "424") {
        palyname = "前组三单式";
    }
    else if (id == "425") {
        palyname = "前组六单式";
    }
	else if(id=="317")
	{
		palyname="包胆";
	}
	else if(id=="318")
	{
		palyname="三星组选和值";
	}
	
	else if(id=="701")
	{
		palyname="三星组三胆拖";
	}
	else if(id=="702")
	{
		palyname="三星组六胆拖";
	}
	else if(id=="703")
	{
		palyname="三星组选单式";
    }
    else if (id == "426") {
        palyname = "前三组选单式";
    }
	else if(id=="319")
	{
		palyname="三星组合复式";
	}
	else if(id=="304")
	{
		palyname="三星直选和值";
	}
	else if(id=="704")
	{
		palyname="三星直选胆拖";
	}
	else if(id=="305")
	{
		palyname="二星直选和值";
    }
    else if (id == "432") {
        palyname = "前二直选和值";
    }
	else if(id=="311")
	{
		palyname="二星组选包胆";
    }
    else if (id == "436") {
        palyname = "前二组选包胆";
    }
	else if(id=="705")
	{
		palyname="后三星组三和值";
	}
	else if(id=="706")
	{
		palyname="后三星组六和值";
    }
    else if (id == "416") {
        palyname = "前三组六";
    }
    else if (id == "418") {
        palyname = "前三星组选和值";
    }
    else if (id == "419") {
        palyname = "前三星组三和值";
    }
    else if (id == "420") {
        palyname = "前三星组六和值";
    }
    else if (id == "125") {
        palyname = "前三复式";
    }
    else if (id == "708") {
        palyname = "前三和值";
    }
    else if (id == "121") {
        palyname = "定位胆";
    }
    else if (id == "119") {
        palyname = "后三不定位";
    }
    else if (id == "120") {
        palyname = "前三不定位";
    }
    else if (id == "415") {
        palyname = "前三组三";
    }
	    return palyname;
    }
//2013-1-24
//通过玩法ID得到奖金
function getpalyJj(id) {
 //2013-1-27
  //  alert(id);
  if( id == "125" || id == "708" || id == "421" || id=="105" || id=="304" || id=="113")//三星直选
	{
		palyMoney="1800";
	} 
	else if(id=="313" || id == "424"|| id == "415"|| id == "315"|| id == "419"|| id == "705")//三星组三
	{
		palyMoney="600";
	}
	else if(id=="314" || id == "425"|| id == "416"|| id == "316" || id == "420" || id == "706")//组六单式
	{
	    palyMoney="300";
    }
    else if (id == "418" || id == "318" || id == "426" || id == "703" || id == "120" || id == "119" || id == "121") //前三星组选和值不参与倍投
	{
        palyMoney = "0";
    }
   
	else if(id=="106" || id == "431" || id == "437" || id == "114" || id == "432" || id == "305")//二星复式
	{
		palyMoney="180";
    }
    else if (id == "434"|| id == "433" || id == "116" || id == "117" || id == "435" || id == "118")//前二组选单式
	 {
        palyMoney = "80";
    }
	else if(id=="111")//大小单双
	{
		palyMoney="4";
	}
   return palyMoney;
    }

//向投注框里添加一行号码
function add_line(value,text,type1,type2)
{
	
	$("select#codesshow").append("<option value='"+value+"|"+type1+"|"+type2+"'>"+text+"</option>");
    $("#btBonus").val(getpalyJj(getplaytypeid(type1,type2)));//2013-1-24
}

//统计投注框里的号码注数
function count_allzhushu()
{
	zhushu = 0;
	$("select#codesshow > option").each(function(){
		var value = $(this).val();
		var valueArr = value.split("|");
		var code = valueArr[0];
		var type1 = Number(valueArr[1]);
		var type2 = Number(valueArr[2]);
		var num = getzhushu_single(code,type1,type2)
		if (num == 0)
		{
			return false;			
		}
		else
		{
			zhushu += num;
		
		}
		
	});	
		
}

//统计选择的期号数、每期投注金额、总金额并显示
function show_money()
{ 

    var singlezhushu = zhushu;

	$("#zhushushow2").text(singlezhushu)
	$("#moneyshow2").text(singlezhushu*2)
		
	var expectlistsuc1 = $("#expectlistsuc1").val();
	var expectlistsuc2 = $("#expectlistsuc2").val();
	var expectlistsuc3 = $("#expectlistsuc3").val();
	//var expectlistsuc4 = $("#expectlistsuc4").val();//2013-1-24
	var beishulistsuc1 = $("#beishulistsuc1").val();
	var beishulistsuc2 = $("#beishulistsuc2").val();
	var beishulistsuc3 = $("#beishulistsuc3").val();
	
	var expectlistsuc=JoinExpect(expectlistsuc1,expectlistsuc2,expectlistsuc3);
	var beishulistsuc=JoinBeishu(beishulistsuc1,beishulistsuc2,beishulistsuc3);
	
	var expectlistsucArr = expectlistsuc.split(",");
	var beishulistsucArr = beishulistsuc.split(",");
	
	var expectnum = 0;
	var allmoney = 0;
	if(expectlistsuc.length>0)
	{
		expectnum = expectlistsucArr.length;
	}
	
	$("#TzList > table > tbody > tr > td > input[name=beishu_show]").each(function(){
		var value = Number($(this).val());
		$(this).next().text(value*singlezhushu*2)
	});
	for(var i=0;i<expectlistsucArr.length;i++)
	{
		var expectmoney = beishulistsucArr[i]*2*singlezhushu;
		allmoney = allmoney+expectmoney;
	}
	$("#expectnumshow").text(expectnum)
	$("#moneyshow3").text(allmoney)
	
	if(expectnum>=1)
	{
		$("#IsZhuihao").attr("checked",true);
	}
	else
	{
		$("#IsZhuihao").attr("checked",false); //2013-1-3 false ---true
	}
	$("#batchexpectsel").val(expectnum);
	SetIsStop();
}

//清除用户选择的号码
function clear_selectedball() {


   // alert(xxtype + "---" + tztype)
	if (xxtype == 9)  //三星胆拖
	{
		$("tr#tr_vote_15,tr#tr_vote_16").find("td.ball_r").removeClass(SelectBallClassName);
	}
	else if(xxtype == 8) //三星组选
	{
		if(tztype == 11 || tztype == 12)//组三组六
		{
			$("tr#tr_vote_10").find("td.ball_r").removeClass(SelectBallClassName);
			
		}
		if(tztype == 13)//包胆
		{
			$("tr#tr_vote_11,tr#tr_vote_12").find("td.ball_r").removeClass(SelectBallClassName);
		}
		if(tztype == 14)//和值
		{
			$("tr#tr_vote_13,tr#tr_vote_14").find("td.ball_r").removeClass(SelectBallClassName);
		}
		if(tztype == 22)//组三和值
		{
			$("tr#tr_vote_18,tr#tr_vote_19").find("td.ball_r").removeClass(SelectBallClassName);
		}
		if(tztype == 23)//组六和值
		{
			$("tr#tr_vote_20,tr#tr_vote_21").find("td.ball_r").removeClass(SelectBallClassName);
		}
    }
    else if (xxtype == 13) //三星组选
    {
        if (tztype == 11 || tztype == 12)//组三组六
        {
            $("tr#tr_vote_10").find("td.ball_r").removeClass(SelectBallClassName);
        }
        if (tztype == 13)//包胆
        {
            $("tr#tr_vote_11,tr#tr_vote_12").find("td.ball_r").removeClass(SelectBallClassName);
        }
        if (tztype == 14)//和值
        {
            $("tr#tr_vote_13,tr#tr_vote_14").find("td.ball_r").removeClass(SelectBallClassName);
        }
        if (tztype == 22)//组三和值
        {
            $("tr#tr_vote_18,tr#tr_vote_19").find("td.ball_r").removeClass(SelectBallClassName);
        }
        if (tztype == 23)//组六和值
        {
            $("tr#tr_vote_20,tr#tr_vote_21").find("td.ball_r").removeClass(SelectBallClassName);
        }
    }
	else if(xxtype == 2) //三星直选
	{
		if(tztype == 1) //直选复式
		{
			$("tr#tr_vote_3,tr#tr_vote_4,tr#tr_vote_5").find("td.ball_r").removeClass(SelectBallClassName);
		}
		if(tztype == 17) //直选复式
		{
			$("tr#tr_vote_17").find("td.ball_r").removeClass(SelectBallClassName);
		}
		if(tztype == 18)//和值
		{
			$("tr#tr_vote_13,tr#tr_vote_14").find("td.ball_r").removeClass(SelectBallClassName);
		}
    }
    else if (xxtype == 12) //前三星直选
    {
        if (tztype == 1) //直选复式
        {
            $("tr#tr_vote_1,tr#tr_vote_2,tr#tr_vote_3").find("td.ball_r").removeClass(SelectBallClassName);
        }
        if (tztype == 17) //直选复式
        {
            $("tr#tr_vote_17").find("td.ball_r").removeClass(SelectBallClassName);
        }
        if (tztype == 18)//和值
        {
            $("tr#tr_vote_13,tr#tr_vote_14").find("td.ball_r").removeClass(SelectBallClassName);
        }
    }
    else if (xxtype == 11) //定位胆
    {
        if (tztype == 1) //直选复式
        {
            $("tr#tr_vote_1,tr#tr_vote_2,tr#tr_vote_3,tr#tr_vote_4,tr#tr_vote_5").find("td.ball_r").removeClass(SelectBallClassName);
        }

    }
    else if (xxtype == 10) //定位胆
    {
        if (tztype == 25 || tztype == 24) //直选复式
        {
            $("tr#tr_vote_5").find("td.ball_r").removeClass(SelectBallClassName);
        }

    }
	else if(xxtype == 7) //五星通选
	{
		if(tztype == 1) 
		{
			$("tr#tr_vote_1,tr#tr_vote_2,tr#tr_vote_3,tr#tr_vote_4,tr#tr_vote_5").find("td.ball_r").removeClass(SelectBallClassName);
		}
	}
	else if(xxtype == 1) //五星直选
	{
		if(tztype == 1) 
		{
			$("tr#tr_vote_1,tr#tr_vote_2,tr#tr_vote_3,tr#tr_vote_4,tr#tr_vote_5").find("td.ball_r").removeClass(SelectBallClassName);
		}
	}
	else if(xxtype == 3) //二星直选
	{
		if(tztype == 1) //直选复式
		{
			$("tr#tr_vote_4,tr#tr_vote_5").find("td.ball_r").removeClass(SelectBallClassName);
		}
		if(tztype == 8|| tztype == 7 || tztype == 21) //直选复式
		{
			$("tr#tr_vote_8").find("td.ball_r").removeClass(SelectBallClassName);
		}
		if(tztype == 9 || tztype == 20) //和值
		{
			$("tr#tr_vote_9").find("td.ball_r").removeClass(SelectBallClassName);
		}
		//if(tztype == 8)//单式
		//{
		//	$("#pastecontent").val("");
		//}
    }


    else if (xxtype == 14) //前二星直选
    {

     
        if (tztype == 1) //直选复式
        {
            $("tr#tr_vote_1,tr#tr_vote_2").find("td.ball_r").removeClass(SelectBallClassName);
        }
        if (tztype == 8 || tztype == 7 || tztype == 21) //直选复式
        {
        
           
            $("tr#tr_vote_8").find("td.ball_r").removeClass(SelectBallClassName);
        }
        if (tztype == 9 || tztype == 20) //和值
        {
            $("tr#tr_vote_9").find("td.ball_r").removeClass(SelectBallClassName);
        }
      
    }
	
	else if(xxtype == 4) //一星直选
	{
		if(tztype == 1) //直选复式
		{
			$("tr#tr_vote_5").find("td.ball_r").removeClass(SelectBallClassName);
		}
    }
    else if (xxtype == 10) //不定位
    {
        if (tztype == 1) //直选复式
        {
            $("tr#tr_vote_5").find("td.ball_r").removeClass(SelectBallClassName);
        }
    }
	else if(xxtype == 5)  //组合
	{
		$("tr#tr_vote_1,tr#tr_vote_2,tr#tr_vote_3,tr#tr_vote_4,tr#tr_vote_5").find("td.ball_r").removeClass(SelectBallClassName);
	}
	else if(xxtype == 6)  //组合
	{
		$("tr#tr_vote_6,tr#tr_vote_7").find("td.ball_r_1").removeClass(SelectBallClassName);
	}
	
	$("#temp_select_zhushu").text(0);
	$("#temp_select_money").text(0);
}

//机选N注号码 2013-1-25
function select_jxmuti(num) {


	var IsEXZXFS2DS = false;
	if(xxtype == 3 && tztype == 7)//二星组选复式
	{
		IsEXZXFS2DS = true;
		tztype = 8;
	}
	else if ((xxtype == 8 || xxtype == 13) && tztype == 11)  //组三单式
	{
		tztype = 110
	}
	else if ((xxtype == 8 || xxtype == 13) && tztype == 12)  //组六单式
	{
		tztype=120
	}
	var linecounts = getlinecounts(xxtype, tztype);


	var playtypename = getplaytypename();
	
	
	for(var i=1;i<=num;i++)
	{
		var codes = select_jxsingle(linecounts,IsEXZXFS2DS);
		var value = codes;
		if(xxtype == 6) value=value.replace(/大/g,"2").replace(/小/g,"1").replace(/单/g,"5").replace(/双/g,"4");		
		var text = "["+playtypename+"]"+codes;
		add_line(value,text,xxtype,tztype);
	}
	if(IsEXZXFS2DS)
	{
		tztype = 7;
	}
	if (tztype == 110) //组三机选后
	{
		tztype = 11	
	}
	if (tztype == 120) //组六机选后
	{
		tztype = 12
    }

	//count_allzhushu();
	ShowMoney();
	//show_money();//替换
}

//机选一注号码
function select_jxsingle(linenum,IsEXZXFS2DS)
{
    //var linecounts=getlinecounts(xxtype,tztype);


    //alert(xxtype+"---"+tztype)
	var codeArr=new Array();
	var code;
	var jxmax;
	if(xxtype == 3 && tztype==9)
		jxmax = 18
	else if(xxtype == 6)
		jxmax=3;
	else
		jxmax=9;
		
	if(xxtype == 3 && tztype == 7)//二星组选复式
	{
		codeArr[0] = getRndNum(0,jxmax);
		codeArr[1] = getRndNum(0,jxmax);
		while(codeArr[1]==codeArr[0])
		{
			codeArr[1] = getRndNum(0,jxmax);
		}
		code=codeArr.sort().join(",");//alert(code);
	}
	else if ((xxtype == 3 || xxtype == 14) && tztype == 8)//二星组选单式
	{
		codeArr[0] = getRndNum(0,jxmax);
		codeArr[1] = getRndNum(0,jxmax);
		//if(IsEXZXFS2DS)
		//{
			while(codeArr[1]==codeArr[0])
			{
				codeArr[1] = getRndNum(0,jxmax);
			}
		//}
		code=codeArr.sort().join(",");//alert(code);
	}
	else if(xxtype == 3 && tztype == 9)//二星组选和值
	{
		code = getRndNum(0,jxmax);
		//code=codeArr.sort(sortfunction).join(",");//alert(code);
	}
	else if ((xxtype == 8 || xxtype == 13) && tztype == 110) //三星组选机选
	{//组三
		
		codeArr[0] = getRndNum(0,jxmax);
		codeArr[1] = getRndNum(0,jxmax);
		while(codeArr[1]==codeArr[0])
		{
			codeArr[1] = getRndNum(0,jxmax);
		}
		if (codeArr[1]>codeArr[0])
		{
		code=codeArr[0]+","+codeArr[0]+","+codeArr[1];
		}
		else
		{
		code=codeArr[0]+","+codeArr[1]+","+codeArr[1];	
		}
		
		//alert(code);
	}
	else if ((xxtype == 8 || xxtype == 13) && tztype == 120) //三星组选机选
	{//组六
		
		codeArr[0] = getRndNum(0,jxmax);
		codeArr[1] = getRndNum(0,jxmax);
		codeArr[2] = getRndNum(0,jxmax);
		while((codeArr[1]==codeArr[0]) || (codeArr[1]==codeArr[2]) ||(codeArr[0]==codeArr[2]) )
		{
			codeArr[0] = getRndNum(0,jxmax);
		    codeArr[1] = getRndNum(0,jxmax);
		    codeArr[2] = getRndNum(0,jxmax);
		}
		
		
		code=codeArr[0]+","+codeArr[1]+","+codeArr[2];	
		
		
		//alert(code);
	}
	else if ((xxtype == 8 || xxtype == 13) && tztype == 2) //三星组选机选
	{//组选
		
		codeArr[0] = getRndNum(0,jxmax);
		codeArr[1] = getRndNum(0,jxmax);
		codeArr[2] = getRndNum(0,jxmax);
		while((codeArr[0]==codeArr[1]) || (codeArr[1]==codeArr[2]) )
		{
			codeArr[0] = getRndNum(0,jxmax);
		    codeArr[1] = getRndNum(0,jxmax);
		    codeArr[2] = getRndNum(0,jxmax);
		}
		
		
		code=codeArr[0]+","+codeArr[1]+","+codeArr[2];	
		
		
		//alert(code);
	}
	else if(xxtype == 2 && tztype == 17) //三星包胆复式
	{//三星包胆复式
		codeArr[0] = getRndNum(0,jxmax);
		codeArr[1] = getRndNum(0,jxmax);
		codeArr[2] = getRndNum(0,jxmax);
		while((codeArr[1]==codeArr[0]) || (codeArr[1]==codeArr[2]) ||(codeArr[0]==codeArr[2]) )
		{
			codeArr[0] = getRndNum(0,jxmax);
		    codeArr[1] = getRndNum(0,jxmax);
		    codeArr[2] = getRndNum(0,jxmax);
		}
		code=codeArr[0]+","+codeArr[1]+","+codeArr[2];
    }
    else if (xxtype == 10)//不定位
    {
    
     
        codes = codes;
    }
    else if (xxtype == 11)//定位胆
    {
        for (var i = 0; i < 5 - linenum; i++) {
            code = "-," + code;
        }
    }
    else if (xxtype == 12)//前三
    {
        codeArr[0] = getRndNum(0, jxmax);
        codeArr[1] = getRndNum(0, jxmax);
        codeArr[2] = getRndNum(0, jxmax);
      
        code =codeArr[0] + "," + codeArr[1] + "," + codeArr[2]+",-,-";
    }
    else if (xxtype == 14)//前二直选2013-1-23
    {
        codeArr[0] = getRndNum(0, jxmax);
        codeArr[1] = getRndNum(0, jxmax);
       
      
        code =codeArr[0] + "," + codeArr[1] +",-,-,-";
    }
	
	
	
	else
	{
		for(var i=0;i<linenum;i++)
		{
			codeArr[i] = getRndNum(0,jxmax);
		}
		code=codeArr.join(",");//alert(code);
		if(xxtype != 6)
		{
			for(var i=0;i<5-linenum;i++)
			{
				code = "-,"+code;
			}
		}
	}
	if(xxtype == 6) code=code.replace(/0/g,"大").replace(/1/g,"小").replace(/2/g,"单").replace(/3/g,"双");
	return code;
}
//生成一个min到max的随机整数
function getRndNum(min,max)
{
	return Math.round((max-min)*Math.random()+min);
}

//获取列表中的投注号码
function get_codeshow()
{
	var codes = "";
	$("#codesshow > option").each(function(){
		var valueArr = $(this).val().split("|");
		var code = valueArr[0];
		var type1 = Number(valueArr[1]);
		var type2 = Number(valueArr[2]);
		var playtypeid=getplaytypeid(type1,type2);
		codes = codes+"["+playtypeid+"]"+code+"$"
	});
	codes = codes.substr(0,codes.length-1);
	return codes;
}


//验证提交数据是否合法
function checkData(checkType)
{
	var codes = get_codeshow();	
	if(codes=="")
	{
		alert("您还没有选择号码");
		return ;
	}
	if((codes.length-codes.replace(/\$/g,"").length)>600)
	{
		alert("投注内容不能超过600行");
		return;
	}
	if(Number(zhushu)<=0)
	{
		alert("您选择的号码不正确");
		return ;
	}
	
	if ($("input[name=confirmxy]").attr("checked") == false)
	{
		alert("同意《用户合买代购协议》才能投注");
		return ;
	}
	
	var FirstPlayStr=codes.substring(0,5).replace("[","\\[");
	var re=new RegExp(FirstPlayStr,"g");
	var codeArr=codes.split("$");
	var playname="";
	
	var cs=codes.replace(re,"");
	
	if(codes.length-cs.length < codeArr.length*5)
	{
		playname="混投";
		
	}
	else
	{
		playname=getpalynamebyid(codes.substring(1,4));	
	
	}
	
if($("#btDiv").is(":hidden"))
   {
	var expectlistsuc= GetBeishuExpectListSuc();
	var beishulistsuc=GetBeishuExpectListSuc();
   }
   else
   {
   	var expectlistsuc= $("#expectlistsuc4").val();
	var beishulistsuc= $("#beishulistsuc4").val();
   }
	if(expectlistsuc=="" || beishulistsuc=="")
	{
		alert("请选择您要投注的期号");
		return ;
	}
	var allmoney = $("#moneyshow3").text();
	var expectnum = $("#expectnumshow").text();
	var lotteryTypeId = $('#lotteryTypeId').text();
	var phase = $('#phase').text();
	//2013-2-25判断大于800注禁止提交
	 if(zhushu>800)
		   {
			alert("投注注数不能超过800注！");
		    zhushu = 0;//注数清0
			$("#codesshow > option").remove();//投注内容清空 
			return ;  
		    }

	if(confirm("请确认您的投注信息\n\r\n\r玩法："+playname+"\n\r期数：共"+expectnum+"期\n\r金额："+allmoney+"元"))
	{
		$("#btn_SubmitZ,#btn_SubmitHM,#btn_SubmitPath").attr("disabled",true);
		
		var ZjCut=0;
		if ($("#ZjStop").attr("checked")=='checked')
		{
			ZjCut=1;
		}
		var  Zhuihao=0;
		if($("#IsZhuihao").attr("checked")=='checked'){
			Zhuihao=1;
		}
		if (checkType=="zg") {
				 var  data={
					    totalMoney:allmoney,//投注总金额
					    playname:playname,//投注名称
						codes:codes,//投注彩票代码
						expectnum:expectnum,//投注彩票期数
						zhushunum: $("#zhushushow2").text(),//投注数
						expectlistsuc:expectlistsuc, //投注彩票期数list
						beishulistsuc:beishulistsuc,//投注彩票倍数list
						ZjCut:ZjCut,//是否追号停止
						IsZhuihao:Zhuihao,//是否追号
						lotteryTypeId:lotteryTypeId,//彩种类型ID
						lotteryType:"cqssc",//彩种类型代码
						phase:phase,//当前期号
						t : Math.random()
					};
					var form = '<form action="../order/ajax_save" method="post" id="tmpForm2">';
					for (var name in data) {
					var val = eval('data.' + name);
					form += '<input type="text" name="' + name + '" value="' + val + '">';
					}
					form += '</form>';
					$('body').append(form);
					$('#tmpForm2').submit();
		} else {
			 var  _data={
					    totalMoney:allmoney,//投注总金额
					    playname:playname,//投注名称
						codes:codes,//投注彩票代码
						expectnum:expectnum,//投注彩票期数
						zhushunum: $("#zhushushow2").text(),//投注数
						expectlistsuc:expectlistsuc, //投注彩票期数list
						beishulistsuc:beishulistsuc,//投注彩票倍数list
						ZjCut:ZjCut,//是否追号停止
						IsZhuihao:Zhuihao,//是否追号
						lotteryTypeId:lotteryTypeId,//彩种类型ID
						lotteryType:"cqssc",//彩种类型代码
						phase:phase,//当前期号
						t : Math.random()
					};
			
			buyTogetherSubmit(_data);
		}
	}
	
}


function buyTogetherSubmit(data) {
	var form = '<form action="../hemai/order" method="post" id="tmpForm">';
	for (var name in data) {
	var val = eval('data.' + name);
	form += '<input type="text" name="' + name + '" value="' + val + '">';
	}
	form += '</form>';
	$('body').append(form);
	$('#tmpForm').submit();
	
};

//2013-1-24 新计划倍投
//计划倍投
function CheckPlanN()
{  
     var codes = get_codeshow();
	 
	if(codes=="")
	{
		alert("您还没有选择号码");
		return;
	}
	if(Number(zhushu)<=0)
	{
		alert("您选择的号码不正确");
		return ;
	}
	if((codes.length-codes.replace(/\$/g,"").length)>600)
	{
		alert("投注内容不能超过600行");
		return;
	}
	 var FirstPlayStr=codes.substring(0,5).replace("[","\\[");
	var re=new RegExp(FirstPlayStr,"g")
	var codeArr=codes.split("$");
	var playname="";
	var cs=codes.replace(re,"")
	
	if(codes.length-cs.length < codeArr.length*5)
	{
		alert("您好，倍投计算器暂不支持混投！");
		return;
	}
	if($("#btBonus").val()=="")
	{
		alert("您好，倍投计算器暂不支持混投！");
		return;
	}
   
	var tzqs = Number($("#btIssueNum").val()); //投注期数
	if (tzqs<1)
	{
		alert("您好，最少投注一期！");
		return;
	}
	var qsqs = $("#btStartList > option:selected").index(); //起始期数索引
	var zqs=$("#btStartList > option").length-qsqs; //可投注总期数
	if (tzqs>zqs) //是否超过可投注其数
	{
		alert("您好，您投注的期数超过可投注期数，现在最大可投注期数为"+zqs+"期！");
		return;
	}
	var qsbs = Number($("#btStartMultiple").val()); //起始倍数
	if (qsbs<1)
	{
		alert("您好，起始倍数最少为1！");
		return;
	}
	var maxbs = Number($("#btMaxMultiple").val()); //最大倍数
	var bonus = Number($("#btBonus").val()); //奖金
	//验证注数是否大于奖金
	
	if(zhushu*2 > bonus)
	{
		alert("按照当前设置，投注金额"+zhushu*2+"元，超过收益" + bonus + "元，请重新设置！");
		return;
	}
	var rdoWinCondition = Number($("input[name=rdoWinCondition]:checked").val());
	var syl = Number($("#allMargin").val());//全程最低收益率
	var qjs = 0 //定制起始几期
	var syje =0 //最低收益金额
	
	if(rdoWinCondition==2)
	{
		qjs = Number($("#preIssueNum").val());
		if (qjs<1)
		{
			alert("您好，前几期最少为1！");
			return;
		}
		syl = Number($("#preMargin").val());
	}
	else if(rdoWinCondition==3)
	{
		syje = Number($("#minMoney").val());
	}
	
	var pretr = 0;//截至上期总投注
	var vArr = new Array(7);
	$("#btTable > tbody").empty();
	
	for(var i = 1;i <= tzqs;i++)
	{
		if(rdoWinCondition==2 && i==(qjs+1))
		{
			syl = Number($("#afterMargin").val());
		}
		
		if(rdoWinCondition==3)
		{
			while (((bonus * qsbs) - (pretr + (zhushu * qsbs * 2)))<syje)
			{
				if(qsbs > maxbs)
			 	{
					var cqqs= $("#btStartList > option").eq(qsqs+i-1).val();
					var msg = "<p style='text-align:left;'>按照当前设置 : 从第<font color='red' style='font-weight:bold'>"+cqqs+"</font>期开始，投注倍数将超过"+maxbs+"倍，建议从以下方面调整方案.</p>";
					msg = msg + "<p style='text-align:left;text-indent:2em;'>1.减少方案期数(推荐)</p>";
					msg = msg + "<p style='text-align:left;text-indent:2em;'>2.降低预期收益率(推荐)</p>";
					msg = msg + "<p style='text-align:left;text-indent:2em;'>3.减少投入注数</p>";
					msg = msg + "<p style='text-align:left;text-indent:2em;'>4.提高最大倍数设置</p>";
					
					//-----------
					msg = "按照当前设置 : 从第"+cqqs+"期开始，投注倍数将超过"+maxbs+"倍，建议从以下方面调整方案:";
					msg += "1.减少方案期数(推荐);";
					msg += "2.降低预期收益率(推荐);";
					msg += "3.减少投入注数;";
					msg += "4.提高最大倍数设置";
						
					//-----------
					alert(msg);
					return;
			 	}
			  	qsbs++;
			}
		}
		else
		{
			
			while(((((bonus * qsbs) - (pretr + (zhushu * qsbs * 2))) * 100) / (pretr + (zhushu * qsbs * 2))) < syl) 
			{
				if(qsbs > maxbs)
				{
					var cqqs= $("#btStartList > option").eq(qsqs+i-1).val();
					var msg = "<p style='text-align:left;'>按照当前设置 : 从第<font color='red' style='font-weight:bold'>"+cqqs+"</font>期开始，投注倍数将超过"+maxbs+"倍，建议从以下方面调整方案.</p>";
					msg = msg + "<p style='text-align:left;text-indent:2em;'>1.减少方案期数(推荐)</p>";
					msg = msg + "<p style='text-align:left;text-indent:2em;'>2.降低预期收益率(推荐)</p>";
					msg = msg + "<p style='text-align:left;text-indent:2em;'>3.减少投入注数</p>";
					msg = msg + "<p style='text-align:left;text-indent:2em;'>4.提高最大倍数设置</p>";
					
					msg = "按照当前设置 : 从第"+cqqs+"期开始，投注倍数将超过"+maxbs+"倍，建议从以下方面调整方案:";
					msg += "1.减少方案期数(推荐);";
					msg += "2.降低预期收益率(推荐);";
					msg += "3.减少投入注数;";
					msg += "4.提高最大倍数设置";
					alert(msg);
					return;
				}
				qsbs++;
			}
		}
		//累计投入
		pretr += (zhushu * qsbs * 2); 
		//收益率
		tempSy = ((bonus * qsbs) - pretr) * 100 / pretr; 
		vArr[0] =$("#btStartList > option").eq(qsqs+i-1).val();
		vArr[1] = qsbs.toString();
		vArr[2] = (zhushu * qsbs * 2).toString();
		vArr[3] = pretr.toString();
		vArr[4] = (bonus * qsbs).toString();
		vArr[5] = ((bonus * qsbs) - pretr).toString();
		vArr[6] = tempSy.toFixed(2) + "%";
	
		var thisTr ="<tr>"
		thisTr +="<td>"+vArr[0]+"</td>"
		thisTr +="<td>"+vArr[1]+"</td>"
		thisTr +="<td>"+formatCurrency(vArr[2])+"</td>"
		thisTr +="<td>"+formatCurrency(vArr[3])+"</td>"
		thisTr +="<td>"+formatCurrency(vArr[4])+"</td>"
		thisTr +="<td>"+formatCurrency(vArr[5])+"</td>"
		thisTr +="<td>"+vArr[6]+"</td>"
		$("#btTable > tbody").append(thisTr);
	}

	ShowPlanInfo();
	JoinExpectBeishuBT();
	ShowMoney();//2013-1-24
}


//显示倍投信息
function ShowPlanInfo()
{
	if($("#btTable > tbody > tr").length>0)
	{
		var lashtr=$("#btTable > tbody > tr:last");
		$("#btIssueCount").text($(lashtr).index()+1);
		// $("#btInvestment").text(Number($(lashtr).find("td").eq(3).text().replace("￥","")));
		$("#btInvestment").text($(lashtr).find("td").eq(3).text().replace("￥",""));
		$("#btRevenue").text(Number($(lashtr).find("td").eq(5).text().replace("￥","").replace(",","")));
	}
	else
	{
		$("#btIssueCount").text(0);
		$("#btInvestment").text(0);
		$("#btRevenue").text(0);
	}
	
}
//JS 货币格式化
function formatCurrency(num) {
	num = num.toString().replace(/\$|\,/g,'');
	if(isNaN(num))
	{
		num = "0";
	}
	var sign = (num == (num = Math.abs(num)));
	num = Math.floor(num*100+0.50000000001);
	var cents = num%100;
	num = Math.floor(num/100).toString();
	if(cents<10)
	{
		cents = "0" + cents;
	}
	for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
	{
		num = num.substring(0,num.length-(4*i+3))+','+num.substring(num.length-(4*i+3));
	}
	return (((sign)?'':'-') + '￥' + num + '.' + cents);
}
//2013-1-24 新计划倍投
/*计划倍投*/
function checkplan()  
{
	
	var codes = get_codeshow();	
	if(codes=="")
	{
		alert("您还没有选择号码");
		return;
	}
	if((codes.length-codes.replace(/\$/g,"").length)>600)
	{
		alert("投注内容不能超过600行");
		return;
	}
	if(Number(zhushu)<=0)
	{
		alert("您选择的号码不正确");
		return ;
	}
	if ($("input[name=confirmxy]").attr("checked") == false)
	{
		alert("同意《用户合买代购协议》才能投注");
		return ;
	}
	var FirstPlayStr=codes.substring(0,5).replace("[","\\[");
	var re=new RegExp(FirstPlayStr,"g")
	var codeArr=codes.split("$");
	var playname="";
	var cs=codes.replace(re,"")
	
	if(codes.length-cs.length < codeArr.length*5)
	{
		alert("混投,不能计划倍投!");
		return;
	}

	
	//取方案类别
	var valuenew =  $("#codesshow > option:first-child").val();
	var valueArrnew = valuenew.split("|");
	var type1 = valueArrnew[1];
	var type2 = valueArrnew[2];
	var playtypeid=getplaytypeid(Number(type1),Number(type2));
	
    // 方案注数
	var zhushunum = $("#zhushushow2").text();
	var buyExpect = $("#buyExpectShow").text();
	$("#zhushunum").val(zhushunum)
	$("#codes").val(codes);
	$("#buyExpect").val(buyExpect);
	$("#playtypeid").val(playtypeid);
	$("#formh8").attr("action","Project.asp");
	$("#formh8").submit();
	
}



// date 可以是时间对象也可以是字符串，如果是后者，形式必须为: yyyy-mm-dd hh:mm:ss 其中分隔符不定。"2006年12月29日 16点01分23秒" 也是合法的
function DateAdd(interval,number,date){ 
    number = parseInt(number);
    if (typeof(date)=="string"){
        date = date.split(/\D/);
        --date[1];
        eval("var date = new Date("+date.join(",")+")");
    }
    if (typeof(date)=="object"){
        var date = date
    }
    switch(interval){
        case "y": date.setFullYear(date.getFullYear()+number); break;
        case "m": date.setMonth(date.getMonth()+number); break;
        case "d": date.setDate(date.getDate()+number); break;
        case "w": date.setDate(date.getDate()+7*number); break;
        case "h": date.setHours(date.getHour()+number); break;
        case "n": date.setMinutes(date.getMinutes()+number); break;
        case "s": date.setSeconds(date.getSeconds()+number); break;
        case "l": date.setMilliseconds(date.getMilliseconds()+number); break;
    } 
    return date;
}

//日期转化为字符串格式： yyyy-mm-dd
function DateToStr(dt)
{
	var str="";
	if(dt.getFullYear){
		var y,m,d;
		y=dt.getFullYear();
		m=dt.getMonth()+1;  //1-12
		if(m<10)
		{
			m = "0"+m.toString();
		}
 
		d=dt.getDate();
		if(d<10)
		{
			d = "0"+d.toString();
		}
		str=""+y+"-"+m+"-"+d;
	}
	return str;
}

//时间转化为字符串格式： yyyy-mm-dd hh:nn
function TimeToStr(dt){
	var str="";
	if(dt.getFullYear){
  		var y,m,d;
  		y=dt.getFullYear();
  		m=dt.getMonth()+1;  //1-12
  		//alert(m);
  		if(m<10)
		{
			m = "0"+m.toString();
		}
	 
		d=dt.getDate();
		if(d<10)
		{
			d = "0"+d.toString();
		}
		h = dt.getHours();
		if(h<10)
		{
			h = "0"+h.toString();
		}
		n = dt.getMinutes();
		if(n<10)
		{
			n = "0"+n.toString();
		}
		str=""+y+"-"+m+"-"+d+" "+h+":"+n;
	}
	return str;
}
//控制倍数输入框
function control_beishu(obj,isshowmoney)
{
	
	var tr = $(obj).parent().parent()
	var beishu_show = $(tr).find("input[name=beishu_show]");
	$(beishu_show).attr("disabled",$(obj).attr("checked") ? false : true);
	var topbeishu;
	if (FirstLoadTouzhuExpect)
	{
		topbeishu = 1;
	}
	else
	{
		topbeishu = isshowmoney;
	}
	if($(obj).attr("checked"))
	{
		$(beishu_show).val(topbeishu)
	}
	else
	{
		$("#selectallexpect").attr("checked",false);
		$(beishu_show).val(0);
	}
}

//设置倍数和期号
function SetTozhuExpect()
{
	var TouzhuExpectType = Number($("#TouzhuExpectType").val());
	
	if(TouzhuExpectType==1 && FirstLoadTouzhuExpect)
	{
		var checkbeishu = $("#tbshowtozhuexpect > tbody > tr > td > input[name=checkbeishu]").first();
		$(checkbeishu).attr("checked",true);
		control_beishu(checkbeishu,1);
		JoinExpectBeishu();
		FirstLoadTouzhuExpect = false;
	}
	var expectlistsuc = "";
	var beishulistsuc = "";
	if(TouzhuExpectType==1)
	{
		expectlistsuc = $("#expectlistsuc1").val();
		beishulistsuc = $("#beishulistsuc1").val();
	}
	else if (TouzhuExpectType==2)
	{
		expectlistsuc = $("#expectlistsuc2").val();
		beishulistsuc = $("#beishulistsuc2").val();
	}
	else if (TouzhuExpectType==3)
	{
		expectlistsuc = $("#expectlistsuc3").val();
		beishulistsuc = $("#beishulistsuc3").val();
	}
	var expectlistsucArr = expectlistsuc.split(",");

	var beishulistsucArr = beishulistsuc.split(",");
	for (var i =0; i < expectlistsucArr.length ; i++)
	{
		if($("#tbshowtozhuexpect > tbody > tr > td > input[name='expect_hidden'][value='"+expectlistsucArr[i]+"']").length > 0)
		{
			var tr =$("#tbshowtozhuexpect > tbody > tr > td > input[name='expect_hidden'][value='"+expectlistsucArr[i]+"']").parent().parent()
			var checkbeishu = $(tr).eq(0).find("input[name='checkbeishu']").attr("checked",true);
			control_beishu(checkbeishu,Number(beishulistsucArr[i]));
		}
	}
	JoinExpectBeishu();

	ShowMoney();
	//show_money();//替换
}

//加入期号列表2013-1-25
function JoinExpectBeishuBT(){
  if($("#btDiv").is(":hidden"))
	{
	  JoinExpectBeishu();
	}
	else
	{
		var expectlistsuc4 = "";
    	var beishulistsuc4 = "";
		if($("#btTable > tbody > tr").length>0)
		{
			$("#btTable > tbody > tr").each(function(){
				expectlistsuc4 += $(this).find("td:first").text()+","
				beishulistsuc4 += $(this).find("td").eq(1).text()+","
			})
		}
		
	expectlistsuc4 = expectlistsuc4.substring(0,expectlistsuc4.length-1);
	beishulistsuc4 = beishulistsuc4.substring(0,beishulistsuc4.length-1);
	//expectlistsuc4 = expectlistsuc4.substring(9,expectlistsuc4.length);
	//beishulistsuc4 = beishulistsuc4.substring(9,beishulistsuc4.length);
	//alert(beishulistsuc4);
	$("#expectlistsuc4").val(expectlistsuc4);
	$("#beishulistsuc4").val(beishulistsuc4);	
	
	}
}

//获取总的投注注数
function GetAllZhuShu()
{
	zhushu = 0
	$("input[name=seleLiValue]").each(function(){
		var arr = $(this).val().split('|')
		zhushu = zhushu + Number(arr[2]);
	});
}
//显示金额倍投
function ShowMoney()
{
	if($("#btDiv").is(":hidden"))
	{
		count_allzhushu();
		show_money();
	
	}
	else
	{
	count_allzhushu();	
	//GetAllZhuShu();
	$("#zhushushow2").text(zhushu);
	$("#moneyshow2").text(zhushu*2);
	var expectlistsuc4 = $("#expectlistsuc4").val();
	var beishulistsuc4 = $("#beishulistsuc4").val();
	
	var expectlistsucArr = expectlistsuc4.split(",");
	var beishulistsucArr = beishulistsuc4.split(",");
	
	var expectnum = 0;
	var allmoney = 0*2*zhushu;
	if(expectlistsuc4.length>0)
	{
		expectnum = expectlistsucArr.length;
	}
	
	//var allmoney = 0;
	for(var i=0;i<expectlistsucArr.length;i++)
	{
		if(beishulistsucArr[i].length > 0)
		{
			allmoney = allmoney + beishulistsucArr[i]*2*zhushu;
		}
	}
	$("#expectnumshow").text(expectnum)
	$("#moneyshow3").text(allmoney);
	}
}
//2013-1-25
//取期号倍数
function JoinExpectBeishu()
{
	var BeishuExpectListSuc = GetBeishuExpectListSuc();
	var ArrBeishuExpectListSuc = BeishuExpectListSuc.split("|");
	var expectlistsuc = ArrBeishuExpectListSuc[0];
	var beishulistsuc = ArrBeishuExpectListSuc[1];
	var TouzhuExpectType = Number($("#TouzhuExpectType").val());
	if(TouzhuExpectType==1)
	{
		$("#expectlistsuc1").val(expectlistsuc);
		$("#beishulistsuc1").val(beishulistsuc);
	}
	else if(TouzhuExpectType==2)
	{
		$("#expectlistsuc2").val(expectlistsuc);
		$("#beishulistsuc2").val(beishulistsuc);
	}
	else if(TouzhuExpectType==3)
	{
		$("#expectlistsuc3").val(expectlistsuc);
		$("#beishulistsuc3").val(beishulistsuc);
	}
	//alert(middle.document.all("beishulistsuc1").value);


}


//获取已经投注了的期号和对应倍数
function GetBeishuExpectListSuc()
{
	var beishulistsuc = "";
	var expectlistsuc = "";
	$("#tbshowtozhuexpect > tbody > tr > td > input[name=beishu_show]").each(function(){
		var value = $(this).val();
		if (Number(value)>0)
		{
			beishulistsuc += value+",";
			expectlistsuc += $(this).parent().find("input[name=expect_hidden]").val()+",";
		}
	});
	
	beishulistsuc = beishulistsuc.substring(0,beishulistsuc.length-1);
	expectlistsuc = expectlistsuc.substring(0,expectlistsuc.length-1);
	return expectlistsuc+"|"+beishulistsuc;
}

//根据是否追号设置中奖后是否停止追号
function SetIsStop()
{
	 if($("#IsZhuihao").is(':checked'))
	 {
		$("#ZjStop").attr("checked",CustomIsSetNotStop);
		$("#ZjStop").attr("disabled",false)
	 }
	 else
	 {
		 $("#ZjStop").attr("checked",false)
		 $("#ZjStop").attr("disabled",true)
	 }
}

function JoinExpect(expectlistsuc1,expectlistsuc2,expectlistsuc3)//2013-1-24
{
	var expectlistsuc="";
	if(expectlistsuc1.length>0)
	{
		expectlistsuc = expectlistsuc1;
	}
	if(expectlistsuc2.length>0)
	{
		if(expectlistsuc.length>0)
		{
			expectlistsuc = expectlistsuc+",";
		}
		expectlistsuc = expectlistsuc+expectlistsuc2;
	}
	if(expectlistsuc3.length>0)
	{
		if(expectlistsuc.length>0)
		{
			expectlistsuc = expectlistsuc+",";
		}
		expectlistsuc = expectlistsuc+expectlistsuc3;
	}

	return expectlistsuc;
}

function JoinBeishu(beishulistsuc1,beishulistsuc2,beishulistsuc3)
{
	var beishulistsuc="";
	if(beishulistsuc1.length>0)
	{
		beishulistsuc = beishulistsuc1;
	}
	if(beishulistsuc2.length>0)
	{
		if(beishulistsuc.length>0)
		{
			beishulistsuc = beishulistsuc+",";
		}
		beishulistsuc = beishulistsuc+beishulistsuc2;
	}
	if(beishulistsuc3.length>0)
	{
		if(beishulistsuc.length>0)
		{
			beishulistsuc = beishulistsuc+",";
		}
		beishulistsuc = beishulistsuc+beishulistsuc3;
	}
   
	return beishulistsuc;
}

function clear_expectbeishu()
{
	$("#expectlistsuc1").val("");
	$("#beishulistsuc1").val("");
	$("#expectlistsuc2").val("");
	$("#beishulistsuc2").val("");
	$("#expectlistsuc3").val("");
	$("#beishulistsuc3").val("");
	$("#expectlistsuc4").val("");
	$("#beishulistsuc4").val("");
}