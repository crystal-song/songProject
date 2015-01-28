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
<title>${product1.projectName} - 更新投资详情</title>
<link href="<%=path%>/css/style1.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="wrap">
<!-- header -->
 <%@ include file="/includes/manage_nav.jsp" %> 
 <!-- header end -->
    <div class="cl"></div>
  <div class="content">
  	<h2>更新投资详情：${product1.projectName}</h2>
    	<div class="dataForm">
        	<ul>
                <li>
                    <dd>项目名称：</dd>
                    <input type="text"  value="${product1.projectName}" disabled="disabled" />
                    <dt>1111</dt>
                </li>
                <li>
                    <dd>企业编号：</dd>
                    <input type="text"  value="${product1.enterpriseNumber}"    disabled="disabled" />
                    <dt></dt>
                </li>
                <li>
                    <dd>项目图片：</dd>
                    
                  <dt><img alt="项目图片预览" width="250" height="158" /><br />尺寸：250*158</dt>
                </li>
                <li>
                    <dd>融资金额：</dd>
                  <input type="number"   value="${product1.financingMoney}"   min="0" value="0" disabled="disabled" />
                    <dt></dt>
                </li>                <li>
                    <dd>年化收益：</dd>
                    <input type="number"  value="${product1.yearIncome}"  min="0.05" max="0.24" value="0.12" step="0.01" disabled="disabled" />
                    <dt></dt>
                </li>
                <li>
                    <dd>还款日期：</dd>
                    <input type=""  value="${product1.repaymentTime}"    class="ui_timepicker"     disabled="disabled" />
                    <dt>请规范书写时间格式：如2015-01-01 00:00:00</dt>
                </li>
                <li>
                    <dd>还款方式：</dd>
                    <p>
                      <label>
                      <span>${product1.repaymentWay}</span></label>
                      <label>                    <span>按月付息</span></label>
                    </p>
<dt></dt>
                </li>
                <li>
                    <dd>发布时间：</dd>
                    <input type="date"  disabled="disabled" />
                    <dt></dt>
                </li>
            </ul>
   	  </div>
        <table cellpadding="0" cellspacing="0" border="1" align="center" class="investmentList">
        <caption>投资记录</caption>
        <thead>
        	<tr>
        	<th align="center">投资ID</th>
            <th align="center">投资人</th>
            <th align="center">身份证</th>
            <th align="center">投资金额</th>
            <th align="center">添加人</th>
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
            <td colspan="3" align="center" id="progressTd">${product1.financingProgress*100}%</td>
          </tr>
        </tfoot>
        </table>
        <div class="addToList dataForm">
        
        <form  action="<%=path%>/Login/investmentinfo" id="form" method="post"      > 
     
            <input type="hidden"  name="enterpriseNumber"  id="enterpriseNumber"  value="${product1.enterpriseNumber}"  />
             <input type="hidden"  name="state"   id="state"   value="0"    />
           
        <ul><li>
            <dd>投资人：</dd><input type="text"  name="investor"  id="investor"  />
        <dt>
        <br />
            <dd>身份证：</dd><input type="text"  name="identityCard"  id="identityCard"   />
        <dt>
        <br />
            <dd>投资金额：</dd><input type="number"  name="investmentAmount"  id="investmentAmount"   />
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
