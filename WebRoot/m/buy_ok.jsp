<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ include file="/includes/taglibs.jsp" %>
<title>投资成功 - 中租宝</title>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="clear"></div>
<div class="msg_con">
  <div class="queren_con" style="height:675px;">
   <div class="sucess_title"><strong>投资成功!</strong></div>
   <div style="width:600px; margin:0px auto;">
   	<ul class="chong">
   	<li style="clear:both;"><span>　订单号：</span><span style="width:auto">${transferInfo.orderNo}</span></li>
   	<li style="clear:both;"><span>项目名称：</span><span style="width:auto">${transferInfo.projectName}</span></li>
   	<li style="clear:both;"><span>金　　额：</span><span style="width:auto; color:#ec6c23;"><strong>${transferInfo.paymentAmount}元 + ${transferInfo.reward}元 礼券</strong></span></li>
   	</ul>
   </div>
   <div class="clear"></div>

   <ol class="sec_list " style="display:block" id="wol">
   <li>您可以做如下操作：</li>
   <li>去个人中心查看<strong><a href="<%=path%>/gate/userProject" class="con_link">[我的项目]</a></strong>，浏览详细信息进行投资。</li>
   <li><a href="<%=path%>/gate/recharge" class="sec_btn_org">去充值</a></li>
   <li><a href="<%=path%>/gate/service" class="sec_btn_org">查看资产</a></li>
   </ol>
   
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