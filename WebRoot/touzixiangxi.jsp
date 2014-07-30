<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>投资详细页面</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<!-- banner start -->
<%@ include file="/includes/banner.jsp" %>
<!-- banner end  -->
<div class="clear"></div>
<div class="one"></div>
<div class="clear"></div>

<div class="xx">
	<div class="xx_fra">
    	<div class="xx_left">
        	<div class="xx_one">
            	<div class="xxo_bor">
                	<div class="xxo_left"><img src="<%=path%>/images/sy_64.jpg"></div>
                    <div class="xxo_right">
                    	<div class="xxo_one">
                        	<div class="xxo_font">项目名称：<span class="ckxq_red">${product1.projectName}</span></div>
                            <div class="xxo_font">企业编号：${product1.enterpriseNumber}</div>
                            <div class="xxo_font">信用等级：<img src="<%=path%>/images/qualityRate_${product1.qualityRating}.jpg" style="margin-bottom:-3px;"><span style="padding-left:120px;">分享到：<img src="<%=path%>/images/xx_09.jpg">&nbsp;<img src="<%=path%>/images/xx_11.jpg">&nbsp;<img src="<%=path%>/images/xx_13.jpg"></span></div>
                        </div>
                        <div class="xx_font">年化收益：<span class="ckxq_red1">${product1.yearIncome}%</span>&nbsp;&nbsp;还款日期:<span class="ckxq_red1">${product1.repaymentTime}</span>&nbsp;&nbsp;还款方式：<span class="zi14">${product1.repaymentWay}</span></div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="tzxx">
                	<div class="tzxx_left">
                    	担保机构:<span class="cu">${product1.guaranteeInstitution}</span><br>
100%本息保障<br>
距离企业还款结项还有300天<br>
企业生产经营正常，还款正常
                    </div>
                    <div class="tzxx_right">
                    	融资金额:<span class="cu hong">${product1.financingMoney}万</span><br>
融资进度：<span class="cu hong">${product1.financingProgress}%</span><br>
<div class="progress_160"><div class="progress_bar" style="width:${product1.financingProgress<100?product1.financingProgress:100}%"></div></div>

                    </div>
                </div>
            </div>
            <div class="clear_height"></div>
            <div class="wenzi">
            	<div class="wz_one">项目描述</div>
                <div class="wz_nr">${product1.companyProfile}</div>
                <div class="wz_one">担保机构简介及担保意见</div>
                <div class="wz_nr"><span class="cu">担保机构简介：</span>${product1.guaranteeInstitutionIntroduce}<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">担保机构意见：</span>${product1.collateralOpinion}</div>
				<div class="wz_one">资金运转</div>
                <div class="wz_nr"><span class="cu">资金用途：</span>${product1.fundUse}<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">还款来源：</span>${product1.repaymentSource}</div>
				<div class="wz_one">风险控制措施</div>
                <div class="wz_nr"><span class="cu">担保机构：</span>${product1.guaranteeInstitution}<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">抵押物信息：</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;${product1.guarantee}<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">风险控制措施：</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;${product1.riskControl}<br>
</div>
				<div class="wz_one">企业背景</div>
                <div class="wz_nr">${product1.companyProfile}<br>
</div>
                <div class="wz_one">企业信息</div>
                <div class="wz_nr"><span class="cu">营业范围：</span>${product1.businessScope}<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">经营状况：</span>&nbsp;&nbsp;${product1.stateOfOperation}<br>
</div>
            </div>
        </div>
        <!-- xx right -->
<%@ include file="/includes/xx_right.jsp" %>
    	<!-- xx right end-->
    </div>
</div>

<div class="clear_height"></div>

<!-- links start -->
<%@ include file="/includes/links.jsp" %>
<!-- links end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
