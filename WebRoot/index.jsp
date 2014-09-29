<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%@ include file="/includes/taglibs.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中投汇</title>

<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
var navIndex=0;
$(document).ready(function(){
	$('.res').click(function(){
		$('.ie_text').css('display','none');
		//alert('ok')
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
<div class="top_01"></div>
<div class="clear"></div>
<div class="one">
	<div class="one_fra">
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
            <div class="two_nr">对于极致的追求是中投汇融一直以来秉承的信念，<span class="hong">极致透明安全、极致体验</span>。在这里我们为您准备好一切。</div>
        </div>
        <div class="two_list2">
        	<div class="two_tit">理财随心</div>
            <div class="two_nr">在中投汇融，我们提供了高质量的不同期限、不同利率、不同用途的借款项目，随心选择。</div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="two_pic"><img src="<%=path%>/images/sy_41.jpg"></div>
</div>
<div class="clear"></div>
<div class="content">
	<div class="content_fra">
    	<div class="cont_left">
    	
    	
    	<%--  <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
        	<div class="ckxq">
            	<div class="ckxq_bg">推荐项目:<span class="ckxq_red"><a href="<%=path%>/index.jsp">${s.projectName}</a></span></div>
                <div class="xq_tab">
                	<div class="xq_left"><img src="<%=path%>/images/sy_63.jpg"></div>
                    <div class="xq_right">
                    	<div class="xq_table">
                        	<div class="xq01">
                            	<div class="xq01_tit">年化收益</div>
                                <div class="xq01_nr hong">14.50%</div>
                            </div>
                            <div class="xq02">
                            	<div class="xq01_tit">融资金额</div>
                                <div class="xq01_nr">1000万</div>
                            </div>
                            <div class="xq03">
                            	<div class="xq01_tit">还款日期</div>
                                <div class="xq01_nr">2015-06-04</div>
                            </div>
                            <div class="xq04">
                            	<div class="xq01_tit">企业等级</div>
                                <div class="xq04_nr"><img src="<%=path%>/images/sy_66.jpg"></div>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="jindu">
                        	<div class="jindu_font">融资进度：<span class="hong">73%</span></div>
                            <div class="jindu_pic"><img src="<%=path%>/images/sy_71.jpg"></div>
                        <div class="clear"></div>
                        <div class="jd_font">
                        	<div class="jindu_font">已投金额：<span class="hong">730万元</span></div>
                            <div class="jd_right">还款方式：<span class="qucu">到期还本</span></div>
                        </div>
                        <div class="clear"></div>
                        <div class="jd_font">
                        	<div class="jindu_font">还需金额：<span class="hong">270万元</span></div>
                            <div class="jd_right">担保机构：<span class="qucu">很暗诺亚投资担保有限公司</span></div>
                        </div>
                    </div>
                </div>
            </div>
			</div>
			 </c:forEach>
      
	 
        </c:if>
			 --%>
 
	   <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
	  
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
            </c:forEach>
      
	 
        </c:if>
             
            
            
       <div class="clear_height"></div>
              
           <%--  <div class="clear_height"></div>
            <div class="ind_list">
            	<div class="xq_left"><img src="<%=path%>/images/sy_63.jpg"></div>
                <div class="ind_right">
                	<div class="tuijian">
                    	<div class="tj_left">推荐项目:<span class="hong">建筑工程企业建筑材料采购</span></div>
                        <div class="tj_right">
                        	<div class="tj_jd">融资进度：80%</div>
                            <div class="tj_jd_pic"><img src="<%=path%>/images/sy_76.jpg"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="xq_table">
                        <div class="xq01">
                            <div class="xq01_tit">年化收益</div>
                            <div class="xq01_nr hong">14.50%</div>
                        </div>
                        <div class="xq02">
                            <div class="xq01_tit">融资金额</div>
                            <div class="xq01_nr">1000万</div>
                        </div>
                        <div class="xq03">
                            <div class="xq01_tit">还款日期</div>
                            <div class="xq01_nr">2015-06-04</div>
                        </div>
                        <div class="xq04">
                            <div class="xq01_tit">企业等级</div>
                            <div class="xq04_nr"><img src="<%=path%>/images/sy_66.jpg"></div>
                        </div>
                    </div>
                </div>
            </div> --%>
		</div> 
		<div class="cont_right">
			<!-- news_list start  -->
			<%@ include file="/includes/news_list_right.jsp" %>
			<!-- news_list end  -->
        </div>
        <div class="clear"></div>
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
