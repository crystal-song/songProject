<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ include file="/includes/taglibs.jsp" %>

<title>常见问题 - 帮助中心 - 中租宝</title>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="news_location">当前位置：<a href="<%=path%>/index.jsp" >首页</a> >> <a href="<%=path%>/help_con.jsp" >帮助中心</a> >> <a href="<%=path%>/question.jsp" >常见问题</a></div>

    <div class="user_con_news">
       <div class="news_left">
          <!-- left menu -->
           <%@ include file="/includes/left_help.jsp" %>
          <!-- left end -->
       </div>
       <div class="right_news_con">      
          <dl>
        	   <dt></dt>
        	   <p>1、中租宝平台投资理财的收益情况如何？</p>
        	   <dd>中租宝平台上出借人的回报是基于P2P模式下的点对点回报，也就是出借人的收益会受借款人个体差异的影响，不是一个固定的数据，中租宝的每月预期收益率1%以上。
               </dd>
               <dd>公司主要以企业债即person-to-business,个人对（非金融机构）企业为主要运营模式。专注服务于中小企业融资项目与投资人对接的金融服务平台。
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
var navIndex=5;
var index=1;
$(document).ready(function(e) {
$(".nav_big a").eq(4).addClass("bd_btom").siblings().removeClass("bd_btom");
$(".nav_big a").eq(4).children("p").addClass("headwd_color");
$(".news_ul a").eq(1).addClass("aqbz").siblings().removeClass("aqbz");
});
</script>

