<%@page import="org.springframework.ui.Model"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<meta name="renderer" content="webkit">
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">


<title>用户注册 -成功- 中租宝</title>
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
