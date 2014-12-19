<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ include file="/includes/taglibs.jsp" %>

<title>帮助中心 - 中租宝</title>
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
        </div>    
            <div class="daohang">
             <a href="<%=path%>/chushenwenjian.jsp" class="daohang_bac">个人信息初审文件</a><a href="<%=path%>/wenjian_qiye.jsp">企业信息初审文件</a>
            </div>
        	<ul class="wenjian_list">
        	  <li class="wenjian_hei">
        	   <h3>需要信息简介</h3>
        	    <div id="danwei">
        	      <span>1. 身份认证</span><span>2. 信用报告</span><span>3. 工作认证</span>
        	      <span>4. 收入认证</span><br /><span>5. 房产报告</span><span>6. 购车认证</span>
        	      <span>7. 学历认证</span><span>8. 居住地认证</span>
        	    
        	    </div>
        	  </li>
        	  <li class="wenjian_hei">
        	  <h3>身份认证</h3>
        	    <div id="danwei">
        	      <dl id="mb10">
					<dt> 请同时提供下面两项资料：</dt>
					<dd class="mb_dt"> 1. 本人身份证原件的正、反两面照片。</dd>
					<dd class="mb_dt"> 2. 本人手持身份证正面头部照，（确保身份证上的信息没有被遮挡，避免证件与头部重叠，确保身份证内容完整清晰可见）。</dd>
				 </dl>
					<dl>
					  <dt> 认证有效期：</dt>
					  <dd class="mb_dt"> 永久</dd>
					</dl>
        	    
        	    </div>
        	  </li>
        	  <li class="wenjian_hei">
        	  
        	  <h3>信用报告</h3>
        	     <div id="danwei">
        	        <dl id="mb10">
						<dd class="mb_dt">个人信用报告是由中国人民银行出具，全面记录个人信用活动，反映个人信用基本状况的文件。本报告是中租宝了解您信用状况的一个重要参考资料。</dd>
					</dl>
					<dl id="mb10">
						<dt>认证说明：</dt>
						<dd class="mb_dt">个人信用报告需15日内开具。</dd>
					</dl>
					<dl id="mb10">
						<dt>认证条件：</dt>
						<dd class="mb_dt">信用记录良好。</dd>
					</dl>
					<dl id="mb10">
						<dt>认证有效期：</dt>
						<dd class="mb_dt">6个月</dd>
					</dl>
					<dl id="mb10">
						<dt>如何办理：</dt>
						<dd class="mb_dt">可去当地人民银行打印，部分地区可登录个人信用信息服务平台。</dd>
						<dd>
						<a target="_blank" href="http://www.pbccrc.org.cn/zxzx/lxfs/lxfs.shtml">全国各地征信中心联系方式查询</a>
						</dd>
					</dl>
        	     </div>
        	  </li>
        	  <li class="wenjian_hei">
        	  <h3>工作认证</h3>
        	     <div id="danwei">
        	       <dl id="mb10">
					<dd class="mb_dt">您的工作状况是中租宝评估您信用状况的主要依据之一。</dd>
					</dl>
					<dl id="mb10">
					<dt >认证说明：</dt>
					<dd class="mb_dt">请提供下面任意一项资料：</dd>
					<dd class="mb_dt">1. 加盖单位公章（或劳动合同专用章）的劳动合同。</dd>
					<dd class="mb_dt">2. 最近1个月内开具的加盖单位公章（或人力章、财务章）的机打（手写无效）在职证明。</dd>
					<dd class="mb_dt">3. 带有姓名、照片、工作单位名称的工作证。</dd>
					</dl>
					<dl id="mb10">
					<dt >认证条件：</dt>
					<dd class="mb_dt">本人需在现单位工作满3个月。</dd>
					</dl>
					<dl id="mb10">
					<dt >认证有效期：</dt>
					<dd class="mb_dt">6个月</dd>
					</dl>				
        	     </div>
        	  </li>
        	  <li class="wenjian_hei">
        	  <h3>收入认证</h3>
        	     <div id="danwei">
        	     
        	      <dl id="mb10">
					<dd class="mb_dt">您的银行流水单是中租宝评估您收入状况的主要依据之一。</dd>
					</dl>
					<dl id="mb10">
					<dt >认证说明：</dt>
					<dd class="mb_dt">请提供下面任意一项资料：</dd>
					<dd class="mb_dt">1. 可体现工资项的最近3个月的工资卡银行流水单。</dd>
					<dd class="mb_dt">2. 可体现工资项的最近3个月的网银电脑截屏。</dd>
					</dl>
					<dl id="mb10">
					<dt >认证条件：</dt>
					<dd class="mb_dt">本人名下近3个月的月收入均在2000以上。</dd>
					</dl>
					<dl id="mb10">
					<dt >认证有效期：</dt>
					<dd class="mb_dt">6个月</dd>
					</dl>

        	     </div>
        	  </li>
        	  <li class="wenjian_hei">
        	  <h3>房产认证</h3>
        	     <div id="danwei">
        	       <dl id="mb10">
					<dd class="mb_dt">房产认证是证明借入者资产及还款能力的重要凭证之一。</dd>
					</dl>
					<dl id="mb10">
					<dt >认证说明：</dt>
					<dd class="mb_dt">请提供下面任意一项资料：</dd>
					<dd class="mb_dt">1. 房屋产权证明。</dd>
					<dd class="mb_dt">2. 购房合同 + 近3个月的还贷流水。</dd>
					<dd class="mb_dt">3. 购房发票 + 近3个月的还贷流水。</dd>
					<dd class="mb_dt">4. 按揭合同 + 近3个月的还贷流水。</dd>
					</dl>
					<dl id="mb10">
					<dt>认证条件：</dt>
					<dd class="mb_dt">必须是商品房，且房产是本人名下所有或共有的。</dd>
					</dl>
					<dl id="mb10">
					<dt class="mb_dt">认证有效期：</dt>
					<dd class="mb_dt">永久</dd>
					</dl>
        	     </div>
        	  </li>
        	  <li class="wenjian_hei">
        	  <h3>购车认证</h3>
        	     <div id="danwei">
        	       <dl id="mb10">
					<dd class="mb_dt">购车认证是证明借入者资产及还款能力的重要凭证之一。</dd>
					</dl>
					<dl id="mb10">
					<dt>认证说明：</dt>
					<dd class="mb_dt">请同时提供下面两项资料：</dd>
					<dd class="mb_dt">1. 车辆行驶证的原件照片。</dd>
					<dd class="mb_dt">2. 本人和车辆的合影（照片需露出车牌号码）。</dd>
					</dl>
					<dl id="mb10">
					<dt>认证条件：</dt>
					<dd class="mb_dt">车辆必须是本人名下所有。</dd>
					</dl>
					<dl id="mb10">
					<dt>认证有效期：</dt>
					<dd class="mb_dt">永久</dd>
					</dl>
        	     </div>
        	  </li>
        	  <li class="wenjian_hei">
        	  <h3>结婚认证</h3>
        	     <div id="danwei">
        	       <dl id="mb10">
					<dd class="mb_dt">借入者婚姻状况的稳定性，是中租宝考核借款人信用的评估因素之一。</dd>
					</dl>
					<dl id="mb10">
					<dt>认证说明：</dt>
					<dd class="mb_dt">请同时提供下面三项资料：</dd>
					<dd class="mb_dt">1. 结婚证书的原件照片。</dd>
					<dd class="mb_dt">2. 配偶身份证原件的正、反两面照片。</dd>
					<dd class="mb_dt">3. 本人和配偶的近照合影一张。</dd>
					</dl>
					<dl id="mb10">
					<dt>认证有效期：</dt>
					<ddclass="mb_dt">永久</dd>
					</dl>			
        	     </div>
        	  </li>
        	  <li class="wenjian_hei">
        	  <h3>学历认证</h3>
        	     <div id="danwei">
        	       <dl id="mb10">
					<dd class="mb_dt">借出者在选择借款申请投标时，借入者的学历也是一个重要的参考因素。为了让借出者更好、更快地相信您的学历是真实的，建议您对学历进行在线验证。</dd>
					</dl>
					<dl id="mb10">
					<dt>认证说明：</dt>
					<dd class="mb_dt">2001年至今获得学历，需学历证书编号：</dd>
					<dd class="mb_dt">
					1. 访问
					<a target="_blank" href="http://www.chsi.com.cn/xlcx/">学信网</a>
					，找到“零散查询”信息，点击【查询】；
					</dd>
					<dd class="mb_dt">2. 输入证书编号、姓名、查询码（通过手机短信获得，为12位学历查询码）、验证码，进行查询；</dd>
					<dd class="mb_dt">3. 查询成功后，您将查获得《教育部学历证书电子注册备案表》；</dd>
					<dd class="mb_dt">
					4. 将该表右下角的12位在线验证码（见
					<a target="_blank" href="/static/img/help/yangbentu1.jpg?20140401a">学历认证1</a>
					）输入文本框，点击【提交审核】。
					</dd>
					<dd class="mb_dt">1991年至今获得学历，无需学历证书编号：</dd>
					<dd class="mb_dt">
					1. 访问
					<a target="_blank" href="http://www.chsi.com.cn/xlcx/">学信网</a>
					，找到“本人查询”信息，点击【查询】；
					</dd>
					<dd class="mb_dt">
					2. 注册学信网账号，登录
					<a target="_blank" href="http://www.chsi.com.cn/xlcx/">学信网</a>
					，访问【学历信息】页面；
					</dd>
					<dd class="mb_dt">3. 选择您的最高学历，点击【申请验证报告】（通过手机短信获得12位学历查询码，此查询码与中租宝所需验证码不同）；</dd>
					<dd class="mb_dt">
					4. 申请成功后，您将获得12位在线验证码（
					<a target="_blank" href="/static/img/help/yangbentu2.jpg?20140401a">见学历认证2</a>
					）；
					</dd>
					<dd class="mb_dt">5. 将12位在线验证码输入文本框，点击【提交审核】。</dd>
					</dl>
					<dl id="mb10">
					<dt>认证条件：</dt>
					<dd class="mb_dt">大专或以上学历（普通全日制）。</dd>
					</dl>
					<dl id="mb10">
					<dt>认证有效期：</dt>
					<dd class="mb_dt">永久</dd>
					</dl>
        	     </div>
        	  </li>
        	  <li class="wenjian_hei">
        	  <h3>居住地证明</h3>
        	     <div id="danwei">
        	        <dl id="mb10">
					   <dd class="mb_dt">居住地的稳定性，是中租宝考核借款人的主要评估因素之一。</dd>
					</dl>
					<dl id="mb10">
						<dt>认证说明：</dt>
						<dd class="mb_dt">请提供下面任意一项资料：</dd>
						<dd class="mb_dt">1. 用本人姓名登记的水、电、气最近3个月缴费单。</dd>
						<dd class="mb_dt">2. 用本人姓名登记的固定电话最近3个月缴费单。</dd>
						<dd class="mb_dt">3. 本人的信用卡最近2个月的月结单。</dd>
						<dd class="mb_dt">4. 本人的自有房产证明。</dd>
						<dd class="mb_dt">5. 本人父母的房产证明，及证明本人和父母关系的证明材料。</dd>
					</dl>
					<dl>
					   <dt>认证有效期：</dt>
					   <dd class="mb_dt">6个月</dd>
					</dl>
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
