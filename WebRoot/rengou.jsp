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
var navIndex=3;
$(document).ready(function(){
	/*$('.select_nav a').click(function(){
		$(this).siblings().slideToggle('slow')
		}
	);	*/
	
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
	
	$(".box_check").hide();	
	$(".user_check p").mouseover(function(){
		$(this).siblings('.box_check').show();
		$('.box_check').mouseover(function(){
			$(this).show();
			});

	}).mouseout(function(){
		$(this).siblings('.box_check').hide();    
		$('.box_check').mouseout(function(){
			$(this).hide();
			});
		
	    });
	
	});
</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>
<div class="msg_con">
   <div class="msg_left">
       <div class="msg_left_top">
           <div class="name">
                 <div class="pic">
                   <h3></h3>
                 </div>
                 <span><strong>${user1.name}</strong></span>
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
             <span>安全等级：<strong>低</strong></span>
             <a href="#">[提升]</a>
           </div>
       </div>
       <div class="msg_left_cent">
          <a class="msg_nav">
               <i style="background:url(<%=path%>/img/tubiao5.png) no-repeat"></i>
               <span>账户主页</span>
          </a>
          <div class="select_nav">
              <a  class="msg_nav">
                <i class="bac_change_1"></i>
                <span>资产管理</span>
              </a>
              <ul style="display:none">
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
              <ul style="display:none">
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
              <ul style="display:none">
                  <li>资产统计</li>
                  <li>充值提现</li>
                  <li style="border-bottom:0">交易记录</li>
              </ul>
          </div>    
       </div>
          
   </div>
   <div class="msg_right">
       <div class="msg_main">
           <div class="msg_title">
             <h2>确认投资</h2>
           </div>
           <div class="user_con01">                 
             <div class="xq_left"><a href="#"><img src="<%=path%>/img/guangyao01.jpg" style="margin-bottom:-3px;"></a></div>      
             <div class="pro_check">
               <dl>
                 <dt><h2>光耀东方集团</h2></dt>
                 <dd><a href="#">光耀东方集团，中国优秀商业地产企业之一，全国化布局、专业化导向的大型企业集团。
                                     光耀东方，以"大型城市综合体开发"为基础，以"投资并购重组"为重点，以"商业运营管理"为主线，
                                     构建"三位一体"的商业地产开发运营体系，以"城市规划先导"与"后定位、再创造"的独特发展模式，
                                     形成卓越的运营能力，整合产业链条，再造城市价值......</a></dd>
               </dl>
               <div class="loding_bar">
                 <div class="l_b"></div>
               </div>
               <div class="mess"><span>融资金额:</span><span>1111</span><span>融资进度:</span><span>100%</span></div>
             </div>
             <div class="msg_title">
             <h2>确认投资金额</h2>
             </div> 
             <div class="jin"><span>投资金额:</span><span><input type="text"></input></span><i>元(增值金额为0.00元,超值金额为增值金额的整数倍)</i></div>
             
             <div class="msg_title">
             <h2>确认联系方式</h2>
             </div> 
             <p class="check_tel"><span>手机号码:</span><span><input type="text"></input></span></p>
             <p class="check_tel"><span>邮寄地址</span><span><input type="text"></input></span></p>  
             <input type="submit" value="保存" class="huoqu">   
           </div>
           <div class="msg_title">
             <h2>确认付款信息</h2>
           </div> 
           <p class="check_tel01"><strong>总金额:</strong><strong style="color:#f60">100</strong><strong>元</strong></p>
             <input type="submit" value="去易宝支付付款" class="huoqu" style="width:100px">  
            
           
       
           <div class="user_bottom">
            <h3>温馨提示:</h3>
            <ol>
              <li>请您根据自身真实情况填写，中租宝会对用户的所有资料进行严格保密。</li>
              <li>使用过程遇到问题，请联系客服，400-600-4300。 </li>
            </ol>
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