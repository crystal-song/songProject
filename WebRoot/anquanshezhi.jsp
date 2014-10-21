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
<title>安全设置 - 我的账户 - 中汇宝</title>
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
        	 $('.ren_pass').css('display','none');
         });
      
         $('.next_btn').click(function(){
 
        	$(this).parent().parent().parent().children().children('.ren_right').html('修改')
        	$(this).parent().parent().parent().children('.ren_pass').css('display','block');
        	$(this).parent().parent('.yincang').css('display','none');
         });
              
         $(".yincang input").blur(function(){
        	 var val=$(this).val();
        	 
        	 if( $(this).is('#phone') ){
        		var phone= $('#phone').parent().parent().children('.tishitext');
        		if(val.length!=11||val==""){
        			 phone.css('display','block');	 
        		 }else{
        			 phone.css('display','none')
        		 } 
        	 }
        	 
        	 if( $(this).is('#username') ){
         		var username = $('#username').parent().parent().children('.tishitext');
         		if(val=="" || checkusername(val)){
         			username.css('display','block');
         		 }else{
         			username.css('display','none');	
         		 } 
         		 
         	     function checkusername(str){
         	    	var Expression=/[^\u4E00-\u9FA5]/; 
         	    	var objExp=new RegExp(Expression);
         	    	if(objExp.test(val)==true){
         	    	  return true;       	    
         	    	}else{
         	    	  return false;
         	    	}        	    	 	  
         	     }
        	 }   
        	 
        	 
        	 if( $(this).is('#carno') ){
         		var carno= $('#carno').parent().parent().children('.tishitext');
         		if(isCardNo(val)){
         			 carno.css('display','block');	 
         		 }else{
         			 carno.css('display','none')
         		 } 
         		
         		function isCardNo(card)  
         		{  
         		   // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
         		   var reg = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;  
         		   if(reg.test(card))  
         		   {     
         		     alert('ok')
         		   } else{
         			  alert('fail')
         		   } 
         		}  
         		
         	 }
         	 
        	 if( $(this).is('#file01') ){
         		var file01= $('#file01').parent().parent().children('.tishitext');
         		if(val==""){
         			 file01.css('display','block');	 
         		 }else{
         			 file01.css('display','none')
         		 } 
         	 }
        	 
        	 if( $(this).is('#file02') ){
          		var file02= $('#file02').parent().parent().children('.tishitext');
          		if(val==""){
          			 file02.css('display','block');	 
          		 }else{
          			 file02.css('display','none')
          		 } 
          	 }
        	 
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
   <div class="msg_right">
       <div class="msg_main">
           <div class="msg_title">
             <h2>安全设置</h2>
           </div>
           <div class="user_con01">
               <div class="renzheng">
	             <div class="ren_h">
		             <span><i></i>用户名</span>
		             <span>****</span>       
	             </div>	             
	           </div>                 
	           <div class="renzheng">
	             <div class="ren_h">    
		             <span><i></i>实名认证</span>
		             <span></span>
		             <span class="ren_right" >认证</span>
	             </div>
	             <div class="yincang" style="display:none">  
	              <span><b>*</b>为必填项</span>    
	                  <p><span><b></b>用户名</span><span style="text-align:left">****</span></p>
		              <p><span><b>*</b>真实姓名</span><span><input type="text" id="username"></input></span><span class="tishitext" style="display:none">请输入正确的中文名!</span></p>
		              <p><span><b>*</b>证件类型</span>
		                 <span>
		                     <select>
		                        <option value="">身份证</option>
								<option value="">军官证</option>
								<option value="">台胞证</option>
								<option value="">护照</option>
							 </select>
						</span>
						<span class="tishitext" style="display:none">请选择证件类型!</span>
					  </p>
		              <p><span><b>*</b>身份证号</span><span><input type="text" id="carno"></input></span><span class="tishitext" style="display:none">请输入18位有效证件号!</span></p>
		              <div class="hide_car">
			              <p><span><b>*</b>上传正面证件照</span><span><input type="file" id="file01"></input></span></p>		              
			              <p class="pic_car"></p>
			              <p><span><b>*</b>上传背面证件照</span><span><input type="file" id="file02"></input></span></p>			              
			              <p class="pic_car"></p>			              
		              </div>
		              <p><span><input type="checkbox"></input></span><span style="width:300px"><a class="xieyi">我已阅读并同意签署 《中汇宝服务协议》</a></span><span class="tishitext" style="display:none">请签署协议!</span></p>
		              <p><span><input type="checkbox"></input></span><span style="width:312px"><a>我已阅读并同意签署 《委托收付资金协议》</a></span><span class="tishitext" style="display:none">请签署协议!</span></p>
		              <p><a class="next_btn">提交实名认证</a>               
	               <div class="user_bottom01" style="height:200px">
		            <h3>温馨提示:</h3>
			            <ol>
			              <li>您可选择通过上传身份证的形式通过身份验证，通过 上传认证 完成实名认证，然后等待客服人员审核通过。</li>
			              <li>未满18周岁，实名认证无法通过。</li>
			              <li>中汇宝会对用户的所有资料进行严格保密。</li>
			              <li>实名认证过程遇到问题，请联系客服，010-84243099/3199</li>		              
			            </ol>		            	            
                   </div>
	             </div>
	             <div class="ren_pass" style="display:none">
	                   <strong>恭喜您实名认证成功</strong>    
	             </div>
	           </div>
	           <div class="clear"></div>
	           <div class="renzheng">
	             <div class="ren_h">
		             <span><i></i>手机认证</span>
		             <span></span>
		             <span class="ren_right">认证</span>
	             </div>
	             <div class="yincang" style="display:none">
		              <p><span><b>*</b>手机号码</span><span><input type="text" id="phone"></input></span><span><a class="huoqu">获取验证码</a></span><span class="tishitext" style="display:none">请输入正确的手机号!</span></p>
		              <p><span><b>*</b>短信验证码</span><span><input type="text"></input></span><span class="tishitext" style="display:none">验证码错误!</span></p>
		              <p><a class="next_btn">下一步</a></p>
		              <div class="user_bottom01">
			            <h3>温馨提示:</h3>
			            <ol>
			              <li>请填写真实有效的手机号，手机号将作为验证用户身份的重要手段。</li>
			              <li>中汇宝会对用户的所有资料进行严格保密。 </li>
			              <li>手机认证过程遇到问题，请联系客服，010-84243099/3199。</li>
			            </ol>
                      </div>        	             
	             </div>
	             <div class="ren_pass" style="display:none">
	                   <strong>恭喜您手机认证成功</strong>    
	             </div>
	           </div>
	           <div class="clear"></div>
	           <div class="renzheng">
	             <div class="ren_h">
		             <span><i></i>邮箱验证</span>
		             <span>***@sina.com</span>
		             <span class="ren_right">验证</span>
	             </div>
	             <div class="yincang">
		              <p><span><b>*</b>邮箱验证</span><span><input type="text"></input></span><span class="tishitext" style="display:none">请输入正确格式邮箱!</span></p> 
		              <p><a class="next_btn">发送验证邮件</a></p>
		              <div class="user_bottom01">
			            <h3>温馨提示:</h3>
			            <ol>
			              <li>请填写真实有效的邮箱地址，您可通过邮箱进行找回密码等操作。</li>
			              <li>中汇宝会对用户的所有资料进行严格保密。 </li>
			              <li>邮箱验证过程遇到问题，请联系客服，010-84243099/3199。 </li>
			            </ol>
                      </div>        	             
	             </div>
	             <div class="ren_pass" style="display:none">
	                   <strong>已向您的邮箱发送一封邮件</strong>  
	                   <a class="ren_org" href="http://mail.sina.com.cn/">前往查看</a>  
	             </div>
	           </div>
	           <div class="clear"></div>
	           <div class="renzheng">
	             <div class="ren_h">
		             <span><i></i>登录密码</span>
		             <span>已设置</span>
		             <span class="ren_right">修改</span>
	             </div>
	             <div class="yincang">
		              <p><span><b>*</b>原登录密码</span><span><input type="text"></input></span></p>
		              <p><span><b>*</b>新登录密码</span><span><input type="text"></input></span><span class="tishitext"></span></p>
		              <p><span><b>*</b>再次输入新登录密码</span><span><input type="text"></input></span><span class="tishitext" style="display:none">密码不一致,请从新输入!</span></p>
		              <p><a class="next_btn">修改登录密码</a></p>
		              <div class="user_bottom01">
			            <h3>温馨提示:</h3>
			            <ol>
			              <li>请牢记您设置的新密码，登录密码可通过密码找回功能找回。</li>
			              <li>邮箱验证过程遇到问题，请联系客服，010-84243099/3199 </li>
			            </ol>
                      </div>        	             
	             </div>
	             <div class="ren_pass" style="display:none">
	                   <strong>恭喜您登录密码设置成功</strong>    
	             </div>
	           </div>
	           <div class="clear"></div>
	           <div class="renzheng">
	             <div class="ren_h">
		             <span><i></i>支付密码</span>
		             <span>未设置</span>
		             <span class="ren_right">设置</span>
	             </div>
	             <div class="yincang">
		              <p><span><b>*</b>输入支付密码</span><span><input type="text"></input></span></p>
		              <p><span><b>*</b>再次输入支付密码</span><span><input type="text"></input></span></p>
		              <p><a class="next_btn">设置支付密码</a></p>
		              <div class="user_bottom01">
			            <h3>温馨提示:</h3>
			            <ol>
			              <li>请牢记您设置的支付密码，支付密码将用于投资，提现等重要操作。</li>
			              <li>使用过程遇到问题，请联系客服，010-84243099/3199</li>
			            </ol>
                      </div>        	             
	             </div>
	             <div class="ren_pass" style="display:none">
	                   <strong>恭喜您支付密码设置成功</strong>    
	             </div>
	           </div>
	           <div class="clear"></div>
	           <div class="renzheng">
	             <div class="ren_h">
		             <span><i></i>密码保护</span>
		             <span>未设置</span>
		             <span class="ren_right">设置</span>
	             </div>
	             <div class="yincang">
		              <p><span>请选择问题</span>
		                  <span>
		                     <select>
		                        <option value="8">你孩子的名字叫什么</option>
								<option value="9">你孩子的生日是哪天</option>
								<option value="1">你爸爸的名字叫什么</option>
								<option value="2">你爸爸的生日是哪天</option>
								<option value="3">你妈妈的名字叫什么</option>
								<option value="4">你妈妈的生日是哪天</option>
								<option value="5">最难忘的日子</option>
								<option value="6">你的学号是多少</option>
								<option value="7">你的老家在哪里</option>
		                     </select>
		                  </span>
		              </p>
		              <p><span>再次输入支付密码</span><span><input type="text"></input></span></p>
		              <p><a class="next_btn">设置支付密码</a></p>
		              <div class="user_bottom01">
			            <h3>温馨提示:</h3>
			            <ol>
			              <li>请牢记您设置的密码保护问题，密码问题将用于找回密码等重要操作。</li>
			              <li>使用过程遇到问题，请联系客服，010-84243099/3199</li>
			            </ol>
                      </div>        	             
	             </div>
	             <div class="ren_pass" style="display:none">
	                   <strong>恭喜您密码保护设置成功</strong>    
	             </div>
	           </div>
	           <div class="clear"></div>	           
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