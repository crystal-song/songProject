<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="/includes/taglibs.jsp"%>
<title>我的项目 - 我的账户 - 中租宝</title>

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
					<strong>我的项目</strong>
				</div>
				<div class="con_list">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="project_list">
						<thead>
							<tr>
								<td align="center" height="40">项目名称</td>
								<td align="center">投资金额</td>
								<td align="center">投资时间</td>
								<td align="center">投资周期</td>
								<td align="center">预期收益</td>
								<td align="center">投资协议</td>
							</tr>
						</thead>
						<tbody>
							<c:if test="${ not empty li}">
								<c:forEach var="s" items="${li}" varStatus="i">
									<tr>


										<td align="center" height="30">${s.projectName}</td>
										<td align="center"><fmt:formatNumber type="number"
												value="${s.paymentAmount + s.reward}" maxFractionDigits="2" />元</td>
										<td align="center">${fn:substring(s.transDate,0,10)}</td>
										<td align="center">${s.financingPeriod}天</td>
										<td align="center"><fmt:formatNumber type="number"
											value="${s.interest}"
												maxFractionDigits="2" />元</td>
										<td align="center"><a
											href="<%=path%>/gate/authorization?platformUserNo=${s.platformUserNo}&enterpriseNumber=${s.enterpriseNumber}&transDate=${s.transDate}"
											title="查看投资协议" style="text-decoration: underline;">点击查看</a></td>


									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="clear"></div>
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
<script type="text/javascript">
 var head_index=2; 
</script>
<script type="text/javascript" src="<%=path%>/static/js/zhongzubao.js?va=4"></script>
<script type="text/javascript">
	var indexs = 2;
	$(document).ready(
			function() {

				$(".u_left_sec:eq(2) li:eq(2)").children("a").css("color",
						"#fc652e");

			});
</script>
