<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="/includes/taglibs.jsp" %>

<title>正在提交数据...</title>
<link href="<%=path%>/css/style1.css" rel="stylesheet" type="text/css" />
<%--  <jsp:include page="/payment/head.jsp"></jsp:include>   --%>

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
</html>