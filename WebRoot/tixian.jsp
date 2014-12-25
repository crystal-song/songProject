<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ include file="/includes/taglibs.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<title>提现 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  

</head>

<body>
<div class="black_bac"></div>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="user_con">
    <div class="user_left">
      <!-- user_left start -->
           <%@ include file="/includes/user_info_left.jsp" %>
         <!-- user_left end -->
    </div>
      <div class="user_right">  
        <div class="zichan_con">        
          <div class="pro_con_title" style="margin-top:5px;"><strong>提现</strong></div>
            <div class="add_postcar" style="display:none">
              <p>添加银行卡</p>
              <ul>
                <li><span>开户名：</span><div>....</div></li>
                <li>
                  <span>银行选择：</span>
                  <div>
                    <select>
                      <option>请选择</option>
                      <option>工商银行</option>
                      <option>建设银行</option>
                      <option>中国银行</option>
                    </select>
                  </div>
                </li>
                <li>
                  <span>开户行名称：</span>
                  <div>
                    <input type="text"></input>
                  </div>
                </li>
                <li><span>开户行所在地：</span><div> <input type="text"></input></div></li>
                <li><span>银行账号：</span><div> <input type="text"></input></div></li>
                <li><span>确认银行账号：</span><div> <input type="text"></input></div></li>
              </ul>
              <div class="postcar_btn">
                  <a href="#" class="postcar_btn_red">添加</a>
                  <a href="#">取消</a>
              </div>
            </div>
             
             <div class="form-group" style="margin-top:50px; dislplay:none">
              <label for="plat">可提现金金额</label>
              <div class="form-control ame" style="width:300px; text-align:left;"><strong class="wd_org">100</strong>元</div>
             </div>
        <form id="form" role="form" action="<%=path%>/gate/dodrawMoney" method="post" target="_blank">
          <input type="hidden" id="host" name="host"/>
          <div class="form-group" style="display:none">
           <!-- <label for="platformNo">platformNo</label><input type="text"
              class="form-control" id="platformNo" name="platformNo" value="10040011137" />  -->
                <input type="text"class="form-control" id="platformNo" 
                 name="platformNo" value="${f.platformNo}" />  
                  <!--  name="platformNo" value="10012415118" />   -->
          </div>
          <div class="form-group" style="display:none">
            <label for="requestNo">requestNo</label><input type="text"
              class="form-control" id="requestNo" name="requestNo" value="${now}" />
          </div>
          <div class="form-group" style="display:none">
            <label for="platformUserNo">platformUserNo</label><input
              type="text" class="form-control" id="platformUserNo"
              name="platformUserNo"  value="${registerYeePay}"  />
          </div>
            <div class="form-group" style="display:none">
            <label for="feeMode">feeMode</label><input
              type="text" class="form-control" id="feeMode"
              name="feeMode"  value="${feeMode}"  />
          </div>
             <div class="form-group" >
            <label for="amount">提现金额</label><input
              type="text" class="form-control tixian_money" id="amount"
              name="amount"  value="提现金额不能为0"  style="color:#ccc"/>
          </div>
           
          <div class="form-group" style="display:none">
            <label for="notifyUrl">notifyUrl</label><input type="text"
              class="form-control" id="notifyUrl" name="notifyUrl" value="${f.notifyUrl}/gate/drawMoneyNotify" />
          </div>
          <div class="form-group" style="display:none">
            <label for="callbackUrl">callbackUrl</label><input
              type="text" class="form-control" id="callbackUrl"
              name="callbackUrl" value="${f.callbackUrl}/gate/drawMoneySucceed" />
          </div>
      
         <!--  <button onclick="onSubmit('http://qa.yeepay.com/member')" class="btn btn-default" style="display:none">QA</button> -->
          <div class="mar_que_top"><a onclick="onSubmit('${f.onSubmit}')" class="btn mar_btn" id="mysubmit_btn" style="color:#fff;" >确认</a></div>
        </form>
            <%--  <div class="add_postcar" style="display:none">
              <p>填写现金金额</p>
              <ul>
                <li><span>可提现金金额：</span><div><strong>0.00</strong>元（面提现手续费额度：0.00元）</div></li>
                <li>
                  <span>提现金额：</span>
                  <div><input type="text" class="jin_right"></input>元 <i style="display:none">请填写现金金额</i></div>
                </li>
                <li>
                  <span>手续费：</span>
                  <div>
                     <strong>0.00</strong>元（面提现手续费额度：0.00元）
                  </div>
                </li>
                <li><span>支付密码：</span><div> <input type="text"></input></div></li>
                <li><span>验证码：</span><div><input type="text"></input></div></li>
                <li><span></span><div> <input type="submit" class="sub" value="点击获取验证码"><a class="yzm" href="#">验证码</a></div></li>
              </ul>
              <div class="postcar_btn">
                  <a href="#" class="postcar_btn_red">添加</a>
                  <a href="#">取消</a>
              </div>
              <div class="postcar_btn">
                  <a href="<%=path%>/gate/binding" class="postcar_btn_org">绑卡</a>
                  <a href="#">取消</a>
              </div>
            </div>     --%>

          <div class="tishi ai" style="margin-top:50px;">
            <p><strong>温馨提示</strong></p>
            <ol>
              <li class="tishi_red">您充值的资金在24小时内不允许提现。</li>
              <li class="tishi_red">您充值的资金若未投资就提现，第三方支付公司会收取您提现金额的0.5%作为转账费用。</li>
              <li>您的账户资金将由第三方平台托管。</li>
              <li>为了您的资金安全，请您在充值前完成手机绑定，身份认证及支付密码设置。</li>
              <li>中租宝严禁信用卡充值、套现等行为，一经发现将予以处罚，包括但不限于：限制收款、冻结账户、永久停止服务， 并会影响银行征信记录。</li>
              <li>充值过程遇到问题，请联系客服，010-84243099/3199</li>
            </ol>          
          </div> 
          <div id="dialog01"  style="display:none; height:210px;">
	         <div class="dialog_title">
               <strong>温馨提示</strong>
	           <div class="right_cha"></div>
	         </div>
	         <div class="touzi_text">
	           <p style="background:url('../img/images-2014-11/renzheng01.png') 26px 7px no-repeat">如果您成功提现：<a href="<%=path%>/gate/service">查看我的资产</a></p>          
	         </div>
	         <div class="touzi_text">
	           <p style="background:url('../img/images-2014-11/renzheng02.png') 26px 7px no-repeat">如果您提现失败：<a href="<%=path%>/gate/drawMoney">重新提现</a> | <a  href="<%=path%>/contact.jsp">联系客服</a></p>          
	         </div>	       
            </div>                      
          </div> 
        </div>
      </div>
