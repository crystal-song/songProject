<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ include file="/includes/taglibs.jsp"%>
<title>我要投资 - 中租宝</title>

</head>

<body>
	<%@ include file="/includes/header.jsp"%>
	<!-- top end  -->

	<div class="clear"></div>

	<div id="bodyframe" style="VISIBILITY: hidden">
		<!-- <IFRAME frameBorder=1 id=heads src="framepage.htm" style="HEIGHT: 200px; LEFT: 220px; POSITION: absolute; TOP: 200px; WIDTH: 500px"> -->

		<form action="<%=path%>/product/allProduct" id="form" method="post"
			class="box" style="display: 'none'">
			<input type="hidden" name="pageNo" id="pageNo" value="${pageNo}" />
			<input type="hidden" name="yearIncome" id="yearIncome"
				value="${product.yearIncome}" /> <input type="hidden"
				name="financingMoney" id="financingMoney"
				value="${product.financingMoney}" /> <input type="hidden"
				name="financingPeriod" id="financingPeriod"
				value="${product.financingPeriod}" /> <input type="hidden"
				name="financingProgress" id="financingProgress"
				value="${product.financingProgress}" /> <input type="hidden"
				name="projectStatus" id="projectStatus"
				value="${product.projectStatus}" /> <input type="hidden"
				class="now" id="now" value="${now}"> <input name="imgbtn"
				id="imgbtn" type="submit" value="查询" />
			<!--  <button id="update" ></button> -->

		</form>
		<!--  </IFRAME> -->
	</div>
	<input type="hidden" name="page.pageNo" id="pageNo" value="1" />

	<div class="tou_con">
		<div class="con_left">
			<!-- con_left -->
			<%@ include file="/includes/news_list_right.jsp"%>
			<!-- con_left end-->
			<div class="guanggao" style="display: none"></div>
		</div>
		<div class="con_right">
			<div class="right_lable">
				<ul>
					<li class="right_lable_red"><a
						href="<%=path%>/product/allProduct">全部项目</a></li>
					<li style="display: none"><a
						href="<%=path%>/product/allProduct?projectStatus=2">融资中</a></li>
					<li style="display: none">已成功</li>
					<li style="display: none">按条件查找</li>
				</ul>
				<select class="deal_sort" style="display: none">
					<option selected="selected">默认排序</option>
					<option selected="selected">最新上线</option>
					<option>最高目标金额</option>
					<option>最多支持人数</option>
					<option>最多支持金额</option>
				</select>
			</div>
			<div class="select_sort">
				<ul>
					<li>期限 <select class="sec_style">
							<option selected="selected">默认排序</option>
							<option selected="selected">最新上线</option>
							<option>最高目标金额</option>
							<option>最多支持人数</option>
							<option>最多支持金额</option>
					</select>
					</li>
					<li>年化利率 <select class="sec_style">
							<option selected="selected">默认排序</option>
							<option selected="selected">最新上线</option>
							<option>最高目标金额</option>
							<option>最多支持人数</option>
							<option>最多支持金额</option>
					</select>
					</li>
					<li>金额 <select class="sec_style">
							<option selected="selected">默认排序</option>
							<option selected="selected">最新上线</option>
							<option>最高目标金额</option>
							<option>最多支持人数</option>
							<option>最多支持金额</option>
					</select>
					</li>
					<li>投标完成度 <select class="sec_style">
							<option selected="selected">默认排序</option>
							<option selected="selected">最新上线</option>
							<option>最高目标金额</option>
							<option>最多支持人数</option>
							<option>最多支持金额</option>
					</select>
					</li>
					<li><input type="submit" value="查找" /></li>
				</ul>
			</div>
			<div class="touzi_cont">
				<div class="con_list">
					<ul>
						<c:if test="${ not empty list}">
							<c:forEach var="s" items="${list}" varStatus="i">
								<li><input type="hidden" class="open_time"
									id="start_time_${s.id}" value="${s.financeTime}">
									<div class="floor_num01">
										<a class="floor_img01" href="getProductByid?id=${s.id}">${s.projectPicture}
											<div class="hot"></div> <!--  <div class="last_time01">剩余时间:<strong>&nbsp;&nbsp;28</strong>天</div>-->
											<div class="last_time01">
												距离开放购买还有： <span id="t_d_${s.id}"></span> <span
													id="t_h_${s.id}"></span> <span id="t_m_${s.id}"></span> <span
													id="t_s_${s.id}"></span>
											</div>
										</a> <a class="shuoming01" href="getProductByid?id=${s.id}"
											title="${s.projectName}">${s.projectName}</a>
										<div class="aim01">
											<span style="color: #a4a4a4;">目标：</span> <span>${s.financingPeriod}天</span>
											<%-- //${s.projectStatus==1?'预热中':s.projectStatus==2?'融资中':s.projectStatus==3?'已满标':s.projectStatus==4?'还款中':'已完成' } --%>
											<span style="width: 60px; margin-right: 0">￥&nbsp;${s.financingMoney}万元</span>
											<a class="pro_status">${s.projectStatus==1?'预热中':s.projectStatus==2?'融资中':s.projectStatus==3?'已满标':s.projectStatus==4?'还款中':'已完成' }</a>
										</div>
										<div class="loding_bar">
											<div class="l_b"
												style="width:<c:if test='${empty s.financingProgress}'>0</c:if><c:if test='${not empty s.financingProgress}'><fmt:formatNumber value="${s.financingProgress*100<100?s.financingProgress==null?0:s.financingProgress*100:100}" pattern="#.##"/></c:if>%"
												title="融资进度：<fmt:formatNumber value="${s.financingProgress*100<100?s.financingProgress==null?0:s.financingProgress*100:100}" pattern="#.##"/>%"></div>
										</div>
										<div class="floor_bottom01">
											<c:if test="${s.projectStatus!=1 }">
												<span style="float: left; margin-left: 3%;"><a
													class="baifenbi01" style="float: left; text-align: left;"><c:if
															test='${empty s.financingProgress}'>0</c:if><fmt:formatNumber value="${s.financingProgress*100}" pattern="#.##"/> %</a>
													<a style="float: left; color: #a4a4a4;">已达</a></span>
											</c:if>
											<c:if test="${s.projectStatus==1 }">
												<span style="float: left; margin-left: 3%;"><a
													class="baifenbi01" style="float: left; text-align: left;"><fmt:formatDate
															value="${s.financeTime}" pattern="yyyy-MM-dd" /></a> <a
													style="float: left; color: #a4a4a4;">融资时间</a></span>
											</c:if>
											<span style="display: none"><a class="baifenbi01"
												style="width: 80px; float: left; text-align: left;">￥&nbsp;&nbsp;<c:if
														test='${empty s.realityMoney}'>0</c:if> ${s.realityMoney}
											</a><a style="color: #a4a4a4; text-align: left; float: left;">已筹资</a>
											</span> <span style="float: right; margin-right: 3%;"><a
												class="baifenbi01" style="float: right; text-align: right;">${s.yearIncome}%</a>
												<a style="float: right; color: #a4a4a4;">年化收益率</a></span>
										</div>
										<div class="botm_btn01">
											<c:if test="${s.projectStatus==2 }">
												<a href="getProductByid?id=${s.id}">我要投</a>
											</c:if>
											<a href="getProductByid?id=${s.id}" class="btn_org">了解详情</a>
										</div>
									</div></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<div class="clear"></div>
				<div class="next_list">
					<a href="javascript:jumpPage(1)">首页</a>
					<c:if test=""></c:if>
					<c:if test="${page.pageNo > 1}">
						<a href="javascript:jumpPage(${page.pageNo-1})">上一页</a>
					</c:if>
					<div class="pageNum"></div>
					<c:if test="${page.pageNo < page.totalPage}">
						<a href="javascript:jumpPage(${page.pageNo+1})">下一页</a>
					</c:if>
					<a href="javascript:jumpPage(${page.totalPage})">末页</a>
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
<script type="text/javascript">
 var head_index=1; 
