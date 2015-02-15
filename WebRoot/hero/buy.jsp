<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/includes/taglibs.jsp"%>

<title>支付 - 我的众筹 - 中租宝</title>

</head>
<body style="background: #f6f6f6">
	<div class="black_bac"></div>
	<!-- top start  -->
	<%@ include file="/includes/header.jsp"%>
	<!-- top end  -->
	<div class="clear"></div>
	
		<div class="juancon">
			
			<div class="juantitle">
				${hero.name } 
			
			
					

			</div>
			<div class="juan_con_left">
		
				<div class="jcon_fir" style='display:${rewardid!=null?"none":""}'>
					<div class="fir_title">请输入金额</div>
					<div class="j_input">
					<form action="/gate/dobuy" id="form" method="POST" target="_blank">
						<input type="hidden" value="${hero.name }" name="name">
				<input type="hidden" value="${hero.id }" name="heroid"> <input
					type="hidden" value="${reward.price }" name="rewardamount" id="rewardamount">
				
				<input
					type="hidden" value="${rewardid}" name="rewardid" id="rewardid">
					 <input
					type="hidden" value="" name="addressid" id="addressid"> 
					<input
					type="hidden" value="${reward.delivery_price}"
					name="delivery_price" id="delivery_price">
						<input type="text" id="amount" name="amount" class="j_input_hide">
						</form>
					</div>

				</div>
				<div class="jcon_sec" style="height: 140px;">
					<div class="fir_title">请选择你的支持</div>
					<input type="radio" class="j_radio01" name="radio1"> <span
						class="j_wen01">无私捐赠</span> <a class="rechose">重新选择</a>
				</div>
				<c:forEach var="s" items="${rewards}" varStatus="i">
					<div class=" jcon_sec">
						<input type="radio" ${rewardid == s.id?"checked='checked'":"" } class="j_radio02" name="radio1"  price="${s.price }" deli v="${s.id }" delivery_price="${s.delivery_price }"/> <span
							class="j_wen01">￥${s.price}</span> <span class="j_wen01 j_msg">
							<dl>
								<dt>支持￥${s.price }元</dt>
							
								<dd style="height: 100px">${s.description }</dd>
								<dd>
									预计回报发送时间：<strong>${s.delivery_date }</strong>
								</dd>
							</dl>
						</span> <a class="rechose">重新选择</a>
					</div>
				</c:forEach>

				<div class="fir_title">
					收货地址
					<div class="tianjia">添加地址</div>
				</div>
		
					<div class="xinzeng">
						<div class="son_dizhi">添加收货地址</div>
						<div class="dizhi_fir">
						<span>省/直辖市<strong>*</strong></span><input
								type="text" id="province" />
							<span>城市/区<strong>*</strong></span><input type="text" id="city" />
						</div>
						<div class="dizhi_fir" style="height: 115px;">
							<span>详细地址<strong>*</strong></span>
							<textarea id="detail"></textarea>
						</div>
						<div class="dizhi_fir">
							<span>邮编<strong>*</strong></span><input type="text"  id="code"/>
						</div>
						<div class="dizhi_fir">
							<span>收货人姓名<strong>*</strong></span><input id="name" type="text" />
						</div>
						<div class="dizhi_fir">
							<span>电话号码<strong>*</strong></span><input type="text" id="phone" />
						</div>
						<a class="zhifu">确认添加</a>
					</div>

					<p class="son_dizhi">我的收货地址：</p>
					<div class="dizhi">
						<c:forEach var="a" items="${address}" varStatus="i">
							<div v="${a.id }">
								<p style="margin-top: 26px;">${a.province }${a.city }（${a.name }收）</p>
								<p>${a.detail }</p>
								<p>${a.phone }</p>
							</div>
						</c:forEach>

					</div>
					<button type="submit" name="submibtn" id="mysubmit_btn"
						onclick="onSubmit('${f.onSubmit}')" style="margin-left: 348px">支付</button>
			
			</div>
			<div class="juan_con_right">${hero.checkout_sidebar_content}</div>
			<div id="dialog01" style="display: none; height: 210px;">
				<div class="dialog_title">
					<strong>温馨提示</strong>
					<div class="right_cha"></div>
				</div>
				<div class="touzi_text">
					<p
						style="background: url('../img/images-2014-11/renzheng01.png') 26px 7px no-repeat">
						如果您支付成功：<a href="/prolist.jsp">查看我的众筹项目</a>
					</p>
				</div>
				<div class="touzi_text">
					<p
						style="background: url('../img/images-2014-11/renzheng02.png') 26px 7px no-repeat">
						如果您支付失败：<a href="/juanzeng1.jsp">重新支付</a> | <a href="/contact.jsp">联系客服</a>
					</p>
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

