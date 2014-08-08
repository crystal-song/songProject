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
<title>用户中心页面</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
$(document).ready(function(){
	$('.select_nav a').click(function(){
		$(this).siblings().slideToggle('slow')
		}
	);	
	
	$(function(){
	var num=0;
	var timer=null;
	timer=setInterval(function(){
		num++
		$('.red_bar').css('width',num);
		/*$('progress').val(num)
		$('span').html(num)*/
		var zi=$('.view strong').text();
		if(zi=='低' && num==40){
			clearInterval(timer)	
		}
		if(zi=='中' && num==80){
			clearInterval(timer)	
		}
		if(zi=='高' && num==120){
			clearInterval(timer)			
		}
	},20)

	$('.sec li').mouseover(function(e){
		$(this).addClass('bac_org').siblings().removeClass('bac_org');
		});
    });
	
	$('.msg_nav').eq(1).mouseover(function(e){
		$('.bac_change_1').css('background-image','url("<%=path%>/img/tubiao10.png")');
		
		}).mouseout(function(e){
		$('.bac_change_1').css('background-image','url("<%=path%>/img/tubiao9.png")');
		
		});
	
	$('.msg_nav').eq(2).mouseover(function(e){
		$('.bac_change_2').css('background-image','url("<%=path%>/img/tubiao11.png")');
		
		}).mouseout(function(e){
		$('.bac_change_2').css('background-image','url("<%=path%>/img/tubiao12.png")');
		
		});	
	
	$('.msg_nav').eq(3).mouseover(function(e){
		$('.bac_change_3').css('background-image','url("<%=path%>/img/tubiao2.png")');
		
		}).mouseout(function(e){
		$('.bac_change_3').css('background-image','url("<%=path%>/img/tubiao3.png")');
		
		});			
	});
</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>

<div class="msg_con">
   <div class="msg_left">
       <div class="msg_left_top">
           <div class="name">
                 <div class="pic">
                   <h3></h3>
                 </div>
                 <span><strong>liuxiaoyan..</strong></span>
           </div>
           <div class="left_btm">
                  <span class="sp1"><a href="#" title="您还未实名认证，请点击"></a></span>
                  <span class="sp2"><a href="#" title="您还未绑定手机，请点击"></a></span>
                  <span class="sp3"><a href="#" title="您还未验证邮箱，请点击"></a></span>
                  <span class="sp4"><a href="#" title="您还未设置支付密码，请点击"></a></span>         
           </div>
           <div class="loadbar">
             <div class="red_bar"></div>
           </div>
           <div class="view">
             <span>安全等级：<strong>中</strong></span>
             <a href="#">[提升]</a>
           </div>
       </div>
       <div class="msg_left_cent">
          <a class="msg_nav">
               <i style="background:url(img/tubiao5.png) no-repeat"></i>
               <span>账户主页</span>
          </a>
          <div class="select_nav">
              <a  class="msg_nav">
                <i class="bac_change_1"></i>
                <span>资产管理</span>
              </a>
              <ul>
                  <li>资产统计</li>
                  <li>充值提现</li>
                  <li>交易记录</li>
              </ul>
          </div>
          <div class="select_nav">
              <a  class="msg_nav">
              <i class="bac_change_2"></i>
              <span>消息管理</span>
            </a>
              <ul>
                  <li>资产统计</li>
                  <li>充值提现</li>
                  <li>交易记录</li>
              </ul>
          </div>
          <div class="select_nav">
              <a class="msg_nav" style="margin-bottom: 0px;">
                  <i class="bac_change_3"></i>
                  <span>账户管理</span>
              </a>
              <ul>
                  <li>资产统计</li>
                  <li>充值提现</li>
                  <li style="border-bottom:0">交易记录</li>
              </ul>
          </div>    
       </div>
        
   </div>
   <div class="msg_right">
      <div class="msg_right_top">
          <span class="top_tongzhi">通知</span>
          <p>恭喜您获得注册奖励面值50元投资券！</p>
          <a href="#" class="xiangxi">查看详细</a>
          <a href="#" class="zhidao">我知道了</a>
      </div>
      <div class="msg_right_cent">
           <div class="msg_div01">
              <div class="div01_left">
                  <p class="p1">
                      <span class="div01_top">可用余额:</span>
                      <a href="#" title="可用余额"></a>
                  </p>
                  <h3><strong>0</strong>.00元</h3>             
              </div>
              <div class="div01_right">
                   
                   <a href="#" class="btn_01">充值</a> 
                   <a href="#" class="btn_02">提现</a>       
              </div>    
           </div>
           <div class="msg_div02">
           <div class="div01_left">
                  <p class="p1">
                      <span class="div01_top">可用余额:</span>
                      <a href="#" title="可用余额 + 冻结资金 + 待收本金 + 待收利息 + 可用投资券"></a>
                  </p>
                  <h3><strong>0</strong>.00元</h3>                           
              </div>
           </div>
           <div class="msg_div03">
                <div class="div01_left">
                  <p class="p1">
                      <span class="div01_top">可用余额:</span>
                      <a href="#"  title="当月可获得的投资收益"></a>
                  </p>
                  <h3><strong>0</strong>.00元</h3>              
                </div>
           </div>
           <div class="msg_div04">
                 <div class="div01_left">             
                  <p class="p1">
                      <span class="div01_top">可用余额:</span>
                      <a href="#"  title="当月可获得的投资收益"></a>
                  </p>
                  <h3><strong>0</strong>.00元</h3>              
                 </div>
           </div>
      </div>
      <div class="msg_right_main">
           <div class="msg_title">
             <h2>收益走势</h2>
             <a href="#">查看更多资产统计</a>
           </div>
           <div class="shouyi">
           <div class="sec"><ul>
               <li>收益时间</li>
               <li class="bac_org">年收益</li>
               <li>月收益</li>
             </ul></div>
            
            <div class="last">
            <p>您还没有任何收益，快去投资让你的财富增值吧！</p>
            <img src="<%=path%>/img/aitouzi01_r2_c16.jpg" width="680" height="40" /></div> 
           </div>
           
           <div class="msg_title">
             <h2>交易记录</h2>
             <a href="#">查看更多交易记录</a>
           </div>
           <div class="shouyi">
             <div class="sec"> <ul>
               <li class="bac_org">收益时间</li>
               <li>年收益</li>
               <li>月收益</li>
             </ul></div>
            <div class="jilu">
               <ul>
                 <li>时间</li>
                 <li>交易类型</li>
                 <li>交易详情</li>
                 <li>金额</li>
                 <li>余额</li>
               </ul> 
              <div class="jilu_con">
                <p>暂无交易记录</p>
              </div>
              <div class="msg_con_bottom">
              <p>首页展示最近 6 条记录</p>
              </div>
            </div>
           </div>        
      </div>   
   </div>
</div>

<div class="clear"></div>
<div class="one"></div>
<div class="clear"></div>

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