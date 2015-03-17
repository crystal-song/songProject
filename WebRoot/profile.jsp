<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/taglibs.jsp" %>

<title>用户中心</title>

<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
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
<%@ include file="/includes/left_profile.jsp" %>
<!-- left end -->
<!-- right content -->
    <div class="bz_right">

    	<div class="bzr_tit">
        	<ul>
            	<li class="bzr_qian">我的账户</li>
            </ul>
        </div>
        <div class="clear"></div>
        <div class="bzr_nr">

        </div>
    </div>
<!-- right end -->
</div>
<div class="clear_height"></div>

<!-- links start -->

<!-- links end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
<script type="text/javascript">
  var head_index=2;  
</script>
<script type="text/javascript" src="<%=path%>/static/js/zhongzubao.js?va=4"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.bzl_list ul li').click(function(){
		/* $(".u_left_sec:eq(2) li:eq(3)").children("a").css("color","#fc652e"); */
	    $(this).addClass('aqbz').siblings().removeClass('aqbz');
	});
	
})
</script>