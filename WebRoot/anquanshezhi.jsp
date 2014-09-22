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
              <ul style="display:block">
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
	             <div class="yincang">      
	               <p><span>用户名</span><span><input type="text"></input></span></p>
		              <p><span>真实姓名</span><span><input type="text"></input></span></p>
		              <p><span>证件类型</span>
		                 <span>
		                     <select>
		                        <option value="">身份证</option>
								<option value="">军官证</option>
								<option value="">台胞证</option>
								<option value="">护照</option>
							 </select>
						</span>
					  </p>
		              <p><span>身份证号</span><span><input type="text"></input></span></p>
		              <div class="hide_car" style="display:none">
			              <p><span> 上传正面证件照</span><span><a class="huoqu">上传照片</a></span></p>
			              <p class="pic_car"></p>
			              <p><span> 上传背面证件照</span><span><a class="huoqu">上传照片</a></span></p>
			              <p class="pic_car"></p>
		              </div>
		              <p><span><input type="checkbox"></input></span><span style="width:300px">我已阅读并同意签署 《中投汇服务协议》</span></p>
		              <p><span><input type="checkbox"></input></span><span style="width:312px">我已阅读并同意签署 《委托收付资金协议》</span></p>
		              <p><input type="submit" value="提交实名认证" class="sub_m"></input><a class="aa">采用上传认证</a></p>               
	               <div class="user_bottom01" style="height:200px">
		            <h3>温馨提示:</h3>
			            <ol>
			              <li>请谨慎填写身份验证信息，因为调用公安局的验证接口需要支付5元费用，爱投资会为用户垫付首次验证费用。</li>
			              <li>您还可选择通过上传身份证的形式通过身份验证，通过 上传认证 完成实名认证，然后等待客服人员审核通过。</li>
			              <li>未满18周岁，实名认证无法通过。</li>
			              <li>爱投资会对用户的所有资料进行严格保密。</li>
			              <li>实名认证过程遇到问题，请联系客服，400-600-4300</li>		              
			            </ol>		            	            
                   </div>
	             </div>
	           </div>
	           <div class="clear"></div>
	           <div class="renzheng">
	             <div class="ren_h">
		             <span><i></i>手机认证</span>
		             <span></span>
		             <span class="ren_right">认证</span>
	             </div>
	             <div class="yincang">
		              <p><span>手机号码</span><span><input type="text"></input></span><span><a class="huoqu">获取验证码</a></span></p>
		              <p><span>短信验证码</span><span><input type="text"></input></span></p>
		              <p><a class="next_btn">下一步</a></p>
		              <div class="user_bottom01">
			            <h3>温馨提示:</h3>
			            <ol>
			              <li>请填写真实有效的手机号，手机号将作为验证用户身份的重要手段。</li>
			              <li>中投汇会对用户的所有资料进行严格保密。 </li>
			              <li>手机认证过程遇到问题，请联系客服，400-600-4300。</li>
			            </ol>
                      </div>        	             
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
		              <p><span>邮箱验证</span><span><input type="text"></input></span></p> 
		              <p><a class="next_btn">发送验证邮件</a></p>
		              <div class="user_bottom01">
			            <h3>温馨提示:</h3>
			            <ol>
			              <li>请填写真实有效的邮箱地址，您可通过邮箱进行找回密码等操作。</li>
			              <li>中投汇会对用户的所有资料进行严格保密。 </li>
			              <li>邮箱验证过程遇到问题，请联系客服，400-600-4300 </li>
			            </ol>
                      </div>        	             
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
		              <p><span>原登录密码</span><span><input type="text"></input></span></p>
		              <p><span>新登录密码</span><span><input type="text"></input></span></p>
		              <p><span>再次输入新登录密码</span><span><input type="text"></input></span></p>
		              <p><a class="next_btn">修改登录密码</a></p>
		              <div class="user_bottom01">
			            <h3>温馨提示:</h3>
			            <ol>
			              <li>请牢记您设置的新密码，登录密码可通过密码找回功能找回。</li>
			              <li>邮箱验证过程遇到问题，请联系客服，400-600-4300 </li>
			            </ol>
                      </div>        	             
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
		              <p><span>输入支付密码</span><span><input type="text"></input></span></p>
		              <p><span>再次输入支付密码</span><span><input type="text"></input></span></p>
		              <p><a class="next_btn">设置支付密码</a></p>
		              <div class="user_bottom01">
			            <h3>温馨提示:</h3>
			            <ol>
			              <li>请牢记您设置的支付密码，支付密码将用于投资，提现等重要操作。</li>
			              <li>使用过程遇到问题，请联系客服，400-600-4300 </li>
			            </ol>
                      </div>        	             
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
			              <li>使用过程遇到问题，请联系客服，400-600-4300 </li>
			            </ol>
                      </div>        	             
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