<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ include file="/includes/taglibs.jsp" %>

<title>还款成功 - 中租宝</title>


</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="clear"></div>
<div class="msg_con">
  <div class="queren_con" style="height:675px;">
   <div class="sucess_title"><strong>还款成功!</strong></div>
   <div class="sec_product" style="display:none;">
	   <div class="sec_pro_show"></div> 
   </div>
   
  </div>        
</div>
<div class="clear_height"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>