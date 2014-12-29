<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

  <%@ include file="/includes/taglibs.jsp" %>

<title>投资成功 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;          
</script>
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
   <%-- <div class="title_sec">您可以进行以下操作</div>
   
   <!-- 
   <div>前去<a href="<%=path%>/touzi.jsp" class="con_link">[浏览项目]</a></div>
   <div>前去<a href="<%=path%>/user-info.jsp" class="con_link">[用户中心]</a></div>
    -->
   <ol class="sec_list">
   <li>前去项目中心<strong><a href="<%=path%>/touzi.jsp" class="con_link">[浏览项目]</a></strong>，查看详细信息，进行投资。</li>
   <li>去个人中心查看<strong><a href="<%=path%>/user-info.jsp" class="con_link">[个人信息]</a></strong>。</li>
   <li><a href="<%=path%>/chongzhi.jsp" class="sec_btn_org">去充值页面充值</a></li>
   </ol> --%>
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