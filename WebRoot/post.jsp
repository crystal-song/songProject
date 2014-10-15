<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
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
<div>
<h1>正在为您转至第三方支付平台，请稍后...</h1>
<h2><a href="javascript:;" onclick="onSubmit">立即跳转</a></h2>
</div>
  <div class="container" styly="display:none;">
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