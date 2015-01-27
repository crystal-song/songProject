<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>交易记录 - 我的账户 - 中租宝</title>
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
        <div class="zichan_con">
            
            <table  bgcolor="#eee" border="0" cellpadding="0" cellspacing="1" class="quan_tab">
                <tr>
                    <td bgcolor="#FFFFFF">项目名称</td>
                    <td bgcolor="#FFFFFF">募集金额(元)</td>
                    <td bgcolor="#FFFFFF">项目状态</td>
                    <td bgcolor="#FFFFFF">项目周期(天)</td>
                    <td bgcolor="#FFFFFF">还款方式</td>
                    <td bgcolor="#FFFFFF">下次还款时间</td>
                    <td bgcolor="#FFFFFF">操作</td>
                </tr>

                <c:if test="${ not empty list}">
                    <c:forEach var="t" items="${list}">
                        <tr>
                         <td bgcolor="#FFFFFF">${t.projectName}</td>
                        <td bgcolor="#FFFFFF">${t.realityMoney}</td>
                        <td bgcolor="#FFFFFF">${t.projectStatus==1?'预热中':t.projectStatus==2?'融资中':t.projectStatus==3?'已满标':t.projectStatus==4?'还款中':'已完成' }</td>
                        <td bgcolor="#FFFFFF">${t.financingPeriod}</td>
                        <td bgcolor="#FFFFFF">${t.repaymentWay=='1'?'按月付息、到期还本':t.repaymentWay=='2'?'按季付息、到期还本':t.repaymentWay=='3'?'半年付息、到期还本':t.repaymentWay=='4'?'按年付息、到期还本':'到期付息、到期还本' }</td>
                        <td bgcolor="#FFFFFF"><fmt:formatDate value="${t.repaymentTime}" pattern="yyyy-MM-dd"/></td>
                        <td bgcolor="#FFFFFF"><c:if test="${t.loaned==true}"><a href="<%=path%>/loan/loanManage?enterpriseNumber=${t.enterpriseNumber}">还款管理</a></c:if><c:if test="${t.loaned!=true}"><font color="grey">还款管理</font></c:if></td>
                        </tr>
                    </c:forEach>
                </c:if>

            </table>
            <c:if test="${empty list}">
                <li >
                    暂无记录
                </li>
            </c:if>

            <div class="clear"></div>
            <div class="next_list">
                <a href="<%=path %>/loan/loanProduct?pageNo=1&username=${name}">首页</a>
                <c:if test="${page.pageNo > 1}"><a href="<%=path %>/loan/loanProduct?pageNo=${page.pageNo-1}&username=${name}">上一页</a>  </c:if>
                <div class="pageNum"></div>
                <c:if test="${page.pageNo < page.totalPage}">  <a href="<%=path %>/loan/loanProduct?pageNo=${page.pageNo+1}&username=${name}">下一页</a>  </c:if>
                <a href="<%=path %>/loan/loanProduct?pageNo=${page.totalPage}&username=${name}">末页</a>
            </div>
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
