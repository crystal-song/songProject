<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%@ include file="/includes/taglibs.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易宝账户注册成功！ - 中投汇</title>
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
  <div class="queren_con" style="height:750px">
    <div class="ren_pass01"><strong>您的易宝账号已注册成功</strong></div> 
    <p class="jin_font">现在需要您重新登录！</p>
    <ol class="sec_list">
    <li><a class="sec_btn_org" href="<%=path%>/login">立即重新登录</a></li>
    </ol>
    <%-- <p class="jin_font">您可以做以下操作</p>
   <ol class="sec_list">
      <li>去项目中心<a class="con_link" href="<%=path%>/touzi.jsp"><strong>[浏览项目]</strong></a></li>
      <li>去用户中心查看<a class="con_link" href="<%=path%>/user-info.jsp"><strong>[个人信息]</strong></a></li>
      <li><a class="sec_btn_org" href="<%=path%>/gate/recharge">去充值</a></li>    
   </ol>  --%>
   <div class="sec_pro_show"></div>      
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