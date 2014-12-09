<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="renderer" content="webkit">
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<%@ include file="/includes/taglibs.jsp" %> 
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  

<script type="text/javascript">
var navIndex=0;

	// if(var navIndex!=null&&navIndex!=-1)$(".nav_big li").eq(0).addClass("bd_btom");
	
/*
    $(".header li").mouseover(function(){ 
      var index=$(this).index();
      $('.top div').eq(index).show();

    $(this).addClass('head_red').siblings().removeClass('head_red');     
    }).mouseout(function(){
       var index=$(this).index();
       $('.top div').eq(index).hide();
    });

    $(".top div").mouseover(function(){ 
      var index=$(this).index();
      $(this).show();
     
    }).mouseout(function(){
       var index=$(this).index();
       $(this).hide();
    });

*/

$(document).ready(function(){
	$(".nav_big a").eq(0).addClass("bd_btom").siblings().removeClass("bd_btom");
		  
		$('.res').click(function(){
			$('.ie_text').css('display','none');
		  });	

		 $(".news_title li").click(function(){
		        var index= $(this).index();
		        $(this).addClass('news_title_bac').siblings().removeClass('news_title_bac');
		        $(".news_label ul").eq(index).css("display","block").siblings().css("display","none")
		    });
		    		            
	});
</script>

</head>
<body>


<!--[if lt IE 8]>
<div class="ie_text">你在使用 IE5.5 以上低于 IE8 版本的IE浏览器，建议您更新浏览器版本至IE8以上查看.
<div class="res"></div>
</div>

<![endif]-->

<!-- top start  -->

<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>

<!-- banner start -->
<%@ include file="/includes/banner.jsp" %>
<!-- banner end  -->

<!-- 
<div class="top_01"></div>
<div class="clear"></div>
<div class="one">
	<div class="one_fra" style="display:none">
    	<div class="one_list">已撮合融资<span class="red_weight">1,703,240,000</span>元</div>
        <div class="one_list">为客户赚取收益<span class="red_weight">171,282,505</span>元</div>
        <div class="one_list">已按时还款<span class="red_weight">355,700,000</span>元</div>
        <div class="one_list">已支付收益<span class="red_weight">50,923,085</span>元</div>
    </div>
</div>
<div class="clear"></div>
<div class="two">
	<div class="two_cont">
    	<div class="two_list">
        	<div class="two_tit">事无巨细</div>
            <div class="two_nr">细节都关乎生死。对每一个项目我们都进行<span class="hong">360度全方位尽职调查</span>及<span class="hong">超严格风险控制</span>。您只需安心投资。</div>
        </div>
        <div class="two_list1">
        	<div class="two_tit">极致之美</div>
            <div class="two_nr">对于极致的追求是中租宝一直以来秉承的信念，<span class="hong">极致透明安全、极致体验</span>。在这里我们为您准备好一切。</div>
        </div>
        <div class="two_list2">
        	<div class="two_tit">理财随心</div>
            <div class="two_nr">在中租宝，我们提供了高质量的不同期限、不同利率、不同用途的借款项目，随心选择。</div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="two_pic"><img src="<%=path%>/images/sy_41.jpg"></div>
</div>
<div class="clear"></div>
<div class="content">
	<div class="content_fra">
    	<div class="cont_left">
   --> 	
