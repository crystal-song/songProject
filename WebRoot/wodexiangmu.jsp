<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>我的项目 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
 <%@ include file="/includes/taglibs.jsp" %> 
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;    
    var indexs=2;
    $(document).ready(function(){    
    	 $(".u_left_mian").click(function(){
             $(this).siblings().slideToggle("slow");
           });
    	$(".u_left_sec:eq(2) li:eq(2)").children("a").css("color","#fc652e");

});
 
    

</script>

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
          <div class="pro_con_title" style="margin-top:5px;"><strong>我的项目</strong>
          </div>
          <div class="con_list">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="project_list">
				<thead>
				<tr>
				<td align="center" height="40">项目名称</td><td align="center">投资金额</td><td align="center">投资时间</td><td align="center">投资周期</td><td align="center">预期收益</td><td align="center">投资协议</td>
				</tr>
				</thead>
				<tbody>
            <c:if test="${ not empty li}">
            <c:forEach var="s" items="${li}" varStatus="i">            
				<tr>

				<td align="center"  height="30">${s.projectName}</td><td align="center">${s.paymentAmount}</td><td align="center">${fn:substring(s.transDate,0,10)}</td><td align="center">{s.financingPeriod}</td><td align="center">${s.paymentAmount * s.interestRate/100}</td><td align="center"><a href="<%=path%>/gate/authorization?platformUserNo=${s.platformUserNo}&enterpriseNumber=${s.enterpriseNumber}&transDate=${s.transDate}" title="查看投资协议" style="text-decoration:underline;">点击查看</a></td>

				</tr>				
                </c:forEach>
               </c:if>
               </tbody>
               </table>
               </div>
            <div class="clear"></div>    
      </div>   
    </div>
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>