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
         <div class="checkok">
              <p class="check_m">邮件已发送到您的邮箱 zh************@sina.cn</p>
              <p>请按邮箱中的提示操作，完成身份验证。 </p>
         </div>
         </div>
  </div>        
</div>
   
<div class="clear_height"></div>

<!-- links start -->

<!-- links end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>