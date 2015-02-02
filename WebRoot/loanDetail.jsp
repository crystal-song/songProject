<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>还款明细 - 我的账户 - 中租宝</title>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="user_con">
    <div class="user_left">
        <!-- user_left start -->
        <%@ include file="/includes/user_info_left.jsp" %>
        <!-- user_left end -->
    </div>
    <div class="user_right">
     <table  bgcolor="" border="0" cellpadding="0" cellspacing="0" class="quan_tab" >
                <tr>
                    <td bgcolor="#FFFFFF">项目名称:</td>
                    <td bgcolor="#FFFFFF">${product.projectName }</td>
                    <td bgcolor="#FFFFFF">目标金额:</td>
                    <td bgcolor="#FFFFFF">${product.financingMoney}万元</td>
                    <td bgcolor="#FFFFFF">项目周期（天）:</td>
                    <td bgcolor="#FFFFFF">${product.financingPeriod }</td>
                </tr>
				 <tr>
                    <td bgcolor="#FFFFFF">还款方式:</td>
                    <td bgcolor="#FFFFFF">${product.repaymentWay=='1'?'按月付息、到期还本':product.repaymentWay=='2'?'按季付息、到期还本':product.repaymentWay=='3'?'半年付息、到期还本':product.repaymentWay=='4'?'按年付息、到期还本':'到期付息、到期还本' }</td>
                    <td bgcolor="#FFFFFF">计息日:</td>
                    <td bgcolor="#FFFFFF"><fmt:formatDate value="${product.repaymentTime }" pattern="yyyy-MM-dd"/> </td>
                </tr>
                 <tr>
                    <td bgcolor="#FFFFFF">本期结息日:</td>
                    <td bgcolor="#FFFFFF"><fmt:formatDate value="${productrepay.endTime }" pattern="yyyy-MM-dd"/></td>
                    <td bgcolor="#FFFFFF">本期利息（元）:</td>
                    <td bgcolor="#FFFFFF">${productrepay.interest}</td>
                    <td bgcolor="#FFFFFF">本期本金（元）:</td>
                    <td bgcolor="#FFFFFF">${productrepay.amount }</td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF">账户可用余额（元）:</td>
                    <td bgcolor="#FFFFFF">${avaliableMoney}</td>
                    <td bgcolor="#FFFFFF"></td>
                    <td bgcolor="#FFFFFF"></td>
                     <!-- 根据还款状态显示 -->

                     <c:if test="${avaliableMoney>=total&&period==perioding}">
                    <td bgcolor="#FFFFFF"><a href="<%=path%>/gate/doRepayment?id=${productrepay.enterpriseNumber}&period=${productrepay.period}" onclick="checkAvaliMoney();">立即还款</a></td>
                    </c:if>
                     <c:if test="${avaliableMoney<total&&period==perioding}">
                    <td bgcolor="#FFFFFF">账户余额不足，请<a href="<%=path%>/gate/recharge">充值</a></td>

                    </c:if>
                    <td bgcolor="#FFFFFF"></td>
                </tr>
            </table>
        <div class="zichan_con">
            
            <table  bgcolor="#eee" border="0" cellpadding="0" cellspacing="1" class="quan_tab">
                <tr>
                    <td bgcolor="#FFFFFF">投资人</td>
                    <td bgcolor="#FFFFFF">应付利息(元)</td>
                    <td bgcolor="#FFFFFF">应付本金(元)</td>
                    <td bgcolor="#FFFFFF">实付金额(元)</td>
                    <td bgcolor="#FFFFFF">备注</td>
                   
                </tr>

                <c:if test="${ not empty userrepaysList}">
                    <c:forEach var="t" items="${userrepaysList}">
                        <tr>
                        <td bgcolor="#FFFFFF">${t.userId}</td>
                        <td bgcolor="#FFFFFF">${t.interest}</td>
                        <td bgcolor="#FFFFFF">${t.amount}</td>
                        <td bgcolor="#FFFFFF"><c:if test="${productrepay.repayed==true}">${t.interest+t.amount}</c:if></td>
                        <td bgcolor="#FFFFFF" ></td>
                        </tr>
                    </c:forEach>
                </c:if>

            </table>
            <c:if test="${empty userrepaysList}">
                <li >
                    暂无记录
                </li>
            </c:if>
    </div>
    </div>
</div>
<input type="hidden" id="total" value="${total}"/>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript">
    var navIndex=3;    
    var indexs=2;
    $(document).ready(function(){    
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".nav_big a").eq(2).children("p").addClass("headwd_color");  
    	$(".u_left_sec:eq(2) li:eq(3)").children("a").css("color","#fc652e");
});
 
</script>

