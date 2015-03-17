<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mftour.spring.service.IUserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/includes/taglibs.jsp" %> 
<title>我的地址 - 我的账户 - 中租宝</title>
<script type="text/javascript" src="/js/sms.js" ></script>
<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="user_con">
    <div class="user_left">
      <!-- user_left start -->
         <%@ include file="/includes/user_info_left.jsp"、
         
          %>
      <!-- user_left end -->
    </div>
    <div class="user_right">
      <div class="zichan_con checkheight">
         <div class="pro_con_title" style="margin-top: 5px; background:url(/img/images-2014-11/red_line_big.png) 104px 12px no-repeat;">
                <strong>收货地址管理</strong>
         </div>
    <div class="fir_title">
			 <input
					type="hidden" value="" name="addressid" id="addressid"> 
					<div class="tianjia">添加地址</div>
						<a id="del" href="javascript:void(0)">删除收货地址</a>
				</div>
		
					<div class="xinzeng">
						
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
    </div>
    <!-- absolute_right start -->
	     <%@ include file="/includes/absolute.jsp" %>
	<!-- absolute_right end -->
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>

<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script> 
<script>	head_index = 2;</script>
<script type="text/javascript" src="/static/js/zhongzubao.js?va=4"></script>

<script type="text/javascript">
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
												"url(/img/images-2014-11/kuang.jpg)  no-repeat");
								$(this)
										.siblings()
										.css("background",
												"url(/img/images-2014-11/kuang1.jpg)  no-repeat");
								
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
			$("#del").click(function(){
				
				$.ajax("/hero/del/address",
						{"data":{id: $("#addressid").val()},
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
