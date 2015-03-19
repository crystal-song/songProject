<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/includes/taglibs.jsp" %>

<title>支付成功 - 我的众筹 - 中租宝</title>

</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
    <div class="zhi_con">
      <div class="zhi_left"></div>
      <div class="zhi_right">

        <div class="zhi_title">您已成功付款${amount }元</div>
        <p>如果页面没有跳转，请点击此跳转回<a href="/hero/my">众筹首页</a></p>
        <p>如果您对其他项目感兴趣，请点击查看<a href="/hero/all"">所有众筹项目</a></p>

      </div>
    
    </div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>

<script>
    $(function(){
    	$(".u_left_sec:eq(0) li:eq(0)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(3).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".nav_big a").eq(3).children("p").addClass("headwd_color");
    })
   window.setInterval(" refresh()",5000);
    function refresh(){location.href='/hero/my';}
 	
</script>