<div class="content">
  <div class="title">
       <div class="label"><strong>热门项目</strong></div>
  </div>
    <div class="shuju">
       <div class="new_production">
         <a class="images_pro" href="product/getProductByid?id=56"><img width="100%" height="100%" src="<%=path%>/img/images-2014-11/shengxian03.jpg"></a>
         <div class="meier_wd">                
           <h3><a href="product/getProductByid?id=56" style="color:#ff453e">百家社区生鲜便利连锁店01期</a></h3>       	
           <ul class="mei_msg">
            <li><span>融资金额</span><span class="wd_size"><strong>5,000,000</strong></span></li>
            <li><span>年化收益</span><span class="wd_size"><strong class="wd_size_col">14%</strong></span></li>
            <li><span>项目状况</span><span class="wd_size" style="font-size:12px;">融资中..</span></li>
            <li><span>信用等级</span><span class="wd_size new_span"><img  src="<%=path%>/img/images-2014-11/star_5.png"></span></li>
            <li><a href="product/getProductByid?id=56" class="touzi_mei">我要投</a></li>
           </ul>
         </div>
       </div>
       <div class="newpro_right">
         <dl>
           <dt><strong>企业定位</strong></dt>
           <dd><a class="newpro_wd01"></a><span>打造专业化金融信息交易平台。</span></dd>
           <dd><a class="newpro_wd02"></a><span>实现高净值资产管理规模。</span></dd>
           <dd><a class="newpro_wd03"></a><span>创造国际化资产管理服务水平。</span></dd>
           <dd><a class="newpro_wd04"></a><span>成就顶级国际私人银行服务平台。</span></dd>
       </dl>
       </div>    
    </div> 
    <div class="clear"></div>
    <!--
      <li class="shu_pro">
      
        <div class="shu_pic pic01"></div>
        <div class="shu_wd">
          <span>以撮合融资总额</span>
          <p><strong>1,447,540<i>元</i></strong></p>
        </div>
        
      </li>
      <li class="shu_pro">
        <div class="shu_pic pic02"></div>
        <div class="shu_wd">
          <span>为客户赚取利益</span>
          <p><strong>1,447,540<i>元</i></strong></p>
        </div>
        
      </li>
      <li class="shu_pro">
        <div class="shu_pic pic03"></div>
        <div class="shu_wd">
          <span>以按时返款</span>
          <p><strong>1,447,540<i>元</i></strong></p>
        </div>
        
      </li>
      <li class="shu_pro">
        <div class="shu_pic pic04"></div>
        <div class="shu_wd">
          <span>以支付利益</span>
          <p><strong>1,447,540<i>元</i></strong></p>
        </div>
      </li>
       -->

     <div class="title">
       <div class="label"><strong>推荐项目</strong></div>
       <a class="more" href="<%=path%>/product/allProduct">更多&nbsp;&nbsp;>></a>
     </div> 
     <div class="main">
       <ul>
        
	   <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">   
         <li>
              <div class="floor_num">
                 <a class="floor_img" href="product/getProductByid?id=${s.id}">
                 ${s.projectPicture}
                 <div class="hot"></div>
                 <!-- <div class="last_time">剩余时间:<strong>&nbsp;&nbsp;28</strong>天</div> -->
                 <div class="last_time">年化收益率:<strong>&nbsp;&nbsp;${s.yearIncome}%</strong></div>
                 </a>
                 <h3><a class="shuoming" href="product/getProductByid?id=${s.id}" title="${s.projectName}">${s.projectName}</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span><%-- ${s.financingPeriod}个月 --%>30天</span>
                   <span style="width:110px;"><em>¥&nbsp;</em>${s.financingMoney}万元</span>
                   <a>融资中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b" style="width:<c:if test='${empty s.financingProgress}'>1</c:if><c:if test='${not empty s.financingProgress}'>${s.financingProgress<100?s.financingProgress==null?0:s.financingProgress:100}</c:if>%" title="融资进度：${s.financingProgress}%"></div>
                 </div>
                 <div class="floor_bottom">
                   <span style="float:left; margin-left:3%;"><a style="float:left; color:#a4a4a4;">已达</a><a class="baifenbi" style="float:left; text-align:left;"><c:if test='${empty s.financingProgress}'>0</c:if>${s.financingProgress}%</a>
                   </span>
                   <span style="display:none"  ><a style="color:#a4a4a4; float:left; ">已筹资</a><a class="baifenbi" style="float:left; text-align:left;">¥&nbsp;&nbsp;<c:if test='${empty s.realityMoney}'>0</c:if> ${s.realityMoney}</a>
                   </span>
                   <span style="float:right; margin-right:3%;"><a style="float:right; color:#a4a4a4;" >年化收益率</a><a class="baifenbi" style="float:right; text-align:right;">${s.yearIncome}%</a>
                  </span>
                 </div>
                 <div class="botm_btn">
                  <a href="product/getProductByid?id=${s.id}">我要投</a>
                  <a href="product/getProductByid?id=${s.id}" class="btn_org">了解详情</a>
                 </div>
              </div>
            </li>
      
        
	 <!-- 
			<div class="clear_height"></div>
            <div class="ind_list">
            
            	<%-- <div class="xq_left"><a href="product/getProductByid?id=${s.id}" title="${s.projectName}"><img src="<%=path%>/images/sy_63.jpg" /></a></div> --%>
            	<div class="xq_left"><a href="product/getProductByid?id=${s.id}">${s.projectPicture}</a></div>
                <div class="ind_right">
                	<div class="tuijian">
                    	<div class="tj_left">推荐项目:<span class="hong"><a href="product/getProductByid?id=${s.id}" title="${s.projectName}">${s.projectName}</a></span></div>
                        <div class="tj_right">
                        	<div class="tj_jd">融资进度：<c:if test='${empty s.financingProgress}'>0</c:if>${s.financingProgress}%</div>
                             <div class="tj_jd_pic"><div class="progress_80"><div class="progress_bar" style="width:<c:if test='${empty s.financingProgress}'>0</c:if><c:if test='${not empty s.financingProgress}'>${s.financingProgress<100?s.financingProgress==null?0:s.financingProgress:100}</c:if>%" title="融资进度：${s.financingProgress}%"></div></div></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="xq_table">
                    <a href="product/getProductByid?id=${s.id}" title="${s.projectName}">
                        <div class="xq01">
                            <div class="xq01_tit">年化收益</div>
                            <div class="xq01_nr hong">${s.yearIncome}%</div>
                        </div>
                        <div class="xq02">
                            <div class="xq01_tit">融资金额</div>
                            <div class="xq01_nr">${s.financingMoney}万</div>
                        </div>
                        <div class="xq03">
                            <div class="xq01_tit">还款日期</div>
                            <div class="xq01_nr">${s.repaymentTime}</div>
                        </div>
                        <div class="xq04">
                            <div class="xq01_tit">企业等级</div>
                            <div class="xq04_nr"><img src="<%=path%>/images/qualityRate_${s.qualityRating}.jpg" style="margin-bottom:-3px;"></div>
                        </div>
                        </a>
                    </div>
                </div>
                
            </div>
            -->
          
            </c:forEach>
        </c:if>
       
     </ul>
   </div>
   <div class="title">
       <div class="label"><strong>最新动态</strong></div>
     </div>
   <div class="news">
    
   <div class="w_gonggao">
	      <ul class="news_title">
	        <li class="news_title_bac"><a id="new_bac" class="new_title01">网站公告</a><a class="new_logo1" href="<%=path%>/guarantee/getchannel">更多 >></a></li>       
	       </ul>
	      <div class="news_label">
		      <ul class="news_con">
		        <c:if test="${ not empty list2}">
			        <c:forEach var="s" items="${list2}" varStatus="i">
			            <li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
			        </c:forEach>
				</c:if>
		      </ul>      
	      </div>
     </div> 
     <div class="w_gonggao">
	      <ul class="news_title">
	        <li class="news_title_bac"><a id="new_bac" class="new_title02">还款公告</a><a class="new_logo1" href="<%=path%>/guarantee/getchannel">更多 >></a></li>       
	       </ul>
	      <div class="news_label">
		      <ul class="news_con">
		        <c:if test="${ not empty list3}">
                    <c:forEach var="s" items="${list3}" varStatus="i">
                    	<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
                    </c:forEach>
				</c:if>
		      </ul>      
	      </div>
     </div> 
     <div class="w_gonggao" style="margin-right:0">
	      <ul class="news_title">
	        <li class="news_title_bac"><a id="new_bac" class="new_title03">媒体报道 </a><a class="new_logo1" href="<%=path%>/guarantee/getchannel">更多 >></a></li>       
	       </ul>
	      <div class="news_label">
		      <ul class="news_con">
		        <c:if test="${ not empty list1}">
                   <c:forEach var="s" items="${list1}" varStatus="i">
                    	<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
                   </c:forEach>
				</c:if>
		      </ul>  
	      </div>
     </div> 
    </div> 
    <!-- absolute_right start -->
	 <%@ include file="/includes/absolute.jsp" %>
	<!-- absolute_right end -->
      
 </div>                  
      <!--    
		</div> 
		<div class="cont_right">
			<!-- news_list start  -->
		
			<!-- news_list end  -->
			<!-- 
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="clear_height"></div>
<!-- links start -->
<!-- 

 -->
<!-- links end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
