<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mftour.spring.service.IUserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %> 
<title>安全设置 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="<%=path%>/js/sms.js" ></script>
<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="user_con">
    <div class="user_left">
      <!-- user_left start -->
         <%@ include file="/includes/user_info_left.jsp" %>
      <!-- user_left end -->
    </div>
    <div class="user_right">
      <div class="zichan_con">
         <div class="pro_con_title" style="margin-top: 5px; background:url(../img/images-2014-11/red_line_big.png) 104px 12px no-repeat;">
                <strong>收货地址管理</strong>
         </div>
         <a class="tianjia"></a>
         <div class="dizhi_msg">
           <p class="little_head">添加收货地址:</p>
         </div>
      </div>
    
    </div>
    <!-- absolute_right start -->
	     <%@ include file="/includes/absolute.jsp" %>
	<!-- absolute_right end -->
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>


<script type="text/javascript">
    var navIndex=3;  
    var indexs=0;

    $(document).ready(function(){
    	$(".u_left_sec:first li:eq(1)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".nav_big a").eq(2).children("p").addClass("headwd_color");


</script>
</html>