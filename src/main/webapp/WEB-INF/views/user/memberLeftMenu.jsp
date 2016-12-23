<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<div class="user_menu">
	<div class="baseinfo">
		<dl class="info fn_clear">
			<dt>
				<img src="<%=basePath%>static/images/u1.jpg" />
			</dt>
			<dd>
				<h4>
					${sessionScope.memberUser.userName}
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
				<a href="#">投注记录</a><a href="#">追号记录</a>
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
</div>
