<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ include file="/includes/taglibs.jsp" %> 

<title>线下项目 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />

</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="xian_con">
     <div class="xian_left"></div>
     <div class="xian_right">
       <h1><strong>线下投资专属项目</strong></h1>
       <p style="margin-top:15%;">请联系客服人员购买此项目</p>
       <p>010-84243099/3199</p>
     </div>
</div>

    
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>