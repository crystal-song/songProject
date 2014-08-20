<%@ page language="java"  pageEncoding="UTF-8"%>
            
            <div class="cr_bg">
            	<div class="cr_tit">
                	<div class="cr_font">网站公告</div>
                    <div class="cr_more"><a href="<%=path%>/guarantee/getNewslist?channel=新闻报道"><img src="<%=path%>/images/sy_50.jpg"></a></div>
                </div>
                <div class="cr_nr">
                	<ul>
                	 <c:if test="${ not empty list1}">
        <c:forEach var="s" items="${list1}" varStatus="i">
                    	<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
                    	 </c:forEach>
						</c:if>
                </div>
            </div>
		<div class="clear_height"></div>
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
                </div>
            </div>
		<div class="clear_height"></div>
            <div class="cr_bg">
            	<div class="cr_tit">
                	<div class="cr_font">项目还款公告</div>
                    <div class="cr_more"><a href="<%=path%>/guarantee/getNewslist?channel=新闻报道"><img src="<%=path%>/images/sy_50.jpg"></a></div>
                </div>
                <div class="cr_nr">
                	<ul>
                	 <c:if test="${ not empty list1}">
        <c:forEach var="s" items="${list1}" varStatus="i">
                    	<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
                    	 </c:forEach>
						</c:if>
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
                </div>
            </div>
