<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>法律声明 - 帮助中心 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<%@ include file="/includes/taglibs.jsp" %>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">

var navIndex=5;
var index=2;

$(document).ready(function(e) {
	$(".nav_big a").eq(4).addClass("bd_btom").siblings().removeClass("bd_btom");
	$(".news_ul a").eq(2).addClass("aqbz").siblings().removeClass("aqbz");
	});
</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
 <div class="news_location">当前位置：<a href="<%=path%>/index.jsp" >首页</a> >> <a href="<%=path%>/help_con.jsp" >帮助中心</a> >> <a href="<%=path%>/security.jsp" >安全策略</a></div>
      <div class="user_con_news">
       <div class="news_left">
          <!-- left menu -->
           <%@ include file="/includes/left_help.jsp" %>
          <!-- left end -->
       </div>
       <div class="right_news_con">  
        	<dl>
        	   <dt></dt>
        	   <p>(一) 严格准入</p>
        	   <dd style="margin-bottom:15px;">担保公司准入：理财范围仅与持有融资性担保机构经营许可证的融资性担保公司战略合作；
               </dd>
               <dd>企业准入：严格控制在实体经营企业，保证企业的财报可审查、资金用途可跟踪、企业经营情况可监控，企业的盈利能力可评估。
               </dd>
               <p>(二) 严格贷前审查</p>
               <dd>融资性担保公司前期风控第一层把关，平台设置独立风险控制部门第二层把关。在原则性尽职调查基础上对相关项目的从业行业、企业经营情况、实际控制人道德风险、申请贷款用途合规及合法性、反担保措施等多个纬度实施审慎考量。
               </dd>          
        	   <p>(三) 完善贷后管理</p>
               <dd>融资性担保公司前期风控第一层把关，平台设置独立风险控制部门第二层把关。在原则性尽职调查基础上对相关项目的从业行业、企业经营情况、实际控制人道德风险、申请贷款用途合规及合法性、反担保措施等多个纬度实施审慎考量。
               </dd>
               <dd>平台及第三方担保机构对借款企业执行借款合同情况及借款企业的经营情况进行追踪调查和检查。若发现借款人未按规定用途使用贷款等造成贷款风险加大的情形，将采取相关保全措施。若企业借款出现预期、坏账依照合同规定，
                                  担保机构会在规定时间对投资客户实行前置赔付，并迅速启动抵押标的或反担保物处置程序，最大化减小损失。
        	   </dd>
        	</dl>
        	  	
        </div>
    </div>
<!-- right end -->
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
