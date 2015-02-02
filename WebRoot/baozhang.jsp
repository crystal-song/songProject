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

 <div class="news_location">当前位置：<a href="<%=path%>/" >首页</a> >> <a href="<%=path%>/guarantee/getchannel">新闻中心</a>
</div>
   <div class="user_con_news">
     
       <div class="news_left">
          <div class="n_left_title">新闻中心</div>
           <ul class="news_ul">                               
              <c:if test="${ not empty list}">
                <c:forEach var="s" items="${list}" varStatus="i">
            	  <li><span><a href="<%=path%>/guarantee/getlist?id=${s.id}">${s.name}</a></span></li>${s.id}
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
   </div>
<!-- absolute_right start -->
<%@ include file="/includes/absolute.jsp" %>
<!-- absolute_right end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
<div class="clear"></div>
</body>

<script type="text/javascript">
var navIndex=4;
$(document).ready(function(e) {
	$(".nav_big a").eq(4).addClass("bd_btom").siblings().removeClass("bd_btom");
	$(".nav_big a").eq(4).children("p").addClass("headwd_color");
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
