<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>用户中心页面</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
 <%@ include file="/includes/taglibs.jsp" %> 
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
    			num++;
    			$('.red_bar').css('width',num);
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
         $(".ren_right").click(function(){
             var a=$(this).parent().parent().children('.yincang').slideToggle();        
        	 var text=$(this).text()

        	 if(text=="认证"){
        		 $(this).text("取消认证")
        	 }else if(text=="取消认证"){
        	     $(this).text("认证")
        	 }else if(text=="验证"){
        		 $(this).text("取消验证")
        	 }else if(text=="取消验证"){     		 
        		 $(this).text("验证")    		 
        	 }else if(text=="修改"){
        		 $(this).text("取消修改")
        	 }else if(text=="取消修改"){     		 
        		 $(this).text("修改")	 
        	 }else if(text=="设置"){
        		 $(this).text("取消设置")
        	 }else if(text=="取消设置"){     		 
        		 $(this).text("设置")
        		 
        	 } 
         });    	   	 
         $('.aa').click(function(){
        	 var aa_text=$('.aa').text();   
             if(aa_text=="采用上传认证"){
            	 $('.hide_car').css("display","block")
            	 $('.aa').text('采用接口认证');
             }else if(aa_text=="采用接口认证"){
            	 $('.hide_car').css("display","none")
            	 $('.aa').text('采用上传认证');     	 
             }
         });
         
         $(".zhedie").click(function(){
        	
        	 if($(this).text()=='展开'){
        	     $(this).siblings('.hide_div').css('display','block');
        	     $(this).text('收起');
        	     $(this).css('background-image','url("<%=path%>/img/jiantou2.png")');
        	    
        	 }else if($(this).text()=='收起'){
        	     $(this).siblings('.hide_div').css('display','none');
        	     $(this).text('展开');
        	     $(this).css('background-image','url("<%=path%>/img/jiantou.png")');
        	 }
         });  
         
         $('.kitt li').mouseover(function(){       	 
        	 $(this).addClass('all_org').siblings().removeClass('all_org');    	 
         });
});
  
</script>

</head>

<body onload="initProvince()">
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
   <div class="msg_right">
       <div class="msg_main">
           <div class="msg_title">
             <h2>站内通知</h2>
           </div>
           <div class="user_con02">
            <ul class="kitt">
              <li>状态</li>
              <li class="all_org">全部</li>
              <li>未读</li>
              <li>已读</li>
            </ul> 
            <div class="xitong">
              <div class="zhedie"><strong>展开</strong></div>
              <h3>系统通知</h3>
              <p>2014-07-25 09:55:23</p>
              <p>恭喜您获得注册奖励面值50元投资券！</p>
              <div class="hide_div" style="display:none">亲爱的用户，感谢您在中租宝平台注册，并获得注册奖励面值50元投资券！请您及时登录中租宝账户查看。 </div>
            </div>
            <div class="xitong">
              <div class="zhedie"><strong>展开</strong></div>
              <h3>系统通知</h3>
              <p>2014-07-25 09:55:23</p>
              <p>恭喜您获得注册奖励面值50元投资券！</p>
              <div class="hide_div" style="display:none"> 
                                 亲爱的用户zhaoshuang您好，<br />
                                 您已经成功注册，欢迎您加入中租宝！<br />
                                 希望我们可以为您提供更加优质的服务，让您的财富稳健增长。
              </div>
            </div>  
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