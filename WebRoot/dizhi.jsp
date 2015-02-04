<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mftour.spring.service.IUserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %> 
<title>安全设置 - 我的账户 - 中租宝</title>
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
         <a class="tianjiadizhi"></a>
         <div class="dizhi_msg">
           <a class="add_dizhi"></a>
           <p class="little_head" style="display:none">添加收货地址:</p>                
         </div>
         <div class="clear"></div>
         <div class="dizhi_input">
                <ul>
                  <li><span>省/直辖市<strong>*</strong></span><input type="text"/><span>城市/区<strong>*</strong></span><input type="text"/></li>
                  <li class="di_hei"><span>详细地址<strong>*</strong></span><textarea></textarea></li>
                  <li><span>邮编<strong>*</strong></span><input type="text"/></li>
                  <li><span>收货人姓名<strong>*</strong></span><input type="text"/></li>
                  <li><span>手机号码<strong>*</strong></span><input type="text"/></li>
                </ul>      
                    
           </div> 
         <div class="clear"></div>
         <div class="dizhi_table">
           <ul>
             <li>
               <span>收件人</span>
               <span>所在地区</span>
               <span>详细地址</span>
             </li>
           </ul>
         
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
</html>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript">
    var navIndex=3;  
    var indexs=0;

    $(document).ready(function(){
    	$(".u_left_sec:first li:eq(1)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".nav_big a").eq(2).children("p").addClass("headwd_color");
    });
   
</script>
