<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>还款概况 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>

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
     <table  bgcolor="" border="0" cellpadding="0" cellspacing="" class="quan_tab">
                <tr>
                    <td bgcolor="#FFFFFF">项目名称:</td>
                    <td bgcolor="#FFFFFF">${product.projectName}</td>
                    <td bgcolor="#FFFFFF">目标金额:</td>
                    <td bgcolor="#FFFFFF">${product.financingMoney}万元</td>
                    <td bgcolor="#FFFFFF">项目周期(天):</td>
                    <td bgcolor="#FFFFFF">${product.financingPeriod }</td>
                </tr>
				 <tr>
                    <td bgcolor="#FFFFFF">还款方式:</td>
                    <td bgcolor="#FFFFFF">${product.repaymentWay=='1'?'按月付息、到期还本':product.repaymentWay=='2'?'按季付息、到期还本':product.repaymentWay=='3'?'半年付息、到期还本':product.repaymentWay=='4'?'按年付息、到期还本':'到期付息、到期还本' }</td>
                    <td bgcolor="#FFFFFF">计息日:</td>
                    <td bgcolor="#FFFFFF"><fmt:formatDate value="${product.repaymentTime}" pattern="yyyy-MM-dd"/></td>
                </tr>
            </table>
        <div class="zichan_con">
            
            <table  bgcolor="#eee" border="0" cellpadding="0" cellspacing="1" class="quan_tab">
                <tr>
                    <td bgcolor="#FFFFFF">期数</td>
                    <td bgcolor="#FFFFFF">还款状态</td>
                    <td bgcolor="#FFFFFF">结息日</td>
                    <td bgcolor="#FFFFFF">应还利息</td>
                    <td bgcolor="#FFFFFF">应还本金</td>
                    <td bgcolor="#FFFFFF">已还金额</td>
                    <td bgcolor="#FFFFFF">还款日期</td>
                    <td bgcolor="#FFFFFF">操作</td>
                </tr>

                <c:if test="${ not empty productrepaysList}">
                    <c:forEach var="t" items="${productrepaysList}">
                        <tr>
                         <td bgcolor="#FFFFFF">${t.period}</td>
                        <td bgcolor="#FFFFFF">${t.repayed==true?'已还款':'未还款'}</td>
                        <td bgcolor="#FFFFFF"><fmt:formatDate value="${t.endTime}" pattern="yyyy-MM-dd"/></td>
                        <td bgcolor="#FFFFFF">${t.interest}</td>
                        <td bgcolor="#FFFFFF">${t.amount}</td>
                        <td bgcolor="#FFFFFF"> <c:if test="${t.repayed==true }">${t.interest+t.amount}</c:if></td>
                        <td bgcolor="#FFFFFF"><fmt:formatDate value="${t.repayTime}" pattern="yyyy-MM-dd"/></td>
                        <td bgcolor="#FFFFFF"> <c:if test="${t.repayed==false }"><a href="<%=path%>/loan/loanDetail?enterpriseNumber=${product.enterpriseNumber}&id=${t.id}&period=${t.period}">还款</a>  </c:if></td>
                        </tr>
                    </c:forEach>
                </c:if>

            </table>
            <c:if test="${empty productrepaysList}">
                <li >
                    暂无记录
                </li>
            </c:if>

          
        </div>
    </div>
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
<script type="text/javascript">
    var navIndex=3;    
    var indexs=2;
    $(document).ready(function(){    
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".nav_big a").eq(2).children("p").addClass("headwd_color");

    
    	$(".u_left_sec:eq(2) li:eq(3)").children("a").css("color","#fc652e");
});
 
</script>
</html>
