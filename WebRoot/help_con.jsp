<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/includes/taglibs.jsp" %>

<title>帮助中心 - 中租宝</title>
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
          <p>中租宝，是中投汇融投资管理有限公司旗下的众筹网络平台</p>    
          <p>中租宝开创了企业债新时代，首次提出高标准、严要求挑选合作伙伴，只接受优质担保机构（信用评级A+级以上，政府重点扶持项目）企业的银行级理财项目，并有专家风控团队，为投资者提供100%本息保障，最高超过银行活期同期存款30倍的高收益理财项目。通过中租宝，您可以将手中富余资金出借给盈利能力强的中小企业，并获得高收益的利息回报，分享企业高速发展的红利。 </p> 
          <p>
                       中投汇融投资管理有限公司（以下简称“中投汇融”）
                       是国内首批企业债领域的财富投资管理公司。我们汇集了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台。          
           </p>         
          <p>公司定位：以互联网金融、资产管理、投资咨询为主业的综合性现代金融服务企业。
                       公司目前两大体系分别为线上“中租宝”电商平台和线下中投汇融财富管理中心，公司旗下产业涵盖矿产、畜牧、科技能源、金融（融资租赁）行业，年产值近1亿。 </p>
          <p>中投汇融倡导现代金融服务的发展理念，目前已与国内数十家知名金融机构建立了长期战略合作关系，
                       赢得了工商银行、民生银行、招商银行、浦发银行、兴业银行、江苏银行、平安银行、中国中投证券、四川信托股份有限公司、中融信托股份有限公司、新时代信托股份有限公司、新华信托股份有限公司等多家合作单位的一致认可，
                        同时积极开展了资金监管、产品开发及产品推广等多方面的合作。</p>
       </div>    
   </div>

<!-- absolute_right start -->
	<%@ include file="/includes/absolute.jsp" %>
<!-- absolute_right end -->      
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript">
$(document).ready(function(e) {
	$(".nav_big a").eq(4).addClass("bd_btom").siblings().removeClass("bd_btom");
	$(".nav_big a").eq(4).children("p").addClass("headwd_color");
    $(".news_ul li").click(function(e){
       var index=$(this).index();
       $(this).children("div").addClass("news_wd_color");
       $(this).siblings().children("div").removeClass("news_wd_color");
       $(".news_right ul").eq(index).css("display","block").siblings().css("display","none");
    });
    $(".news_ul a").eq(0).addClass("aqbz").siblings().removeClass("aqbz");

});
</script>

