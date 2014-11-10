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
<meta content="中租宝，是北京中投汇融投资管理有限公司旗下的众筹网络平台，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>易宝账户注册成功！ - 中租宝</title>
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
<div class="msg_con">
  <div class="queren_con" style="height:750px">
    <div class="ren_pass01"><strong>您的易宝账号已注册成功</strong></div> 
    <p class="jin_font">现在需要您重新登录！</p>
    <ol class="sec_list">
      <li><a class="sec_btn_org" href="<%=path%>/login">立即重新登录</a></li>
    </ol>
    <%-- <p class="jin_font">您可以做以下操作</p>
   <ol class="sec_list">
      <li>去项目中心<a class="con_link" href="<%=path%>/touzi.jsp"><strong>[浏览项目]</strong></a></li>
      <li>去用户中心查看<a class="con_link" href="<%=path%>/user-info.jsp"><strong>[个人信息]</strong></a></li>
      <li><a class="sec_btn_org" href="<%=path%>/gate/recharge">去充值</a></li>    
   </ol>  --%>
   <div class="sec_pro_show" style="display:none"></div>      
</div>
</div>   

<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>