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
<title>安全设置 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;    
    $(document).ready(function(){
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
        $(".anquan_right").click(function(){
        	
            $(this).parent().siblings(".anquan_hide").slideToggle();
            
            if($(this).text()=="认证"){

               $(this).text("取消认证");

            }else if($(this).text()=="取消认证"){
              $(this).text("认证");
            }
            
            if($(this).text()=="修改"){

                $(this).text("取消修改");

             }else if($(this).text()=="取消修改"){
               $(this).text("修改");
             }
            
         }); 
         $(".u_left_mian").click(function(){
              $(this).siblings().slideToggle("slow");
            }); 
         $(".anquan_hide_btn").click(function(){
        	  $(this).parent().parent().parent().hide().siblings(".tijiao_checkok").show(); 
        	  //$(this).parent().parent().siblinds().children(".anquan_label").children(".yishe").css("display","block");
        	 $(this).parent().parent().parent().parent().siblings(".anquan_label").children(".yishe").css("display","block").siblings(".anquan_right").css("display","none");
        	 // alert(a)
         });
         $(".anquan_hide input").blur(function(){
        	 var val=$(this).val();                	        	 
        	 
        	 if( $(this).is('#phone') ){
         		
         		if(val==""){
         			$(this).parent().siblings(".tishitext").text("您的手机号为空，请重新填写。"); 	 
         		 }else if(val.length!=11){
         			$(this).parent().siblings(".tishitext").text("您的手机号填写不正确，请重新填写。"); 
         		 }else{
         			$(this).parent().siblings(".tishitext").text("您的手机号填写正确。"); 
         		 } 
         	 }   
        	       	 
        	 
        	 if($(this).is('#username')){
        		 var Expression=/[^\u4E00-\u9FA5]/;  
        		 if(val==""){         			  
         			  $(this).parent().siblings(".tishitext").text("您的姓名为空。");                     	 	                			
         		 }else if(Expression.test(val)){
         			 $(this).parent().siblings(".tishitext").text("您的姓名不正确！请重新填写。"); 
         		 }else{         			
         			  $(this).parent().siblings(".tishitext").text("您的姓名填写正确。");     		 
         		      }  
        		 
         	     function checkusername(val){            	    	          	     
         	    	       	    	
         	    	  if(Expression.test(val)==true){           	    		        	    	
         	    		return true;          	    		
         	    	}         	    	
         	      	  else{             	    	
         	    	    return false;          	    	  
         	    	}          	    	
         	     } 				  				  		  
		}
        		        	      	 
        	 if($(this).is('#card_id')){
        		 var reg = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;  
				  if($('#card_id').val()==""){

					   $(this).parent().siblings(".tishitext").text("您的身份证为空。");
					   return false;
					  }				  				  
				  else if(!reg.test($('#card_id').val())){
                      $(this).parent().siblings(".tishitext").text("您的身份证填写不正确。");
					   return false;      
        		 }else{
                      $(this).parent().siblings(".tishitext").text("您的身份证填写正确。");
					   return true;      
        		 }   				  				  
				  			  				  				 
			  }
        	         	 
        	 if($(this).is('#email')){				 
				   var cc= /^([a-zA-Z0-9]|[._])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;				  
				      if($('#email').val()==""){
      			    	$(this).parent().siblings(".tishitext").text("您的邮箱为空！请重新填写。");     
      			    	return false;
      			    } else if (!(cc.test($('#email').val()))){        			    	
      			    	$(this).parent().siblings(".tishitext").text("您的邮箱格式不正确！请重新填写。");     
      			    	return false;        				      			         				
      			  }else{       			           				  
      				   $(this).parent().siblings(".tishitext").text("您的邮箱填写正确。");     
      				    return true;        			
      			  }				  
			}   
        	 
      	 
        	 if( $(this).is('#file01') ){
         		
         		if(val==""){
         			$(this).parent().siblings(".tishitext").text("您的正面证件照为空。"); 
         		 }else{
         			$(this).parent().siblings(".tishitext").text("您的正面证件照上传成功。"); 
         		 } 
         	 }
        	 
        	 if( $(this).is('#file02') ){
          		
          		if(val==""){
          			$(this).parent().siblings(".tishitext").text("您的背面证件照为空。");  
          		 }else{
          			$(this).parent().siblings(".tishitext").text("您的背面证件照上传成功。"); 
          		 } 
          	 }
          	      	 
        	  if($(this).is('#newpassword')){
				   	   				
					var ps = $("#password").val();
					var pas = $("#newpassword").val();
					if(ps=="" || pas==""){						
					  $(this).parent().siblings(".tishitext").text("您的密码为空。");
						  return false;
					}else if(ps!=pas){

			          $(this).parent().siblings(".tishitext").text("兩次輸入的密碼不一致。");
						 return false;
					}else{						
					  $(this).parent().siblings(".tishitext").text("您的密码输入正确");
						  return true;
                       }
			 }
                   	  
        	  if($(this).is('#new_zhifu_password')){
 	   				
					var ps01 = $("#zhifu_password").val();
					var pas01 = $("#new_zhifu_password").val();
					
					if(ps01=="" || pas01==""){						
					  $(this).parent().siblings(".tishitext").text("您的密码为空。");
						  return false;
					}else if(ps01!=pas01){
			          $(this).parent().siblings(".tishitext").text("兩次輸入的密码输入不一致。");
						 return false;
					}else if(ps01==pas01){						
					  $(this).parent().siblings(".tishitext").text("兩次輸入一致。");
						  return true;
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

<div class="user_con">
    <div class="user_left">
      <!-- user_left start -->
           <%@ include file="/includes/user_info_left.jsp" %>
         <!-- user_left end -->
    </div>
          <div class="user_right">  
            <div class="zichan_con">        
               <div class="pro_con_title" style="margin-top:5px;"><strong>安全设置</strong>
                </div>
               <div class="con_list_new">
                 <ul class="anquan">
                   <li>
                        <div class="anquan_label">
                         <span>用户名</span>
                         <span>已设置</span>
                         <span>asdoi</span>
                        </div> 
                   </li>
                   <li >
                        <div class="anquan_label">
                         <span>实名认证</span>
                         <span class="yishe">已设置</span>
                         <span class="anquan_right">认证</span>
                        </div>
                       <div class="anquan_hide" style="display:none;">
                         <ul>
                           <li><span><strong>*</strong>用户名</span><span></span></li>
                           <li>
                             <span><strong>*</strong>真实姓名</span>
                             <span><input type="text" id="username"></input></span> 
                             <span class="tishitext" style="width:auto;"></span> 
                           </li>
                           <li>
                             <span><strong>*</strong>证件类型</span>
                             <span>
	                          <select>
	                              <option value="">身份证</option>
	                              <option value="">军官证</option>
	                              <option value="">台胞证</option>
	                              <option value="">护照</option>
	                          </select>
                             </span>
                            </li>
                           <li><span><strong>*</strong>身份证号码</span><span><input type="text" id="card_id"></input></span><span class="tishitext" style="width:auto"></span></li>
                           <li><span><strong>*</strong>上传正面证件照</span><span><input type="file" id="file01"></input></span><span class="tishitext" style="width:auto"></span></li>
                           <li id="pic_height"><span></span><span id="postcar"><div></div></span></li>
                           <li><span><strong>*</strong>上传背面证件照</span><span><input type="file" id="file02"></input></span><span class="tishitext" style="width:auto"></span></li>
                           <li id="pic_height"><span></span><span id="postcar"><div></div></span></li>
                           
                           <li id="text-align_style">  
                                <span style="width:300px;" id="text-align_style"><input type="checkbox" class="box_wh"></input>我已阅读并同意签署 <a href="#" class="wd_color">《中租宝服务协议》</a></span>    
                           </li>
                           <li id="text-align_style">  
                                <span style="width:300px;" id="text-align_style"><input type="checkbox" class="box_wh"></input>我已阅读并同意签署 <a href="#" class="wd_color">《委托收付资金协议》</a></span>    
                           </li>
                           <li><span><a href="#" class="anquan_hide_btn">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                   </li>
                   <li style="display:none">
                       <div class="anquan_label">
                         <span>手机认证</span>
                         <span class="yishe">已设置</span>
                         <span class="anquan_right">认证</span>
                        </div>
                       <div class="anquan_hide" style="display:block">
                          <ul>
                           <li><span><strong>*</strong>手机号码</span>
                               <span><input type="text" id="phone"></input></span> 
                               <span class="tishitext" style="width:auto"></span>
                           </li>
                           <li><a class="sent">获取验证码</a></li>
                           <li><span><strong>*</strong>短信验证码</span><span><input type="text"></input></span></li>
                           <li><span><a href="#" class="anquan_hide_btn">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                   </li>
                   <li>
                        <div class="anquan_label">
                         <span>邮箱验证</span>
                         <span class="yishe">已设置</span>
                         <span class="anquan_right">认证</span>
                        </div>
                       <div class="anquan_hide" style="display:none">
                          <ul>
                           <li><span><strong>*</strong>邮箱验证</span><span><input type="text" id="email"></input></span><span class="tishitext" style="width:auto;"></span></li>
                           <li><span><a href="#" class="anquan_hide_btn">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                   </li>
                   <li >
                       <div class="anquan_label">
                         <span>登录密码</span>
                         <span class="yishe">已设置</span>
                         <span class="anquan_right">修改</span>
                        </div>
                       <div class="anquan_hide" style="display:none">
                          <ul>
                           <li><span><strong>*</strong>原登录密码</span><span><input type="text" ></input></span></li>
                           <li><span><strong>*</strong>新登录密码</span><span><input type="text" id="password"></input></span></li>
                           <li><span><strong>*</strong>再次输入登录密码</span><span><input type="text" id="newpassword"></input></span><span class="tishitext" style="width:auto"></span></li>
                           <li><span><a href="#" class="anquan_hide_btn">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                   </li>
                   <li style="display:block">
                       <div class="anquan_label" style="display:none">
                         <span>支付密码</span>
                         <span class="yishe">已设置</span>
                         <span class="anquan_right">认证</span>
                        </div>
                       <div class="anquan_hide" style="display:none">
                          <ul>
                           <li><span><strong>*</strong>输入支付密码</span><span><input type="text" id="zhifu_password"></input></span></li>
                           <li><span><strong>*</strong>再次输入支付密码</span><span><input type="text" id="new_zhifu_password"></input></span><span class="tishitext" style="width:auto"></span></li>
                           <li><span><a href="#" class="anquan_hide_btn">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                   </li>
                   <li style="display:none">
                        <div class="anquan_label">
                         <span>密码保护</span>
                         <span class="yishe">已设置</span>
                         <span class="anquan_right">认证</span>
                        </div>
                       <div class="anquan_hide">
                          <ul>
                           <li><span><strong>*</strong>请选择问题</span>
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
                          </li>
                           <li><span><strong>*</strong>输入答案</span><span><input type="text"></input></span></li>
                           <li><span><a href="#" class="anquan_hide_btn">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                   </li>
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