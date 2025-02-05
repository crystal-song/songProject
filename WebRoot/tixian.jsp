<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


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
				
				<form id="form-card" role="form"
					style='${yeepay.cardStatus==null?"":"display:none"}'
					action="/gate/dobinding" method="post" target="_blank">
					<input type="hidden" class="form-control" id="platformUserNo"
						name="platformUserNo" value="${name}" /> <input type="hidden"
						class="form-control" id="notifyUrl" name="notifyUrl"
						value="${f.notifyUrl}/gate/bindingNotify" /> <input type="hidden"
						class="form-control" id="callbackUrl" name="callbackUrl"
						value="${f.callbackUrl}/gate/bindingSucceed" />
					<button type="submit"
						class="btn btn-default mar_btn">绑定银行卡</button>
				</form>
				<div class="tips_tixian">				
				<div class="tishi ai  ${yeepay.cardStatus == "VERIFIED"?"hide":""}" style="margin-top: 50px;">
					<p>
						<strong>温馨提示</strong>
					</p>
					<ol>
					    <li>在您首次“提现”之前，请先绑定银行卡;</li>
						<li>银行卡审核需要1-2个工作日，请您耐心等待。您可以在本页查看到银行卡的审核状态；</li>
						<li>当您的银行卡状态变为“已审核”时，方可进行提现操作。</li>						
					</ol>
				</div>
				
				</div>
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
						<strong class="wd_org">${account.availableMoney }</strong>元
					</div>
				</div>
				<form id="form" role="form" action="/gate/dodrawMoney"
					method="post" target="_blank">
					<input type="hidden" class="form-control" id="feeMode"
						name="feeMode" value="${feeMode}" /> <input type="hidden"
						class="form-control" id="platformUserNo" name="platformUserNo"
						value="${name}" />
					<div class="form-group">
						<label for="amount">提现金额</label><input type="text"
							class="form-control tixian_money" id="amount" name="amount"
							value="提现金额不能为0" style="color: #ccc" />
							<span class="liquan_y"></span>
					</div>
					<input type="hidden" class="form-control" id="notifyUrl"
						name="notifyUrl" value="${f.notifyUrl}/gate/drawMoneyNotify" /> <input
						type="hidden" class="form-control" id="callbackUrl"
						name="callbackUrl" value="${f.callbackUrl}/gate/drawMoneySucceed" />


					<div class="mar_que_top">
						<input type="submit" class="btn mar_btn"
							id="mysubmit_btn" style="color: #fff;" >确认</button>
					</div>
				</form>

				<div class="tishi ai" style="margin-top: 50px;">
					<p>
						<strong>温馨提示</strong>
					</p>
					<ol>
					
						<li class="tishi_red">最低可提现金金额为100元。</li>
						<li class="tishi_red">您充值的资金在24小时内不允许提现。</li>
						<li class="tishi_red">您充值的资金若未投资就提现，第三方支付公司会收取您提现金额的0.5%作为转账费用。</li>
						<li>您的账户资金将由第三方平台托管。</li>						
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
						<p style="background: url('../img/images-2014-11/renzheng01.png') 26px 7px no-repeat">
							如果您成功提现：<a href="/gate/service">查看我的资产</a>
						</p>
					</div>
					<div class="touzi_text">
						<p
							style="background: url('../img/images-2014-11/renzheng02.png') 26px 7px no-repeat">
							如果您提现失败：<a href="/gate/drawMoney">重新提现</a> | <a
								href="/contact.jsp">联系客服</a>
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
							<a href="/gate/recharge">去充值</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
								href="/gate/service">查看我的资产</a>
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
<script type="text/javascript">
 var head_index=5; 
</script>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="/static/js/zhongzubao.js?va=4"></script>
<script type="text/javascript">
$("#mysubmit_btn").click(function(){
	 $("#mysubmit_btn").attr("disabled");
	
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
		    	}
		    	 if(tixian_val<100){
			    		//alert("您提现的金额不能超出可提现金额");
			    		$(".newye").css("display","block")
			    	    $(".black_bac").css("display","block");
			    		$(".p_font").text("提现金额不能小于100元！")
			    		return false;	    		
			    	}
		    
		    		  $("#dialog01").css("display","block");
		    		  $(".black_bac").css("display","block");
		    		  document.getElementById("mysubmit_btn").value="正在提交...";
		    		  $("#mysubmit_btn").removeAttr("disabled");
		    		  form.submit();
});



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
   	 
   	 var bankKey={
   			 "BOCO":"交通银行",
   			 "CEB":"光大银行",
   			 "SPDB":"上海浦东发展银行",
   			 "ABC":"农业银行",
   			 "PAB":"平安银行",
   			 "CCB":"建设银行",
   			 "CMBC":"民生银行",
   			 "SDB":"深圳发展银行",
   			 "POST":"中国邮政储蓄",
   			 "CMBCHIHA":"招商银行",
   			 "CIB":"兴业银行",
   			 "ICBC":"中国工商银行",
   			 "BOC":"中国银行",
   			 "BCCB":"北京银行",
   			 "GDB":"广发银行",
   			 "HXB":"华夏银行",
   			 "XACB":"西安市商业银行",
   			 "SHB":"上海银行",
   			 "TJCB":"天津市商业银行",
   			 "TYCB":"太原市商业银行",
   			 "GZCB":"广州市商业银行",
   			 "SNXS":"深圳农村商业银行",
   			 "SHRCB":"上海农商银行",
   			 "BJRCB":"北京农商银行",
   			 "CDCB":"成都市商业银行",
   			 "HZCB":"杭州市商业银行",
   			 "NOBC":"南洋商业银行",
   			 "KLB":"昆仑银行",
   			 "ZZYH":"郑州银行",
   			 "WZYH":"温州银行",
   			 "QLYH":"齐鲁银行",
   			 "DDYH":"丹东银行",
   			 "HBC":"恒生银行",
   			 "NJCB":"南京银行",
   			 "XMYH":"厦门银行",
   			 "DONGGUANBC":"东莞银行",
   			 "JSBCCHINA":"江苏银行",
   			 "HKBEA":"东亚银行(中国)",
   			 "AYYH":"安阳银行",
   			 "CDYH":"成都银行",
   			 "NBB":"宁波银行",
   			 "BSCB":"长沙银行",
   			 "HBYH":"河北银行",
   			 "NYFZYH":"农业发展银行",
   			 "GZYH":"广州银行"  			 
   	 }
     var bankname=$(".bank_name").text();
   	 $(".bank_name").text(bankKey[bankname])
   	
});

</script>
