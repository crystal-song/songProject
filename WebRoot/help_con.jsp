<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/taglibs.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="中租宝，是北京中投汇融投资管理有限公司旗下的众筹网络平台，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>帮助中心 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
	$(".nav_big a").eq(4).addClass("bd_btom").siblings().removeClass("bd_btom");
    $(".news_ul li").click(function(e){
       var index=$(this).index();
       $(this).children("div").addClass("news_wd_color");
       $(this).siblings().children("div").removeClass("news_wd_color");
       $(".news_right ul").eq(index).css("display","block").siblings().css("display","none");
    });
    $(".news_ul a").eq(0).addClass("aqbz").siblings().removeClass("aqbz");
    
});
</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<div class="clear"></div>
<div class="news_location">当前位置：<a href="<%=path%>/" >首页</a> >> <a href="<%=path%>/help_con.jsp">帮助中心</a> >> <a href="<%=path%>/help_con.jsp" >关于我们</a></div>
   <div class="user_con_news">
       <div class="news_left">
          <!-- left menu -->
           <%@ include file="/includes/left_help.jsp" %>
          <!-- left end -->
       </div>
       <div class="right_news_con">      
          <p>中投汇融投资管理有限公司（以下简称“中投汇融”）成立于工体北路，注册资本5001万，现有员工150人，管理总资产50亿。 </p>
          <p>公司定位：以互联网金融、资产管理、投资咨询为主业的综合性现代金融服务企业。
                       公司目前两大体系分别为线上“中租宝”电商平台和线下中投汇融财富管理中心，公司旗下产业涵盖矿产、畜牧、科技能源、金融（融资租赁）行业，年产值近1亿。 </p>
          <p>中投汇融倡导现代金融服务的发展理念，目前已与国内数十家知名金融机构建立了长期战略合作关系，
                       赢得了工商银行、民生银行、招商银行、浦发银行、兴业银行、江苏银行、平安银行、中国中投证券、四川信托股份有限公司、中融信托股份有限公司、新时代信托股份有限公司、新华信托股份有限公司等多家合作单位的一致认可，
                        同时积极开展了资金监管、产品开发及产品推广等多方面的合作。</p>
          <!--               
           <p><strong>目标</strong></p>            
          <div class="dingwei">
        	    打造专业化金融信息交易平台。<br/>
			    培养优秀金融服务团队。<br/>
			    实现高净值资产管理规模。<br/>
			    创造国际化资产管理服务水平。<br/>
			    成就顶级国际私人银行服务平台。
        	</div>
        	 -->
       </div>    
   </div>
<!-- top end  -->
<!--  
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
-->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
