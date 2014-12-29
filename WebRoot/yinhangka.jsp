<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp"%>

<title>绑定银行卡 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
</head>

<body>
	<!-- top start  -->
	<%@ include file="/includes/header.jsp"%>
	<!-- top end  -->

	<div class="user_con">
		<div class="user_left">
			<!-- user_left start -->
			<%@ include file="/includes/user_info_left.jsp"%>
			<!-- user_left end -->
		</div>

	</div>
	</div>
<!-- absolute_right start -->
	<%@ include file="/includes/absolute.jsp" %>
<!-- absolute_right end -->	
	<div class="clear"></div>
<!-- footer start -->
	<%@ include file="/includes/footer.jsp"%>
<!-- footer end -->
</body>
<script type="text/javascript">
var navIndex=3; 
var indexs=1;
    $(document).ready(function(){
    	$(".u_left_sec:eq(1) li:eq(3)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".nav_big a").eq(2).children("p").addClass("headwd_color");
});
    
    function onSubmit(host) {
    	  document.getElementById("host").value = host;
    	  var form = document.getElementById("form");
    	  form.submit();
    	}
        
</script>
</html>