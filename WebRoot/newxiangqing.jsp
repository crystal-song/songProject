<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
<title>${news.title} - ${news.channel} - 中租宝</title>
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

<!-- absolute_right start -->
	<%@ include file="/includes/absolute.jsp" %>
<!-- absolute_right end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
<script type="text/javascript">
 var head_index=4; 
</script>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="<%=path%>/static/js/zhongzubao.js?va=4"></script> 
<script type="text/javascript">

$(document).ready(function(e) {
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

