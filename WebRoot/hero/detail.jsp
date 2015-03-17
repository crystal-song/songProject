<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/includes/taglibs.jsp"%>

<title>项目详情 - 我的众筹 - 中租宝</title>
</head>
<body style="background: #f6f6f6">

	<!-- top start  -->
	<%@ include file="/includes/header.jsp"%>
	<!-- top end  -->
	<div class="clear"></div>
	<div id="campaign">
		<div class="zhong_msgcon">
			<div id="funding_area">
				<div class="center">
					<h2 class="campaign_title">
						<a>${hero.name}</a>
					</h2>
				</div>
				<div class="clearfix">
					<div id="image">
						<img src="${hero.main_image_file_name}" />
					</div>
					<div id="backing" >
						<ul>
							<li class="stats " id="backers">${hero.stats_number_of_contributions}
								<span>支持</span>
							</li>
							<li class="stats">${hero.fixed_payment_amount }<span>已支持
									${hero.goal_dollars }</span>
							</li>
							<li class="stats" id="days">${hero.datenum}${hero.datetype }
								<span style="width: 100px"> 后结束</span>
							</li>
						</ul>
						<div id='progress_bg' class='small'>
							<div id='progress' style="width:${hero.progress}%"></div>
						</div>
						<div class="clear"></div>
						<div class="reserve_back"></div>
						<div id="reserve_container">
							<div class="call_to_action_button">
									<a  class="blue_button" id="main_cta"
				href='${hero.status eq "1"?"/hero/buy?id=":"javascript:void(0)"}${hero.id}'>
				${hero.status=='1'?'我要支持':''}
				${hero.status=='2'?'已结束':''}
				${hero.status=='3'?'即将开启':''}</a>
								
							</div>
							<div class="call_to_action_description"></div>
						</div>
					</div>
				</div>
				<div class="share"></div>
			</div>
		</div>

	</div>
	<div class="zhong_con">
		<div class="hei_con" id="content">${hero.main_content}</div>
		<div class="hei_right" id="sidebar">
			<div class="rewards_sidebar ${empty rewards ?"hide":"" }">
				<h3>支持</h3>
				<ul>
					<c:forEach var="s" items="${rewards}" varStatus="i">
						<li id="rewards_click">
						
						<a class="rev_mon"
							href='${hero.status eq "1"?"/hero/buy?":"javascript:void(0)"}reward=${s.id }&id=${hero.id}'>
			
								<p class="price_zhong">￥${s.price }</p>

								<p class="title_zhong" >支持￥${s.price }元</p>
								<p class="image_reward">
									<img src="${s.image_url }" />
								</p>
								<p class="description_zhong">${s.description }</p>
								<p class="rew_font">
									<strong>${s.delivery_price>0? "配送费用："+s.delivery_price:"免运费" }</strong>
								</p>
								<p class="delivery_zhong">预计回报发送时间: ${s.delivery_date }</p>
								<p class="claimed_zhong">
									已有<label style="color: #ff665f">${s.back_number }</label>人支持
								</p>
						</a></li>

					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
		<div class="rew_btn" style="margin-top: 20px;">
			<a
				href='${hero.status eq "1"?"/hero/buy?id=":"javascript:void(0)"}${hero.id}'>
				${hero.status=='1'?'我要支持':''}
				${hero.status=='2'?'已结束':''}
				${hero.status=='3'?'即将开启':''}</a>
				
				
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
<script>	head_index = 3;</script>
<script type="text/javascript" src="/static/js/zhongzubao.js?va=4"></script>
<script type="text/javascript">
var indexs=0;

$(document).ready(function(e){
    var isScroll=false;

	$(".u_left_sec:eq(0) li:eq(0)").children("a").css("color","#fc652e");
	$(".nav_big a").eq(3).addClass("bd_btom").siblings().removeClass("bd_btom");
	$(".nav_big a").eq(3).children("p").addClass("headwd_color");
	
	
	$(".dizhi div").click(function(){
		$(this).css("background","url(/img/images-2014-11/kuang.png)  no-repeat");
		$(this).siblings().css("background","url(/img/images-2014-11/kuang1.png)  no-repeat");
	})
	
});
 
</script>

