<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0042)http://cc.77qiu.com/Trade/cqssc/cqssc.html -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>时时彩购买-|网上购彩|-|高频彩购买|-|投注|-|合买|--深受彩民信赖的购彩网站！</title>
<meta name="description" content="时时乐" />
<meta name="keywords" content="时时乐" />

<meta HTTP-EQUIV="pragma" CONTENT="no-cache"/>
<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"/>
<meta HTTP-EQUIV="expires" CONTENT="0"/>

<link href="http://www.vb6g.com/res/css/index.css" type="text/css" rel="stylesheet"/>
<script language="javascript" src="http://www.vb6g.com/res/js/base.js"></script>
<script type="text/javascript" src="http://www.vb6g.com/res/js/jquery-1.7.2.min.js"></script>
<script src="http://www.vb6g.com/res/js/js/buyTogether.js" type="text/javascript"></script> 
<script type="text/javascript">
function seturl(obj) {
    var a = document.getElementById("frame_content");
    a.src = obj;
}
</script>
</head>
<body>

<!--头部开始-->

<link href="http://www.vb6g.com/res/css/head.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="http://www.vb6g.com/res/img/favicon.new.ico" />
<script src="http://www.vb6g.com/res/js/ajaxfileupload.js" type="text/javascript"></script>

<script src="http://www.vb6g.com/res/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type : "post",
			url  : "user/getUser",
			success : function(res) {
				res = eval(res);
				var money = res[0].money;
				var frozenMoney = res[0].frozenMoney;
				
				$("#mymoeny").mouseover(function(){
					if ($(this).hasClass("over")) {
						$(this).removeClass("over");
						$(this).html("***");
					} else {
						$(this).addClass("over");
						$(this).html((money - frozenMoney).toFixed(2));
					}
				}); 
				
				$("#mymoeny").addClass("over").html((money - frozenMoney).toFixed(2));
				$("#username").html(res[0].username);
			}
		});
	});
</script>
<div class="mainbody">
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../banner.jsp"></jsp:include>
					
<ul id="tc_body">
	<li class="tc_a">
		<ul class="tc_a01">
			<li class="tc_a01_bt"><h2>彩票合买</h2></li>
			<li class="tc_a01_nr">
				<ul class="yh_a01">
					<li class="yh_a01_nr"><a href="together?type=0">全部彩种</a></li>
					
						<li class="yh_a01_nr"><a href="together?type=1">重庆时时彩</a></li>
					
						<li class="yh_a01_nr"><a href="together?type=8">广东11选5</a></li>
					
						<li class="yh_a01_nr"><a href="together?type=3">山东十一运</a></li>
					
						<li class="yh_a01_nr"><a href="together?type=4">江西11选5</a></li>
					
						<li class="yh_a01_nr"><a href="together?type=5">福彩3D</a></li>
					
				</ul>
			</li>
		</ul>
	</li>
	<li class="tc_b">
		
		<!-- <iframe id="ifname" width="100%" frameborder="0" scrolling="no" align="middle" src="sInfo" name="sInfo1" height="1075"></iframe> -->
		






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=GBK">

<title>合买方案</title>
<link href="http://www.vb6g.com/res/css/together.css" type="text/css" rel="stylesheet">
<script src="http://www.vb6g.com/res/js/js/buyTogether.js" type="text/javascript"></script> 
<script >

	function gopage(obj) {
		window.location.href="sInfo1.asp?page="+obj.value+"&classid="+401;
		}

</script>

</head>

<body>


