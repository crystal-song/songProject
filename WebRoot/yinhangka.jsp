<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp"%>

<title>绑定银行卡 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
</head>

<body>
	<!-- top start  -->
	<%@ include file="/includes/header.jsp"%>
	<!-- top end  -->

	<div class="user_con">
		<div class="user_left">
			<!-- user_left start -->
			<%@ include file="/includes/user_info_left.jsp"%>
			<!-- user_left end -->
		</div>
		<div class="user_right">
			<div class="zichan_con">
				<div class="pro_con_title" style="margin-top: 5px;">
					<strong>绑定银行卡</strong>
				</div>

				<div class="add_postcar" style="display: none; height: 330px;">
					<p>银行卡信息</p>
					<ul class="postcar_msg">
						<li><span>开户行名称：</span>
						<div>工商银行</div></li>
						<li><span>银行卡账号：</span>
						<div>12345678</div></li>
						<li><span>银行卡状态：</span>
						<div>绑定中..</div></li>
					</ul>
					<div class="postcar_btn">
						<a href="#" class="postcar_btn_red">添加银行卡</a>
						<!-- <a href="#" style="background:#ff6a00; color:#fff" onclick="onSubmit('https://member.yeepay.com/member')" >解除绑定</a> -->
					</div>
				</div>

				<div class="clear_height" style="height: 40px;"></div>
				<form id="form" role="form" action="<%=path%>/gate/dobinding"
					method="post" target="_blank">
					<input type="hidden" id="host" name="host">
					<div class="form-group" style="display: none">
						<!--   <label for="platformNo">platformNo</label><input type="text"
		              class="form-control" id="platformNo" name="platformNo" value="10040011137" />  -->
						<input type="text" class="form-control" id="platformNo"
							name="platformNo" value="${f.platformNo}" />
						<!--  name="platformNo" value="10012415118" />  -->
					</div>
					<div class="form-group" style="display: none">
						<label for="requestNo">requestNo</label><input type="text"
							class="form-control" id="requestNo" name="requestNo"
							value="${now}" />
					</div>
					<div class="form-group" style="display: none">
						<label for="platformUserNo">platformUserNo</label><input
							type="text" class="form-control" id="platformUserNo"
							name="platformUserNo" value="${name}" />
					</div>
					<div class="form-group" style="display: none">
						<label for="notifyUrl">notifyUrl</label><input type="text"
							class="form-control" id="notifyUrl" name="notifyUrl"
							value="${f.notifyUrl}/gate/bindingNotify" />
					</div>
					<div class="form-group" style="display: none">
						<label for="callbackUrl">callbackUrl</label><input type="text"
							class="form-control" id="callbackUrl" name="callbackUrl"
							value="${f.callbackUrl}/gate/bindingSucceed" />
					</div>
					<!--  <button onclick="onSubmit('http://qa.yeepay.com/member')" class="btn btn-default" style="display:none">QA</button> -->
					<button onclick="onSubmit('${f.onSubmit}')"
						class="btn btn-default mar_btn">绑定银行卡</button>
				</form>
			</div>

		</div>
	</div>
	</div>
<!-- absolute_right start -->
	<%@ include file="/includes/absolute.jsp" %>
<!-- absolute_right end -->	
	<div class="clear"></div>
<!-- footer start -->
	<%@ include file="/includes/footer.jsp"%>
<!-- footer end -->
</body>
<script type="text/javascript">
var navIndex=3; 
var indexs=1;
    $(document).ready(function(){
    	$(".u_left_sec:eq(1) li:eq(3)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".nav_big a").eq(2).children("p").addClass("headwd_color");
});
    
    function onSubmit(host) {
    	  document.getElementById("host").value = host;
    	  var form = document.getElementById("form");
    	  form.submit();
    	}
        
</script>
</html>