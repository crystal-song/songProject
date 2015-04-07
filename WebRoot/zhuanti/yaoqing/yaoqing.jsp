<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mftour.spring.service.IUserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/includes/taglibs.jsp" %> 
<title>我的地址 - 我的账户 - 中租宝</title>

<body>

<div class="black_bac"></div>
<div class="con">
   <div class="yao_logo"><img alt="" src="/img/images-2014-11/p_logo.png"></div>
   <div class="con_ed"></div>
   <div class="kong"></div>
   <div class="li_tab"><a href="/account/liquan?page=1&catlog=0">马上邀请，领红包</a></div>
   <div class="guize">
    <p>活动规则</p>
    <ul>
    <li>1. 被邀请的注册用户在投资项目后，邀请人即可获得价值50元礼券。</li>
    <li>2.被推荐人必须通过推荐人的个人邀请链接注册才算有效；</li>
    <li class="p_left">请登录后进入“我的账户—账户管理—推荐管理”，点击【复制】，获得链接。</li>
    <li>3. 此活动最终解释权归所有。如有任何疑问，请联系客服。联系电话:010-84243099。</li>
    <li>*被邀请用户仅首次投资后，邀请用户可获得50元礼券。</li>
    </ul>
   </div>
</div>
    <!-- absolute_right start -->
	   <%@ include file="/includes/absolute.jsp" %>
	<!-- absolute_right end -->

<div class="clear"></div>
</body>
</html>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
 <script>
 $(".absolute_bac1").hide();
 $(".absolute_right a").hide();
 $(".absolute_right span").mouseover(function(){
    $(this).children().show();

}).mouseout(function(){
    $(this).children().css("display","none");
});
    $(".absolute_bac2").mouseover(function(){
      $(this).siblings(".erweima_bac").show();
    }).mouseout(function(){
      $(this).siblings(".erweima_bac").hide();
    });
	$(window).on('scroll', function(){
    if($(window).scrollTop()<500){
        $(".absolute_bac1").hide();
    }
    if($(window).scrollTop()>=500){
        $(".absolute_bac1").show(); 
    }
  });
    $(".absolute_bac1").click(function(){
       $("html,body").animate({scrollTop:0},500);  		            
    });	  
 
 </script>





 

