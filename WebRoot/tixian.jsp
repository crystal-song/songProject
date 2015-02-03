<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%@ include file="/includes/taglibs.jsp" %> 

<title>提现 - 我的账户 - 中租宝</title>

</head>

<body>
	<div class="black_bac"></div>
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
					<strong>我的银行卡</strong>
				</div>

				<div class="add_postcar"
					style='${yeepay.cardStatus==null?"display:none":""}' height:auto;">
					<p></p>
					<ul class="postcar_msg">
						<li><span>开户行名称：</span>
							<div class="bank_name">${yeepay.bank}</div></li>
						<li><span>银行卡账号：</span>
							<div>${yeepay.cardNo}</div>
							<div class=" ${yeepay.cardStatus == "VERIFIED"?"ren_status":"ren_status01"}" style="margin: 0; padding-left: 20px;">${yeepay.cardStatus == "VERIFIED"?"已认证":"认证中"}</div></li>

					</ul>
				</div>
				<div class="tips_tixian">				
				<div class="tishi ai  ${yeepay.cardStatus == "VERIFIED"?"hide":""}" style="margin-top: 50px;">
					<p>
						<strong>温馨提示</strong>
					</p>
					<ol>
						<li class="tishi_red">绑定银行卡预计需要1-2个工作日，请您耐心等候。在此期间，您无法进行提现操作。</li>						
					</ol>
				</div>
				
				</div>
				<form id="form-card" role="form"
					style='${yeepay.cardStatus==null?"":"display:none"}'
					action="<%=path%>/gate/dobinding" method="post" target="_blank">
					<input type="hidden" class="form-control" id="platformUserNo"
						name="platformUserNo" value="${name}" /> <input type="hidden"
						class="form-control" id="notifyUrl" name="notifyUrl"
						value="${f.notifyUrl}/gate/bindingNotify" /> <input type="hidden"
						class="form-control" id="callbackUrl" name="callbackUrl"
						value="${f.callbackUrl}/gate/bindingSucceed" />
					<button type="submit"
						class="btn btn-default mar_btn">绑定银行卡</button>
				</form>
			</div>

		</div>
		<div class="user_right" style="${yeepay.cardStatus == "VERIFIED" ?"":"display:none"}">
			<div class="zichan_con">
				<div class="pro_con_title" style="margin-top: 5px;">
					<strong>提现</strong>
				</div>
				<div class="form-group" style="margin-top: 50px; dislplay: none">
					<label for="plat">可提现金金额</label>

					<%--  <div class="form-control ame" style="width:300px; text-align:left;"><strong class="wd_org">${account.availableMoney}</strong>元</div> --%>
					<div class="form-control ame"
						style="width: 300px; text-align: left;">
						<strong class="wd_org">100</strong>元
					</div>
				</div>
				<form id="form" role="form" action="<%=path%>/gate/dodrawMoney"
					method="post" target="_blank">
					<input type="hidden" class="form-control" id="feeMode"
						name="feeMode" value="${feeMode}" /> <input type="hidden"
						class="form-control" id="platformUserNo" name="platformUserNo"
						value="${name}" />
					<div class="form-group">
						<label for="amount">提现金额</label><input type="text"
							class="form-control tixian_money" id="amount" name="amount"
							value="提现金额不能为0" style="color: #ccc" />
					</div>
					<input type="hidden" class="form-control" id="notifyUrl"
						name="notifyUrl" value="${f.notifyUrl}/gate/drawMoneyNotify" /> <input
						type="hidden" class="form-control" id="callbackUrl"
						name="callbackUrl" value="${f.callbackUrl}/gate/drawMoneySucceed" />


					<div class="mar_que_top">
						<button type="submit" onclick="onSubmit('${f.onSubmit}')" class="btn mar_btn"
							id="mysubmit_btn" style="color: #fff;">确认</button>
					</div>
				</form>

				<div class="tishi ai" style="margin-top: 50px;">
					<p>
						<strong>温馨提示</strong>
					</p>
					<ol>
						<li class="tishi_red">您充值的资金在24小时内不允许提现。</li>
						<li class="tishi_red">您充值的资金若未投资就提现，第三方支付公司会收取您提现金额的0.5%作为转账费用。</li>
						<li>您的账户资金将由第三方平台托管。</li>
						<li>在您首次“提现”之前，请先绑定银行卡;</li>
						<li>银行卡审核需要1-2个工作日，请您耐心等待。您可以在本页查看到银行卡的审核状态；</li>
						<li>当您的银行卡状态变为“已审核”时，方可进行提现操作。</li>
						<li>中租宝严禁信用卡充值、套现等行为，一经发现将予以处罚，包括但不限于：限制收款、冻结账户、永久停止服务，
							并会影响银行征信记录。</li>
						<li>提现过程遇到问题，请联系客服，010-84243099/3199</li>
					</ol>
				</div>
				<div id="dialog01" style="display: none; height: 210px;">
					<div class="dialog_title">
						<strong>温馨提示</strong>
						<div class="right_cha"></div>
					</div>
					<div class="touzi_text">
						<p
							style="background: url('../img/images-2014-11/renzheng01.png') 26px 7px no-repeat">
							如果您成功提现：<a href="<%=path%>/gate/service">查看我的资产</a>
						</p>
					</div>
					<div class="touzi_text">
						<p
							style="background: url('../img/images-2014-11/renzheng02.png') 26px 7px no-repeat">
							如果您提现失败：<a href="<%=path%>/gate/drawMoney">重新提现</a> | <a
								href="<%=path%>/contact.jsp">联系客服</a>
						</p>
					</div>
				</div>
				<div id="dialog01" style="display: none; height: 210px;"
					class="newye">
					<div class="dialog_title">
						<strong>温馨提示</strong>
						<div class="right_cha"></div>
					</div>
					<div class="touzi_text">
						<p
							style="background: url('../img/images-2014-11/renzheng02.png') 26px 7px no-repeat"
							class="p_font">充值金额不能为0,请重新充值!</p>
					</div>
					<div class="touzi_text" style="display: block">
						<p>
							<a href="<%=path%>/gate/recharge">去充值</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
								href="<%=path%>/gate/service">查看我的资产</a>
						</p>
					</div>
					<a class="diabtn">确定</a>
				</div>
			</div>
		</div>
	</div>
	<!-- absolute_right start -->
	<%@ include file="/includes/absolute.jsp"%>
	<!-- absolute_right end -->
	<div class="clear"></div>
	<!-- footer start -->
	<%@ include file="/includes/footer.jsp"%>
	<!-- footer end -->
	<div class="black_bac"></div>
