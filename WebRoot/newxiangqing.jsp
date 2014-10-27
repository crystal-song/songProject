<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/taglibs.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="中租宝，是北京中投汇融投资管理有限公司旗下的众筹网络平台，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="中租宝,理财,投资,收益,中投汇融,融资,P2B,P2P,商券,众筹,zhonghuibao,信托,债权,抵押,信贷,基金,定投,中小贷,微信托,投资人" name="keywords">
<title>${news.title} - ${news.channel} - 中租宝</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
var navIndex=4;
</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>
<div class="frame">
<div class="news_location">当前位置：<a href="<%=path%>/" >首页</a> >> <a href="<%=path%>/guarantee/getNewslist?channel=${news.channel}">${news.channel}</a></div>
	<div class="clear_height"></div>
	<div class="bz_left">
    	<div class="bzl_tit"></div>
        <div class="bzl_list">
        	<ul>
        	 <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
            	<li class="aqbz"><a href="getlist?id=${s.id}">${s.name}</a></li>
            	</c:forEach>
        </c:if>    
            </ul>
        </div>
    </div>
    <div class="bz_right">
    
    	<div class="bzr_tit">
        	<h1>${news.title}</h1>
        </div>
        <div class="clear"></div>
        <div class="bzr_nr">
         <%-- <div >${news.title}</div> --%>
         
         <div style="text-align:right; padding:10px;">发布时间：${news.time}</div>
         <div class="news_content">${news.depicts}</div>      
        
        	<%-- <ul>
        		 <c:if test="${ not empty list1}">
        <c:forEach var="s" items="${list1}" varStatus="i">
            	<li>${s.title}</li>
               	</c:forEach>
        </c:if>
            </ul> --%>
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