</body>
</html>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	function onSubmit(host) {
		if($("#addressid").val()===""){
			alert("请选择一个地址");
			return;
		}
		if($("#rewardid").val()==="" && $("#amount") ==""){
			alert("请选择一个支持或者");
			return ;
		}	
			
		document.getElementById("mysubmit_btn").disabled = true;
		document.getElementById("mysubmit_btn").innerHTML = "正在提交...";
		var form = document.getElementById("form");
		$("#dialog01").css("display", "block");
		$(".black_bac").css("display", "block");
		form.submit();

	}
	var navIndex = 2;
	var indexs = 0;
	$(document)
			.ready(
					function(e) {
						$(".u_left_sec:eq(0) li:eq(0)").children("a").css(
								"color", "#fc652e");
						$(".nav_big a").eq(3).addClass("bd_btom").siblings()
								.removeClass("bd_btom");
						$(".nav_big a").eq(3).children("p").addClass(
								"headwd_color");

						$(".dizhi div")
								.click(
										function() {
											$("#addressid").val($(this).attr("v"));
											$(this)
													.css("background",
															"url(/img/images-2014-11/kuang.png)  no-repeat");
											$(this)
													.siblings()
													.css("background",
															"url(/img/images-2014-11/kuang1.png)  no-repeat");
											
										})
						$(".j_radio02").click (
								function() {
									$("#rewardid").val($(this).attr("v"));
									$("#rewardamount").val($(this).attr("price"));
									$("#delivery_price").val($(this).attr("delivery_price"));
									$(this).parent().siblings(".jcon_sec").css(
											"display", "none");
									$(this).siblings(".rechose").css("display",
											"block")
								});
						$(".j_radio01").click (
								function() {
									$("#rewardid").val("");
									$("#rewardamount").val("");
									$("#delivery_price").val("");
									$(".jcon_fir").show();
									$(this).parent().siblings(".jcon_sec").css(
											"display", "none");
									$(this).siblings(".rechose").css("display",
											"block")
								});
						
						$(".rechose").click(
								function() {
									$(this).parent().siblings(".jcon_sec").css(
											"display", "block");
									$(this).css("display", "none")

								});
						$(".tianjia").click(function() {
							$(".xinzeng").slideToggle()
						});
						$(".zhifu").click(function(){
							if($("#province").val() == "" ||  $("#city").val() =="" || $("#name").val() == "" ||
									$("#detail").val() == "" ||
									$("#code").val() == "" ||
									$("#phone").val() == "" ){
								alert("请填写所有信息");
								return false;
							}
							$.ajax("/hero/add/address",
									{"data":{province: $("#province").val(),
										    city: $("#city").val(),
										    name: $("#name").val(),
										    detail: $("#detail").val(),
										    code: $("#code").val(),
										    phone: $("#phone").val()},
								    "type": "POST"
								    }).done(function(data){
								    	if (data==="login"){
								    		alert("请登录");
								    		return false;
								    	}
								    	location.reload();
								    	});
						});
						$(".checkok").click(function() {
							$("#dialog01").css("display", "block");
							$(".black_bac").css("display", "block");
						});
					});
</script>

