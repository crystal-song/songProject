<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
<title>联系我们 - 帮助中心 - 中租宝</title>

</head>
<body>
<!-- top start -->
<%@ include file="/includes/header.jsp" %>
<!-- top end -->
<div class="news_location">当前位置：<a href="<%=path%>/index.jsp" >首页</a> >> <a href="<%=path%>/help_con.jsp" >
帮助中心</a> >> <a href="<%=path%>/contact.jsp" >联系我们</a></div>
<div class="user_con_news">
<div class="news_left">
<!-- left menu -->
<%@ include file="/includes/left_help.jsp" %>
<!-- left end -->
</div>
<!-- right content -->

<div class="right_news_con">
<div class="contaction">
<p>名&nbsp;&nbsp;称：中投汇融投资管理有限公司</p>
<p>地&nbsp;&nbsp;址：北京市朝阳区工体北路13号院1号楼</p>
<p>电&nbsp;&nbsp;话：010-84243099/3199</p>
<p>传真号：010-84243990</p>
<p>Email：cs@ptobchina.com</p>
<p>简&nbsp;&nbsp;介：中租宝，北京市朝阳区工体北路13号院1号楼1501-1502室。 邮编：100020</p>
</div>
<iframe style="width:800px; height:550px; border:0px; scrolling:auto; allowtransparency:true ;background-color:transparent" src="map.jsp">
</iframe>
</div>
<!-- right end -->
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html> 

<script type="text/javascript">

$(document).ready(function(e) {
$(".news_ul a").eq(5).addClass("aqbz").siblings().removeClass("aqbz");
});
</script>

