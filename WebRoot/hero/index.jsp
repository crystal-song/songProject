<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/includes/taglibs.jsp"%>

<title>我的众筹 - 中租宝</title>

</head>
<body>

	<!-- top start  -->
	<%@ include file="/includes/header.jsp"%>
	<!-- top end  -->
	<div class="content01">
		<div class="z_list_title">
			<a class='${status=="0"?"z_title_bac":"" }' href="/hero/all">所有项目</a>
			<a class='${status=="1"?"z_title_bac":"" }' href="/hero/all?status=1">众筹中</a>
			<a class='${status=="2"?"z_title_bac":"" }' href="/hero/all?status=2">已筹满</a>
			<a class='${status=="3"?"z_title_bac":"" }' href="/hero/all?status=3">即将开启</a>
		</div>
		<div class="crowd_con">
			<c:forEach var="s" items="${heros.list}" varStatus="i">
				<div class="crowd_list">
					<div class="crowd_pic">
						<a href="/hero/get-by-id?id=${s.id}"><img
							src="${s.main_image_file_name}" /></a>
					</div>
					<div class="crowdpro_name">
						名称：<a href="/zhongchou_msg.jsp">${s.name}</a>
					</div>
					<div class="crowd_bar">
						<div style="width:${s.progress}%"></div>
					</div>
					<div class="crowd_wd">
						<div class="crow_left">
							<span>${s.stats_number_of_contributions} </span> <span>支持者</span>
						</div>
						<div class="crow_right">
							<span>${s.datenum}</span> <span>${s.datetype}后结束</span>
						</div>
					</div>
				</div>
			</c:forEach>


			<div class="clear"></div>
			<div class='next_list ${heros.pagecount >1?"":"hide" }'>
				<a href="/hero/all?status=${status }">首页</a>
				<c:if test=""></c:if>
				<c:if test="${heros.page > 1}">
					<a href="/hero/all?pageNo=${heros.page-1}&status=${status }"">上一页</a>
				</c:if>
				<div class="pageNum">
					<c:forEach var="i" begin="1" end="${heros.pagecount }">
						<a href="/hero/all?status=${status}&pageNo=${i }"
							class='pager ${i== heros.page?"pageNumCur":""}'>${i }</a>
					</c:forEach>

				</div>
				<c:if test="${heros.page < heros.pagecount}">
					<a href="/hero/all?pageNo=${heros.page+1}&status=${status }">下一页</a>
				</c:if>
				<a href="/hero/all?pageNo=${heros.pagecount}&status=${status }">末页</a>
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

<script type="text/javascript">

	$(document).ready(
			function() {

				$(".u_left_sec:eq(0) li:eq(5)").children("a").css("color",
						"#fc652e");
				$(".nav_big a").eq(3).addClass("bd_btom").siblings()
						.removeClass("bd_btom");
				$(".nav_big a").eq(3).children("p").addClass("headwd_color");

				$(".right_cha").click(function() {
					$(".newye").css("display", "none")
					window.location.reload(true);
				})
				$(".diabtn").click(function() {
					alert("aa")
					$(".newye").css("display", "none")
					window.location.reload(true);
				})

			});
</script>



