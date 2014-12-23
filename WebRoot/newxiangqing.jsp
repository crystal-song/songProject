<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
<title>${news.title} - ${news.channel} - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<div class="news_location">当前位置：<a href="<%=path%>/" >首页</a> >> <a href="<%=path%>/guarantee/getNewslist?channel=${news.channel}">${news.channel}</a></div>
    <div class="user_con_news">

       <div class="news_left">
          <div class="n_left_title">新闻中心</div>
           <ul class="news_ul"> 
           <!--              
             <li><a href="<%=path%>/newxiangqing.jsp">网站公告</a></li>
             <li><a href="<%=path%>/newxiangqing.jsp">还款公告</a></li>
             <li><a href="<%=path%>/newxiangqing.jsp">媒体公告</a></li>-->
             <c:if test="${ not empty list}">
               <c:forEach var="s" items="${list}" varStatus="i">
            	<li><a href="getlist?id=${s.id}">${s.name}</a></li>
            	</c:forEach>
        </c:if>    
           </ul>   
       </div>
       <!-- <div class="right_news_con"> -->
        <div class="news_right position_top">
          <h1>${news.title}</h1>       
          <div>${news.depicts}</div>
       </div>   
   
   </div>
<!-- top end  -->
<!--  
<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>
<div class="frame">
<div class="news_location">当前位置：<a href="<%=path%>/" >首页</a> >> <a href="<%=path%>/guarantee/getNewslist?channel=${news.channel}">${news.channel}</a></div>
	<div class="clear_height"></div>
	<div class="bz_left">
    	<div class="bzl_tit"></div>
        <div class="bzl_list">
        	<ul>
        	 <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
            	<li class="aqbz"><a href="getlist?id=${s.id}">${s.name}</a></li>
            	</c:forEach>
        </c:if>    
            </ul>
        </div>
    </div>
    <div class="bz_right">
    
    	<div class="bzr_tit">
        	<h1>${news.title}</h1>
        </div>
        <div class="clear"></div>
        <div class="bzr_nr">
         <%-- <div >${news.title}</div> --%>
         
         <div style="text-align:right; padding:10px;">发布时间：${news.time}</div>
         <div class="news_content">${news.depicts}</div>      
        
        	<%-- <ul>
        		 <c:if test="${ not empty list1}">
                  <c:forEach var="s" items="${list1}" varStatus="i">
            	    <li>${s.title}</li>
                  </c:forEach>
                 </c:if>
            </ul> --%>
        </div>
    </div>
</div>
-->
<!-- absolute_right start -->
	<%@ include file="/includes/absolute.jsp" %>
<!-- absolute_right end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
<script type="text/javascript">

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
