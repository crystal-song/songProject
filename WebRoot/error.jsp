<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ include file="/includes/taglibs.jsp" %> 
<meta http-equiv="refresh" content="3;URL=<%=path%>/?500" />
<title>线下项目 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
  
</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="error_con">
   <span class="back_fang" style="background:url(<%=path%>/img/images-2014-11/500_fang.gif) no-repeat;"></span>
   <span class="e_con_right">
      <a class="error_title" style="background:url(<%=path%>/img/images-2014-11/500_title.gif) -22px 5px no-repeat;"></a>
      <a class="title_sec">网站无法显示该页面</a>
      <a href="<%=path%>/">您可以回到<label style="color:#f1a627; text-decoration:underline">首页</label></a>
   </span>
</div>
</body>
</html>