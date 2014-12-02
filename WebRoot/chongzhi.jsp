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
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>充值 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
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
    var indexs=1;
    $(document).ready(function(){
    	$(".u_left_sec:eq(1) li:eq(1)").children("a").css("font-weight","bold");
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    	  $(".u_left_mian").click(function(){
              $(this).siblings().slideToggle("slow");
            });
     
});
         

</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<!-- 
<div class="one"></div>
<div class="clear_height"></div>
<div class="msg_con">
   <div class="msg_left">
         
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
	          <!--  <ul class="chong"> 
              <form role="form" action="<%=path%>/gate/doRecharge" method="post"
          target="_blank">
          <ul class="chong">
         <li style="height:0px;"> <input type="hidden" id="host" name="host"></input>
		<div class="form-group" style="display:none;height:0px;" >
            <!-- <label for="platformNo">platformNo</label><input type="text"
              class="form-control" id="platformNo" name="platformNo"
              value="10040011137" /> 
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
            class="btn btn-default">立即充值</button> 
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
 -->

<div class="user_con">
     <div class="user_left">
         <!-- user_left start -->
           <%@ include file="/includes/user_info_left.jsp" %>
         <!-- user_left end -->
      </div>
      <div class="user_right">           
        <div class="zichan_con">        
          <div class="pro_con_title" style="margin-top:5px;"><strong>充值</strong></div>
          <div class="fangshi">
            <p>充值方式</p>
            <ul>
              <li></li>              
            </ul>
          </div>
          
          <div class="money">
            <p><span>可用余额</span><span><strong>0.00</strong>元</span></p>
            <p class="position_money" style="display:none"><span>充值金额</span><span class="money_text"><input type="text" value="100"></input>元</span></p>
          </div>   
                
          <div class="fangshi" style="height:auto; display:none ">
            <p>选择银行</p>
            <ul>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
            </ul>
          </div>
          <div class="yanzheng" style="display:none">
            <p><a>验证码</a><span><input type="submit" class="sub" value="点击获取验证码"></input></span><a></a></p>
            <p><a href=""></a><span><input type="checkbox"> </input>我已阅读并确认下方重要提示信息</span></p>
            <p><a href=""></a><span><a href="javascript:;" onclick="onSubmit('https://member.yeepay.com/member')" class="chongzhi_btn">立即充值</a></span></p>
          </div>                  
     <form role="form" action="<%=path%>/gate/doRecharge" method="post" target="_blank" id="form">      
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
          <li class="mar_chong">
           <div class="form-group">
            <span><label for="amount" style="margin:0px;" >充值金额：</label></span>
            <input type="text"
              class="form-control" id="amount" name="amount"
              value="100" /><label style="margin-left:10px; text-align:left;">元</label>
          </div> 
          </li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="notifyUrl">notifyUrl</label><input type="text"
              class="form-control" id="notifyUrl" name="notifyUrl"  value="http://192.168.1.207:8080/spring3/gate/examRecharge" />
          </div>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="callbackUrl">callbackUrl</label><input
              type="text" class="form-control" id="callbackUrl"
              name="callbackUrl"
              value="http://192.168.1.207:8080/spring3/gate/examRecharge" />
          </div>         
          <!--  <button onclick="onSubmit('http://qa.yeepay.com/member')"
            class="btn btn-default">QA</button>
          <button onclick="onSubmit('http://qa.yeepay.com/bha-toolkit')"
            class="btn btn-default">QA</button> -->
          <!-- <button onclick="onSubmit('https://member.yeepay.com/member')"
            class="btn btn-default">立即充值</button> -->
            <div  class="mar_que_top"><a href="javascript:;" onclick="onSubmit('https://member.yeepay.com/member')" style="text-align:center; color:#fff">确定</a></div>
        </li>
        </ul>
         </form>                     
          <div class="tishi">
            <p><strong>温馨提示</strong></p>
            <ul>
              <li class="tishi_red">您充值的资金若未投资就提现，第三方支付公司会收取您提现金额的0.5%作为转账费用。</li>
              <li>您的账户资金将由第三方平台托管。</li>
              <li>为了您的资金安全，请您在充值前完成手机绑定，身份认证及支付密码设置。</li>
              <li>爱投资严禁信用卡充值、套现等行为，一经发现将予以处罚，包括但不限于：限制收款、冻结账户、永久停止服务， 并会影响银行征信记录。</li>
              <li>充值过程遇到问题，请联系客服，010-84243099/3199</li>
             </ul>            
           </div>              
          </div> 
        </div>
      </div>

<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>