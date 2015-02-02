<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ include file="/includes/taglibs.jsp"%>

<title>注册易宝账户 - 用户中心 - 中租宝/></title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet"
	type="text/css" />
<%-- <jsp:include page="/payment/head.jsp"></jsp:include>   --%>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>

</head>

<body>
	<!-- top start  -->
	<%@ include file="/includes/header.jsp"%>
	<!-- top end  -->
	<div class="msg_con">


		<div class="msg_right">
			<div class="msg_main" id="msg_new">
				<div class="msg_title">
					<h2>注册第三方支付平台——易宝</h2>
				</div>
				<div class="user_con01">
					<div class="container">
						<form id="form" role="form" action="<%=path%>/gate/doRegister"
							method="post" style="padding: 0px;" target="_blank">
							<input type="hidden" id="host" name="host" />

							<div class="form-group" style="display: none; height: 0px;">
								<label for="platformUserNo">platformUserNo</label><input
									type="text" class="form-control" id="platformUserNo"
									name="platformUserNo" value="${user.name}" />
							</div>
							<div class="form-group" style="display: none; height: 0px;">
								<label for="nickName"> 用户名：</label><input type="text"
									class="form-control" id="nickName" name="nickName"
									value="${user.name}" />
							</div>
							<div class="form-group">
								<label for="realName">真实姓名：</label><input type="text"
									class="form-control" id="realName" name="realName" value="" />
							</div>
							<div class="form-group" style="display: none; height: 0px;">
								<label for="idCardType">idCardType</label><input type="text"
									class="form-control" id="idCardType" name="idCardType"
									value="G2_IDCARD" />
							</div>
							<div class="form-group">
								<label for="idCardNo"> 身份证：</label><input type="text"
									class="form-control" id="idCardNo" name="idCardNo" value="" />
							</div>
							<div class="form-group">
								<label for="mobile"> 手机号：</label><input type="text"
									class="form-control" id="mobile" name="mobile" value="" />
							</div>
							<div class="form-group" style="display: none; height: 0px;">
								<label for="email">电子邮箱：</label><input type="text"
									class="form-control" id="email" name="email"
									value="${user.email}" />
							</div>
							<div class="form-group" style="display: none; height: 0px;">
								<label for="notifyUrl">notifyUrl</label><input type="text"
									class="form-control" id="notifyUrl" name="notifyUrl"
									value="${f.notifyUrl}/gate/registerNotify" />
							</div>
							<div class="form-group" style="display: none; height: 0px;">
								<label for="callbackUrl">callbackUrl</label><input type="text"
									class="form-control" id="callbackUrl" name="callbackUrl"
									value="${f.callbackUrl}/gate/exam" />
								<!--  name="callbackUrl" value="http://www.ptobchina.com/spring3/gate/exam"   /> -->


							</div>

							<div class="jin_input" style="padding-left: 200px;">
								<input type="submit" name="submibtn" id="mysubmit_btn" value="立即注册" onclick="onSubmit('${f.onSubmit}')" style="margin-left:348px"></input>
							</div>
							<!--  <button onclick="onSubmit('http://qa.yeepay.com/member')" class="btn-default">OA</button> -->
							<!-- <button onclick="onSubmit('https://member.yeepay.com/member')" class="bt">生产</button> -->


						</form>
						<div class="clear"></div>
						<div class="user_bottom" style="width: auto;">
							<h3>温馨提示:</h3>
							<ol>
								<li>在您进行任何充值操作之前，请先注册易宝支付账号，以便您能正常充值。</li>
								<li>根据国家有关规定，中租宝将所有资金委托第三方支付平台“易宝支付”进行管理。</li>
								<li>为保证交易的规范化，您在进行充值、投资等行为前需要同步注册“易宝支付”账户。</li>
								<li>为确保您交易的安全性，请您如实填写以上信息！</li>
							</ol>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="clear"></div>
	<!-- footer start -->
	<%@ include file="/includes/footer.jsp"%>
	<!-- footer end -->
</body>

<script type="text/javascript">
	function allcheck(){
		var chkNickName=document.getElementById("nickName").value;
		if(chkNickName==""){alert("用户昵称不能为空！");return false}
		var chkRealName=document.getElementById("realName").value;
		if(chkRealName==""){alert("真实姓名不能为空！");return false}
		var chkIdCardNo=document.getElementById("idCardNo").value;
		var regId = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
	   if(regId.test(chkIdCardNo) == false)  
	   {  
		   alert("身份证输入不合法！");  
		   return  false;  
	   } 
	   //var regMobile=/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/;
	   var chkMobile=document.getElementById("mobile").value;
	   //if(regMobile.test(chkMobile)){
		  if(chkMobile==""){
		   alert("手机号输入不合法！");  
		   return  false;  
		   }
	return true;
	}
   function onSubmit() {
	  if(!allcheck()){return false};
	  var form = document.getElementById("form");
	  document.getElementById("mysubmit_btn").disabled=true;
	  document.getElementById("mysubmit_btn").innerHTML="正在提交...";
	  form.submit();
	}
</script>

<script type="text/javascript">
    var navIndex=3;          

</script>
</html>