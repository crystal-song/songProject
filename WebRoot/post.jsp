<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>正在提交数据...</title>
<link href="<%=path%>/css/style1.css" rel="stylesheet" type="text/css" />
<%--  <jsp:include page="/payment/head.jsp"></jsp:include>   --%>
<script type="text/javascript">
function onSubmit() {
	var url = document.getElementById("url").value;
	var form = document.getElementById("form");
	form.action = url;
	form.submit();
}
window.onload=function(){
	setTimeout(onSubmit,2000);
	
}
</script>
</head>
<body>
<div id="tiaozhuan">
<h1 style="margin-top:100px; text-align:center; font-size:24px; color:#3e3e3e;">正在为您转至第三方支付平台，请稍后...</h1>
<h3 style="margin-top:46px; text-align:center; font-size:20px; color:#3e3e3e;"><a href="javascript:;" onclick="onSubmit">立即跳转</a></h3>
</div>
  <div class="container" style="display:none;">
    <div class="row clearfix">
      <div class="col-md-12 column">
        <h3>准备请求</h3>
        <form id="form" method="post">
          <div class="form-group">
            <label for="service">service</label><input type="text"
              class="form-control" id="service" name="service" value='${service}' />
          </div>
          <div class="form-group">
            <label for="url">url</label><input type="text"
              class="form-control" id="url" value='<c:out value="${url}"/>' />
          </div>
          <div class="form-group">
            <label for="req">req</label>
            <textarea class="form-control" id="req" name="req" rows="14"><c:out value="${req}"/></textarea>
          </div>
          <div class="form-group">
            <label for="sign">sign</label>
            <textarea class="form-control" id="sign" name="sign"
              rows="5"><c:out value="${sign}"/></textarea>
          </div>
          <button onclick="onSubmit()" class="btn btn-default">Submit</button>
        </form>
      </div>
    </div>
  </div>
</body>
</html>