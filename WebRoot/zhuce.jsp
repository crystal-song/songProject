<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ include file="/includes/taglibs.jsp" %>

<title>易宝账户注册成功！ - 中租宝</title>

</head>
<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<div class="msg_con">
  <div class="queren_con" style="height:750px">
    <div class="ren_pass01"><strong>您的易宝账号已注册成功</strong></div> 

   <ol class="sec_list">
    <li>前去项目中心<strong><a href="<%=path%>/product/allProduct" class="con_link">[浏览项目]</a></strong>，查看详细信息，进行投资。</li>
    <li>去个人中心查看<strong><a href="/gate/service" class="con_link">[个人资产]</a></strong>。</li>
    <li><a href="<%=path%>/gate/recharge" class="sec_btn_org">去充值</a></li>
    <li><a href="<%=path%>/gate/drawMoney" class="sec_btn_org">去提现</a></li>
   </ol>

   <div class="sec_pro_show" style="display:none"></div>      
</div>
</div>   

<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>