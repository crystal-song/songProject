<%@ page language="java"  pageEncoding="UTF-8"%>
            <div class="cr_bg" style="height:260px;">
            	<div class="cr_tit">
                	<div class="cr_font">投资份额</div>
                    <div class="cr_more"><img src="<%=path%>/images/sy_50.jpg"></div>
                </div>
                <div class="cr_nr">
                	<div class="fen"><span>可投资金额</span><strong><span>50,000.00</span></strong><i>元</i></div>
                	<div class="fen"><span>转让的进度</span><div class="fen_loadbar"><div class="fen_redbar"></div></div><span class="fen_bai">50%</span></div>
                	<div class="neirong" style="display:none"></div>
                	<div class="jin_input"><input type="text" class="jin_text" value="请输入资金" id="input"></input>元</div>
                	<div class="jin_input"><a id="touzi_dialog"><strong>立即投资</strong></a><a class="jisuan" style="display:none"></a></div>
                </div>
            </div>
            <div class="clear_height"></div>
            <div class="cr_bg">
            	<div class="cr_tit">
                	<div class="cr_font">网站公告</div>
                    <div class="cr_more"><a href="<%=path%>/guarantee/getNewslist?channel=网站公告"><img src="<%=path%>/images/sy_50.jpg"></a></div>
                </div>
                <div class="cr_nr">
                	<ul>
                	 <c:if test="${ not empty list2}">
        <c:forEach var="s" items="${list2}" varStatus="i">
                    	<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
                    	 </c:forEach>
						</c:if>
						</ul>
                </div>
            </div>
		<%-- <div class="clear_height"></div>
            <div class="cr_bg">
            	<div class="cr_tit">
                	<div class="cr_font">项目到期公告</div>
                    <div class="cr_more"><a href="<%=path%>/guarantee/getNewslist?channel=新闻报道"><img src="<%=path%>/images/sy_50.jpg"></a></div>
                </div>
                <div class="cr_nr">
                	<ul>
                	 <c:if test="${ not empty list1}">
        <c:forEach var="s" items="${list1}" varStatus="i">
                    	<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
                    	 </c:forEach>
						</c:if>
						</ul>
                </div>
            </div> --%>
		<div class="clear_height"></div>
            <div class="cr_bg">
            	<div class="cr_tit">
                	<div class="cr_font">还款公告</div>
                    <div class="cr_more"><a href="<%=path%>/guarantee/getNewslist?channel=还款公告"><img src="<%=path%>/images/sy_50.jpg"></a></div>
                </div>
                <div class="cr_nr">
                	<ul>
                	 <c:if test="${ not empty list3}">
        <c:forEach var="s" items="${list3}" varStatus="i">
                    	<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
                    	 </c:forEach>
						</c:if>
						</ul>
                </div>
            </div>
		<div class="clear_height"></div>
            <div class="cr_bg">
            	<div class="cr_tit">
                	<div class="cr_font">媒体报道</div>
                    <div class="cr_more"><a href="<%=path%>/guarantee/getNewslist?channel=新闻报道"><img src="<%=path%>/images/sy_50.jpg"></a></div>
                </div>
                <div class="cr_nr">
                	<ul>
                	 <c:if test="${ not empty list1}">
        <c:forEach var="s" items="${list1}" varStatus="i">
                    	<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
                    	 </c:forEach>
						</c:if>
						</ul>
                </div>
            </div>
