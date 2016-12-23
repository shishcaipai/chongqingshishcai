<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
			rel="stylesheet" />
		<link href="<%=basePath%>static/css/style.css" type="text/css"
			rel="stylesheet" />
		<title>彩票100</title>
	</head>

	<body>
		<jsp:include page="../header.jsp"></jsp:include>
		<jsp:include page="../banner.jsp"></jsp:include>
		<!--banner part-->
		<div class="banner">
			<div class="wrap">

				<div class="s_part fn_clear">
					<div class="lp1" id="pub">
						<div class="title">
							<a href="#" class="hover">彩票100公告</a>
							<a href="#">接口参数说明</a>
							<a href="#" class="last">接口类型说明</a>
						</div>
						<div class="lp1_box">
							<div style="display: block;">
								<!--   <c:forEach items="${requestScope.footBallMatchList }" var="footballMatch">
                	       <p><a href="#">${footballMatch.homesxName }</a></p>
                	    </c:forEach>
                       -->
                       			<p>
									<a href="#">彩票100数据均来自互联网，所有接口免费开放</a>
								</p>
								<p>
									<a href="#">调用接口前，请先注册用户名</a>
								</p>
								<p>
									<a href="#">由于本人经历有限，目前提供7种足球彩票接口</a>
								</p>
								<p>
									<a href="#">后续会提高接口数据的准确性</a>
								</p>
								<p>
									<a href="#">后续会增加彩票接口的类型：如体彩，单场等任何其他接口数据</a>
								</p>
								<p>
									<a href="#"><font style="color: #FF0000;">彩票100目前是试运行阶段，不保证本站提供的数据的准确性、安全性和完整性</font></a>
								</p>
							</div>
							<div style="display: none;">
								<p>
									<a href="#">地址：www.caipiao100.net/caipiao100/football/matchList</a>
								</p>
								<p>
									<a href="#">调用接口,须设置日期参数：pdate=yyyy-MM-dd</a>
								</p>
								<p>
									<a href="#">调用接口,须设置类型参数：typeCode=jczq-sfp</a>
								</p>
								<p>
									<a href="#">调用接口,须设置注册的用户名参数：userName=apple@126.com</a>
								</p>
								<p>
									<a href="#">调用接口,须设置用户密码参数：password=123456</a>
								</p>
								<p>
									<a href="http://www.caipiao100.net/caipiao100/football/matchList?pdate=2014-12-12&typeCode=jczq-sfp&userName=88888@126.com&password=123456">
									示例：www.caipiao100.net/caipiao100/football/matchList?pdate=2014-12-12&typeCode=jczq-sfp&userName=88888@126.com&password=123456</a>
								</p>
							</div>
							<div style="display: none;">
								<p>
									<a href="#">竞彩足球,胜负平/让球：typeCode=jczq-sfp</a>
								</p>
								<p>
									<a href="#">竞彩足球,进球数：typeCode=jczq-jqs</a>
								</p>
								<p>
									<a href="#">竞彩足球,半全场：typeCode=jczq-bqc</a>
								</p>
								<p>
									<a href="#">足彩,胜负彩：typeCode=zc_sfc</a>
								</p>
								<p>
									<a href="#">足彩,四场进球：typeCode=zc_jq4</a>
								</p>
								<p>
									<a href="#">足彩,六场半全场：typeCode=zc_zc6</a>
								</p>
							</div>
						</div>
					</div>

			

					<div class="rp">
						<div class="rp_box">
							<a href="<%=basePath%>jzspf"><em><img src="<%=basePath%>static/images/ico_zu.png" />
							</em><b>竞足</b><cite>胜平负/让球</cite>
							</a>
							<a href="<%=basePath%>jzjqs"><em><img src="<%=basePath%>static/images/ico_zu.png" />
							</em><b>竞足</b><cite>进球数</cite>
							</a>
							<a href="<%=basePath%>jzbqc"><em><img src="<%=basePath%>static/images/ico_zu.png" />
							</em><b>竞足</b><cite>半全场</cite>
							</a>
							<a href="#"><em><img
										src="<%=basePath%>static/images/ico_pin.png" />
							</em><b>高频</b><cite>不止NBA,篮球可以这么玩</cite>
							</a>
							<a href="#" class="last"><em><img
										src="<%=basePath%>static/images/ico_ti.png" />
							</em><b>体彩</b><cite>不止NBA,篮球可以这么玩</cite>
							</a>
						</div>
					</div>
				</div>

				<div class="prize_now fn_clear">
					<div class="ico"></div>
					<div class="prize_box">
						<a href="#" class="prev"></a>
						<a href="#" class="next"></a>
						<div class="slides_container">
							<div class="list">
								<em><span class="name">双色球</span><span>第 <b>2014037</b>
										期</span><span>奖池：<font>115,259,940元</font>
								</span><span>01天00小时22分21秒后截止</span>
								</em>
								<cite><a href="#" class="tou">立即投注</a><a href="#">投一注</a><a
									href="#">参与合买</a><a href="#">多投几注</a>
								</cite>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!--banner part end -->
		<!--main-->
		<div class="main">
			<div class="wrap">
				<div class="model_index">

					<div class="title fn_clear">
						<em class="c1">竞技彩票</em>
						<cite><a href="<%=basePath%>sfc" target="_blank"
							class="hover">胜负彩</a><a href="<%=basePath%>4cjq" target="_blank">四场进球</a><a
							href="<%=basePath%>6cbqc" target="_blank">六场半全场</a><a
							href="<%=basePath%>rx9c" target="_blank" class="last">任选九场</a>
						</cite>
						<a href="#" class="more">更多</a>
					</div>

					<div class="model_box fn_clear">

						<div class="hot_race">
							<h4>
								焦点赛事
							</h4>
							<p class="time">
								<em>英超</em><cite>截止时间：04-06 20:20</cite>
							</p>
							<div class="vspart fn_clear">
								<div class="vsl">
									<em><img src="<%=basePath%>static/images/flag/f1.png" />
									</em>
									<cite>巴西</cite>
									<i>7</i>
								</div>
								<div class="vsc">
									VS
								</div>
								<div class="vsl">
									<em><img src="<%=basePath%>static/images/flag/f2.png" />
									</em>
									<cite>克罗地亚</cite>
									<i>20</i>
								</div>
							</div>
							<div class="vstxt">
								<p>
									<em>[<a href="#">欧赔</a>]</em><span class="red">1.30</span><span>5.01</span><span
										class="green">10.32</span>
								</p>
								<p>
									<em>[<a href="#">亚盘</a>]</em><span class="red">1.04</span><span>球半</span><span
										class="green">0.82</span>
								</p>
								<p>
									<em>[<a href="#">交战</a>]</em><span>近2场巴西1胜1平0负</span>
								</p>
							</div>
							<div class="toutxt">
								<p>
									<a href="#">投注北单</a><a href="#">投注竞彩</a>
								</p>
							</div>
							<div class="ad_l1">
								<a href="#"><img src="<%=basePath%>static/images/ad2.jpg" />
								</a>
							</div>
						</div>

						<div class="cennum">
							<div class="cennbox fn_clear">
								<div class="cenlist">
									<table width="100%" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<th>
												场次
											</th>
											<th>
												比赛
											</th>
											<th>
												平均欧赔
											</th>
											<th>
												数据分析
											</th>
										</tr>

										<c:forEach items="${requestScope.sfcMatchList }"
											var="footballMatch" varStatus="vs">
											<tr>
												<td>
													${vs.index+1 }
												</td>
												<td>
													<a href="#">${footballMatch.homesxName }</a><i>VS</i><a
														href="#">${footballMatch.awaysxName }</a>
												</td>
												<td>
													<span>${footballMatch.nspf1 }</span><span>${footballMatch.nspf2
														}</span><span>${footballMatch.nspf3 }</span>
												</td>
												<td>
													<a href="#">析</a><a href="#">亚</a><a href="#">欧</a>
												</td>
											</tr>
										</c:forEach>


									</table>
								</div>
								<div class="tzlist" id="tzlist">
									<table width="100%" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<th>
												选号
											</th>
										</tr>
										<c:forEach items="${requestScope.sfcMatchList }"
											var="footballMatch" varStatus="s">
											<tr>
												<td>
													<a id="sfc_${s.index }_3" href="javascript:void(0)" onclick="selectSfc('${s.index }',3)">3</a>
													<a id="sfc_${s.index }_1" href="javascript:void(0)" onclick="selectSfc('${s.index }',1)">1</a>
													<a id="sfc_${s.index }_0" href="javascript:void(0)" onclick="selectSfc('${s.index }',0)">0</a>
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
							<div class="cnncontrol">
								<span id="selectText"></span><a href="javascript:void(0)"
									onclick="toBuy()">立即投注</a>
							</div>
						</div>


						<div class="r_infos">
							<h4>
								足球数据
							</h4>
							<ul class="data1 fn_clear">
								<li>
									<a href="http://league.aicai.com/cup/71_2014/" target="_blank"
										class="ogIcon"></a><a
										href="http://league.aicai.com/cup/71_2014/" target="_blank">赛程赛果</a>
								</li>
								<li>
									<a href="http://league.aicai.com/cup/71_scorerank_2014/"
										target="_blank" class="ycIcon"></a><a
										href="http://league.aicai.com/cup/71_scorerank_2014/"
										target="_blank">积分榜</a>
								</li>
								<li>
									<a href="http://league.aicai.com" target="_blank"
										class="moreIcon"></a><a href="http://league.aicai.com/"
										target="_blank">更多数据</a>
								</li>
							</ul>
							<h4 class="link fn_clear">
								必发指数
								<a href="#">更多>></a>
							</h4>
							<p class="vs">
								克罗地亚 vs 澳大利亚
								<a href="#">成交走势</a>
							</p>
							<ul class="data2 fn_clear">
								<li class="fn_clear">
									<em>主胜</em><cite><i
										style="width: 53.69%; background-color: red;"></i>
									</cite><span style="color: red;">53.69%</span>
								</li>
								<li class="fn_clear">
									<em>平局</em><cite><i
										style="width: 12.67%; background-color: green;"></i>
									</cite><span style="color: green;">12.67%</span>
								</li>
								<li class="fn_clear">
									<em>客胜</em><cite><i
										style="width: 17.24%; background-color: #0099ff;"></i>
									</cite><span style="color: #0099ff;">17.24%</span>
								</li>
							</ul>
							<h4>
								其他应用
							</h4>
							<p class="linktool">
								<a href="#">智能过滤</a><a href="#">足球比分</a><a href="#">篮球比分</a><a
									href="#">单关配</a><a href="#">过关统计</a>
							</p>
						</div>
					</div>
				</div>

				<div class="model_index">

					<div class="title fn_clear">
						<em class="c2">高频彩票</em>
						<cite><a href="#">广东11选5</a><a href="#">老11选5</a><a
							href="#">好运11选5</a><a href="#">快乐8</a><a href="#">新时时彩</a><a
							href="#" class="last">快3</a>
						</cite>
						<a href="#" class="more">更多</a>
					</div>

					<div class="model_box fn_clear">

						<div class="hot_race">
							<h4 class="ti fn_clear">
								数据盘点
							</h4>
							<p class="txti">
								双色球本期要点
							</p>
							<p class="txti">
								红球本期最大遗漏号：
								<em>07 32 10</em>
							</p>
							<p class="txti"
								style="border-bottom: 1px solid #e2e2e2; padding-bottom: 20px;">
								蓝球本期最大遗漏号：
								<em>05 03 07</em>
							</p>
							<br />
							<p class="txti">
								大乐透本期要点
							</p>
							<p class="txti">
								前区近30期开奖热号：
								<em>15 17 29</em>
							</p>
							<p class="txti"
								style="border-bottom: 1px solid #e2e2e2; padding-bottom: 20px;">
								后区近30期开奖热号：
								<em>11 03 01</em>
							</p>
							<br />
							<h4 class="ti fn_clear" style="padding-bottom: 10px;">
								数字彩资讯
							</h4>
							<div class="hot_list">
								<p>
									<a href="#">双色球063期攻略：蓝球看小码</a>
								</p>
								<p>
									<a href="#">双色球063期提醒：断区呼之欲出</a>
								</p>
								<p>
									<a href="#">双色球063期合买：红人合力擒奖</a>
								</p>
								<p>
									<a href="#">大乐透065期攻略：大数仍热出</a>
								</p>
								<p>
									<a href="#">大乐透065期合买：实力红人发力</a>
								</p>
								<p>
									<a href="#">福彩字谜和胆码：太湖钓叟推荐</a>
								</p>
							</div>
						</div>

						<div class="cennum">
							<ul class="data3">
								<li class="fn_clear">
									<h4>
										11选5
									</h4>
									<p>
										<span><b>第14060601期</b><i>10时13分08秒后截止</i>
										</span>
										<br />
										猜对 1 个号就中奖，返奖率 59%
									</p>
									<a href="#" class="go">立即投注</a>
								</li>
								<li class="fn_clear">
									<h4>
										新11选5
									</h4>
									<p>
										<span><b>第14060601期</b><i>9时41分55秒后截止</i>
										</span>
										<br />
										猜对 1 个号就中奖，返奖率 59%
									</p>
									<a href="#" class="go">立即投注</a>
								</li>
								<li class="fn_clear">
									<h4>
										广东11选5
									</h4>
									<p>
										<span><b>第14060584期 </b><i>01分29秒后截止</i>
										</span>
										<br />
										猜对 1 个号就中奖，返奖率 59%
									</p>
									<a href="#" class="go">立即投注</a>
								</li>
								<li class="fn_clear">
									<h4>
										快乐8
									</h4>
									<p>
										<span><b>第140606001期</b><i>9时51分29秒后截止</i>
										</span>
										<br />
										返奖率59%，10分钟一期
									</p>
									<a href="#" class="go">立即投注</a>
								</li>
								<li class="fn_clear">
									<h4>
										新时时彩
									</h4>
									<p>
										<span><b>第140606001期</b><i>9时51分29秒后截止</i>
										</span>
										<br />
										返奖率59%，10分钟一期
									</p>
									<a href="#" class="go">立即投注</a>
								</li>
								<li class="fn_clear">
									<h4>
										快3
									</h4>
									<p>
										<span><b>第140606001期</b><i>9时51分29秒后截止</i>
										</span>
										<br />
										返奖率59%，10分钟一期
									</p>
									<a href="#" class="go">立即投注</a>
								</li>
							</ul>
						</div>


						<div class="r_infos">
							<h4>
								最新中奖
							</h4>
							<div class="zprize">
								<p>
									<em>恭喜1862687****</em><cite><i>39分钟前中</i><b>广东11选5</b><span>540元</span>
									</cite>
								</p>
								<p>
									<em>恭喜75****</em><cite><i>39分钟前中</i><b>广东11选5</b><span>95元</span>
									</cite>
								</p>
								<p>
									<em>恭喜wbmwang</em><cite><i>39分钟前中</i><b>广东时时彩</b><span>1850元</span>
									</cite>
								</p>
								<p>
									<em>恭喜aicaihao</em><cite><i>39分钟前中</i><b>新11选5</b><span>540元</span>
									</cite>
								</p>
							</div>
							<h4 style="margin-bottom: 0;">
								合买指引
							</h4>
							<div class="fn_clear zy">
								<p>
									<a href="#">什么是合买?</a>
								</p>
								<p>
									<a href="#">如何参与方案合买？</a>
								</p>
								<p>
									<a href="#">什么是方案保密？</a>
								</p>
								<p>
									<a href="#">方案置顶有哪些规则</a>
								</p>
								<p>
									<a href="#">什么是方案保底?</a>
								</p>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
		<!--main end -->
		<jsp:include page="../footer.jsp"></jsp:include>
		<script type="text/javascript">

    var arr=new Array(); 
    var buyNumber = new Array();
    
    //初始化
    for(var i=0;i<14;i++){
      arr[i]=0;
    }
    
    for(var j=0;j<14;j++){
      buyNumber[j]="";
    }
    
    var allSelectFlag=false;
    var totalMoney=0;//总金额
    var name="";
    var lotteryCode="zc_sfc";
    var buyCaiNumber="";
    var lotterySelectCount=1;
    
    function selectSfc(index,score){//hover
       var lotteryCount=1;
       var selectFlag=true;
       if(($("#sfc_"+index+"_"+score).attr("class") == "") || ($("#sfc_"+index+"_"+score).attr("class") == null)){
       	  if(arr[index] == 0){
       	    arr[index]=1;
       	  }else{
       	    arr[index]++;
       	  }
       }else{
          if(arr[index] > 0){
            arr[index]--;
          }
       }
       for(var t=0;t<arr.length;t++){
          if(arr[t] <= 0){
            selectFlag=false;
          }
          lotteryCount=lotteryCount*arr[t];
       }
       
       if(buyNumber[index] == null ){
      	 buyNumber[index]+=score;
       }else if(buyNumber[index].indexOf(score) < 0){
         buyNumber[index]+=score;
       }
              
       if(selectFlag){
       	  lotterySelectCount = lotteryCount;
       	  allSelectFlag=true;
          var text="您共选择了 "+lotteryCount+" 注，共计 "+(lotteryCount*2)+" 元";
          totalMoney=(lotteryCount*2);
          name="胜负彩"+lotteryCount+"注，"+totalMoney+"元";
          $("#selectText").empty();
          $("#selectText").html(text);
       }
    }
    
    function toBuy(){
        if(allSelectFlag){
            buyCaiNumber="";
            for(var i=0;i<buyNumber.length;i++){
              buyCaiNumber+=buyNumber[i]+"-";
            }
            buyCaiNumber = buyCaiNumber.substring(0,buyCaiNumber.length-1);
            window.location.href="${pageContext.request.contextPath}/order/sfc/orderconfirm?lotteryCount="+lotterySelectCount+"&totalMoney="+totalMoney+"&lotteryCode="+lotteryCode+"&buyCaiNumber="+buyCaiNumber+"&name="+name;
        }else{
          alert("请正确投注!");
        }
    }
    
     $(document).ready(function(){
       var text="您共选择了 0 注，共计 0 元";
       $("#selectText").empty();
       $("#selectText").html(text);
     });
    
</script>
	</body>
</html>
