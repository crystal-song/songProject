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
<title>充值 - 用户中心 - 中投汇</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
 <jsp:include page="/payment/head.jsp"></jsp:include>  
<script type="text/javascript">
	function onSubmit(host) {
		document.getElementById("host").value = host;
		var form = document.getElementById("form");
		form.submit();
	}
</script>

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
         })
         
         
         
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
                  <span class="sp5"><a href="<%=path%>/anquanshezhi.jsp" title="您未注册易宝支付账号，点击注册"></a></span>         
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
             <h2>充&nbsp;&nbsp;&nbsp;&nbsp;值</h2>
           </div>
           <div class="user_con01">
	          <p>充值方式</p>                 
	          <div class="yinhang01">
	          <div class="wang_yin">
	          <span></span>
	          </div>
	          <div class="clear"></div>
              <ul class="chong">
		           <li><span>所剩余额</span><a class="org_num"><strong>0.00</strong></a><i>元</i></li>
		           <li style=" display:none;"><span>充值金额</span><a><input type="text" class="input_text"></input></a><i>元</i></li>
		           <li><span>验证码</span><a><input type="text" class="input_text"></input></a><i></i></li>
	                             
	          </ul>
              <form role="form" action="<%=path%>/gate/doRecharge" method="post"
          target="_blank">
          <input type="hidden" id="host" name="host">
          <div class="form-group" style="display:none">
            <label for="platformNo">platformNo</label><input type="text"
              class="form-control" id="platformNo" name="platformNo"
              value="10040011137" />
          </div>
          <div class="form-group" style="display:none">
            <label for="requestNo">requestNo</label><input type="text"
              class="form-control" id="requestNo" name="requestNo"
              value="${now}" />
          </div>
          <div class="form-group" style="display:none">
            <label for="platformUserNo">platformUserNo</label><input
              type="text" class="form-control" id="platformUserNo"
              name="platformUserNo"  value="189123456"  />
          </div>
          <div class="form-group" style="display:none">
            <label for="feeMode">feeMode</label><input type="text"
              class="form-control" id="feeMode" name="feeMode"
              value="PLATFORM" />
          </div>
          
           <div class="form-group">
           <ul class="chong"><li><span>充值金额</span>
            <label for="amount" style="display:none">amount</label>
            <input type="text"
              class="form-control" id="amount" name="amount"
              value="100" /><i>元</i>
              </li></ul>
          </div> 
          <div class="form-group" style="display:none">
            <label for="notifyUrl">notifyUrl</label><input type="text"
              class="form-control" id="notifyUrl" name="notifyUrl"  value="http://192.168.1.207:8080/spring3/bha/gate/exam" />
          </div>
          <div class="form-group" style="display:none">
            <label for="callbackUrl">callbackUrl</label><input
              type="text" class="form-control" id="callbackUrl"
              name="callbackUrl"
              value="http://192.168.1.207:8080/spring3/bha/gate/exam" />
          </div>
          
        
        <ul class="chong">
        <li><span></span><a class="queren_box"><input type="checkbox"></input></a><a>我已阅读并确认下方重要提示信息</a></li>
	               <li><span></span><%-- <a href="<%=path%>/chongzhicheck.jsp" class="submit_box">充值</a> --%>
                   <button onclick="onSubmit('http://qa.yeepay.com/member')"
            class="btn btn-default">QA</button>
          <button onclick="onSubmit('http://qa.yeepay.com/bha-toolkit')"
            class="btn btn-default">QA</button>
          <button onclick="onSubmit('https://member.yeepay.com/member')"
            class="btn btn-default">生产</button></li>
        </ul>
	       </form>   
	          <div class="user_bottom01" style="height:200px">
			            <h3>温馨提示:</h3>
			            <ol>
			              <li><strong>您充值的资金若未投资就提现，第三方支付公司会收取您提现金额的0.5%作为转账费用。</strong> </li>
			              <li>您的账户资金将由第三方平台托管。 </li>       
			              <li>为了您的资金安全，请您在充值前完成手机绑定，身份认证及支付密码设置。  </li>
			              <li>中投汇严禁信用卡充值、套现等行为，一经发现将予以处罚，包括但不限于：限制收款、冻结账户、永久停止服务，并会影响银行征信记录。</li>
			              <li>充值过程遇到问题，请联系客服，400-600-4300 </li>
			            </ol>
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