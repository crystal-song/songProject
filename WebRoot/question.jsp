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
<title>常见问题 - 帮助中心 - 中租宝</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
var navIndex=5;
var index=1;

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
<div class="news_location">当前位置：<a href="<%=path%>/index.jsp" >首页</a> >> <a href="<%=path%>/help.jsp" >帮助中心</a> >> <a href="<%=path%>/question.jsp" >常见问题</a></div>
<!-- left menu -->
<%@ include file="/includes/left_help.jsp" %>
<!-- left end -->
<!-- right content -->
    <div class="bz_right">

    	<div class="bzr_tit">
        	<ul>
            	<li class="bzr_qian">常见问题</li>          
            </ul>
        </div>
        <div class="clear"></div>
        <div class="bzr_nr">
        	<dl>
        	   <dt></dt>
        	   <p>1、中租宝平台投资理财的收益情况如何？</p>
        	   <dd>中租宝平台上出借人的回报是基于P2P模式下的点对点回报，也就是出借人的收益会受借款人个体差异的影响，不是一个固定的数据，中汇通的每月预期收益率1%以上。
               </dd>
               <dd>公司主要以P2B即person-to-business,个人对（非金融机构）企业为主要运营模式。专注服务于中小企业融资项目与投资人对接的金融服务平台。
                                 完全打破传统P2P平台的纯信用软风控运作模式，转变为以不动产为抵押物的硬风控运作模式，从而将投资人的风险大幅下降，致力于为客户提供安全稳健的优质理财产品。
               </dd>
               <p>2、中租宝作为理财服务平台，受法律保护吗？</p>
               <dd>《中华人民共和国合同法》从法律上肯定了民间借贷行为的合法性，并从法律层面保护出借人收回借贷资金和利息的权利。
               </dd>
               <dd>《合同法》第211条：“自然人之间的借款合同对支付利息没有约定或约定不明确的，视为不支付利息。自然人之间的借款合同约定支付利息的，
                                   借款的利率不得违反国家有关限制借款利率的规定”。最高人民法院《关于人民法院审理借贷案件的若干意见》第6条：“民间借贷的利率可以适当高于银行的利率，
                                   各地人民法院可以根据本地区的实际情况具体掌握，但最高不得超过银行同类贷款利率四倍。超出此限度的，超出部分的利息不予保护”。
        	   </dd>
        	</dl>
        	   	
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
