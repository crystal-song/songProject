<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%@ include file="/includes/taglibs.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>文章管理</title>
<link href="<%=path%>/css/style1.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript" >


function query(){
	/* alert("ccccccccccc"); */
	     /* $('#chanel').val(); */
	     $('#id').val($('#chanel').val());
	
	     $('#form').submit();

}

 
    

</script>
</head>

<body>
<div id="wrap">
<!-- header -->
 <%@ include file="/includes/manage_nav.jsp" %> 
 <!-- header end -->
    <div class="cl"></div>
  <div class="content">
  	<h2>文章管理</h2>
    <div class="dataSearch">
    	<dd>请选择频道：</dd>
        <select name="chanel" id="chanel" >
          <option value="0">全部</option>
           <c:if test="${ not empty list1}">
        <c:forEach var="s" items="${list1}" varStatus="i">
          <option value="${s.id}">${s.name}</option>
          </c:forEach>
  
        </c:if>
         <!--  <option value="2">还款公告</option> -->
        </select>
        <form  action="<%=path%>/Login/getNewsbychannel" id="form" method="post"     >
        <input type="hidden"   name="id" id="id"  value="" />
        <input type="button"  onclick="query()"  class="submitBtn" value="提交"  />
        </form>  
    </div>
    <div class="dataList cl">
    	<table width="100%" border="0" cellpadding="5" cellspacing="1">
  <tr>
    <td>标题图片</td>
    <td>文章标题</td>
    <td>所属频道</td>
    <td>是否置顶</td>
    <td>发布时间</td>
    <td>项目管理</td>
  </tr>
  <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
  <tr>
    <td><img width="50" /></td>
    <td>${s.title}</td>
    <td>${s.channel}</td> 
    <td><c:if test="${s.state==1}">是</c:if></td><%-- <a href="javascript:if(confirm('确实要删除该内容吗?'))location='<%=path%>/Login/deleteNewsbyId?id=${s.id}'">删除</a> --%>
    <td>${s.time}</td>
    <td><p><a href="<%=path%>/Login/updateNewsbyId?id=${s.id}">修改</a><a href="javascript:if(confirm('确实要删除该内容吗?'))location='<%=path%>/Login/deleteNewsbyId?id=${s.id}'">删除</a></p></td>
  </tr>
   </c:forEach>
   
        </c:if>
  <!-- <tr>
    <td><img width="50" /></td>
    <td>光耀东方 投资项目</td>
    <td>新闻报道</td>
    <td>是</td>
    <td>2014-8-4 14:32:35</td>
    <td><a href="#">修改</a></td>
  </tr>
  <tr>
    <td><img width="50" /></td>
    <td>光耀东方 投资项目</td>
    <td>还款公告</td>
    <td>否</td>
    <td>2014-8-4 14:32:35</td>
    <td><a href="#">修改</a></td>
  </tr>
  <tr>
    <td><img width="50" /></td>
    <td>光耀东方 投资项目</td>
    <td>3000万</td>
    <td>否</td>
    <td>2014-8-4 14:32:35</td>
    <td><a href="#">修改</a></td>
  </tr>
  <tr>
    <td><img width="50" /></td>
    <td>光耀东方 投资项目</td>
    <td>3000万</td>
    <td>&nbsp;</td>
    <td>2014-8-4 14:32:35</td>
    <td><a href="#">修改</a></td>
  </tr> -->
</table>

    </div>
 <!-- <h2>频道管理</h2>
<div class="dataSearch">
    	<dd>请输新的频道名称：</dd>
        <input type="search" />
        <input type="submit" class="submitBtn" value="添加新频道" />
    </div>
<div class="dataList cl">
    	<table width="100%" border="0" cellpadding="5" cellspacing="1">
  <tr>
    <td>频道ID</td>
    <td>频道名称</td>
    <td>创建时间</td>
    <td>项目管理</td>
  </tr>
  <tr>
    <td>0</td>
    <td>网站公告</td>
    <td>2014-8-4 14:32:35</td>
    <td><p><a href="#">修改</a><a href="#">删除</a></p></td>
  </tr>
  <tr>
    <td>1</td>
    <td>新闻报道</td>
    <td>2014-8-4 14:32:35</td>
    <td><p><a href="#">修改</a><a href="#">删除</a></p></td>
  </tr>
  <tr>
    <td>2</td>
    <td>返还公告</td>
    <td>2014-8-4 14:32:35</td>
    <td><p><a href="#">修改</a><a href="#">删除</a></p></td>
  </tr>
  <tr>
    <td>5</td>
    <td>关于我们</td>
    <td>2014-8-4 14:32:35</td>
    <td><p><a href="#">修改</a><a href="#">删除</a></p></td>
  </tr>
  <tr>
    <td>6</td>
    <td>帮助中心</td>
    <td>2014-8-4 14:32:35</td>
    <td><a href="#">修改</a></td>
  </tr>
</table> -->

   <!--  </div> -->
  </div>
  <div class="cl"></div>
</div>
</body>
</html>
