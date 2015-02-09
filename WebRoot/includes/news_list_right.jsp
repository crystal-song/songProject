<%@ page language="java"  pageEncoding="UTF-8"%>
  
 
 <div class="left_title"><strong>网站公告</strong></div>
      <ul>
        <c:if test="${ not empty list2}">
        <c:forEach var="s" items="${list2}" varStatus="i">
                    	<li><a href="/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
                    	 </c:forEach>
						</c:if>
      </ul>
      <div class="left_title"><strong>还款公告</strong></div>
      <ul>
        <c:if test="${ not empty list3}">
        <c:forEach var="s" items="${list3}" varStatus="i">
                    	<li><a href="/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
                    	 </c:forEach>
						</c:if>
      </ul>
      <div class="left_title"><strong>新闻报道</strong></div>
      <ul>
        <c:if test="${ not empty list1}">
        <c:forEach var="s" items="${list1}" varStatus="i">
                    	<li><a href="/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
                    	 </c:forEach>
						</c:if>
      </ul>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 