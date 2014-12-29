<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ include file="/includes/taglibs.jsp" %>

<title>联系客服 - 帮助中心 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
</head>
<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="news_location">当前位置：<a href="<%=path%>/index.jsp" >首页</a> >> <a href="<%=path%>/help_con.jsp" >
         帮助中心</a> </div> 
 <div class="user_con_news">
   <div class="news_left">
	<!-- left menu -->
	<%@ include file="/includes/left_help.jsp" %>
	<!-- left end -->
	</div>
	<!-- right content -->
     <div class="right_news_con"> 
        	<div class="contaction">
        	   <p>服务器错误</p>
              
        	</div>
        	<div style="width:800px;height:550px;border:#ccc solid 1px;" id="dituContent"></div>
 	
      
  </div>
  </div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>

</html>
