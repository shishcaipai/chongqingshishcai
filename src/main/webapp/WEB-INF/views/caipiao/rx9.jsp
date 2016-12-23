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
<title>1000万不是梦想！</title>
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../banner.jsp"></jsp:include>
<!--main-->
<div class="main fn_clear">
	<div class="wrap fn_clear">
        
       <div class="box848">
       	   <div class="rx9">
           	   
               <div class="trx9">
               	   <em><img src="<%=basePath %>static/images/ico_zq.jpg" /><i>任选9场</i></em>
                   <cite>
                   	  <span>式截止时间： <i>2014-06-23 23:25 </i></span><br />
                      <span>单式截止时间：<i> 2014-06-23 23:05(≥ 10万 22:50)</i></span>
                   </cite>
               </div>
               
               <div class="inforx9">
                  <h4>投注说明：从14场比赛中至少选择9场比赛，每场比赛至少选择1种比赛结果，最高奖金 <i>500万元</i> <a href="#">玩法规则</a></h4>
               </div>
               
               <div class="cennum">
               	   <div class="choose">
                   	   <label><input name="period" type="radio" checked="checked" onclick="getFootballMatchList('${requestScope.currentPeriod.lotteryCode }','${requestScope.currentPeriod.lotteryPeriod }')" /><i class="red"><c:out value="${requestScope.currentPeriod.lotteryPeriod }"></c:out> (当前期)</i></label><label></label>
                       <c:forEach items="${requestScope.newList }" var="p">
                      	 <label><input name="period" type="radio" onclick="getFootballMatchList('${p.lotteryCode }','${p.lotteryPeriod }')" /><i>${p.lotteryPeriod } (预售期)</i></label><label></label>
                       </c:forEach>
                       <select>
                       	   <option value="-1">历史期</option>
                           <c:forEach items="${requestScope.historyList }" var="period">
                       	      <option value="${period.lotteryPeriod }" onclick="getFootballMatchList('${period.lotteryCode }','${period.lotteryPeriod }')">${period.lotteryPeriod }</option>
                       	   </c:forEach>
                       </select>
                   </div>
                   <div class="cen_table">
                   	   <table width="100%" cellpadding="0" cellspacing="0" border="0">
                       	    <thead>
                              <tr>
                                <th width="5%" rowspan="2">场次</th>
                                <th rowspan="2" width="9%">赛 事</th>
                                <th rowspan="2">比赛时间</th>
                                <th rowspan="2">对阵球队</th>
                                <th  rowspan="2">数据分析</th>
                                <th colspan="3"><select id="jq_select_data">
                                    <option value="jq_odds_avgOdds">平均欧指</option>
                                    <option value="jq_vote_rx9">投注比例</option>
                                    <option value="jq_asia_jp">亚&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;盘</option>
                                    <option value="jq_index_kelly">凯利指数</option>
                                    <option value="jq_index_ls_jp">离散指数</option>
                                  </select></th>
                                <th colspan="3">选号区</th>
                                <th rowspan="2">设胆</th>
                                <th style="border-right:none;" rowspan="2">操作</th>
                              </tr>
                              <tr>
                                <th class="pjoz_bg">胜</th>
                                <th class="pjoz_bg">平</th>
                                <th class="pjoz_bg">负</th>
                                <th class="xh_bg">胜</th>
                                <th class="xh_bg">平</th>
                                <th class="xh_bg">负</th>
                              </tr>
                            </thead>
                            <tbody id="footballMatch">
                              
                            </tbody>
                       </table>
                   </div>
                   
                   <div class="ceninp">
                   		<p>您选择了 <i class="red fb">0</i> 注, 倍数 <input type="text" /> 倍 （最大9999倍），金额 <i class="red fb">0</i>元</p>
                   </div>
                   <br />
                   <p align="right" style="padding-bottom:10px;"><input class="inp1" type="button" value="立即购买" /></p>
                   <p align="right"><input type="checkbox" />我已阅读了《用户合买代购协议》并同意其中条款</p>
                   
               </div>
               
               
           </div>
       </div>
       <div class="box260">
       	   <div class="modelr">
           	  <div class="title"><em>任9开奖结果</em></div>
             <div class="mdbox">
              	   <h4 class="date"><i>第14081期</i>开奖日期：2014-06-23</h4>
               <h3 class="numk">100331*******</h3>
                  <table cellpadding="0" width="100%" cellspacing="0" class="j1">
               	        <tr>
                       	   <td class="td1" width="35%">一等奖：</td>
                           <td>0 注</td>
                           <td><i class="red">0</i>元</td>
                        </tr>
                        <tr>
                       	   <td class="td1">二等奖：</td>
                           <td>0 注</td>
                           <td><i class="red">0</i>元</td>
                        </tr>
                        <tr>
                       	   <td class="td1">任选9场：</td>
                           <td>0 注</td>
                           <td><i class="red">0</i>元</td>
                        </tr>
                        <tr>
                       	   <td class="td1">奖池滚存：</td>
                           <td colspan="2"><i class="red">-</i>元</td>
                        </tr>
                  </table>
              </div>
           </div>
       	   <div class="modelr">
           	    <div class="title"><em>最新资讯</em></div>
                <div class="mdbox art">
                	<p><a href="#">竞彩足球官方开停售时间公告</a></p>
                    <p><a href="#">会员单挑比赛比分100元狂中5万8</a></p>
                    <p><a href="#">会员336元稳博比分斩下9万3</a></p>
                    <p><a href="#">财神驾到 两会员神串关合斩50万</a></p>
                    <p><a href="#">081期足彩大势：难度适中莫失良机</a></p>
                    <p><a href="#">081期完全解盘:阿根廷取胜无忧</a></p>
                    <p><a href="#">081彩果：西班牙英格兰皆告负</a></p>
                    <p><a href="#">财神驾到 两会员神串关合斩50万</a></p>
                    <p><a href="#">081期足彩大势：难度适中莫失良机</a></p>
                    <p><a href="#">081期完全解盘:阿根廷取胜无忧</a></p>
                </div>
           </div>
           
           <div class="adr"><a href="#"><img src="<%=basePath %>static/images/ad3.jpg" /></a></div>
           
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

  $(document).ready(function(){
      var lotteryCode='${requestScope.currentPeriod.lotteryCode }';
      var currentId='${requestScope.currentPeriod.lotteryPeriod }';
      getFootballMatchList(lotteryCode,currentId);
	});
   
   function getFootballMatchList(lotteryCode,periodId){
      $.ajax( {  
        type : "get",  
        url : "${pageContext.request.contextPath}/"+lotteryCode+"/"+periodId,  
        dataType:"json",  
        success : function(data) { 
         	$("#footballMatch").empty();
         	
         	/*var text='';
         	for(var p in data[0]){
         	  text+=p+'!';
         	}
         	alert(text);*/
            var info='';
            for(var i=0;i<data.length;i++){                             
              info+='<tr><td>'+(i+1)+'</td><td><a href="#" target="_blank">'+data[i].league+'</a></td><td>'+data[i].pdate+'</td>'+
                    ' <td><a target="_blank" href="#">'+data[i].homesxName+'</a><strong class="vs">vs</strong><a target="_blank" href="#">'+data[i].awaysxName+'</a></td>'+
                    '<td class="xyo"><a href="#" target="_blank">析</a><a href="#" target="_blank">亚</a><a href="#" target="_blank">欧</a></td>'+
                    '<td>'+data[i].nspf1+'</td><td>'+data[i].nspf2+'</td><td>'+data[i].nspf3+'</td>'+
                    '<td><label><input name="" type="checkbox" value="" />3</label></td>'+
                    '<td><label><input name="" type="checkbox" value="" />1</label></td>'+
                    '<td><label><input name="" type="checkbox" value="" />0</label></td>'+
                    '<td><input name="danname" type="checkbox" value="" /></td>'+
                    '<td class="chooseall"><a href="javascript:void(0);">全</a></td></tr>';
            }
            $("#footballMatch").append(info);
        }  
    });  
   }
</script>
</html>