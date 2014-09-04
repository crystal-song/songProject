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
var navIndex=2;
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
             <h2>个人信息</h2>
             <a href="<%=path%>/user/getuserbyName?name=${user1.name}">修改个人信息</a>
           </div>
           <div class="user_con">
               <div class="photo">
                   <span></span>
               </div>
               <div class="center">
                   <ul class="user_con_name">
                     <li>用户名</li>
                     <!-- <li>详情</li> -->
                     <li>真实姓名</li>
                     <li>身份证号码</li>
                     <li>手机号码</li>
                     <li>邮箱地址</li>  
                   </ul>
                   <ul class="user_con_mag">
                     <li>${user1.name}</li>
                    <!--  <li>...</li> -->
                     <li>${user1.realName}</li>
                     <li>${user1.identityCard}</li>
                     <li>${user1.phone}</li>
                     <li>${user1.email}</li>
                   </ul>
               </div>
               <div class="user_right">
                   <ul class="user_check">
                     <li class="xiangqing"><a href="#">详情</a></li>
                     <li>未认证</li>
                     <li>未绑定</li>
                     <li>未绑定</li>
                     <li>未绑定</li>
                     <li>未绑定</li>
                   </ul>
               
               </div>             
           </div>
           <div class="user_con_last">
                <div class="center_last">
                   <ul class="user_con_last_name">
                     <li>性别</li>
                     <li>出生日期</li>
                     <li>最高学历</li>
                     <li>毕业院校</li>
                     <li>婚姻状态</li>
                     <li>居住地址</li>
                     <li>公司行业</li>
                     <li>公司规模</li>
                     <li>职位</li>
                     <li>月收入</li> 
                   </ul>
         
                   <ul class="user_con_last_mag">
                     <li>${user1.sex}</li>
                     <li>${user1.dateOfBirth}</li>
                     <li>${user1.educationBackground}</li>
                     <li>${user1.schoolOfGraduation}</li>
                     <li>${user1.maritalStatus}</li>
                     <li>${user1.address}</li>
                     <li>${user1.companyIndustry}</li>
                     <li>${user1.companyScale}</li>
                     <li>${user1.position}</li>
                     <li>${user1.income}</li>
                   </ul>
               </div>
           </div>
           <div class="user_bottom">
            <h3>温馨提示:</h3>
            <ol>
              <li>请您根据自身真实情况填写，中投汇会对用户的所有资料进行严格保密。</li>
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