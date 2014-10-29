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
<title>管理PtoB项目</title>
<link href="<%=path%>/css/style1.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="wrap">
<!-- header -->
 <%@ include file="/includes/manage_nav.jsp" %> 
 <!-- header end -->
    <div class="cl"></div>
  <div class="content">
  	<h2>管理PtoB项目</h2>
    <div class="dataSearch">
    	<dd>请输入项目名称：</dd>
    	<form  action="<%=path%>/Login/queryproduct" id="form" method="post"    >
        <input type="text" name="projectName" id="projectName" />
        <input type="submit" class="submitBtn" />
        </form>
    </div>
    <div class="dataList cl">
    	<table width="100%" border="0" cellpadding="5" cellspacing="1">
  <tr>
   <!--  <td>项目图片</td> -->
    <td>项目名称</td>
    <td>融资金额</td>
    <td>融资进度</td>
    <td>年化收益率</td>
    <td>项目管理</td>
  </tr>
   <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
  <tr>
   <!--  <td><img width="50" /></td> -->
    <td>${s.projectName}</td>
    <td>${s.financingMoney}万</td>
    <td>${s.financingProgress}%</td>
    <td>${s.yearIncome}</td>

    <td><p><a href="<%=path%>/Login/updateProduct?id=${s.id}">修改</a><a href="<%=path%>/Login/getProductByid?id=${s.id}">添加记录</a><a href="javascript:if(confirm('确实要删除该内容吗?'))location='<%=path%>/Login/deleteproduct?id=${s.id}'">删除</a><a href="javascript:;">收益率</a></p></td>
  </tr>
  </c:forEach>
      
        </c:if>
  <!-- <tr>
    <td><img width="50" /></td>
    <td>光耀东方 投资项目</td>
    <td>3000万</td>
    <td>25%</td>
    <td>2014-8-4 14:32:35</td>
    <td><a href="#">修改</a></td>
  </tr>
  <tr>
    <td><img width="50" /></td>
    <td>光耀东方 投资项目</td>
    <td>3000万</td>
    <td>25%</td>
    <td>2014-8-4 14:32:35</td>
    <td><a href="#">修改</a></td>
  </tr>
  <tr>
    <td><img width="50" /></td>
    <td>光耀东方 投资项目</td>
    <td>3000万</td>
    <td>25%</td>
    <td>2014-8-4 14:32:35</td>
    <td><a href="#">修改</a></td>
  </tr>
  <tr>
    <td><img width="50" /></td>
    <td>光耀东方 投资项目</td>
    <td>3000万</td>
    <td>25%</td>
    <td>2014-8-4 14:32:35</td>
    <td><a href="#">修改</a></td>
  </tr> -->
</table>

    </div>
  </div>
  <div class="cl"></div>
</div>
</body>
</html>
