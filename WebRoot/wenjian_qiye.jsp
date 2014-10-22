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
<meta content="中汇宝，是北京中投汇融投资管理有限公司旗下的众筹网络平台，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="中汇宝,理财,投资,收益,中投汇融,融资,P2B,P2P,商券,众筹,zhonghuibao,信托,债权,抵押,信贷,基金,定投,中小贷,微信托,投资人" name="keywords">
<title>帮助中心 - 中汇宝</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
var navIndex=6;
var index=4;

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
<div class="news_location">当前位置：<a href="<%=path%>/index.jsp" >首页</a> >> <a href="<%=path%>/help.jsp" >发起项目</a></div>
<!-- left menu -->
<%@ include file="/includes/left_help.jsp" %>
<!-- left end -->
<!-- right content -->
    <div class="bz_right">
        <div class="bzr_tit">
        	<ul>
            	<li class="bzr_qian">发起项目</li>               
            </ul>
        </div>
        <div class="clear"></div>
        <div class="bzr_nr">
        <div class="hei_margin">
            <div class="ws_title">*&nbsp;<strong>请将您的信息尽可能详细的填写到一个word里面，将word与照片的压缩包发送到邮箱：cs@ptobchina.com。</strong></div>
            <div class="ws_title">&nbsp;&nbsp;<strong>如有疑问请您联系客服人员：010-84243099/3199。</strong></div>
            <div class="daohang">
             <a href="<%=path%>/chushenwenjian.jsp">个人信息初审文件</a><a href="<%=path%>/wenjian_qiye.jsp" class="daohang_bac">企业信息初审文件</a>
            </div>
        </div>    
        	<ul class="wenjian_list">
        	  <li class="wenjian_hei">
        	   <h3>申请单位</h3>
        	    <div class="danwei">
        	      <dd class="mb_dt">您的申请单位
					  是中汇宝评估您信用状况的主要依据之一，请您详细填写。</dd>
        	    
        	    </div>
        	  </li>
        	  <li class="wenjian_hei">
        	  <h3>基础六证</h3>
        	    <div id="danwei">
        	      <dl id="mb10">
					<dt>请同时提供下面六项资料照片：</dt>
					<dd class="mb_dt"> 1. 税务登记证。</dd>
					<dd class="mb_dt"> 2. 营业执照。</dd>
					<dd class="mb_dt"> 3. 组织条码证。</dd>
					<dd class="mb_dt"> 4. 商标注册证。</dd>
					<dd class="mb_dt"> 5. 授权书。</dd>
					<dd class="mb_dt"> 6. 质检报告。</dd>		
				 </dl>
				
					<dl>
					  <dt> 认证有效期：</dt>
					  <dd class="mb_dt"> 永久</dd>
					</dl>
        	    
        	    </div>
        	  </li>
        	  <li class="wenjian_hei">
        	  <h3>资金用途</h3>
        	     <div id="danwei">
        	        <dd class="mb_dt">您的资金用途
					  是中汇宝评估您信用状况的主要依据之一，请您详细填写。</dd>
					
				
        	     </div>
        	  </li>
        	  <li class="wenjian_hei">
        	  <h3>还款来源</h3>
        	     <div id="danwei">
        	       <dl id="mb10">
					 <dd class="mb_dt">您的还款来源
					  是中汇宝评估您信用状况的主要依据之一，请您详细填写。</dd>
					</dl>
        	     </div>
        	  </li>
        	  <li class="wenjian_hei">
        	  <h3>增信措施</h3>
        	     <div id="danwei">
                     <dd class="mb_dt">您的增信措施
					  是中汇宝评估您信用状况的主要依据之一，请您详细填写。</dd>
        	     </div>
        	  </li>
        	</ul>
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