<div class="toucai_hemai">
	<div class="toucai_hm_01">
	<input type="hidden" value=0 id="type"/>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tbody><tr>
			<td class="toucai_hm_03"><h2 style="margin-left: 30px;margin-top: -12px">&nbsp;&nbsp;全部彩种</h2></td>
			<td class="toucai_hm_04">
			
			</td>
		  </tr>
		</tbody></table>
	</div>


	<div class="toucai_hm_05">
  <table width="100%" id="SchemeList" border="0" cellspacing="0" cellpadding="0">
    <tbody><tr class="tab_hemai">
      <td style="padding-left:15px;width:120px;">发起人</td>
      <td style="width:120px;">方案金额</td>
      <td style="width:120px;">每份金额</td>
      <td style="width:120px;">方案进度</td>
      <td style="width:120px;">剩余份数</td>
      <td style="width:120px;">认购份数</td>
      <td style="text-align:center;">操作</td>
    </tr>
    
        <form action="" method="post"></form>
      <input name="pid" type="hidden" value="810592502">
      <input name="classId" type="hidden" value="401">
      
      
      <tr class="tab_hemai_2">
      	<td style="display:none">1</td>
        <td style="padding-left:15px;">
         
         
       	 
          似水***
         
        
		</td>

        <td><span class="new_hemai_red">84.00元</span></td>
        <td><span class="new_hemai_red">28.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         33% + 67%
         </td>
         <td>2份</td>
         
		 		
			 		 <td class="new_hemai_srk">
			 		 <input name="buynum" type="text" class="rec_text" id="btnBuy1num" value="1" /></td>
			 		 <td class="new_hemai_an">
			 		  <a onclick="javascript:btnBuy(this);" style="margin-left:25px;cursor:pointer;text-decoration:underline;color:blue;" id="btnBuy1">
			 		  	<input type="hidden" value="10522"/>
			 		  	<input type="hidden" value="2" />
			 		  	<input type="hidden" value="28.00" />
			 		  	<input type="hidden" value="0" />
			 		  	购买
			 		  </a>
			 		 <!-- <input name="提交" type="submit" class="btn_Dora_s" value="" onclick="return confirm(&#39;是否认购？&#39;)" /> -->
			 		 </td>
		 		
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">2</td>
        <td style="padding-left:15px;">
         
         
       	 
          东发***
         
        
		</td>

        <td><span class="new_hemai_red">400.00元</span></td>
        <td><span class="new_hemai_red">200.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 50%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">3</td>
        <td style="padding-left:15px;">
         
         
       	 
          似水***
         
        
		</td>

        <td><span class="new_hemai_red">84.00元</span></td>
        <td><span class="new_hemai_red">28.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 67%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">4</td>
        <td style="padding-left:15px;">
         
         
       	 
          东发***
         
        
		</td>

        <td><span class="new_hemai_red">220.00元</span></td>
        <td><span class="new_hemai_red">110.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 50%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">5</td>
        <td style="padding-left:15px;">
         
         
       	 
          东发***
         
        
		</td>

        <td><span class="new_hemai_red">408.00元</span></td>
        <td><span class="new_hemai_red">204.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 50%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">6</td>
        <td style="padding-left:15px;">
         
         
       	 
          喜来***
         
        
		</td>

        <td><span class="new_hemai_red">408.00元</span></td>
        <td><span class="new_hemai_red">204.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 50%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">7</td>
        <td style="padding-left:15px;">
         
         
       	 
          喜来***
         
        
		</td>

        <td><span class="new_hemai_red">408.00元</span></td>
        <td><span class="new_hemai_red">204.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 50%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">8</td>
        <td style="padding-left:15px;">
         
         
       	 
          喜来***
         
        
		</td>

        <td><span class="new_hemai_red">440.00元</span></td>
        <td><span class="new_hemai_red">220.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 50%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">9</td>
        <td style="padding-left:15px;">
         
         
       	 
          喜来***
         
        
		</td>

        <td><span class="new_hemai_red">804.00元</span></td>
        <td><span class="new_hemai_red">402.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 50%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">10</td>
        <td style="padding-left:15px;">
         
         
        	  <a href="betDetail?betId=10471" target="_blank" class="tc_hm_lianjie">
        	   li***
        	   </a>
       	 
       	 
        
		</td>

        <td><span class="new_hemai_red">144.00元</span></td>
        <td><span class="new_hemai_red">1.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         7% + 0%
         </td>
         <td>134份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">已撤单</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">11</td>
        <td style="padding-left:15px;">
         
         
        	  <a href="betDetail?betId=10470" target="_blank" class="tc_hm_lianjie">
        	   li***
        	   </a>
       	 
       	 
        
		</td>

        <td><span class="new_hemai_red">144.00元</span></td>
        <td><span class="new_hemai_red">1.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 0%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">12</td>
        <td style="padding-left:15px;">
         
         
       	 
          喜气***
         
        
		</td>

        <td><span class="new_hemai_red">9600.00元</span></td>
        <td><span class="new_hemai_red">4800.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 50%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">13</td>
        <td style="padding-left:15px;">
         
         
       	 
          喜气***
         
        
		</td>

        <td><span class="new_hemai_red">18000.00元</span></td>
        <td><span class="new_hemai_red">9000.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 50%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">14</td>
        <td style="padding-left:15px;">
         
         
       	 
          喜气***
         
        
		</td>

        <td><span class="new_hemai_red">9600.00元</span></td>
        <td><span class="new_hemai_red">4800.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 50%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">15</td>
        <td style="padding-left:15px;">
         
         
        	  <a href="betDetail?betId=10457" target="_blank" class="tc_hm_lianjie">
        	   li***
        	   </a>
       	 
       	 
        
		</td>

        <td><span class="new_hemai_red">180.00元</span></td>
        <td><span class="new_hemai_red">1.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 0%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">16</td>
        <td style="padding-left:15px;">
         
         
       	 
          青春***
         
        
		</td>

        <td><span class="new_hemai_red">420.00元</span></td>
        <td><span class="new_hemai_red">105.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 50%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">17</td>
        <td style="padding-left:15px;">
         
         
        	  <a href="betDetail?betId=10341" target="_blank" class="tc_hm_lianjie">
        	   zy***
        	   </a>
       	 
       	 
        
		</td>

        <td><span class="new_hemai_red">360.00元</span></td>
        <td><span class="new_hemai_red">1.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 0%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">18</td>
        <td style="padding-left:15px;">
         
         
       	 
          青春***
         
        
		</td>

        <td><span class="new_hemai_red">210.00元</span></td>
        <td><span class="new_hemai_red">52.50元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 50%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">19</td>
        <td style="padding-left:15px;">
         
         
       	 
          青春***
         
        
		</td>

        <td><span class="new_hemai_red">1680.00元</span></td>
        <td><span class="new_hemai_red">1.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 40%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
       
      
      <tr class="tab_hemai_2">
      	<td style="display:none">20</td>
        <td style="padding-left:15px;">
         
         
        	  <a href="betDetail?betId=10334" target="_blank" class="tc_hm_lianjie">
        	   zy***
        	   </a>
       	 
       	 
        
		</td>

        <td><span class="new_hemai_red">180.00元</span></td>
        <td><span class="new_hemai_red">1.00元</span></td>
        <td style="color:#333;"><span style="float:left;"><!-- 16%
                           
