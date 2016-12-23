<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath %>static/css/jqueryui.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath %>static/css/style.css" type="text/css" rel="stylesheet" />
<title>1000万不是梦想-【竞彩足球总进球】投注</title>
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../banner.jsp"></jsp:include>
<!--main-->
<div class="main sfp">
	<div class="wrap">
    	<div class="bet_title">
        	<div class="fl">
            	<label class="spf_label checked"><input type="checkbox" class="radio_ck" value="0">五大联赛</label>
                <div class="pulldown">
                	<em>更多选择</em>
                    <div class="pubox">
                        <div class="list">
                        	<h4><cite>联赛选择</cite><a href="#">全选</a><a href="#">反选</a><a href="#">全清</a></h4>
                            <div class="lit">
                            	  <label><input type="checkbox" checked="checked" class="radio_ck">日职联<span class="gray">(9场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">德乙<span class="gray">(6场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">英冠<span class="gray">(12场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">英超<span class="gray">(10场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">法乙<span class="gray">(2场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">德甲<span class="gray">(8场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">挪超<span class="gray">(8场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">英甲<span class="gray">(12场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">苏超<span class="gray">(6场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">瑞典超<span class="gray">(6场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">荷乙<span class="gray">(2场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">法甲<span class="gray">(9场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">意甲<span class="gray">(10场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">荷甲<span class="gray">(8场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">西甲<span class="gray">(8场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">葡超<span class="gray">(8场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">阿甲<span class="gray">(10场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">美职联<span class="gray">(8场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">巴甲<span class="gray">(10场)</span></label>
                                  <label><input type="checkbox" checked="checked" class="radio_ck">日职乙<span class="gray">(11场)</span></label>
                            </div>
                        </div>
                        
                        <div class="list datepic">
                        	<h4>日期选择</h4>
                            <div class="lit">
                            	<label><input type="checkbox" checked="checked" class="radio_ck">周六<span class="gray">(5场)</span></label>
                                <label><input type="checkbox" checked="checked" class="radio_ck">周日<span class="gray">(4场)</span></label>
                                <label><input type="checkbox" checked="checked" class="radio_ck">周一<span class="gray">(4场)</span></label>
                            </div>
                        </div>
                        
                    </div>
                </div>
                
                <label class="spf_label checked" style="width:120px;"><input type="checkbox" class="radio_ck" value="0">已截止(28场)</label>
                
                
            </div>
            
            <div class="fr">
            	<span>
                	赛事回查 
                    <select id="seldate">
                        <option value="2014-07-09">2014-07-09</option>
                        <option value="2014-07-08" selected="selected">2014-07-08</option>
                        <option value="2014-07-07">2014-07-07</option>
                        <option value="2014-07-06">2014-07-06</option>
                        <option value="2014-07-05">2014-07-05</option>
                        <option value="2014-07-04">2014-07-04</option>
                        <option value="2014-07-03">2014-07-03</option>
                    </select>
               </span>
            </div>
            
        </div>
        
        <div class="bet_th">
        	<table width="100%" cellpadding="0" cellspacing="0">
            	<tr>
                	<td width="48">编号</td>
                    <td width="68">赛事</td>
                    <td width="92" class="bet_time">
                    	<div class="hd">
                            <span class="time_type">截止时间</span>
                            <div class="pd"><a href="#">开赛时间</a><a href="#">剩余时间</a></div>
                        </div>
                    </td>
                    <td width="112" style="border-right:0; text-align:right;">主队</td>
                    <td width="34" style="border-right:0;">VS</td>
                    <td width="112" style="text-align:left;">客队</td>
                    <td width="400" class="nums" style="border-right:0;"><i>0球</i><i>1球</i><i>2球</i><i>3球</i><i>4球</i><i>5球</i><i>6球</i><i>7+球</i></td>
                    <td width="78">数据</td>
                    <td class="op_th">
                    	<div class="pjop">
                        	<em>平均欧赔</em>
                            <div class="pdbox">
                                <dl class="fn_clear">
                                    <dt>欧赔</dt>
                                    <dd>
                                        <label><input type="radio" class="radio_ck"><span class="gray">平均欧赔</span></label>
                                        <label><input type="radio"  class="radio_ck"><span class="gray">威廉希尔</span></label>
                                        <label><input type="radio" class="radio_ck"><span class="gray">澳门欧赔</span></label>
                                        <label><input type="radio" class="radio_ck"><span class="gray">立博欧赔</span></label>
                                        <label><input type="radio" class="radio_ck"><span class="gray">bet365</span></label>
                                        <label><input type="radio" class="radio_ck"><span class="gray">皇冠欧赔</span></label>
                                    </dd>
                                </dl>
                                <dl class="fn_clear">
                                    <dt>亚盘</dt>
                                    <dd>
                                    	<div class="lit">
                                            <label><input type="radio" class="radio_ck"><span class="gray">平均欧赔</span></label>
                                            <label><input type="radio" class="radio_ck"><span class="gray">威廉希尔</span></label>
                                            <label><input type="radio" class="radio_ck"><span class="gray">澳门欧赔</span></label>
                                            <label><input type="radio" class="radio_ck"><span class="gray">立博欧赔</span></label>
                                        </div>
                                    </dd>
                                </dl>
                                <dl class="fn_clear">
                                    <dt>概率</dt>
                                    <dd>
                                    	<div class="lit">
                                            <label><input type="radio" class="radio_ck"><span class="gray">平均欧赔</span></label>
                                            <label><input type="radio" class="radio_ck"><span class="gray">威廉希尔</span></label>
                                            <label><input type="radio" class="radio_ck"><span class="gray">澳门欧赔</span></label>
                                            <label><input type="radio" class="radio_ck"><span class="gray">立博欧赔</span></label>
                                            <label><input type="radio" class="radio_ck"><span class="gray">bet365</span></label>
                                            <label><input type="radio" class="radio_ck"><span class="gray">皇冠欧赔</span></label>
                                        </div>
                                    </dd>
                                </dl>
                                <dl class="fn_clear">
                                    <dt>凯利</dt>
                                    <dd>
                                    	<div class="lit">
                                            <label><input type="radio" class="radio_ck"><span class="gray">平均欧赔</span></label>
                                            <label><input type="radio" class="radio_ck"><span class="gray">威廉希尔</span></label>
                                            <label><input type="radio" class="radio_ck"><span class="gray">澳门欧赔</span></label>
                                            <label><input type="radio" class="radio_ck"><span class="gray">立博欧赔</span></label>
                                            <label><input type="radio" class="radio_ck"><span class="gray">bet365</span></label>
                                            <label><input type="radio" class="radio_ck"><span class="gray">皇冠欧赔</span></label>
                                        </div>
                                    </dd>
                                </dl>
                                <dl class="fn_clear">
                                    <dt>其他</dt>
                                    <dd>
                                    	<div class="lit">
                                            <label for="rq_1"><input type="radio" type="radio" class="radio_ck"><span class="gray">投注比例</span></label>
                                            
                                        </div>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        
        <div class="bet_content bet_content2">
        	<c:forEach items="${requestScope.betDateList}" var="betDate">
	        	<c:set var="pdate" value="${betDate.pdate}"/>
	        	<div class="bet_date">
	        	  	<em>${betDate.dayDate}</em><a href="#" onclick="javascrip:trInfoHidden('${betDate.pdate}')" class="num">${betDate.matchInfo}</a>
	            </div>
	            
	            <table width="100%" cellpadding="0" cellspacing="0">
	            	<c:forEach items="${requestScope.jqsMatchList}" var="spfMatch" varStatus="s">
	            		<c:if test="${spfMatch.pdate eq pdate}">
			            	<tr name="${betDate.pdate}">
			                	<td width="49"><a href="#">${spfMatch.gameNum}</a></td>
			                    <td width="68"><a href="#" class="league" style="background:#F75000;">${spfMatch.league}</a></td>
			                    <td width="92">${spfMatch.endTime}</td>
			                    <td width="113" class="left_team"><a href="#">${spfMatch.homesxName}</a></td>
			                    <td width="34">&nbsp;</td>
			                    <td width="113" class="right_team"><a href="#">${spfMatch.awaysxName}</a></td>
			                    <td width="400">
			                        <div class="bet_odds">
			                        	<a href="javascript:void(0)" id="lottery_${s.index }_0" name="lotteryCode" matchId="${spfMatch.footballMatchId }" lotteryInfo="0_${spfMatch.footballMatchId }_${spfMatch.spf1}_${betDate.pdate}_${spfMatch.gameNum}" onclick="selectLotteryInfo('lottery_${s.index }_0','${spfMatch.footballMatchId }')" >${spfMatch.spf1}</a>
			                        	<a href="javascript:void(0)" id="lottery_${s.index }_1" name="lotteryCode" matchId="${spfMatch.footballMatchId }" lotteryInfo="1_${spfMatch.footballMatchId }_${spfMatch.spf2}_${betDate.pdate}_${spfMatch.gameNum}" onclick="selectLotteryInfo('lottery_${s.index }_1','${spfMatch.footballMatchId }')" >${spfMatch.spf2}</a>
			                        	<a href="javascript:void(0)" id="lottery_${s.index }_2" name="lotteryCode" matchId="${spfMatch.footballMatchId }" lotteryInfo="2_${spfMatch.footballMatchId }_${spfMatch.spf3}_${betDate.pdate}_${spfMatch.gameNum}" onclick="selectLotteryInfo('lottery_${s.index }_2','${spfMatch.footballMatchId }')" >${spfMatch.spf3}</a>
			                        	<a href="javascript:void(0)" id="lottery_${s.index }_3" name="lotteryCode" matchId="${spfMatch.footballMatchId }" lotteryInfo="3_${spfMatch.footballMatchId }_${spfMatch.spf4}_${betDate.pdate}_${spfMatch.gameNum}" onclick="selectLotteryInfo('lottery_${s.index }_3','${spfMatch.footballMatchId }')" >${spfMatch.spf4}</a>
			                        	<a href="javascript:void(0)" id="lottery_${s.index }_4" name="lotteryCode" matchId="${spfMatch.footballMatchId }" lotteryInfo="4_${spfMatch.footballMatchId }_${spfMatch.spf5}_${betDate.pdate}_${spfMatch.gameNum}" onclick="selectLotteryInfo('lottery_${s.index }_4','${spfMatch.footballMatchId }')" >${spfMatch.spf5}</a>
			                        	<a href="javascript:void(0)" id="lottery_${s.index }_5" name="lotteryCode" matchId="${spfMatch.footballMatchId }" lotteryInfo="5_${spfMatch.footballMatchId }_${spfMatch.spf6}_${betDate.pdate}_${spfMatch.gameNum}" onclick="selectLotteryInfo('lottery_${s.index }_5','${spfMatch.footballMatchId }')" >${spfMatch.spf6}</a>
			                        	<a href="javascript:void(0)" id="lottery_${s.index }_6" name="lotteryCode" matchId="${spfMatch.footballMatchId }" lotteryInfo="6_${spfMatch.footballMatchId }_${spfMatch.spf7}_${betDate.pdate}_${spfMatch.gameNum}" onclick="selectLotteryInfo('lottery_${s.index }_6','${spfMatch.footballMatchId }')" >${spfMatch.spf7}</a>
			                        	<a href="javascript:void(0)" id="lottery_${s.index }_7" name="lotteryCode" matchId="${spfMatch.footballMatchId }" lotteryInfo="7_${spfMatch.footballMatchId }_${spfMatch.spf8}_${betDate.pdate}_${spfMatch.gameNum}" onclick="selectLotteryInfo('lottery_${s.index }_7','${spfMatch.footballMatchId }')" >${spfMatch.spf8}</a>
			                        </div>
			                    </td>
			                    <td width="78" class="bdw"><a href="#">析</a><a href="#">亚</a><a href="#">欧</a></td>
			                    <td class="oupei">
			                    	<span>1.14</span>
			                        <span>6.50</span>
			                        <span>17.00</span>
			                    </td>
			                </tr>
		                </c:if>
	                </c:forEach>
	           	</table>
         	</c:forEach>
        </div>
        
        
        <div class="bet_order fn_clear">
        	<div class="notz" style="display:none;">
            	<em class="xzcc">已选择 0 场</em>
                <em class="alm">至少选择一场比赛</em>
            </div>
            <div class="sd">
            	<a href="#" class="sd">
                	<em>已选<i id="selectedMatches">0</i>场</em>
                    <cite>[设胆]</cite>
                </a>
                <div class="sdbox">
                	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                    	<tr>
                        	<th width="70">序号</th>
                            <th width="110">对阵</th>
                            <th width="200">投注内容</th>
                            <th>设胆</th>
                            <th><a href="#">全删</a></th>
                        </tr>
                        <tr>
                        	<td>周日024</td>
                            <td>戈亚斯 VS 累体育</td>
                            <td><a href="#">(-1)平</a><a href="#">(-1)负</a></td>
                            <td><input type="checkbox" /></td>
                            <td><a href="#" class="det">x</a></td>
                        </tr>
                        <tr>
                        	<td>周日025</td>
                            <td>戈亚斯 VS 累体育</td>
                            <td><a href="#">(-1)平</a><a href="#">(-1)负</a></td>
                            <td><input type="checkbox" /></td>
                            <td><a href="#" class="det">x</a></td>
                        </tr>
                        <tr>
                        	<td>周日026</td>
                            <td>戈亚斯 VS 累体育</td>
                            <td><a href="#">(-1)平</a><a href="#">(-1)负</a></td>
                            <td><input type="checkbox" /></td>
                            <td><a href="#" class="det">x</a></td>
                        </tr>
                    </table>
                    <h5 class="fn_clear">
                    	<em>您的方案属于<i>胜平负</i>玩法</em>
                        <cite>隐藏</cite>
                    </h5>
                </div>
            </div>
            
            <div class="sdgg">
            	<div class="cks">
                	<em>过关方式：</em>
                     <label><input class="radio_ck" readonly="readonly" checked="checked" type="checkbox" />2串1</label>
                    <!--<label><input class="radio_ck"  type="checkbox" />3串1</label>
                    <cite>
                    	<a href="#" class="hd">更多方式</a>
                        <div class="morefs fn_clear">
                        	<h4>请选择过关方式<a href="#">隐藏</a></h4>
                            <div class="morefsbox">
                            	<div class="fn_clear">
                                    <label><input type="checkbox" class="radio_ck" />3串3</label>
                                    <label><input type="checkbox" class="radio_ck" />3串4</label>
                                </div>
                                <div class="fn_clear">
                                    <label><input type="checkbox" class="radio_ck" />3串3</label>
                                    <label><input type="checkbox" class="radio_ck" />3串4</label>
                                    <label><input type="checkbox" class="radio_ck" />3串3</label>
                                    <label><input type="checkbox" class="radio_ck" />3串4</label>
                                    <label><input type="checkbox" class="radio_ck" />3串4</label>
                                </div>
                                <div class="fn_clear">
                                    <label><input type="checkbox" class="radio_ck" />3串3</label>
                                    <label><input type="checkbox" class="radio_ck" />3串4</label>
                                    <label><input type="checkbox" class="radio_ck" />3串3</label>
                                    <label><input type="checkbox" class="radio_ck" />3串4</label>
                                    <label><input type="checkbox" class="radio_ck" />3串4</label>
                                </div>
                                <div class="fn_clear">
                                    <label><input type="checkbox" class="radio_ck" />3串3</label>
                                    <label><input type="checkbox" class="radio_ck" />3串4</label>
                                    <label><input type="checkbox" class="radio_ck" />3串3</label>
                                    <label><input type="checkbox" class="radio_ck" />3串4</label>
                                    <label><input type="checkbox" class="radio_ck" />3串4</label>
                                </div>
                            </div>
                        </div>
                    </cite>
                     -->
                </div>
                <div class="bs">
                	<em>投注倍数：</em>
                    <div class="btns"><input type="button" onclick="add()"  class="det" /><input type="text" id="lotteryCount" value="1" /><input type="button" class="add" onclick="minus()"  /></div>
                    <div class="bsinfo">金额：<i id="totalMoney">2</i> 元 </div>
                </div>
            </div>
            
            <cite class="go">
            	<a href="javascript:void(0)" onclick="toBuy()"><img src="<%=basePath %>static/images/btnqr.jpg" /></a>
            </cite>
        </div>
        
        <div class="bet_notice">
        	<h4>竞彩足球投注提示：</h4>
            <p>1、让球只适合“让球胜平负”玩法,“+”为客让主，“-”为主让客。</p>
            <p>2、<em class="red">页面中过关投注固定奖金仅供参考，实际奖金以出票时刻奖金为准。投注区显示的中奖金额=每1元对应中奖奖金。</em></p>
            <p>3、过关投注完场显示的奖金仅指比赛截止投注时最终变化的过关奖金，仅供参考，派奖奖金以方案详情中最终出票时刻的奖金为准。</p>
            <p>4、单关投注，单注最高奖金限额为500万元；2或3场过关投注，单注最高奖金限额为20万元；4或5场过关投注，单注最高奖金限额为50万元；6场过关投注，单注最高奖金限额100万元。</p>
            <p>5、单注彩票保底奖金：如果单注奖金不足2元，则补足至2元。</p>
            <p>6、竞彩足球可出票时间：周一 ～ 周五 9:00-24:00 周六/日 9:00 - 次日01:00。				</p>
        </div>
        
    </div>
</div>
<!--main end -->
<jsp:include page="../footer.jsp"></jsp:include>
<div class="opacity">
	<div class="dialog">
    	<div class="diatitle"><em>提示</em></div>
        <div class="diabox">
        	提示信息
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
	var totalMoney = 0;
	
	     
	function trInfoHidden(trId){
		$("tr[name="+trId+"]").toggle();
	}
	
	//控制投注是否显示让球
	function spfTypeChange(type){
		if(type==0){
			$("div[name=bet_odd]").show();
			$("div[name=bet_even]").show();
			$("p[name=bet_odd]").show();
			$("p[name=bet_even]").show();
		}else if(type==1){
			$("div[name=bet_odd]").show();
			$("div[name=bet_even]").hide();
			$("p[name=bet_odd]").show();
			$("p[name=bet_even]").hide();
		}else if(type==2){
			$("div[name=bet_odd]").hide();
			$("div[name=bet_even]").show();
			$("p[name=bet_odd]").hide();
			$("p[name=bet_even]").show();
		}
	}
	
	//选购彩票
	function selectLotteryInfo(index,matchId){
	     
	     var selectTotal = 0;
	     
	     var lotteryClass = $("#"+index).attr('class');
         if(lotteryClass == "red"){
              $("#"+index).removeClass("red");
          }else{
	          $("#"+index).addClass("red");
       }
       var selectedLottery = $("a.red[name='lotteryCode']");
       var totalMatchIds = "";
	   var matchIds ="";
       for(var t=0;t<selectedLottery.length;t++){
         var mId = selectedLottery[t].getAttribute("matchId");
         if(matchIds.indexOf(mId)<0){
            matchIds+=mId+";";
	        selectTotal++;
	     } 
	     totalMatchIds+=mId+";";
       }
       
       if(totalMatchIds != ""){
         totalMatchIds = totalMatchIds.substring(0,totalMatchIds.length-1);
       }
       
       if(selectTotal > 0){
       		//if((selectTotal == selectedLottery.length) && selectTotal >= 2){
               totalMoney = selectTotal*(selectTotal-1);
               $("#totalMoney").html(totalMoney);
      		 //}
          $("#selectedMatches").html(selectTotal);
       }else{
          $("#selectedMatches").html(0);
       }
       
	}
	
	//购买操作
    function toBuy(){
      var lotteryCount = $("#lotteryCount").val();
      var selectedLottery = $("a.red[name='lotteryCode']");
      var selectTotal = 0;
      var lotteryInfoList = "";
      
       var matchIds ="";
       for(var t=0;t<selectedLottery.length;t++){
         var mId = selectedLottery[t].getAttribute("matchId");
         var loterryInfo = selectedLottery[t].getAttribute("lotteryInfo");
         if(matchIds.indexOf(mId)<0){
            matchIds+=mId+";";
	        selectTotal++;
	     } 
	     lotteryInfoList+=loterryInfo+";";
       }
       
       /*if(lotteryInfoList != ""){
         lotteryInfoList = lotteryInfoList.substring(0,lotteryInfoList.length-1);
       }*/
      
      if(selectTotal <= 0){
         alert("请先勾选投注信息！");
         return false;
      }else if(selectTotal == 1){
         alert("至少选择两场比赛信息！");
         return false;
      }else{
         window.location.href="${pageContext.request.contextPath}/order/jczq/jqs/orderconfirm?&lotteryInfoList="+lotteryInfoList+"&lotteryCount="+lotteryCount+"&totalMoney="+totalMoney;
      }
    }
	
	//减少投注
    function minus(){
       var lotteryCount = $("#lotteryCount").val();
       if(isInt(lotteryCount)){
         if(lotteryCount <= 1){
            alert("最少投注一注！");
         }else{
             lotteryCount--;
             $("#lotteryCount").val(lotteryCount);
             totalMoney = lotteryCount*totalMoney;
             $("#totalMoney").html(totalMoney);
         }
       }else{
          alert("您输入的投注倍数不是整数，请您输入正确的数据以后再投注！");
       }
    }
    
    //增加投注
    function add(){
      var lotteryCount = $("#lotteryCount").val();
       if(isInt(lotteryCount)){
          lotteryCount++;
          $("#lotteryCount").empty();
          $("#lotteryCount").val(lotteryCount);
          totalMoney = totalMoney*lotteryCount;
          $("#totalMoney").html(totalMoney);
       }else{
          alert("您输入的投注倍数不是整数，请您输入正确的数据以后再投注！");
       }
    }
    
     //判断是否整数
    function isInt(s){
       var  type="^[0-9]*[1-9][0-9]*$"; 
       var  re = new RegExp(type); 
       if(s.match(re)==null) 
        { 
          return false;
        }else{
          return true;
        }
    }
    
</script>

</html>
