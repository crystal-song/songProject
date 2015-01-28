<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>

<title>我的礼券 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>

</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
    <div class="zhi_con">
      <div class="zhi_left"></div>
      <div class="zhi_right"></div>
    
    </div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
<script>
    var navIndex=3;
    var indexs=1;
    $(function(){
        $(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
        $(".u_left_sec:eq(1) li:eq(4)").children("a").css("color","#fc652e");
        $(".zichan_con .tui_li li span:odd").css("text-align","left");
        $(".nav_big a").eq(2).children("p").addClass("headwd_color");
    })


</script>


</html>
