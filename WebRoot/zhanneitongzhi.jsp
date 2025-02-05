<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %> 

<title>用户中心页面</title>

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

<!-- links end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
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
