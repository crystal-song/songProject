<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
  

<title>用户中心页面</title>
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
   <div class="con_title"><strong>密码重置</strong></div>
   <ul class="pass_msg">
      <li><span>输入密码:</span><div><input type="text" id="input_fir" ></input></div></li>
      <li><span>重新输入:</span><div><input type="text" id="input_fir" ></input></div></li>   
   </ul>
   <div class="que_btn "><a href="<%=path%>/pwdfindok.jsp" class="que_mar">确定</a></div>
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