+ 83%</span><span style="float:left;padding:0px 0 0 6px; color:#c00;">(全保)</span> -->
         100% + 0%
         </td>
         <td>0份</td>
         
		 		
		 		
			 		<td class="new_hemai_srk"><span style="margin-left: 20px">-</span></td>
			 		<td class="new_hemai_an">
			 			<span style="margin-left: 25px">成功</span>
			 		</td>
		 		
		 
      </tr>
                                  
                                  <form></form>
                                  <TR>
<td colSpan=10>
  <table class="hm_page" border="0" cellpadding="0" cellspacing="0" width="100%" style=" height:36px;">
  <tbody>
  <tr>
    <td align="center" class="page" id="show_page_div">
   
    页次:<b><font color="red">1</font></b> / 162 　&nbsp;&nbsp;共有:3235 条记录　　
                        <a href="together?type=0&pageNum=1">首页</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="together?type=0&pageNum=1">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        	<a href="together?type=0&pageNum=2">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        	<a href="together?type=0&pageNum=162">尾页</a>
                        	&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;跳转:
                        <select name="pageNum" onchange='javascript:change(this.options[this.options.selectedIndex].value)' id="page">
                          
                          	<option value="1" selected> 1 </option>
                          
                          	<option value="2" > 2 </option>
                          
                          	<option value="3" > 3 </option>
                          
                          	<option value="4" > 4 </option>
                          
                          	<option value="5" > 5 </option>
                          
                          	<option value="6" > 6 </option>
                          
                          	<option value="7" > 7 </option>
                          
                          	<option value="8" > 8 </option>
                          
                          	<option value="9" > 9 </option>
                          
                          	<option value="10" > 10 </option>
                          
                          	<option value="11" > 11 </option>
                          
                          	<option value="12" > 12 </option>
                          
                          	<option value="13" > 13 </option>
                          
                          	<option value="14" > 14 </option>
                          
                          	<option value="15" > 15 </option>
                          
                          	<option value="16" > 16 </option>
                          
                          	<option value="17" > 17 </option>
                          
                          	<option value="18" > 18 </option>
                          
                          	<option value="19" > 19 </option>
                          
                          	<option value="20" > 20 </option>
                          
                          	<option value="21" > 21 </option>
                          
                          	<option value="22" > 22 </option>
                          
                          	<option value="23" > 23 </option>
                          
                          	<option value="24" > 24 </option>
                          
                          	<option value="25" > 25 </option>
                          
                          	<option value="26" > 26 </option>
                          
                          	<option value="27" > 27 </option>
                          
                          	<option value="28" > 28 </option>
                          
                          	<option value="29" > 29 </option>
                          
                          	<option value="30" > 30 </option>
                          
                          	<option value="31" > 31 </option>
                          
                          	<option value="32" > 32 </option>
                          
                          	<option value="33" > 33 </option>
                          
                          	<option value="34" > 34 </option>
                          
                          	<option value="35" > 35 </option>
                          
                          	<option value="36" > 36 </option>
                          
                          	<option value="37" > 37 </option>
                          
                          	<option value="38" > 38 </option>
                          
                          	<option value="39" > 39 </option>
                          
                          	<option value="40" > 40 </option>
                          
                          	<option value="41" > 41 </option>
                          
                          	<option value="42" > 42 </option>
                          
                          	<option value="43" > 43 </option>
                          
                          	<option value="44" > 44 </option>
                          
                          	<option value="45" > 45 </option>
                          
                          	<option value="46" > 46 </option>
                          
                          	<option value="47" > 47 </option>
                          
                          	<option value="48" > 48 </option>
                          
                          	<option value="49" > 49 </option>
                          
                          	<option value="50" > 50 </option>
                          
                          	<option value="51" > 51 </option>
                          
                          	<option value="52" > 52 </option>
                          
                          	<option value="53" > 53 </option>
                          
                          	<option value="54" > 54 </option>
                          
                          	<option value="55" > 55 </option>
                          
                          	<option value="56" > 56 </option>
                          
                          	<option value="57" > 57 </option>
                          
                          	<option value="58" > 58 </option>
                          
                          	<option value="59" > 59 </option>
                          
                          	<option value="60" > 60 </option>
                          
                          	<option value="61" > 61 </option>
                          
                          	<option value="62" > 62 </option>
                          
                          	<option value="63" > 63 </option>
                          
                          	<option value="64" > 64 </option>
                          
                          	<option value="65" > 65 </option>
                          
                          	<option value="66" > 66 </option>
                          
                          	<option value="67" > 67 </option>
                          
                          	<option value="68" > 68 </option>
                          
                          	<option value="69" > 69 </option>
                          
                          	<option value="70" > 70 </option>
                          
                          	<option value="71" > 71 </option>
                          
                          	<option value="72" > 72 </option>
                          
                          	<option value="73" > 73 </option>
                          
                          	<option value="74" > 74 </option>
                          
                          	<option value="75" > 75 </option>
                          
                          	<option value="76" > 76 </option>
                          
                          	<option value="77" > 77 </option>
                          
                          	<option value="78" > 78 </option>
                          
                          	<option value="79" > 79 </option>
                          
                          	<option value="80" > 80 </option>
                          
                          	<option value="81" > 81 </option>
                          
                          	<option value="82" > 82 </option>
                          
                          	<option value="83" > 83 </option>
                          
                          	<option value="84" > 84 </option>
                          
                          	<option value="85" > 85 </option>
                          
                          	<option value="86" > 86 </option>
                          
                          	<option value="87" > 87 </option>
                          
                          	<option value="88" > 88 </option>
                          
                          	<option value="89" > 89 </option>
                          
                          	<option value="90" > 90 </option>
                          
                          	<option value="91" > 91 </option>
                          
                          	<option value="92" > 92 </option>
                          
                          	<option value="93" > 93 </option>
                          
                          	<option value="94" > 94 </option>
                          
                          	<option value="95" > 95 </option>
                          
                          	<option value="96" > 96 </option>
                          
                          	<option value="97" > 97 </option>
                          
                          	<option value="98" > 98 </option>
                          
                          	<option value="99" > 99 </option>
                          
                          	<option value="100" > 100 </option>
                          
                          	<option value="101" > 101 </option>
                          
                          	<option value="102" > 102 </option>
                          
                          	<option value="103" > 103 </option>
                          
                          	<option value="104" > 104 </option>
                          
                          	<option value="105" > 105 </option>
                          
                          	<option value="106" > 106 </option>
                          
                          	<option value="107" > 107 </option>
                          
                          	<option value="108" > 108 </option>
                          
                          	<option value="109" > 109 </option>
                          
                          	<option value="110" > 110 </option>
                          
                          	<option value="111" > 111 </option>
                          
                          	<option value="112" > 112 </option>
                          
                          	<option value="113" > 113 </option>
                          
                          	<option value="114" > 114 </option>
                          
                          	<option value="115" > 115 </option>
                          
                          	<option value="116" > 116 </option>
                          
                          	<option value="117" > 117 </option>
                          
                          	<option value="118" > 118 </option>
                          
                          	<option value="119" > 119 </option>
                          
                          	<option value="120" > 120 </option>
                          
                          	<option value="121" > 121 </option>
                          
                          	<option value="122" > 122 </option>
                          
                          	<option value="123" > 123 </option>
                          
                          	<option value="124" > 124 </option>
                          
                          	<option value="125" > 125 </option>
                          
                          	<option value="126" > 126 </option>
                          
                          	<option value="127" > 127 </option>
                          
                          	<option value="128" > 128 </option>
                          
                          	<option value="129" > 129 </option>
                          
                          	<option value="130" > 130 </option>
                          
                          	<option value="131" > 131 </option>
                          
                          	<option value="132" > 132 </option>
                          
                          	<option value="133" > 133 </option>
                          
                          	<option value="134" > 134 </option>
                          
                          	<option value="135" > 135 </option>
                          
                          	<option value="136" > 136 </option>
                          
                          	<option value="137" > 137 </option>
                          
                          	<option value="138" > 138 </option>
                          
                          	<option value="139" > 139 </option>
                          
                          	<option value="140" > 140 </option>
                          
                          	<option value="141" > 141 </option>
                          
                          	<option value="142" > 142 </option>
                          
                          	<option value="143" > 143 </option>
                          
                          	<option value="144" > 144 </option>
                          
                          	<option value="145" > 145 </option>
                          
                          	<option value="146" > 146 </option>
                          
                          	<option value="147" > 147 </option>
                          
                          	<option value="148" > 148 </option>
                          
                          	<option value="149" > 149 </option>
                          
                          	<option value="150" > 150 </option>
                          
                          	<option value="151" > 151 </option>
                          
                          	<option value="152" > 152 </option>
                          
                          	<option value="153" > 153 </option>
                          
                          	<option value="154" > 154 </option>
                          
                          	<option value="155" > 155 </option>
                          
                          	<option value="156" > 156 </option>
                          
                          	<option value="157" > 157 </option>
                          
                          	<option value="158" > 158 </option>
                          
                          	<option value="159" > 159 </option>
                          
                          	<option value="160" > 160 </option>
                          
                          	<option value="161" > 161 </option>
                          
                          	<option value="162" > 162 </option>
                          
                          
                        </select>
        &nbsp;&nbsp;</td>
  </tr>
  </tbody></table>
  
</td></TR> 
                                

  </tbody></table>
  </div>
  
  
</div>

</body>
<script type="text/javascript">
   function change(index) {
	   var type = $("#type").val();
	   window.location.href = "together?type="+type+"&pageNum=" + index;
   }
</script>
</html>
		<script type="text/javascript">
			function reinitIframe(){
			var iframe = document.getElementById("ifname");
			try{
			var bHeight = iframe.contentWindow.document.body.scrollHeight;
			var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
			var height = Math.max(bHeight, dHeight);
			iframe.height =  height;
			}catch (ex){}
			}
			window.setInterval("reinitIframe()", 200);
			
		</script>
	</li>
</ul>
<div class="clear"></div>
<<!--底部-->
<jsp:include page="../footer.jsp"></jsp:include>	
	</div>
</div>
</body>
</html>
