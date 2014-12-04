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
<title>投资确认 - 中租宝</title>
<%--  <jsp:include page="/payment/head.jsp"></jsp:include>   --%>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;          

</script>
<script type="text/javascript">
function onSubmit(host) {
  document.getElementById("host").value = host;
  var form = document.getElementById("form");
  form.submit();
}
</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<div class="msg_con">
  <div class="queren_con">
   <div class="con_title"><strong>投资信息确认</strong></div>
   <form id="form" role="form" action="<%=path%>/gate/doTransfer" method="post">
   <ul> 
         <input type="hidden" id="host" name="host">
         <li> <div class="form-group" style="display:none;height:0px;" >
             <!-- <label for="platformNo">platformNo</label><input type="text"
              class="form-control" id="platformNo" name="platformNo" value="10040011137" />  -->
               <label for="platformNo">platformNo</label><input type="text"
              class="form-control" id="platformNo" name="platformNo" value="10012415118" /> 
          </div></li>
          <li><div class="form-group" style="display:none;height:0px;" >
            <label for="requestNo">requestNo</label><input type="text"
              class="form-control" id="requestNo" name="requestNo" value="${now}" />
          </div></li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="platformUserNo">platformUserNo</label><input
              type="text" class="form-control" id="platformUserNo"
              name="platformUserNo"  value="${registerYeePay1.platformUserNo}"  />
          </div>
          </li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="orderNo">标的号</label><input type="text"
              class="form-control" id="orderNo" name="orderNo" value="${now}" />
          </div>
          </li>
          <li>
          <div class="form-group" style="display:none">
            <label for="transferAmount">标的金额</label><input type="text"
              class="form-control jin_font" id="transferAmount" name="transferAmount" value="${product.financingMoney}0000" />
          </div>
          </li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="targetPlatformUserNo">借款人会员编号</label><input type="text"
              class="form-control" id="targetPlatformUserNo" name="targetPlatformUserNo" value="601522539" />
          </div>
          </li>
          <li>
          <div class="form-group" >
            <label for="projectName">项目名称</label><input type="text"
              class="form-control" id="projectName" name="projectName" value="${product.projectName}" />
          </div>
          </li>
          <li>
          <div class="form-group" >
            <label for="paymentAmount">投资金额</label><input type="text"
              class="form-control" id="paymentAmount" name="paymentAmount" value="${buyAmount}" />
          </div>
          </li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="expired">投标过期时间</label><input type="text"
              class="form-control" id="expired" name="expired" value="2016-12-01 22:22:31" />
          </div>
          </li>
          
           <li>
          <div class="form-group"  style="display:none;height:0px;" >
            <label for="enterpriseNumber">项目编号</label><input type="text"
              class="form-control" id="enterpriseNumber" name="enterpriseNumber" value="${product.enterpriseNumber}" />
          </div>
          </li>
                             
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="notifyUrl">notifyUrl</label><input type="text"
              class="form-control" id="notifyUrl" name="notifyUrl" value="http://192.168.1.207:8080/spring3/gate/transferNotify" />
          </div>
          </li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="callbackUrl">callbackUrl</label><input
              type="text" class="form-control" id="callbackUrl"
              name="callbackUrl" value="http://192.168.1.207:8080/spring3/gate/transferSucceed" />
          </div>
          </li>
          <li>
          <!-- <button onclick="onSubmit('http://qa.yeepay.com/member')" class="btn btn-default">QA</button>  -->
         <!--  <button onclick="onSubmit('https://member.yeepay.com/member')" class="btn btn-default">生产</button> -->
          <div class="que_btn"><a src="javascript:;" onclick="onSubmit('https://member.yeepay.com/member')">确定</a></div>
          </li>
          </ul>
        </form>
   
  </div>        
</div>

<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>