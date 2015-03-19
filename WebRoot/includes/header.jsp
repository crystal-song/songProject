<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--[if lt IE 8]>
<div class="ie_text">亲爱的用户您使用的浏览器版本过低，我们强烈建议您更新至最新版本的浏览器查看.
<div class="res"></div>
</div>

<![endif]-->
<header>
	<div class="header">
		<div class="top">
			<ul>
				<li>联系我们
					<div class="list01">
						<a href="/help/question.jsp">常见问题</a> <a href="/help/contact.jsp">联系客服</a>
					</div>
				</li>
				<li>关于我们
					<div class="list02">
						<a href="/help/help_con.jsp">企业介绍</a> <a href="/help/security.jsp">安全策略</a>
						<a href="/help/notice.jsp">法律声明</a>
					</div>
				</li>
				<li><a href="/xinshouzhiyin.jsp" class="head_red"
					target="_blank">新手指引</a></li>
				<li class="head_red" style="display: none">我的账户
					<div class="list03" style="display: none">
						<a href="/wel/account">账户管理</a> <a href="/wel/account">资产管理</a>
					</div>
				</li>
			</ul>
			<a href="http://jq.qq.com/?_wv=1027&k=ZpAZ0O"
				class="qun_msg head_red" target=_blank>加入中租宝官方交流群：425296487</a>
			<div class="list04"></div>
		</div>
	</div>

	<div class="nav_bac">
		<div class="nav">
			<a class="logo" href="/" title="中租宝首页"></a>
			<ul class="nav_big">
	
				<li><a href="/" class='${fn:startsWith(pageContext.request.requestURI, "/index.jsp") ? "bd_btom":""}'> <span><strong>首页</strong></span>
						<p class='${fn:startsWith(pageContext.request.requestURI, "/index.jsp") ? "headwd_color":""}'>Home</p>
				</a></li>
				<li><a href="/product/allProduct" class='${fn:startsWith(pageContext.request.requestURI, "/invest") ? "bd_btom":""}'> <span><strong>我要投资</strong></span>
						<p class='${fn:startsWith(pageContext.request.requestURI, "/invest") ? "headwd_color":""}'>Investment</p>
				</a></li>
				<li><a href="/gate/service" class='${fn:startsWith(pageContext.request.requestURI, "/accounts") ? "bd_btom":""}'><span><strong>我的账户</strong></span>
						<p class='${fn:startsWith(pageContext.request.requestURI, "/accounts") ? "headwd_color":""}'>Account</p></a></li>
				   
				    <li style="display:none" class='${fn:startsWith(pageContext.request.requestURI, "/hero") ? "bd_btom":""}'>
				    <a href="/hero/all"><span><strong>我要众筹</strong></span>
				    <p class='${fn:startsWith(pageContext.request.requestURI, "/hero") ? "headwd_color":""}'>Crowdfunding</p></a></li>   
				<li><a href="/guarantee/getchannel" class='${fn:startsWith(pageContext.request.servletPath, "/news") ? "bd_btom":""}'><span><strong>新闻公告</strong></span>
						<p class='${fn:startsWith(pageContext.request.requestURI, "/news") ? "headwd_color":""}'>News</p></a></li>
						
				<li><a href="/help/help_con.jsp" class='${fn:startsWith(pageContext.request.requestURI, "/help") ? "bd_btom":""}'><span><strong>帮助中心</strong></span>
						<p class='${fn:startsWith(pageContext.request.requestURI, "/help") ? "headwd_color":""}'>Help</p></a></li>
				<li><a href="/application/faqixiangmu.jsp"class='${fn:startsWith(pageContext.request.requestURI, "/application") ? "bd_btom":""}'><span><strong>发起项目</strong></span>
						<p class='${fn:startsWith(pageContext.request.requestURI, "/application") ? "headwd_color":""}'>Application</p></a></li>

			</ul>
			<div class="login">
				<c:if test="${empty name}">

					<a class="a_fir" href="/welcome/reg"
						style="line-height: 40px; font-size: 16px; margin-left: 50px;"><strong>注册</strong></a>
					<a class="wd_red a_sec" href="/login.jsp"
						style="line-height: 40px; font-size: 16px;"><strong>登录</strong></a>
				</c:if>


				<c:if test="${!empty name}">
					<span class="username_fir">您好，<strong>${name}</strong></span>
					<div class="tuichu_fir">
						<ul>
							<li class="zhang"><a href="/gate/service" class="acount">我的账户</a></li>
							<li class="zhang"><a href="/wel/account" class="acount">个人信息</a></li>
							<li class="zhang" style="background: #fff"><a
								href="/welcome/logout" class="out">退出</a></li>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
		<!-- <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2::52" alt="点击这里给我发消息" title="点击这里给我发消息"/></a> -->

	</div>
</header>