<!-- absolute_right start -->
	<%@ include file="/includes/absolute.jsp" %>
<!-- absolute_right end -->      
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
<div class="black_bac"></div>
</body>
<script type="text/javascript">

function onSubmit(host) {
	if(!checkval()){return false}
	  document.getElementById("host").value = host;
	  var form = document.getElementById("form");
	  document.getElementById("mysubmit_btn").disabled=true;

	    	var tixian_val=parseInt($(".tixian_money").val());
		    var old_amount=parseInt($(".wd_org").text());

	    	if(tixian_val=="提现金额不能为0" || tixian_val==""){
	    		alert("您输入的金额为空,请重新输入");	    	    		
	    	}    	
	    	 if(tixian_val>old_amount){
	    		alert("您提现的金额不能超出可提现金额");
	    		return false;	    		
	    	}else{
	    		  $("#dialog01").css("display","block");
	    		  $(".black_bac").css("display","block");
	    		  document.getElementById("mysubmit_btn").innerHTML="正在提交...";
	    		  //form.submit();
	    	}		
}

function checkval(){
	if($(".tixian_money").val()==0||$(".tixian_money").val()=="提现金额不能为0"||$(".tixian_money").val()==""){
		alert("提现金额不能为空!!");
		return false;
		}
	return true;
}
    var navIndex=3; 
    var indexs=1;
    $(document).ready(function(){
    	
    	$(".u_left_sec:eq(1) li:eq(2)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");   
    	$(".nav_big a").eq(2).children("p").addClass("headwd_color");
    	$(".tixian_money").focus(function(){ 
    		var tixian_val=$(".tixian_money").val();
    		if(tixian_val=="提现金额不能为0");
    		  $(".tixian_money").val("");
    		//alert("aa")		
    		
    	});
    	
    	$(".right_cha").click(function(){		  
    		 window.location.reload(true);  		  
    	});
    	

	    
	    
	    
	    
});

</script>
</html>