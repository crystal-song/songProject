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
<meta content="中租宝，是北京中投汇融投资管理有限公司旗下的众筹网络平台，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>充值 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<%--  <jsp:include page="/payment/head.jsp"></jsp:include>  --%> 


<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
	function onSubmit(host) {
		document.getElementById("host").value = host;
		var form = document.getElementById("form");
		form.submit();
	}
</script>
<script type="text/javascript">
    var navIndex=3;    
    $(document).ready(function(){
    	$('.select_nav a').click(function(){
    		$(this).siblings().slideToggle('slow');
    		//$(this).siblings().css('display','block');
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
         <%@ include file="/includes/user_info_left.jsp" %>      
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
              <ul class="chong" style="height:auto;">
		           <li><span>账户余额</span><a class="org_num"><strong>0.00</strong></a><i>元</i></li>
		           <li style=" display:none;"><span>充值金额：</span><a><input type="text" class="input_text"></input></a><i>元</i></li>
	          </ul>      
	          <!--  <ul class="chong"> -->
              <form role="form" action="<%=path%>/gate/doRecharge" method="post"
          target="_blank">
          <ul class="chong">
         <li style="height:0px;"> <input type="hidden" id="host" name="host"></input>
		<div class="form-group" style="display:none;height:0px;" >
            <!-- <label for="platformNo">platformNo</label><input type="text"
              class="form-control" id="platformNo" name="platformNo"
              value="10040011137" /> -->
               <label for="platformNo">platformNo</label><input type="text"
              class="form-control" id="platformNo" name="platformNo"
              value="10012415118" />
          </div>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="requestNo">requestNo</label><input type="text"
              class="form-control" id="requestNo" name="requestNo"
              value="${now}" />
          </div>
           <div class="form-group" style="display:none;height:0px;" >
            <label for="platformUserNo">platformUserNo</label><input
              type="text" class="form-control" id="platformUserNo"
              name="platformUserNo"  value="${registerYeePay1.platformUserNo}"  />
          </div>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="feeMode">feeMode</label><input type="text"
              class="form-control" id="feeMode" name="feeMode"
              value="PLATFORM" />
          </div>
          </li>
          <li>
           <div class="form-group">
            <span><label for="amount" style="margin:0px;" >充值金额：</label></span>
            <input type="text"
              class="form-control" id="amount" name="amount"
              value="100" /><i>元</i>
          </div> 
          </li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="notifyUrl">notifyUrl</label><input type="text"
              class="form-control" id="notifyUrl" name="notifyUrl"  value="http://192.168.1.207:8080/spring3/bha/gate/exam" />
          </div>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="callbackUrl">callbackUrl</label><input
              type="text" class="form-control" id="callbackUrl"
              name="callbackUrl"
              value="http://192.168.1.207:8080/spring3/bha/gate/exam" />
          </div>
          
          <!--  <button onclick="onSubmit('http://qa.yeepay.com/member')"
            class="btn btn-default">QA</button>
          <button onclick="onSubmit('http://qa.yeepay.com/bha-toolkit')"
            class="btn btn-default">QA</button> -->
          <!-- <button onclick="onSubmit('https://member.yeepay.com/member')"
            class="btn btn-default">立即充值</button> -->
            <div  class="que_btn"><a href="javascript:;" onclick="onSubmit('https://member.yeepay.com/member')" style="text-align:center;">确定</a></div>
        </li>
        </ul>
         </form> 
 
	          <div class="user_bottom01" style="height:200px">
			            <h3>温馨提示:</h3>
			            <ol>
			              <li><strong>您充值的资金若未投资就提现，第三方支付公司会收取您提现金额的0.5%作为转账费用。</strong> </li>
			              <li>您的账户资金将由第三方平台托管。 </li>       
			              <li>为了您的资金安全，请您在充值前完成手机绑定，身份认证及支付密码设置。  </li>
			              <li>中租宝严禁信用卡充值、套现等行为，一经发现将予以处罚，包括但不限于：限制收款、冻结账户、永久停止服务，并会影响银行征信记录。</li>
			              <li>充值过程遇到问题，请联系客服，010-84243099/3199</li>
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