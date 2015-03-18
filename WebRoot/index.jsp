<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp"%>
<title>中租宝 | 最稳健的企业债理财平台</title>
</head>
<body>

	<!-- top start  -->
	<input type="hidden" class="now" id="now" value="${now}">
	<%@ include file="/includes/header.jsp"%>
	<!-- top end  -->
	<div class="clear"></div>

	<!-- banner start -->
	<%@ include file="/includes/banner.jsp"%>
	<!-- banner end  -->


	<div class="content">
		<div class="title">
			<div class="label">
				<strong>热门项目</strong>
			</div>
		</div>
		<div class="shuju">
			<c:if test="${t!=null }">
				<div class="new_production">
					<c:if test="${t.hotPicture==null }">
						<a class="images_pro" href="product/getProductByid?id=56"><img
							width="100%" height="100%"
							src="<%=path%>/img/images-2014-11/shengxian03.jpg"></a>
					</c:if>
					<c:if test="${t.hotPicture!=null }">
						<a class="images_pro" href="product/getProductByid?id=${t.id }">${t.hotPicture }</a>
					</c:if>
					<div class="meier_wd">
						<h3>
							<a href="product/getProductByid?id=56" style="color: #ff453e">${t.projectName}</a>
						</h3>
						<ul class="mei_msg">
							<li><span>融资金额</span><span class="wd_size"><strong>${t.financingMoney}万元</strong></span></li>
							<li><span>年化收益</span><span class="wd_size"><strong
									class="wd_size_col">${t.yearIncome }%</strong></span></li>
							<li><span>项目状况</span><span class="wd_size"
								style="font-size: 12px;">${t.projectStatus==1?'预热中':t.projectStatus==2?'融资中':t.projectStatus==3?'已满标':t.projectStatus==4?'还款中':'已完成' }</span></li>
							<li><span>信用等级</span><span class="wd_size new_span"><img
									src="<%=path%>/img/images-2014-11/star_5.png"></span></li>
							<li><a href="product/getProductByid?id=${t.id }"
								class="touzi_mei">了解详情</a></li>
						</ul>
					</div>
				</div>
			</c:if>
			<div class="newpro_right">
				<dl>
					<dt>
						<strong></strong>
					</dt>
					<dd>
						<a class="newpro_wd01"></a> <span class="spanhign_right"> <a>灵活投资，低门槛
						</a> <a style="font-size: 12px;"><label style="color: red">200元起投</label>，操作灵活便捷</a>
						</span>
					</dd>
					<dd>
						<a class="newpro_wd02"></a> <span class="spanhign_right"> <a>五层保障</a>
							<a style="font-size: 12px;"><label style="color: red"></label>充足抵押物，第三方平台资金托管</a>
						</span>
					</dd>
					<dd>
						<a class="newpro_wd03"></a> <span class="spanhign_right"> <a>高收益率
						</a> <a style="font-size: 12px; line-height: 12px;">平均年化收益率<label
								style="color: red">12%</label>，最高<label style="color: red">14%</label>，<br />
								高于银行活期<label style="color: red">30倍</label>以上收益率
						</a>
						</span>
					</dd>
					<dd>
						<a class="newpro_wd04"></a><span class="spanhign_right"> <a>专注<label
								style="color: red">企业债</label></a> <a style="font-size: 12px;">精选优质企业，远超P2P安全保障。</a>
						</span>
					</dd>
				</dl>
			</div>
		</div>
		<div class="clear"></div>
		<div class="title">
			<div class="label">
				<strong>推荐项目</strong>
			</div>
			<a class="more" href="<%=path%>/product/allProduct">更多&nbsp;&nbsp;>></a>
		</div>
		<div class="main">
			<ul>
				<c:if test="${ not empty list}">
					<c:forEach var="s" items="${list}" varStatus="i">
						<li>
							<%-- //id="start_time_${s.id}" --%> <input type="hidden"
							class="open_time" id="start_time_${s.id}"
							value="${s.financeTime}">
							<div class="floor_num">
								<a class="floor_img" href="product/getProductByid?id=${s.id}">
									${s.projectPicture}
									<div class="hot"></div> <!-- <div class="last_time">剩余时间:<strong>&nbsp;&nbsp;28</strong>天</div> -->
									<div class="last_time">
										距离开放购买还有： <span id="t_d_${s.id}"></span> <span
											id="t_h_${s.id}"></span> <span id="t_m_${s.id}"></span> <span
											id="t_s_${s.id}"></span>
									</div>
								</a>
								<h3>
									<a class="shuoming" href="product/getProductByid?id=${s.id}"
										title="${s.projectName}">${s.projectName}</a>
								</h3>
								<div class="aim">
									<span style="color: #a4a4a4;" class="a1">目标:</span> <span>
										<%-- ${s.financingPeriod}个月 --%>30天
									</span> <span style="width: 90px;"><em>¥&nbsp;</em>${s.financingMoney}万元</span>
									<a class="pro_status">${s.projectStatus==1?'预热中':s.projectStatus==2?'融资中':s.projectStatus==3?'已满标':s.projectStatus==4?'还款中':'已完成' }</a>
								</div>
								<div class="loding_bar">
									<div class="l_b"
										style="width:<c:if test='${empty s.financingProgress}'>1</c:if><c:if test='${not empty s.financingProgress}'>${s.financingProgress<1?s.financingProgress==null?0:s.financingProgress*100:100}</c:if>%"
										title="融资进度：${s.financingProgress*100}%"></div>
								</div>
								<div class="floor_bottom">
									<c:if test="${s.projectStatus!=1 }">
										<span style="float: left; margin-left: 3%;"><a
											style="float: left; color: #a4a4a4;">已达</a><a
											class="baifenbi" style="float: left; text-align: left;"><c:if
													test='${empty s.financingProgress}'>0</c:if><fmt:formatNumber value="${s.financingProgress*100}" pattern="#.##"/>%</a>
										</span>
									</c:if>
									<c:if test="${s.projectStatus==1 }">
										<%-- <fmt:formatDate value="${s.financeTime}" pattern="yyyy-MM-dd" /> --%>
										<span style="float: left; margin-left: 3%;"><a
											style="float: left; color: #a4a4a4;">融资时间</a><a
											class="baifenbi" style="float: left; text-align: left;"><fmt:formatDate
													value="${s.financeTime}" pattern="yyyy-MM-dd" /></a> </span>
									</c:if>
									<span style="display: none"><a
										style="color: #a4a4a4; float: left;">已筹资</a><a
										class="baifenbi" style="float: left; text-align: left;">¥&nbsp;&nbsp;<c:if
												test='${empty s.realityMoney}'>0</c:if> ${s.realityMoney}
									</a> </span> <span style="float: right; margin-right: 3%;"><a
										style="float: right; color: #a4a4a4;">年化收益率</a><a
										class="baifenbi" style="float: right; text-align: right;">${s.yearIncome}%</a>
									</span>
								</div>
								<div class="botm_btn">
									<c:if test="${s.projectStatus==2 }">
										<a href="product/getProductByid?id=${s.id}">我要投</a>
									</c:if>
									<a href="product/getProductByid?id=${s.id}" class="btn_org">了解详情</a>
								</div>
							</div>
						</li>
					</c:forEach>
				</c:if>
			</ul>
		</div>
		<div class="title">
			<div class="label">
				<strong>最新动态</strong>
			</div>
		</div>
		<div class="news">
			<div class="w_gonggao">
				<ul class="news_title">
					<li class="news_title_bac"><a id="new_bac" class="new_title01">网站公告</a><a
						class="new_logo1" href="<%=path%>/guarantee/getchannel">更多 >></a></li>
				</ul>
				<div class="news_label">
					<ul class="news_con">
						<c:if test="${ not empty list2}">
							<c:forEach var="s" items="${list2}" varStatus="i">
								<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
			</div>
			<div class="w_gonggao">
				<ul class="news_title">
					<li class="news_title_bac"><a id="new_bac" class="new_title02">还款公告</a><a
						class="new_logo1" href="<%=path%>/guarantee/getchannel">更多 >></a></li>
				</ul>
				<div class="news_label">
					<ul class="news_con">
						<c:if test="${ not empty list3}">
							<c:forEach var="s" items="${list3}" varStatus="i">
								<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
			</div>
			<div class="w_gonggao" style="margin-right: 0">
				<ul class="news_title">
					<li class="news_title_bac"><a id="new_bac" class="new_title03">媒体报道
					</a><a class="new_logo1" href="<%=path%>/guarantee/getchannel">更多
							>></a></li>
				</ul>
				<div class="news_label">
					<ul class="news_con">
						<c:if test="${ not empty list1}">
							<c:forEach var="s" items="${list1}" varStatus="i">
								<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
							</c:forEach>
						</c:if>
					</ul>
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
</body>
</html>



