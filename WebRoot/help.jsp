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
var index=0;

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
<!-- left menu -->
<%@ include file="/includes/left_help.jsp" %>
<!-- left end -->
<!-- right content -->
    <div class="bz_right">

    	<div class="bzr_tit">
        	<ul>
            	<li class="bzr_qian">关于我们</li>               
            </ul>
        </div>
        <div class="clear"></div>
        <div class="bzr_nr">
        	<dl>
        	   <dt><strong>关于我们</strong></dt>
        	   <dd>中投汇融投资管理有限公司（以下简称：中投汇融）成立北京工体北路，注册资金五千零一万元人民币，
        	             是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干，
        	             立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台
               </dd>
               <dd>公司主要以P2B即person-to-business,个人对（非金融机构）企业为主要运营模式。专注服务于中小企业融资项目与投资人对接的金融服务平台。
                                 完全打破传统P2P平台的纯信用软风控运作模式，转变为以不动产为抵押物的硬风控运作模式，从而将投资人的风险大幅下降，致力于为客户提供安全稳健的优质理财产品。
               </dd>
               <dd>我们秉持价值发现、价值创造与价值提升的核心理念，利用多年对金融产业与中小企业生态的深刻理解和独特眼光，
                                  嫁接新兴的风险管理模型，围绕中小企业投融资、个人及家庭理财、投资者资产配置，致力于产业升级及产业均衡配置，科技金融与信贷资本适配。志在构建一个安全，稳健，高效的投融资普惠平台。
               </dd>
        	</dl>
        	<p><strong>定位</strong></p>
        	<div class="dingwei">
        	    打造专业化金融信息交易平台。<br/>
			    培养优秀金融服务团队。<br/>
			    实现高净值资产管理规模。<br/>
			    创造国际化资产管理服务水平。<br/>
			    成就顶级国际私人银行服务平台。
        	</div>
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