</script>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/zhongzubao.js?v=1"></script>
<script type="text/javascript">
 var myFilter=new Array();
  function jumpPage(pag){
  
	$('#pageNo').val(pag); 	    	    
	$("#yearIncome").val(myFilter[0]);
	$("#financingPeriod").val(myFilter[1]);
	$("#financingMoney").val(myFilter[2]);
	$("#financingProgress").val(myFilter[3]);
	$("#projectStatus").val(myFilter[4]);    
	 $("#form" ).submit(); 
 }  
	

window.onload=function(e) {
	//pagerInit(11,3);//${page.totalPage},${page.pageNo}
	pagerInit(${page.totalPage},${page.pageNo});
}
   
function pagerInit(a,b){//${page.totalPage},${page.pageNo}
	var totalPages=a;
	var curPage=b;
	if(curPage>totalPages)return false;
	var endPage=curPage+5>totalPages-1?totalPages-1:curPage+5;
	var startPage=endPage-7>2?endPage-7:2;
	endPage=startPage+7>totalPages?totalPages:startPage+7;
	//console.log(startPage+"/"+endPage+"/"+curPage);
	var str='';
	var spl='<span>...</span>';
	$(".pageNum").html('<a href="javascript:jumpPage(1)" class="pager">1</a>');
	if(startPage>2){$(".pageNum").html($(".pageNum").html()+spl);}
      for(i=startPage;i<endPage;i++){
    	  str='<a href="javascript:jumpPage('+i+')" class="pager">'+i+'</a>';
    	  $(".pageNum").html($(".pageNum").html()+str);
		}
      if(endPage<totalPages-1){$(".pageNum").html($(".pageNum").html()+spl);}
    if(totalPages>1)$(".pageNum").html($(".pageNum").html()+'<a href="javascript:jumpPage('+totalPages+')" class="pager">'+totalPages+'</a>');
    $(".pager").eq(curPage-startPage+1).addClass("pageNumCur");
	$(".pageNumCur").attr("href","javascript:;");	

   
}                
          
</script>


