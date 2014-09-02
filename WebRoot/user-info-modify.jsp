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
             <a href="<%=path%>/user-info.jsp">取消修改</a>
           </div>
           <div class="user_con">
               <div class="photo">
                   <span></span>
               </div>
               <div class="center">
                   <ul class="user_con_name">
                     <li>昵称</li>
                     <li>详情</li>
                     <li>真实姓名</li>
                     <li>身份证号码</li>
                     <li>手机号码</li>
                     <li>邮箱地址</li>  
                   </ul>
                   <ul class="user_con_mag">
                     <li>xiaoyan</li>
                     <li>...</li>
                     <li>...</li>
                     <li>220...</li>
                     <li>186...</li>
                     <li>xxxx@sina.com</li>
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
                <form id="form">
                <div class="center_last">
                   <ul class="user_con_last_name">
                     <li>性别(不可修改)</li>
                     <li>出生日期(不可修改)</li>
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
                     <li></li>
                     <li></li>
                     <li> 
                       <select class="select01">
                         <option checked="checked">请选择</option>
                         <option>高中或以下</option>
                         <option>大专</option>
                         <option>大学本科</option>
                         <option>研究生及以上</option> 
                       </select></li>
                     <li><input type="text"/ class="text01"></li>
                     <li><input type="radio" name="weihun" value="a"/>未婚<input type="radio" value="b" name="weihun"/>已婚<input type="radio" name="weihun" checked="true" />其他</li>
                     <li><input type="text" class="text01"/></li>
                     <li> 
                       <select class="select01">
                            <option value="">请选择</option>
                            <option value="制造业">制造业</option>
                            <option value="IT">IT</option>
                            <option value="政府机关">政府机关</option>
                            <option value="媒体/广告">媒体/广告</option>
                            <option value="零售/批发">零售/批发</option>
                            <option value="教育/培训">教育/培训</option>
                            <option value="公共事业">公共事业</option>
                            <option value="交通运输业">交通运输业</option>
                            <option value="房地产业">房地产业</option>
                            <option value="能源业">能源业</option>
                            <option value="金融/法律">金融/法律</option>
                            <option value="餐饮/旅馆业">餐饮/旅馆业</option>
                            <option value="医疗/卫生/保健">医疗/卫生/保健</option>
                            <option value="建筑工程">建筑工程</option>
                            <option value="农业">农业</option>
                            <option value="娱乐服务业">娱乐服务业</option>
                            <option value="体育/艺术">体育/艺术</option>
                            <option value="公益组织">公益组织</option>
                            <option value="其它">其它</option> 
                       </select>
                       </li>
                     <li>
                       <select class="select01">
                            <option value="">请选择</option>
                            <option value="10人以下">10人以下</option>
                            <option value="10-100人">10-100人</option>
                            <option value="100-500人">100-500人</option>
                            <option value="500人以上">500人以上</option> 
                       </select>
                     </li>
                     <li><input type="text" class="text01"/></li>
                     <li>
                       <select class="select01">
                            <option value="">请选择</option>
                            <option value="1000元以下">1000元以下</option>
                            <option value="1001-2000元">1001-2000元</option>
                            <option value="2000-5000元"> 2000-5000元</option>
                            <option value="5000-10000元">5000-10000元</option>
                            <option value="10000-20000元">10000-20000元</option>
                            <option value="20000-50000元">20000-50000元</option>
                            <option value="50000元以上">50000元以上</option> 
                       </select>       
                     </li>
                   </ul>
                   <input type="submit" class="submit01" value="保存"/> <input type="reset" class="submit02" value="取消"/>
               </div>
                </form>
              
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