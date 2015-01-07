<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
<title>用户中心页面</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;          
</script>
</head>
<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>
<div class="msg_con">
  <div class="queren_con">
   <div class="con_title"><strong>提现信息确认</strong></div>
   <ul class="koko">
      <li><span>用户名:</span><div>xiaoyan</div></li>
      <li><span>订单号:</span><div>1234567890</div></li>
      <li><span>提现金额:</span><div><strong class="jin_font">12000</strong><i>元</i></div></li>    
   </ul>
   <div class="que_btn"><a src="#">确定</a></div>
  </div>        
</div>

<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>