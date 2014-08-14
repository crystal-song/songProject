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
<title>帮助中心</title>
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
<!-- left menu -->
<%@ include file="/includes/left_help.jsp" %>
<!-- left end -->
<!-- right content -->
    <div class="bz_right">

    	<div class="bzr_tit">
        	<ul>
            	<li class="bzr_qian">关于我们</li>
                <li>安全策略</li>
                <li>账户操作</li>
                <li>投融资相关</li>
                <li>生利宝</li>
            </ul>
        </div>
        <div class="clear"></div>
        <div class="bzr_nr">
        	<ul>
            	<li>好收益是什么网站？</li>
                <li>好收益提供什么样的理财项目？</li>
                <li>好收益有哪些理财产品？</li>
                <li>如何成为好收益的投资人？</li>
                <li>投资人如何进行投资？</li>
                <li>投资人是否需要支付费用？</li>
                <li>投资人投资金额是多少？</li>
            </ul>
        </div>
    </div>
<!-- right end -->
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
