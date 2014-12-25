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
    <script>
        function loan(id){
            $.ajax({url:"/Login/loanProduct?id="+id,
                type:"GET",
                success: function(data){
                    if(data.success === true){
                        alert("放款成功");
                        location.reload();
                    }else{
                        alert("放款失败");
                    }
                }});
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
    <td>是否放款</td>
    <td>项目管理</td>
  </tr>
   <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
  <tr>
   <!--  <td><img width="50" /></td> -->
    <td><a href="<%=path%>/product/getProductByid?id=${s.id}"  target="_blank" title="点击进入项目前台页面">${s.projectName}</a></td>
    <td>${s.financingMoney}万</td>
    <td>${s.financingProgress}%</td>
    <td>${s.yearIncome}</td>
    <td> ${ s.loaned?"已放款":"未放款"}
     </td>

    <td>
    <p>
    <a href="<%=path%>/Login/updateProduct?id=${s.id}">修改</a>
     <a href="javascript:void(0)" onclick="loan(${s.id})">放款</a>
    <a href="<%=path%>/Login/getProductByid?id=${s.id}">添加记录</a>
    <a href="javascript:if(confirm('确实要删除该内容吗?'))location='<%=path%>/Login/deleteproduct?id=${s.id}'">删除</a>
    <a href="<%=path%>/Login/addyield?id=${s.id}">收益率</a>
    </p>
    </td>
  </tr>
  </c:forEach>
      
        </c:if>

</table>

    </div>
  </div>
  <div class="cl"></div>
</div>
</body>
</html>