</body>
</html>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript">

function onSubmit(host) {
	if(!checkval()){return false}
	  var form = document.getElementById("form");
	  

	    	var tixian_val=parseInt($(".tixian_money").val());
		    var old_amount=parseInt($(".wd_org").text());

	    	if(tixian_val=="提现金额不能为0" || tixian_val==""){
	    		//alert("您输入的金额为空,请重新输入");	 
	    		$(".newye").css("display","block")
	    	    $(".black_bac").css("display","block");
	    		$(".p_font").text("提现金额不能为空，请重新输入！")
	    	}    	
	    	 if(tixian_val>old_amount){
	    		//alert("您提现的金额不能超出可提现金额");
	    		$(".newye").css("display","block")
	    	    $(".black_bac").css("display","block");
	    		$(".p_font").text("您提现的金额不能超出可提现金额！")
	    		return false;	    		
	    	}else{
	    		  $("#dialog01").css("display","block");
	    		  $(".black_bac").css("display","block");
	    		  document.getElementById("mysubmit_btn").innerHTML="正在提交...";
	    		  form.submit();
	    		  document.getElementById("mysubmit_btn").disabled=true;
	    	}		
}

function checkval(){
	if($(".tixian_money").val()==0||$(".tixian_money").val()=="提现金额不能为0"||$(".tixian_money").val()==""){
		//alert("提现金额不能为空!!");
		$(".newye").css("display","block")
	    $(".black_bac").css("display","block");
		$(".p_font").text("提现金额不能为空，请重新输入！")
		
		return false;
		}
	return true;
}
    var navIndex=3; 
    var indexs=1;
    $(document).ready(function(){
    	
    	$(".u_left_sec:eq(1) li:eq(2)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");   
    	$(".nav_big a").eq(2).children("p").addClass("headwd_color");
    	$(".tixian_money").focus(function(){ 
    		var tixian_val=$(".tixian_money").val();
    		if(tixian_val=="提现金额不能为0");
    		  $(".tixian_money").val("");
    		  $(this).css("color","#000")

    		
    	});
   	 $(".right_cha").click(function(){
		 $(".newye").css("display","none")
		 window.location.reload(true);		
	 }) 
	 $(".diabtn").click(function(){
		 $(".newye").css("display","none")
		 window.location.reload(true);
	 }) 
    	$(".right_cha").click(function(){		  
    		 window.location.reload(true);  		  
    	});
    /*各银行名称转换*/
        var bankname=$(".bank_name").text();
	    
	    if(bankname=="BOCO"){
	    	$(".bank_name").text("交通银行")
	    }
	    if(bankname=="CEB"){
	    	$(".bank_name").text("光大银行")
	    }
	    if(bankname=="SPDB"){
	    	$(".bank_name").text("上海浦东发展银行")
	    }
	    if(bankname=="ABC"){
	    	$(".bank_name").text("农业银行")
	    }
	    if(bankname=="ECITIC"){
	    	$(".bank_name").text("中信银行")
	    }
	    if(bankname=="PAB"){
	    	$(".bank_name").text("平安银行")
	    }
	    if(bankname=="CCB"){
	    	$(".bank_name").text("建设银行")
	    }
	    if(bankname=="CMBC"){
	    	$(".bank_name").text("民生银行")
	    }
	    if(bankname=="SDB"){
	    	$(".bank_name").text("深圳发展银行")
	    }
	    if(bankname=="POST"){
	    	$(".bank_name").text("中国邮政储蓄")
	    }
	    if(bankname=="CMBCHIHA"){
	    	$(".bank_name").text("招商银行")
	    }
	    if(bankname=="CIB"){
	    	$(".bank_name").text("兴业银行")
	    }
	    if(bankname=="ICBC"){
	    	$(".bank_name").text("中国工商银行")
	    }
	    if(bankname=="BOC"){
	    	$(".bank_name").text("中国银行")
	    }
	    if(bankname=="BCCB"){
	    	$(".bank_name").text("北京银行")
	    }
	    if(bankname=="GDB"){
	    	$(".bank_name").text("广发银行")
	    }
	    if(bankname=="HXB"){
	    	$(".bank_name").text("华夏银行")
	    }
	    if(bankname=="XACB"){
	    	$(".bank_name").text("西安市商业银行")
	    }
	    if(bankname=="SHB"){
	    	$(".bank_name").text("上海银行")
	    }
	    if(bankname=="TJCB"){
	    	$(".bank_name").text("天津市商业银行")
	    }
	    if(bankname=="TYCB"){
	    	$(".bank_name").text("太原市商业银行")
	    }
	    if(bankname=="GZCB"){
	    	$(".bank_name").text("广州市商业银行")
	    }
	    if(bankname=="SNXS"){
	    	$(".bank_name").text("深圳农村商业银行")
	    }
	    if(bankname=="SHRCB"){
	    	$(".bank_name").text("上海农商银行")
	    }
	    if(bankname=="BJRCB"){
	    	$(".bank_name").text("北京农商银行")
	    }
	    if(bankname=="CDCB"){
	    	$(".bank_name").text("成都市商业银行")
	    }
	    if(bankname=="HZCB"){
	    	$(".bank_name").text("杭州市商业银行")
	    }
	    if(bankname=="NOBC"){
	    	$(".bank_name").text("南洋商业银行")
	    }
	    if(bankname=="KLB"){
	    	$(".bank_name").text("昆仑银行")
	    }
	    if(bankname=="ZZYH"){
	    	$(".bank_name").text("郑州银行")
	    }
	    if(bankname=="WZYH"){
	    	$(".bank_name").text("温州银行")
	    }
	    if(bankname=="HKYH"){
	    	$(".bank_name").text("汉口银行")
	    }
	    if(bankname=="QLYH"){
	    	$(".bank_name").text("齐鲁银行")
	    }
	    if(bankname=="DDYH"){
	    	$(".bank_name").text("丹东银行")
	    }
	    if(bankname=="HBC"){
	    	$(".bank_name").text("恒生银行")
	    }
	    if(bankname=="NJCB"){
	    	$(".bank_name").text("南京银行")
	    }
	    if(bankname=="XMYH"){
	    	$(".bank_name").text("厦门银行")
	    }
	    if(bankname=="NCYH"){
	    	$(".bank_name").text("南昌银行")
	    }
	    if(bankname=="DONGGUANBC"){
	    	$(".bank_name").text("东莞银行")
	    }
	    if(bankname=="JSBCCHINA"){
	    	$(".bank_name").text("江苏银行")
	    }
	    if(bankname=="HKBEA"){
	    	$(".bank_name").text("东亚银行(中国)")
	    }
	    if(bankname=="AYYH"){
	    	$(".bank_name").text("安阳银行")
	    }
	    if(bankname=="CDYH"){
	    	$(".bank_name").text("成都银行")
	    }
	    if(bankname=="NBB"){
	    	$(".bank_name").text("宁波银行")
	    }
	    if(bankname=="BSCB"){
	    	$(".bank_name").text("长沙银行")
	    }
	    if(bankname=="HBYH"){
	    	$(".bank_name").text("河北银行")
	    }
	    if(bankname=="NYFZYH"){
	    	$(".bank_name").text("农业发展银行")
	    }
	    if(bankname=="GZYH"){
	    	$(".bank_name").text("广州银行")
	    }
});

</script>
