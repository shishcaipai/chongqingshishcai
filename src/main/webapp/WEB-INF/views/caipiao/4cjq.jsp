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
               	   <em><img src="<%=basePath %>static/images/ico_zq.jpg" /><i>4场进球彩</i></em>
                   <cite>
                   	  <span>式截止时间： <i>2014-06-23 23:25 </i></span><br />
                      <span>单式截止时间：<i> 2014-06-23 23:05(≥ 10万 22:50)</i></span>
                   </cite>
               </div>
               
               <div class="inforx9">
                  <h4>投注说明：对4场比赛的8支球队至少各选1种进球结果 <i>500万元</i> <a href="#">玩法规则</a></h4>
               </div>
               
               <div class="cennum">
               	   <div class="choose">
                   	   <label><input name="period" type="radio" checked="checked" onclick="getFootballMatchList('${requestScope.currentPeriod.lotteryCode }','${requestScope.currentPeriod.lotteryPeriod }')" /><i class="red"><c:out value="${requestScope.currentPeriod.lotteryPeriod }"></c:out>(当前期)</i></label><label></label>
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
                                <th width="8%" rowspan="2">赛 事</th>
                                <th width="9%" rowspan="2">比赛时间</th>
                                <th width="18%" rowspan="2">对阵球队</th>
                                <th width="10%" rowspan="2">数据分析</th>
                                <th colspan="3">平均欧指</th>
                                <th colspan="4">选号区</th>
                                <th style="border-right:none;" width="5%" rowspan="2">操作</th>
                              </tr>
                              <tr>
                                <th width="6%" class="pjoz_bg">胜</th>
                                <th width="6%" class="pjoz_bg">平</th>
                                <th width="6%" class="pjoz_bg">负</th>
                                <th width="7%" class="xh_bg">0</th>
                                <th width="7%" class="xh_bg">1</th>
                                <th width="7%" class="xh_bg">2</th>
                                <th width="7%" class="xh_bg">3+</th>
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
           	  <div class="title"><em>4场进球彩开奖结果</em></div>
             <div class="mdbox">
              	   <h4 class="date"><i>第14090期</i>开奖日期：2014-06-21</h4>
               <h3 class="numk">2 1 2 1 0 0 * *</h3>
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
            var info='';
            for(var i=0;i<data.length;i++){      
              info+='<tr><td rowspan="2">'+(i+1)+'</td><td rowspan="2"><a href="#" target="_blank">'+data[i].league+'</a><a href="#" target="_blank"></a></td><td rowspan="2">'+data[i].pdate+' </td>'+
                    '<td><a target="_blank" href="#">'+data[i].homesxName+'</a></td>'+
                    '<td rowspan="2" class="xyo"><a href="#" target="_blank">析</a><a href="#" target="_blank">亚</a><a href="#" target="_blank">欧</a></td>'+
                    '<td rowspan="2">'+data[i].nspf1+'</td><td rowspan="2">'+data[i].nspf2+'</td> <td rowspan="2">'+data[i].nspf3+'</td>'+
                    '<td><label><input name="" type="checkbox" value="" />0</label></td>'+
                    '<td><label><input name="" type="checkbox" value="" />1</label></td>'+
                    '<td><label><input name="" type="checkbox" value="" />2</label></td>'+
                    '<td><label><input name="" type="checkbox" value="" />3+</label></td>'+
                    '<td class="chooseall"><a href="javascript:void(0);">全</a></td></tr>'+
                    '<tr><td><a target="_blank" href="#">'+data[i].awaysxName+'</a></td>'+
                    '<td><label><input name="" type="checkbox" value="">0</label></td>'+
                    '<td><label><input name="" type="checkbox" value="">1</label></td>'+
                    '<td><label><input name="" type="checkbox" value="">2</label></td>'+
                    '<td><label><input name="" type="checkbox" value="">3+</label></td>'+
                    '<td class="chooseall"><a href="javascript:void(0);">全</a></td></tr>';
            }
            $("#footballMatch").append(info);
        }  
    });  
   }
</script>
</html>

