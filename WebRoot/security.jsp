<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/taglibs.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>安全策略</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
var navIndex=4;
var index=2;
</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>
<div class="frame">
<!-- left menu -->
<%@ include file="/includes/left_help.jsp" %>
<!-- left end -->
<!-- right content -->
    <div class="bz_right">

    	<div class="bzr_tit">
        	<ul>
            	<li class="bzr_qian">关于我们</li>
                <li>安全策略</li>
                <li>账户操作</li>
                <li>投融资相关</li>
                <li>生利宝</li>
            </ul>
        </div>
        <div class="clear"></div>
        <div class="bzr_nr">
        	<dl>
        	   <dt><strong>安全策略</strong></dt>
        	   <p>(一) 严格准入</p>
        	   <dd style="margin-bottom:15px;">担保公司准入：理财范围仅与持有融资性担保机构经营许可证的融资性担保公司战略合作；
               </dd>
               <dd>企业准入：严格控制在实体经营企业，保证企业的财报可审查、资金用途可跟踪、企业经营情况可监控，企业的盈利能力可评估。
               </dd>
               <p>(二) 严格贷前审查</p>
               <dd>融资性担保公司前期风控第一层把关，平台设置独立风险控制部门第二层把关。在原则性尽职调查基础上对相关项目的从业行业、企业经营情况、实际控制人道德风险、申请贷款用途合规及合法性、反担保措施等多个纬度实施审慎考量。
               </dd>          
        	   <p>(三) 完善贷后管理</p>
               <dd>融资性担保公司前期风控第一层把关，平台设置独立风险控制部门第二层把关。在原则性尽职调查基础上对相关项目的从业行业、企业经营情况、实际控制人道德风险、申请贷款用途合规及合法性、反担保措施等多个纬度实施审慎考量。
               </dd>
               <dd>平台及第三方担保机构对借款企业执行借款合同情况及借款企业的经营情况进行追踪调查和检查。若发现借款人未按规定用途使用贷款等造成贷款风险加大的情形，将采取相关保全措施。若企业借款出现预期、坏账依照合同规定，
                                  担保机构会在规定时间对投资客户实行前置赔付，并迅速启动抵押标的或反担保物处置程序，最大化减小损失。
        	   </dd>
        	</dl>
        	  	
        </div>
    </div>
<!-- right end -->
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
