<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%-- <%@ include file="/includes/taglibs.jsp" %>  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户中心页面</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
 <%-- <jsp:include page="/payment/head.jsp"></jsp:include>   --%>
<%-- <script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  --%> 
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
<div class="one"></div>
<div class="clear_height"></div>
<div class="msg_con">
       

   <div class="msg_right">
       <div class="msg_main" id="msg_new">
           <div class="msg_title">
             <h2>易宝注册</h2>
           </div>        
   <div class="user_con01">                 
      <div class="container">
        <form id="form" role="form" action="<%=path%>/gate/doRegister" method="post" target="_blank">
          <input type="hidden" id="host" name="host"/>
          <div class="form-group">
            <label for="platformNo">platformNo</label>
            <input type="text"class="form-control" id="platformNo" 
                   name="platformNo" value="10040011137" />
          </div>
          <div class="form-group">
            <label for="requestNo">requestNo</label><input type="text"
              class="form-control" id="requestNo" name="requestNo" value="${now}" />
          </div>
          <div class="form-group">
            <label for="platformUserNo">platformUserNo</label><input
              type="text" class="form-control" id="platformUserNo"
              name="platformUserNo"  value="${now}"  />
          </div>
          <div class="form-group">
            <label for="nickName">nickName</label><input type="text"
              class="form-control" id="nickName" name="nickName" value="新用户" />
          </div>
          <div class="form-group">
            <label for="realName">realName</label><input type="text"
              class="form-control" id="realName" name="realName" value="张三" />
          </div>
          <div class="form-group">
            <label for="idCardType">idCardType</label><input type="text"
              class="form-control" id="idCardType" name="idCardType" value="G2_IDCARD" />
          </div>
          <div class="form-group">
            <label for="idCardNo">idCardNo</label><input type="text"
              class="form-control" id="idCardNo" name="idCardNo" value="10040011137" />
          </div>
          <div class="form-group">
            <label for="mobile">mobile</label><input type="text"
              class="form-control" id="mobile" name="mobile" value="${user.phone}" />
          </div>
          <div class="form-group">
            <label for="email">email</label><input type="text"
              class="form-control" id="email" name="email" value="${user.email}" />
          </div>
          <div class="form-group">
            <label for="notifyUrl">notifyUrl</label><input type="text"
              class="form-control" id="notifyUrl" name="notifyUrl" value="${host}${context}/gate/exam" />
          </div>
          <div class="form-group">
            <label for="callbackUrl">callbackUrl</label><input
              type="text" class="form-control" id="callbackUrl"
              name="callbackUrl" value="http://192.168.1.207:8080/spring3/gate/exam" />
          </div>
          <button onclick="onSubmit('http://qa.yeepay.com/member')" class="btn-default">OA</button>
          <button onclick="onSubmit('https://member.yeepay.com/member')" class="bt">生产</button>
        </form>
     </div>  
       </div>
   </div>    
</div>
</div>

<div class="clear"></div>
<div class="one"></div>
<div class="clear"></div>


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