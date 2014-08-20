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
<title>安全保障</title>
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
<div class="frame">
	<div class="bz_left">
    	<div class="bzl_tit">帮助中心</div>
        <div class="bzl_list">
        	<ul>
        	 <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
            	<li class="aqbz"><span class="hong"><a href="<%=path%>/guarantee/getlist?id=${s.id}">${s.name}</a></span></li>
            	</c:forEach>
        </c:if>
               
            </ul>
        </div>
    </div>
    <div class="bz_right">
    	<div class="bzr_tit">
        	
        </div>
        <div class="clear"></div>
        <div class="bzr_nr">
        	<ul>
        		 <c:if test="${ not empty list1}">
        <c:forEach var="s" items="${list1}" varStatus="i">
            	<li><span class="hong"><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title} ${s.time} </a></span></li>
               	</c:forEach>
        </c:if>
            </ul>
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
