<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ include file="/includes/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${product1.projectName}- 投资详情</title>
<link href="<%=path%>/css/style1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>

</head>

<body>
	<div id="wrap">
		<!-- header -->
		<%@ include file="/includes/manage_nav.jsp"%>
		<!-- header end -->
		<div class="cl"></div>
		<div class="content">
			<h2>查看投资详情：${product1.projectName}</h2>
			<div class="dataForm">
				<ul>
					<li>
						<dd>项目名称：</dd> <input type="text" value="${product1.projectName}"
						disabled="disabled" />
					</li>
					<li>
						<dd>企业编号：</dd> <input type="text"
						value="${product1.enterpriseNumber}" disabled="disabled" />
						<dt></dt>
					</li>

				</ul>
			</div>
			<table cellpadding="0" cellspacing="0" border="1" align="center"
				class="investmentList">
				<caption>投资记录</caption>
				<thead>
					<tr>
						<th align="center">订单号</th>
						<th align="center">投资人</th>
						<th align="center">投资金额</th>
						<th align="center">支付金额</th>
						<th align="center">投资券金额</th>
						<th align="center">交易时间</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${ not empty listonline}">
						<c:forEach var="s" items="${listonline}" varStatus="i">
							<tr>
								<td align="center">${s.requestNo}</td>
								<td align="center">${s.platformUserNo}</td>
								<td align="center">${s.paymentAmount+s.reward}</td>
								<td align="center">${s.paymentAmount}</td>
								<td align="center">${s.reward}</td>
								<td align="center">${s.transDate }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${ not empty listoffline}">
						<c:forEach var="s" items="${listonline}" varStatus="i">
							<tr>
								<td align="center"></td>
								<td align="center">${s.investor}</td>
								<td align="center">${s.investmentAmount}</td>
								<td align="center">${s.investmentAmount}</td>
								<td align="center"></td>
								<td align="center"></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
				</table>
				<div align="center">
					<a href="<%=path%>/Login/queryTransRecord?pageNo=1&id=${product1.id}">首页</a>
					<c:if test="${page.pageNo > 1}">
						<a href="<%=path %>/Login/queryTransRecord?pageNo=${page.pageNo-1}&id=${product1.id}">上一页</a>
					</c:if>
					<c:if test="${page.pageNo < page.totalPage}">
						<a href="<%=path %>/Login/queryTransRecord?pageNo=${page.pageNo+1}&id=${product1.id}">下一页</a>
					</c:if>
					<a href="<%=path %>/Login/queryTransRecord?pageNo=${page.totalPage}&id=${product1.id}">末页</a>
				</div>
				
		</div>
		<div class="cl"></div>
	</div>

</body>
</html>
