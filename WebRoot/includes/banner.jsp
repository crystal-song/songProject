<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 焦点图 -->
<div class="banner_bg">
    <div class="banner_fra">
    <c:if test="${bannerContext==''||bannerContext==null}">
     <ul class="ban_show">
   
          <li class="ban01 a1"><a href="http://ptobchina.com/guarantee/getTNewsById?id=42"></a></li>
          <li style="display:none" class="ban02"><a href="/security.jsp"></a></li>
          <li style="display:none" class="ban03"><a href="/zhuanti/201411guwen/first.jsp" target="_blank"></a></li>
     </ul> 
     </c:if>
     <c:if test="${bannerContext!=''}">
     ${bannerContext}
     </c:if>
     <ol>
       <li class="current"></li>
       <li></li>
       <li></li>
     </ol>
  <div class="ban_left" ></div>
  <div class="ban_right" ></div> 
  </div>
         
</div>

