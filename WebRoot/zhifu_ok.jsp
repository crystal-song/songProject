<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>

<title>支付成功 - 我的众筹 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>

</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
    <div class="zhi_con">
      <div class="zhi_left"></div>
      <div class="zhi_right">
        <div class="zhi_title">您已成功付款6220元</div>
        <p>如果页面没有跳转，请点击此跳转回<a href="<%=path%>/zhongcou.jsp">众筹首页</a>。</p>
        <p>如果您有未付款的交易，可<a href="<%=path%>/juanzeng1.jsp">查看并继续付款</a>。</p>
      </div>
    
    </div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
<script>
    var navIndex=2;
    var indexs=0;
    $(function(){
    	$(".u_left_sec:eq(0) li:eq(0)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(3).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".nav_big a").eq(3).children("p").addClass("headwd_color");
    })


</script>


</html>
