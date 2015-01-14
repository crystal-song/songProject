<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %> 

<title>中租宝 | 最稳健的P2B理财平台</title>
<link href="<%=path%>/css/style-2014-11.css?v=1" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 
</head>
<body>

<!-- top start  -->
<input type="hidden" class="now" id="now" value="${now}">
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>

<div class="content01">
   <div class="z_list_title">
    <a class="z_title_bac">所有项目</a>
    <a>众筹中</a>
    <a>已筹满</a>
    <a>即将开启</a>
   </div>
</div>                

 
<!-- absolute_right start -->
	 <%@ include file="/includes/absolute.jsp" %>
<!-- absolute_right end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->

</body>

<script type="text/javascript">
 
 
</script>

</html>
