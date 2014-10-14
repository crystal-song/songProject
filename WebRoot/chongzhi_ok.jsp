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
  <div class="queren_con" style="height:675px;">
   <div class="sucess_title"><strong>您的易宝账号已注册成功!</strong></div>
   <div class="title_sec">您可以进行以下操作</div>
   
   <!-- 
   <div>前去<a href="<%=path%>/touzi.jsp" class="con_link">[浏览项目]</a></div>
   <div>前去<a href="<%=path%>/user-info.jsp" class="con_link">[用户中心]</a></div>
    -->
   <ol class="sec_list">
   <li>前去项目中心<strong><a href="<%=path%>/touzi.jsp" class="con_link">[浏览项目]</a></strong>，查看详细信息，进行投资。</li>
   <li>去个人中心查看<strong><a href="<%=path%>/user-info.jsp" class="con_link">[个人信息]</a></strong>。</li>
   <li><a href="<%=path%>/chongzhi.jsp" class="sec_btn_org">去充值页面充值</a></li>
   </ol>
   <div class="sec_product">
	   <div class="sec_pro_show"></div> 
   </div>
   
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