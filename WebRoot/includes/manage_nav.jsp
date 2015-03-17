<%@ page language="java" pageEncoding="UTF-8"%>
<div class="header">
	<div class="logo"></div>
	<h1>网站管理后台</h1>
</div>
<div class="cl"></div>
<div class="top_nav">
	<ul>
		<li><a href="/Login/queryproduct" class="btn_gray">PtoB产品管理</a></li>
		<li><a href="/ptop/p2b_add.jsp" class="btn_gray">添加PtoB产品</a></li>
		<li><a href="/Login/getNews" class="btn_gray">网站文章管理</a></li>
		<li><a href="/Login/channelManage" class="btn_gray">频道管理</a></li>
		<li style="display: none"><a
			href="${sessionScope.restouthost}/admin/heros" class="btn_gray">众筹管理</a></li>
		<li><a href="/Login/getChannel" class="btn_gray">添加网站文章</a></li>
	</ul>
</div>