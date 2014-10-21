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
<meta content="中汇宝，是北京中投汇融投资管理有限公司旗下的众筹网络平台，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="中汇宝,理财,投资,收益,中投汇融,融资,P2B,P2P,商券,众筹,zhonghuibao,信托,债权,抵押,信贷,基金,定投,中小贷,微信托,投资人" name="keywords">
<title>用户中心 - 我的账户 - 中汇宝</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">

var navIndex=3;
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

	<%@ include file="/includes/user_info_left.jsp" %>
	
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
                     <li class="mg_right">用户名</li><li>${user1.name}</li>
                     <li class="mg_right">真实姓名</li><li>${user1.realName}</li>
                     <li class="mg_right">身份证号</li><li>${user1.identityCard}</li>
                     <li class="mg_right">手机号码</li><li>${user1.phone}</li>
                     <li class="mg_right">邮箱地址</li><li>${user1.email}</li>
                     <li class="mg_right">易宝账号</li><li>${user1.email}</li>
                   </ul>                  
               </div>               
               <div class="user_right">            
                   <ul class="user_check">
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">用户注册时填写的用户名，不可更改</div><span class="box_right"></span></div><p class="xiangqing">详情</p></li>
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未认证个人实名信息， <a href="<%=path%>/anquanshezhi.jsp">实名认证</a></div><span class="box_right"></span></div><p>未认证</p></li>                  
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未绑定身份证，实名认证即可成功绑定身份证， <a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div><span class="box_right"></span></div><p>未认证</p></li>
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未绑定手机号， <a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div><span class="box_right"></span></div><p>未认证</p></li>
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未绑定邮箱号， <a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div><span class="box_right"></span></div><p>未认证</p></li>
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未注册易宝账号， <a href="<%=path%>/gate/register" target="_blank">请注册</a></div><span class="box_right"></span></div><p>未注册</p></li>            
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
                     <li>所在职位</li>
                     <li>每月收入</li> 
                   </ul>
         
                   <ul class="user_con_last_mag">
                     <li>${user1.sex}</li>
                     <li>${ser1.dateOfBirth}</li>
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
              <li>请您根据自身真实情况填写，中汇宝会对用户的所有资料进行严格保密。</li>
              <li>使用过程遇到问题，请联系客服，010-84243099/3199。 </li>
            </ol>
           </div>
       </div>
  
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