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
<div class="msg_con">
  <div class="queren_con" style="height:675px;">
   <div class="sucess_title"><strong>您的银行卡已绑定成功!</strong></div>
   <div class="title_sec">您可以进行以下操作</div>
   
   <!-- 
   <div>前去<a href="<%=path%>/touzi.jsp" class="con_link">[浏览项目]</a></div>
   <div>前去<a href="<%=path%>/user-info.jsp" class="con_link">[用户中心]</a></div>
    -->
   <ol class="sec_list">
   <li>前去项目中心<strong><a href="<%=path%>/product/allProduct" class="con_link">[浏览项目]</a></strong>，查看详细信息，进行投资。</li>
   <li>去个人中心查看<strong><a href="<%=path%>/wel/account" class="con_link">[个人信息]</a></strong>。</li>
   <li><a href="<%=path%>/gate/recharge" class="sec_btn_org">去充值</a></li>
   <li><a href="<%=path%>/tixian.jsp" class="sec_btn_org">去提现</a></li>
   </ol>
   <div class="sec_product" style="display:none">
	   <div class="sec_pro_show"></div> 
   </div>
   
  </div>        
</div>

<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>