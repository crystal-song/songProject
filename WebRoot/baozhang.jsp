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
            	<li class="aqbz">风险保障金</li>
                <li>全额抵押贷款</li>
                <li>受法律保护</li>
            </ul>
        </div>
    </div>
    <div class="bz_right">
    	<div class="bzr_tit">
        	<ul>
            	<li class="bzr_qian">合作担保机构</li>
                <li>CFCA战略合作</li>
                <li>风险保障金</li>
                <li>企业信用等级</li>
                <li>信审风控体系</li>
                <li>法律法规</li> 
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
