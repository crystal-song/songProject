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
<link href="<%=path%>/js/cleonello-jqplot-e8af8a37f0f1/src/jquery.jqplot.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/cleonello-jqplot-e8af8a37f0f1/src/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/cleonello-jqplot-e8af8a37f0f1/src/jquery.jqplot.js"></script>
<script type="text/javascript" src="<%=path%>/js/cleonello-jqplot-e8af8a37f0f1/src/excanvas.js"></script>
<script type="text/javascript" src="<%=path%>/js/cleonello-jqplot-e8af8a37f0f1/src/plugins/jqplot.pointLabels.js"></script>  
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
         
         
         
    //tubiao     
        var a=10;
     	var b=50;
        var c=100;
     	var d=110;
     	var e=150;

     	$.jqplot('chartdiv',  [[[0,c],[20,b],[40,a],[60,d],[80,e],[100,a],[120,c],[140,b],[160,d],[180,e],[200,d],[220,e]]],
     	{ title:'收益走势图',
     	  seriesDefaults: {
     		  pointLabels: { show: true } 
     		  }, 
     	  axes:{yaxis:{ticks: [0,50,100,150,200],
     	               label:"收益(￥)"
     	  },
     	        xaxis: {   
                        label:"月份(2014年)",
     				    ticks: [[0,'1月'],[20,'2月'],[40,'3月'],[60,'4月'],[80,'5月'],[100,'6月'],[120,'7月'],[140,'8月'],[160,'9月'],[180,'10月'],[200,'11月'],[220,'12月']],				        
     			}
     	}
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
          <a class="msg_nav" href="<%=path%>/user-info.jsp">
               <i style="background:url(<%=path%>/img/tubiao5.png) no-repeat"></i>
               <span>账户主页</span>
          </a>
          <div class="select_nav">
              <a  class="msg_nav">
                <i class="bac_change_1"></i>
                <span>资产管理</span>
              </a>
              <ul style="display:block">
                  <li><a href="<%=path%>/zichan.jsp">资产统计</a></li>
                  <li><a href="<%=path%>/chongzhi.jsp">充值</a></li>
                  <li><a href="<%=path%>/tixian.jsp">提现</a></li>
              </ul>
          </div>
          <div class="select_nav">
              <a  class="msg_nav">
	              <i class="bac_change_2"></i>
	              <span>消息管理</span>
              </a>
              <ul style="display:none">
                  <li><a  href="<%=path%>/zhanneitongzhi.jsp">站内信息</a></li>                  
              </ul>
          </div>
          <div class="select_nav">
              <a class="msg_nav" style="margin-bottom: 0px;">
                  <i class="bac_change_3"></i>
                  <span>账户管理</span>
              </a>
              <ul style="display:none">
                  <li><a href="<%=path%>/user-info.jsp">个人信息</a></li>
                  <li><a href="<%=path%>/anquanshezhi.jsp">安全设置</a></li>
                  <li style="border-bottom:0"><a href="<%=path%>/tongzhishezhi.jsp">通知设置</a></li>
              </ul>
          </div>    
       </div>     
   </div>
   <div class="msg_right">
       <div class="msg_main">
           <div class="msg_title">
             <h2>资产总计</h2>
           </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
           <div class="user_con02">
             <p class="zi_num"><span>资产总计:</span><strong>0.00</strong><i>元</i></p>
             <ul class="gray_bar">
               <li><span>可用余额:</span><strong>0.00</strong><i>元</i></li>
               <li><span>待收收益:</span><strong>0.00</strong><i>元</i></li>
               <li><span>待收本金:</span><strong>0.00</strong><i>元</i></li>    
             </ul>
	       </div> 
	          
	       <div class="user_con02">
	         <div class="msg_title">
               <h2>待收收益</h2>
             </div>             
	             <p class="zi_num"><span>待收收益:</span><strong>0.00</strong><i>元</i></p>	             
		           
                    <div class="gray_bar">
		              <div class="gray_bac">
		                <span>可用余额:</span><strong>0.00</strong><i>元</i>
		             </div> 
		            </div>  
		            <div class="tubiao">
		            <div id="chartdiv" style="height:250px;width:500px; "></div> 
		            </div>
		                          
	       </div>    
	       <div class="user_con02">
	         <div class="msg_title">
               <h2>已收收益</h2>
             </div>
             <p class="zi_num"><span>已收收益:</span><strong>0.00</strong><i>元</i></p>
             <ul class="gray_bar">
               <li><span>可用余额:</span><strong>0.00</strong><i>元</i></li>
             </ul>
	       </div> 
	       
	       <div class="user_con02">
	         <div class="msg_title">
               <h2>累计投资</h2>
             </div>
             <p class="zi_num"><span>累计投资:</span><strong>0.00</strong><i>元</i></p>
             <ul class="gray_bar">
               <li><span>可用余额:</span><strong>0.00</strong><i>元</i></li>
             </ul>
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