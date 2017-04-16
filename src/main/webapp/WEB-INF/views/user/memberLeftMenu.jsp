<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!--左部导航-->
<div class="account_left">

	<div class="user_left">
		<div class="user_hot">
			<b style="float: left; margin-top: 5px"><img
				src="<%=basePath%>static/images/sc_38.jpg" /></b>我的账户
		</div>
		<div class="user_scond">
			<div class="user_tub">
				<b style="float: left; margin-right: 15px"><img
					src="<%=basePath%>static/images/sc_40.jpg" /></b><span
					onclick="javascript:location='<%=basePath%>user/memberCenter'">账户全览</span>
			</div>
			<div class="user_tub">
				<b style="float: left; margin-right: 15px"><img
					src="<%=basePath%>static/images/sc_41.jpg" /></b><span
					onclick="javascript:location='<%=basePath%>recharge'">在线充值</span>
			</div>
			<div class="user_tub">
				<b style="float: left; margin-right: 15px"><img
					src="<%=basePath%>static/images/sc_42.jpg" /></b><span
					onclick="javascript:location='<%=basePath%>money/apply'">用户提款</span>
			</div>

			<div class="user_tub">
				<span style="margin-left: 40px;"
					onclick="javascript:location='<%=basePath%>user/personInfo'">账户资料</span>
			</div>
			<div class="user_tub">
				<span style="margin-left: 40px;"
					onclick="javascript:location='<%=basePath%>user/resetPasswordInfo'">用户密码</span>
			</div>
			<div class="user_tub">
				<span style="margin-left: 40px;"
					onclick="javascript:location='<%=basePath%>user/resetapplyPasswordInfo'">提现密码</span>
			</div>
			<div class="user_tub">
				<span style="margin-left: 40px;"
					onclick="javascript:location='<%=basePath%>orderList'">中奖方案</span>
			</div>
			<c:choose>
				<c:when
					test="${sessionScope.memberUser != null&&sessionScope.memberUser.type==1}">
					<div class="user_tub">
						<span style="margin-left: 40px;"
							onclick="javascript:location='<%=basePath%>agent/agentcenter'">代理中心</span>
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<div class="user_tub">
				<span style="margin-left: 40px;"
					onclick="javascript:location='<%=basePath%>betting_record'">投注记录</span>
			</div>
			<%-- <div class="user_tub">
				<span style="margin-left: 40px;"
					onclick="javascript:location='<%=basePath%>zuihaoRecord'">追号记录</span>
			</div> --%>
			<div class="user_tub">
				<span style="margin-left: 40px;"
					onclick="javascript:location='<%=basePath%>hemai_record'">合买记录</span>
			</div>
			<div class="user_tub">
				<span style="margin-left: 40px;"
					onclick="javascript:location='<%=basePath%>myrecharge/list'">充值记录</span>
			</div>
			<div class="user_tub">
				<span style="margin-left: 40px;"
					onclick="javascript:location='<%=basePath%>money/applyrecord/list'">提现记录</span>
			</div>
			<!-- <div class="user_tub">
				<span style="margin-left: 40px;" onclick="">提款密码</span>
			</div> -->
			<div class="user_tub">
				<span style="margin-left: 40px;"
					onclick="javascript:location='<%=basePath%>user/bankInfo'">绑定银行卡</span>
			</div>
			<%-- <c:choose>
				<c:when
					test="${sessionScope.memberUser != null&&sessionScope.memberUser.type==1}">
					<div class="user_tub">
						<span style="margin-left: 40px;"
							onclick="javascript:location='<%=basePath%>user/bankInfo'">我的返点</span>
					</div>
					<div class="user_tub">
						<span style="margin-left: 40px;"
							onclick="javascript:location='<%=basePath%>user/bankInfo'">盈收统计</span>
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose> --%>

		</div>
	</div>

</div>
<%-- <div class="user_menu">
	<div class="baseinfo">
		<dl class="info fn_clear">
			<dd>
				<h4>
					当前用户：${sessionScope.memberUser.userName}
				</h4>
				<p class="fn_clear">
					<c:choose>
                    	<c:when test="${not empty memberUser.realName}"><cite class="card">已绑定</cite></c:when>
                    	<c:otherwise><a href="<%=basePath%>user/realNameInfo" class="card">未绑定</a></c:otherwise>
                    </c:choose>
                    <c:choose>
                    	<c:when test="${not empty memberUser.bankCode}"><cite class="bank">已绑定</cite></c:when>
                    	<c:otherwise><a href="<%=basePath%>user/bankInfo" class="bank">未绑定</a></c:otherwise>
                    </c:choose>
                    <c:choose>
                    	<c:when test="${not empty memberUser.telephone}"><cite class="phone">已绑定</cite></c:when>
                    	<c:otherwise><a href="<%=basePath%>user/telephoneInfo" class="phone">未绑定</a></c:otherwise>
                    </c:choose>
				</p>
			</dd>
		</dl>
		<p class="aq fn_clear">
			<em>安全等级</em>
			<cite><span style="width: 60%"></span><i>中</i>
			</cite>
		</p>
	</div>
	<div class="menu_list">
		<dl class="fn_clear">
			<dt>
				我的彩票
			</dt>
			<dd>
				<a href="<%=basePath%>betting_record">投注记录</a><a href="#">追号记录</a>
			</dd>
		</dl>
		<dl class="fn_clear">
			<dt>
				资金管理
			</dt>
			<dd>
				<a id="myrechargeListMenu" href="<%=basePath %>myrecharge/list">账户明细</a>
				<a id="rechargeMenu" href="<%=basePath %>recharge">我要充值</a>
				<a id="moneyApplyMenu" href="<%=basePath %>money/apply">我要提现</a>
			</dd>
		</dl>
		<dl class="fn_clear">
			<dt>
				账户安全
			</dt>
			<dd>
                <a id="securityCenterMenu" href="<%=basePath%>user/securityCenter">安全中心</a>
                <a id="personInfoMenu" href="<%=basePath%>user/personInfo">个人信息</a>
                <a id="resetPasswordInfoMenu" href="<%=basePath%>user/resetPasswordInfo">修改密码</a>
                <a id="emailInfoMenu" href="<%=basePath%>user/emailInfo">邮箱绑定</a>
                <a id="telephoneInfoMenu" href="<%=basePath%>user/telephoneInfo">手机绑定</a>
                <a id="bankInfoMenu" href="<%=basePath%>user/bankInfo">支付宝绑定</a>
                <a id="realNameInfoMenu" href="<%=basePath%>user/realNameInfo">实名认证</a>
			</dd>
		</dl>
	</div>
</div> --%>
