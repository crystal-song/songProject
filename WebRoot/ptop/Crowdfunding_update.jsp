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
<title>${product1.projectName} - 更新支持详情</title>
<link href="<%=path%>/css/style1.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="wrap">
<!-- header -->
 <%@ include file="/includes/manage_nav.jsp" %> 
 <!-- header end -->
    <div class="cl"></div>
  <div class="content">
  	<h2>更新支持详情：${product1.projectName}</h2>
    	<div class="dataForm">
        	<ul>
                <li>
                    <dd>项目名称：</dd>
                    <input type="text"  value="${product1.projectName}" disabled="disabled" />
                    <dt>1111</dt>
                </li>
                <li>
                    <dd>项目编号：</dd>
                    <input type="text"  value="${product1.enterpriseNumber}"    disabled="disabled" />
                    <dt></dt>
                </li>
                <li>
                    <dd>项目图片：</dd>
                    
                  <dt><img alt="项目图片预览" width="250" height="158" /><br />尺寸：250*158</dt>
                </li>
                <li>
                    <dd>筹集金额：</dd>
                  <input type="number"   value="${product1.financingMoney}"   min="0" value="0" disabled="disabled" />
                    <dt></dt>
                </li>
                <li>
                    <dd>回报日期：</dd>
                    <input type="date"  value="${product1.repaymentTime}"       disabled="disabled" />
                    <dt></dt>
                </li>
                <li>
                    <dd>发布时间：</dd>
                    <input type="date"  disabled="disabled" />
                    <dt></dt>
                </li>
            </ul>
   	  </div>
   	  <div>按支持项筛选：<select name="1">
   	  				<option>全部</option>
                  <option>支持项1</option>
                  
                </select>
       </div>
        <table cellpadding="0" cellspacing="0" border="1" align="center" class="investmentList">
        <caption>支持明细</caption>
        <thead>
        	<tr>
        	<th align="center">投资人ID</th>
            <th align="center">投资人</th>
            <th align="center">身份证</th>
            <th align="center">投资金额</th>
            <th align="center">支持项</th>
            <th align="center">添加时间</th>
            <th align="center">操作</th>
          </tr>
        </thead>
        <tbody>
        <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
        	<tr>
            	<td align="center">${s.id}</td>
                <td align="center">${s.investor}</td>
                <td align="center">${s.identityCard}</td>
              <td align="center">${s.investmentAmount}</td>
              <td align="center">${s.administratorName}</td>
              <td align="center">${s.writeTime}</td>
              <td align="center"><a href="javascript:if(confirm('确实要删除该内容吗?'))location='<%=path%>/Login/deleteTInvestmentInfo?id=${s.id}&enterpriseNumber=${s.enterpriseNumber}'">删除</a></td>
          </tr>
          </c:forEach>
     
        </c:if>
        	
        </tbody>
        <tfoot>
        	<tr>
            <td align="center">总金额</td><td align="center" id="totalMoney" colspan="2">${product1.realityMoney}万元</td>
            <td align="center">投资进度</td>
            <td colspan="3" align="center" id="progressTd">${product1.financingProgress}%</td>
          </tr>
        </tfoot>
        </table>
        <div class="addToList dataForm">
        <h2>当前支持项</h2>
        <table>
        <thead>
        	<tr><th>支持项序号</th><th>支持项描述</th><th>支持项金额</th><th>支持项名额</th><th>当前人数</th><th>操作</th></tr>
        </thead>
        <tbody>
        	<tr><td>1</td><td>描述1</td><td>金额1</td><td>名额1</td><td>人数1</td><td>删除</td></tr>
        </tbody>
        </table>
        <h2>添加支持项</h2>
        <form  action="<%=path%>/Login/investmentinfo" id="form" method="post"      > 
     
            <input type="hidden"  name="enterpriseNumber"  id="enterpriseNumber"  value="${product1.enterpriseNumber}"  />
             <input type="hidden"  name="state"   id="state"   value="0"    />
           
        <ul><li>
            <dd>支持项描述：</dd><input type="text"  name="investor"  id="investor"  />
        <dt>
        <br />
            <dd>支持项金额：</dd><input type="text"  name="identityCard"  id="identityCard"   />
        <dt>
        <br />
            <dd>名额限制：</dd><input type="number"  name="investmentAmount"  id="investmentAmount"   />
        <dt>
         
        <br />
<input type="submit" value="添加" class="submitBtn" /></dt>
</form>

    </li></ul></div>
        <!-- <table cellpadding="0" cellspacing="0" border="1" align="center" class="investmentDelList">
        <caption>已删除的投资记录</caption>
        <thead>
        	<tr>
        	<th align="center">投资ID</th><th  align="center">投资人</th><th align="center">身份证</th><th align="center">投资金额</th><th align="center">添加人</th><th align="center">添加时间</th><th align="center">删除人</th><th align="center">删除时间</th>
          </tr>
        </thead>
        <tbody>
        	<tr>
            	<td align="center">234</td>
                <td align="center">asd</td>
                <td align="center">11111111</td>
                <td align="center">22222</td>
                <td align="center">admin</td>
                <td align="center">2014-8-6 15:07:26</td>
              <td align="center">admin</td>
              <td align="center">2014-8-6 15:07:32</td>
          </tr>
        </tbody>
        </table> -->
  </div>
  <div class="cl"></div>
</div>

</body>
</html>
