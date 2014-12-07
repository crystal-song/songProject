<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/taglibs.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>发起项目  - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<%@ include file="/includes/taglibs.jsp" %>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
	var navIndex=5;
	$(".nav_big a").eq(5).addClass("bd_btom").siblings().removeClass("bd_btom");
	$(".news_ul a").eq(4).addClass("aqbz").siblings().removeClass("aqbz");
	$(".news_ul li").click(function(e){
        var index=$(this).index();
        $(this).children("div").addClass("news_wd_color");
        $(this).siblings().children("div").removeClass("news_wd_color");
        $(".news_right ul").eq(index).css("display","block").siblings().css("display","none");
     });
     $(".news_ul li").click(function(e){
        var index=$(this).index();
        $(this).children("div").addClass("news_wd_color");
        $(this).siblings().children("div").removeClass("news_wd_color");
        $(".news_right ul").eq(index).css("display","block").siblings().css("display","none")
     });
     $(".webside li").click(function(){
    	 
       $(this).children(".news_list_hide").slideToggle();
      
      
      
     });
     
     $(".daohang a").click(function(){
         var index= $(this).index();
         $(this).addClass('daohang_bac').siblings().removeClass('daohang_bac');
         $(".webside").eq(index).css("display","block").siblings(".webside").css("display","none")
     });
  	$(window).on('scroll', function(){
        if($(window).scrollTop()<500){
            $(".absolute_bac1").hide();
        }
        if($(window).scrollTop()>=500){
            $(".absolute_bac1").show(); 
        }
      });
            $(".absolute_bac1").click(function(){
               $("html,body").animate({scrollTop:0},500);  		            
            });	 
});
</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<div class="clear"></div>
<div class="news_location">当前位置：<a href="<%=path%>/index.jsp" >首页</a> >> <a href="<%=path%>/help_con.jsp" >帮助中心</a> >> <a href="<%=path%>/faqixiangmu.jsp" >发起项目</a></div>
   <div class="user_con_news">

       <div class="news_left">
          <!-- left menu -->
           <%@ include file="/includes/left_help.jsp" %>
          <!-- left end -->
       </div>
       <div class="right_news_con news_right">  
       <div class="daohang">
             <a class="daohang_bac">个人信息初审文件</a><a>企业信息初审文件</a>
       </div>
       <div class="hei_margin">
            <div class="ws_title">*&nbsp;<strong>请将您的信息尽可能详细的填写到一个word里面，将word与照片的压缩包发送到邮箱：cs@ptobchina.com。</strong></div>
            <div class="ws_title">&nbsp;&nbsp;<strong>如有疑问请您联系客服人员：010-84243099/3199。</strong></div>
        </div>  
        <!-- geren -->  
          <ul class="webside">
             <li>
                 <div class="bei_title"><span>需要信息简介</span><i></i>
                 </div>
                 <div class="news_list_hide">    
                 
                                
        	      <div>1. 身份认证</div><div>2. 信用报告</div><div>3. 工作认证</div>
        	      <div>4. 收入认证</div><div>5. 房产报告</div><div>6. 购车认证</div>
        	      <div>7. 学历认证</div><div>8. 居住地认证</div>	          	  
                 </div>
                 
             </li>
             <li><div class="bei_title"><span>身份认证</span><i></i>
                 </div>
                 <div class="news_list_hide">
                   <p>请同时提供下面两项资料：</p>
                   <div>1. 本人身份证原件的正、反两面照片。</div>
                   <div>2. 本人手持身份证正面头部照，（确保身份证上的信息没有被遮挡，避免证件与头部重叠，确保身份证内容完整清晰可见）。</div>        	      
                   <p>认证说明：</p>
                   <div>个人信用报告需15日内开具。</div>
                   <p>认证有效期：</p>
                   <div>6个月</div>
                 </div></li>
                <li><div class="bei_title"><span>信用报告</span><i></i>
                 </div>
                 <div class="news_list_hide">
                   <p>个人信用报告是由中国人民银行出具，全面记录个人信用活动，反映个人信用基本状况的文件。
                                      本报告是中租宝了解您信用状况的一个重要参考资料。</p>
                   <p>认证条件：</p>  
                   <div>&nbsp;&nbsp;&nbsp;信用记录良好。</div>
                   <p>认证有效期：</p>  
                   <div>&nbsp;&nbsp;&nbsp;&nbsp;6个月</div>                       
                 </div></li>
             <li><div class="bei_title"><span>工作认证</span><i></i>
                 </div>
                 <div class="news_list_hide">
                   <p>您的工作状况是中租宝评估您信用状况的主要依据之一。</p>
                   <p>请提供下面任意一项资料：</p>
					<div>1. 加盖单位公章（或劳动合同专用章）的劳动合同。</div>
					<div>2. 最近1个月内开具的加盖单位公章（或人力章、财务章）的机打（手写无效）在职证明。</div>
					<div>3. 带有姓名、照片、工作单位名称的工作证。</div>
                   <p>认证条件：</p>  
                   <div>&nbsp;&nbsp;&nbsp;本人需在现单位工作满3个月。</div>
                   <p>认证有效期：</p>  
                   <div>&nbsp;&nbsp;&nbsp;&nbsp;6个月</div>    
                   
                 </div></li>
                 <li><div class="bei_title"><span>收入认证</span><i></i>
                 </div>
                 <div class="news_list_hide">
                   <p>您的银行流水单是中租宝评估您收入状况的主要依据之一。</p>
                   <p>请提供下面任意一项资料：</p>
					<div>1. 可体现工资项的最近3个月的工资卡银行流水单。</div>
					<div>2. 可体现工资项的最近3个月的网银电脑截屏。</div>
                   <p>认证条件：</p>  
                   <div>&nbsp;&nbsp;&nbsp;本人名下近3个月的月收入均在2000以上。</div>
                   <p>认证有效期：</p>  
                   <div>&nbsp;&nbsp;&nbsp;&nbsp;6个月</div>    
                   
                 </div></li>
                 <li><div class="bei_title"><span>房产认证</span><i></i>
                 </div>
                 <div class="news_list_hide">
                   <p>房产认证是证明借入者资产及还款能力的重要凭证之一。</p>
                   <p>请提供下面任意一项资料：</p>
					<div>1. 房屋产权证明。</div>
					<div>2. 购房合同 + 近3个月的还贷流水。</div>
					<div>3. 购房发票 + 近3个月的还贷流水。</div>
					<div>4. 按揭合同 + 近3个月的还贷流水。</div>
                   <p>认证条件：</p>  
                   <div>&nbsp;&nbsp;&nbsp;必须是商品房，且房产是本人名下所有或共有的。</div>
                   <p>认证有效期：</p>  
                   <div>&nbsp;&nbsp;&nbsp;&nbsp;永久</div>    
                   
                 </div></li>
                 
                 <li><div class="bei_title"><span>购车认证</span><i></i>
                 </div>
                 <div class="news_list_hide">
                   <p>购车认证是证明借入者资产及还款能力的重要凭证之一。</p>
                   <p>请同时提供下面两项资料：</p>
					<div>1. 车辆行驶证的原件照片。</div>
					<div>2. 本人和车辆的合影（照片需露出车牌号码）。</div>
                   <p>认证条件：</p>  
                   <div>&nbsp;&nbsp;&nbsp;车辆必须是本人名下所有。</div>
                   <p>认证有效期：</p>  
                   <div>&nbsp;&nbsp;&nbsp;&nbsp;永久</div>    
                   
                 </div></li>
                 <li><div class="bei_title"><span>结婚认证</span><i></i>
                 </div>
                 <div class="news_list_hide">
                   <p>借入者婚姻状况的稳定性，是中租宝考核借款人信用的评估因素之一。</p>
                   <p>请同时提供下面三项资料：</p>
					<div>1. 结婚证书的原件照片。</div>
					<div>2. 配偶身份证原件的正、反两面照片。</div>
                    <div>3. 本人和配偶的近照合影一张。</div>                   
                   <p>认证有效期：</p>  
                   <div>&nbsp;&nbsp;&nbsp;&nbsp;永久</div>    
                   
                 </div></li>
                  <li><div class="bei_title"><span>学历认证</span><i></i>
                 </div>
                 <div class="news_list_hide">
                   <p>借出者在选择借款申请投标时，借入者的学历也是一个重要的参考因素。为了让借出者更好、更快地相信您的学历是真实的，建议您对学历进行在线验证。</p>
                   <p>认证说明：</p>
                   <div>2001年至今获得学历，需学历证书编号：</div>
                   <div>1. 访问<a target="_blank" href="http://www.chsi.com.cn/xlcx/">学信网</a>
					，找到“零散查询”信息，点击【查询】；</div>
                    <div>2. 输入证书编号、姓名、查询码（通过手机短信获得，为12位学历查询码）、验证码，进行查询；</div>
					<div>3. 查询成功后，您将查获得《教育部学历证书电子注册备案表》；</div>
					<div>4. 将该表右下角的12位在线验证码（见
					<a target="_blank" href="/static/img/help/yangbentu1.jpg?20140401a">学历认证1</a>
					）输入文本框，点击【提交审核】。</div>
					<div>1991年至今获得学历，无需学历证书编号：</div>
                   <div>1. 访问
					<a target="_blank" href="http://www.chsi.com.cn/xlcx/">学信网</a>
					，找到“本人查询”信息，点击【查询】；</div>
                    <div>2. 注册学信网账号，登录
					<a target="_blank" href="http://www.chsi.com.cn/xlcx/">学信网</a>
					，访问【学历信息】页面；</div>
					<div>3. 选择您的最高学历，点击【申请验证报告】（通过手机短信获得12位学历查询码，此查询码与中租宝所需验证码不同）；</div>
					<div>4. 申请成功后，您将获得12位在线验证码（
					<a target="_blank" href="/static/img/help/yangbentu2.jpg?20140401a">见学历认证2</a>）</div>
                    <div>5. 将12位在线验证码输入文本框，点击【提交审核】。</div>                                    
                   <p>认证条件：</p>  
                   <div>&nbsp;&nbsp;&nbsp;大专或以上学历（普通全日制）。</div>
                   <p>认证有效期：</p>  
                   <div>&nbsp;&nbsp;&nbsp;&nbsp;永久</div>    
                   
                 </div></li>
                  <li><div class="bei_title"><span>居住地证明</span><i></i>
                 </div>
                 <div class="news_list_hide">
                   <p>居住地的稳定性，是中租宝考核借款人的主要评估因素之一。</p>
                   <p>请提供下面任意一项资料：</p>
					<div>1. 用本人姓名登记的水、电、气最近3个月缴费单。</div>
					<div>2. 用本人姓名登记的固定电话最近3个月缴费单。</div>
					<div>3. 本人的信用卡最近2个月的月结单。</div>
					<div>4. 本人的自有房产证明。</div>
					<div>5. 本人父母的房产证明，及证明本人和父母关系的证明材料。</div>
                   <p>认证有效期：</p>  
                   <div>&nbsp;&nbsp;&nbsp;&nbsp;6个月</div>    
                   
                 </div></li>                
           </ul>
           
           
           <ul class="webside" style="display:none;">
             <li>
                 <div class="bei_title"><span>申请单位</span><i></i>
                 </div>
                 <div class="news_list_hide">    
                 <p>您的申请单位
					  是中租宝评估您信用状况的主要依据之一，请您详细填写。</p>
                 <!--                
        	      <div>1. 身份认证</div><div>2. 信用报告</div><div>3. 工作认证</div>
        	      <div>4. 收入认证</div><div>5. 房产报告</div><div>6. 购车认证</div>
        	      <div>7. 学历认证</div><div>8. 居住地认证</div>    -->   	          	  
                 </div>
                 
             </li>
             <li><div class="bei_title"><span>基础六证</span><i></i>
                 </div>
                 <div class="news_list_hide">
                   <p>请同时提供下面六项资料照片：</p>
                   <div>1. 税务登记证</div><div>2. 营业执照</div><div>3. 组织条码证</div>
        	      <div>4. 商标注册证</div><div>5. 授权书</div><div>6. 质检报告</div>        	      
                 </div></li>
             <li><div class="bei_title"><span>资金用途</span><i></i>
                 </div>
                 <div class="news_list_hide">
                   <p>您的资金用途
					  是中租宝评估您信用状况的主要依据之一，请您详细填写。</p>
                 </div></li>
             <li><div class="bei_title"><span>增信措施</span><i></i>
                 </div>
                 <div class="news_list_hide">
                   <p>您的增信措施
					  是中租宝评估您信用状况的主要依据之一，请您详细填写。</p>
                 </div></li>
           </ul>
           
           
           
        </div>
     </div>   
   
   </div>
  <!-- absolute_right start -->
	<%@ include file="/includes/absolute.jsp" %>
	<!-- absolute_right end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
