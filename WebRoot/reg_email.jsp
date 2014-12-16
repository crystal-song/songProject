<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>



<title>用户注册 -发送邮件- 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 

<script type="text/javascript" >

</script>

</head>


<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<div class="msg_con">
  <div class="queren_con">
   <div class="con_title"><strong>注册中租宝通行证</strong></div>
   
    	 <table border="0" cellspacing="0" cellpadding="0" align="left"  width="100%" class="table_style">
			<tr>
				<td  style="color:#FF6633;font-weight:bold" width="100%">马上激活邮件完成注册</td>
			</tr>
			
			<tr>
				<td  style="color:#FF6633;font-weight:bold" width="100%">激活邮件已发送到您的 ${user1.email}邮箱， </td>
			</tr>
			<tr>
				<td  style="color:#FF6633;font-weight:bold" width="100%">请查看邮箱并完成注册 。</td>
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
