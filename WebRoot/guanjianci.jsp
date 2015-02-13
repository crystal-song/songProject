<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<title>名词解释 - 帮助中心 - 中租宝</title>
</head>
<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<div class="clear"></div>
<div class="news_location">当前位置：<a href="<%=path%>/" >首页</a> >> <a href="<%=path%>/help_con.jsp">帮助中心</a> >> <a href="<%=path%>/help_con.jsp" >名词解释</a></div>
   <div class="user_con_news">
       <div class="news_left">
          <!-- left menu -->
           <%@ include file="/includes/left_help.jsp" %>
          <!-- left end -->
       </div>
       <div class="right_news_con">   
        <div class="termsOfUse" style="margin:0; padding:0; width:838px; ">
        	<h1  class="mingtitle">名词解释</h1>			
			<div class="title01">等额本息</div>
			<div class="section">指在还款期内，每月偿还同等数额的贷款(包括本金和利息)；公式如下：</div>
			<div class="section">每月还款额=[还款本金×月利率×（1+月利率）^还款月数]÷[（1+月利率）^还款月数－1]</div>				
			<div class="title01">放款</div>
        	<div class="section">指一个项目的满标后且已符合放款标准，该项目所筹资金从出借人账户转入企业账户的过程，即企业成功获得了借款。</div>
        	 
        	<div class="title01">回款日期</div>
			<div class="section">指一个项目到期还款时间。</div>			
			<div class="title01">流标</div>
			<div class="section">指因融资期限内，未满标的状态叫做流标。</div>		
			<div class="title01">借款企业</div>
        	<div class="section">已经或准备在网站上进行借款活动的企业称为借款企业。</div>
        	
        	<div class="title01">借款标</div>
			<div class="section">指通过网站进行所需资金筹集的项目。</div>			
			<div class="title01">借款人</div>
			<div class="section">已经或准备在网站上进行借款活动的个人称为借款人。</div>		
			<div class="title01">满标</div>
        	<div class="section">指在期限内足额筹集到所需资金的项目，等待放款的状态。</div>
        	
        	<div class="title01">年化收益率</div>
			<div class="section">以1年为单位获得的投资收益率。</div>			
			<div class="title01">投资人</div>
			<div class="section">已经或准备在网站上进行资金出借活动并完成了实名认证、手机号绑定和提现密码设
                                                            置的用户称为理财用户。</div>		
			<div class="title01">投项目</div>
        	<div class="section">指理财用户将其中租宝账户内指定金额出借给指定的借款项目企业的行为。</div>
        	
        	<div class="title01">提现</div>
			<div class="section">指理财用户将中租宝账户中的本金和利息提取到银行账户中的行为。</div>			
			<div class="title01">投资人</div>
			<div class="section">已经或准备在网站上进行资金出借活动并完成了实名认证、手机号绑定和提现密码设
                                                            置的用户称为理财用户。</div>		
			<div class="title01">投项目</div>
        	<div class="section">指理财用户将其中租宝账户内指定金额出借给指定的借款项目企业的行为。</div>
        	
        	<div class="title01">提现</div>
			<div class="section">以1年为单位获得的投资收益率。</div>			
			<div class="title01">严重逾期</div>
			<div class="section">逾期时间超过30天时，从第31天开始该项目的状态为严重逾期（针对借款企业）。</div>		
			<div class="title01">逾期</div>
        	<div class="section">指借款企业未按协议约定时间进行足额还款，即为逾期。</div>
        	
        	<div class="title01">散标/散标投资项目</div>
			<div class="section">散标是房屋抵押贷、房屋周转贷、汽车抵押贷、个人经营贷、企业经营贷等标的的统称，散标投资门槛为100元起投。</div>			
			<div class="title01">赎回</div>
			<div class="section">投资者向中租宝平台要求全部退出未到期的投资，平台搓合债权转让，由新的投资人购买后，中租宝确认无误后将回款汇至该投资者的账户内，才能赎回成功。</div>		
			<div class="title01">续投</div>
        	<div class="section">指当期理财计划结束后，不全部返还本金和利息，而继续投资该理财计划，投资周期和年化收益率不变。续投分为本金续投和本息续投。本金续投，指续投行为中只加入本金，利息返还到帐户；本息续投，指续投行为中本金和利息都加入。</div>
            <div class="title01">用户投资总额</div>
        	<div class="section">指平台所有用户投资总额的叠加。</div>
            <div class="title01">用户赚取收益</div>
        	<div class="section">指平台截止到目前为止已支付给用户账户的利息和。</div>
       
        </div>
        	 
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
<script type="text/javascript">
 var head_index=5; 
</script>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="<%=path%>/static/js/zhongzubao.js?va=4"></script>
<script type="text/javascript">
$(document).ready(function(e) {

	//$(".nav_big a").eq(4).addClass("bd_btom").siblings().removeClass("bd_btom");
	//$(".nav_big a").eq(4).children("p").addClass("headwd_color");
    $(".news_ul a").eq(7).addClass("aqbz").siblings().removeClass("aqbz");

});
</script>

