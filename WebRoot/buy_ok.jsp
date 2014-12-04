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
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>投资成功 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;          

</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>



<div class="clear"></div>
<div class="msg_con">
  <div class="queren_con" style="height:675px;">
   <div class="sucess_title"><strong>投资成功!</strong></div>
   <div style="width:600px; margin:0px auto;">
   	<ul class="chong">
   	<li style="clear:both;"><span>　订单号：</span><span>${transferInfo.orderNo}</span></li>
   	<li style="clear:both;"><span>项目名称：</span><span>${transferInfo.projectName}</span></li>
   	<li style="clear:both;"><span>金　　额：</span><span>${transferInfo.paymentAmount}</span></li>
   	</ul>
   </div>
   <%-- <div class="title_sec">您可以进行以下操作</div>
   
   <!-- 
   <div>前去<a href="<%=path%>/touzi.jsp" class="con_link">[浏览项目]</a></div>
   <div>前去<a href="<%=path%>/user-info.jsp" class="con_link">[用户中心]</a></div>
    -->
   <ol class="sec_list">
   <li>前去项目中心<strong><a href="<%=path%>/touzi.jsp" class="con_link">[浏览项目]</a></strong>，查看详细信息，进行投资。</li>
   <li>去个人中心查看<strong><a href="<%=path%>/user-info.jsp" class="con_link">[个人信息]</a></strong>。</li>
   <li><a href="<%=path%>/chongzhi.jsp" class="sec_btn_org">去充值页面充值</a></li>
   </ol> --%>
   <div class="sec_product" style="display:none;">
	   <div class="sec_pro_show"></div> 
   </div>
   
  </div>        
</div>
   
     
       

<div class="clear_height"></div>

<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>