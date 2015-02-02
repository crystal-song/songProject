<%@page import="org.springframework.ui.Model"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>

<title>用户注册 -成功- 中租宝</title>
</head>
<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<div class="msg_con">
  <div class="queren_con">
   <div class="con_title"><strong>注册中租宝通行证</strong></div>
   
    	 <table border="0" cellspacing="0" cellpadding="0" align="left"  width="100%" class="table_style">
			<tr>
				<td  style="color:#FF6633;font-weight:bold" width="100%">
			<c:choose>
      			 <c:when test="${regState=='s'}">
					注册成功！
					
			<tr>
				<td  style="color:#FF6633;font-weight:bold" width="100%">您现在可以直接登录中租宝。 </td>
			</tr>
			<tr>
				<td  style="color:#FF6633;font-weight:bold" width="100%"><a href="<%=path%>/login.jsp">请重新登录</a></td>
			</tr>
			
     		    </c:when>
     		   
       			<c:when test="${regState=='f'}">
					注册失败！<%=request.getAttribute("msg") %>
      		    </c:when>
		  </c:choose>
		  
				</td>
			</tr>
			
			<tr>
				<td  style="color:#FF6633;font-weight:bold" ></td>
			</tr>
			<tr>
				<td  style="color:#FF6633;font-weight:bold" ></td>
			</tr>
			<tr>
				<td  style="color:#FF6633;font-weight:bold" ></td>
			</tr>
			<tr>
				<td  style="color:#FF6633;font-weight:bold" ></td>
			</tr>
			
			</table> 
    
    </div>
 </div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
