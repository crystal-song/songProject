<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/includes/taglibs.jsp" %>

<title>新闻中心 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>

</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<!-- 
<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>
<div class="frame">
<div class="news_location">当前位置：<a href="<%=path%>/" >首页</a> >> <a href="<%=path%>/guarantee/getchannel">新闻公告</a>
</div>
	<div class="clear_height"></div>
	<div class="bz_left">
    	<!-- <div class="bzl_tit"></div> 
        <div class="bzl_list">
        	<ul>
        	 <c:if test="${ not empty list}">
                <c:forEach var="s" items="${list}" varStatus="i">
            	  <li class="aqbz"><span class="hong"><a href="<%=path%>/guarantee/getlist?id=${s.id}">${s.name}</a></span></li>
            	</c:forEach>
             </c:if>              
            </ul>
        </div>
    </div>
    <div class="bz_right">
    	<div class="bzr_tit">
        	<h1>新闻公告</h1>
        </div>  
        <div class="clear"></div>
        <div class="bzr_nr" style="padding-top:0px;">
        	<ul class="news_list">
        		 <c:if test="${ not empty list1}">
        <c:forEach var="s" items="${list1}" varStatus="i">
            	<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a><dt>${fn:substring(s.time, 0, 10)}</dt></li>
               	</c:forEach>
        </c:if>
            </ul>
        </div>
    </div>
</div>
<div class="clear_height"></div>
 -->
 <!-- <div class="news_location">当前位置：<a href="<%=path%>/" >首页</a> >> <a href="<%=path%>/guarantee/getNewslist?channel=${news.channel}">${news.channel}</a></div> -->
 <div class="news_location">当前位置：<a href="<%=path%>/" >首页</a> >> <a href="<%=path%>/guarantee/getchannel">新闻中心</a>
</div>
   <div class="user_con_news">
     
       <div class="news_left">
          <div class="n_left_title">新闻中心</div>
           <ul class="news_ul">                   
            <!--  <li><div class="news_wd_color"><a href="getlist?id=7"><span>网站公告</span></a></div></li>
             <li><div><a href="getlist?id=8"><span>还款公告</span></a></div></li>
             <li><div><a href="getlist?id=9"><span>媒体公告</span></a></div></li>   -->   
              <c:if test="${ not empty list}">
                <c:forEach var="s" items="${list}" varStatus="i">
            	  <li><span><a href="<%=path%>/guarantee/getlist?id=${s.id}">${s.name}</a></span></li>
            	</c:forEach>
             </c:if> 
           </ul>   
       </div>   
       <div class="news_right position_top">
           <ul class="webside">
              <c:if test="${ not empty list1}">
                <c:forEach var="s" items="${list1}" varStatus="i">
            	   <li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
               	</c:forEach>
              </c:if>                    
           </ul>
           <ul class="webside" style="display:none">
                  <c:if test="${ not empty list1}">
                    <c:forEach var="s" items="${list1}" varStatus="i">
            	     <li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
               	    </c:forEach>
                  </c:if>
           </ul> 
           <ul class="webside" style="display:none">
                  <c:if test="${ not empty list1}">
                    <c:forEach var="s" items="${list1}" varStatus="i">
            	     <li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
               	    </c:forEach>
                  </c:if>
           </ul>         
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
var navIndex=4;
$(document).ready(function(e) {
	$(".nav_big a").eq(3).addClass("bd_btom").siblings().removeClass("bd_btom");
	$(".nav_big a").eq(3).children("p").addClass("headwd_color");
   $(".news_ul li").click(function(e){
      var index=$(this).index();
      $(this).children("div").addClass("news_wd_color");
      $(this).siblings().children("div").removeClass("news_wd_color");
      $(".news_right ul").eq(index).css("display","block").siblings().css("display","none");
   });
      var news_height= $(".news_right").height();   
      var left_height= $(".news_left").height();
    if(news_height>260){
    	//alert(news_height);
    	$(".user_con_news").css("height",news_height+100);
    }
   
});
</script>
</html>
