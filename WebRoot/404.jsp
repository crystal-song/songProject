<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ include file="/includes/taglibs.jsp" %> 
 <meta http-equiv="refresh" content="3;URL=<%=path%>/wel?404" />
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
   <span class="back_fang"></span>
   <span class="e_con_right">
      <a class="error_title"></a>
      <a class="title_sec01">您访问的页面已经删除或者不存在</a>
      <a href="<%=path%>/wel">您可以回到<label style="color:#f1a627; text-decoration:underline">首页</label></a>
   </span>
</div>
</body>
</html>