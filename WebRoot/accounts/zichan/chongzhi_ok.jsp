<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%@ include file="/includes/taglibs.jsp" %> 

<title>充值成功 - 中租宝</title>


<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<div class="msg_con">
  <div class="queren_con" style="height:675px;">
   <div class="sucess_title"><strong>充值成功!</strong></div>
   <div class="sec_product" style="display:none">
	   <div class="sec_pro_show"></div> 
   </div>
   
   <div class="title_sec" style="display:block">您可以进行以下操作</div>
   <ol class="sec_list" style="display:block">
   <li>1. 去资产中心查看<strong><a href="<%=path%>/gate/service" class="con_link">【个人资产】</a></strong>，查看详细信息进行投资。</li>
   <li>2.<strong><a href="/product/allProduct" class="con_link">【去投资】</a></strong></li>

   </ol>
   <div class="sec_product" style="display:none">
	   <div class="sec_pro_show"></div> 
   </div>
  </div>        
</div>

<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>