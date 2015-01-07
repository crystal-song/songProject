<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

  <%@ include file="/includes/taglibs.jsp" %>

<title>用户中心页面</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />

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
   <div class="con_title"><strong>找回密码</strong></div>
   <ul class="pass_msg">
      <li><span>登录账号:</span><div><input type="text" id="input_fir" value="手机号/用户名"></input></div></li>
      <li><span>验证码:</span><div><input type="text"  id="input_sec"></input><a id="yan_ma"></a><a class="shuaxin"></a></div></li>
     
   </ul>
   <div class="que_btn "><a href="<%=path%>/phone_find.jsp" class="que_mar">下一步</a></div>
  </div>        
</div>
   
<div class="clear_height"></div>

<!-- links start -->
<%@ include file="/includes/links.jsp" %>
<!-- links end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>