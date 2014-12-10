<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mftour.spring.service.IUserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>安全设置 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="<%=path%>/js/sms.js" ></script>
<script type="text/javascript">
    var navIndex=3;  
    var indexs=0;
/*  
    function onSubmit() {
		if($("#mail").val()==""){
			alert("邮箱不能为空!");
			return false;
			}
		
		// $(this).parent().parent().parent().hide().siblings(".tijiao_checkok").show(); 
  	  
  	    // $(this).parent().parent().parent().parent().siblings(".anquan_label").children(".yishe").css("display","block").siblings(".anquan_right").css("display","none");
  /*      
	  $(".anquan_hide_btn").click(function(){
        	  $(this).parent().parent().parent().hide().siblings(".tijiao_checkok").show(); 
        	  //$(this).parent().parent().siblinds().children(".anquan_label").children(".yishe").css("display","block");
        	  $(this).parent().parent().parent().parent().siblings(".anquan_label").children(".yishe").css("display","block").siblings(".anquan_right").css("display","none");
        	 // alert(a)
         });
		 
	
		var form = document.getElementById("form");
	    document.getElementById("anquan_hide_btn").disabled=true;
	    document.getElementById("anquan_hide_btn").innerHTML="正在提交...";
		form.submit();
	}
	*/	
    /*
    function onSubmitone() {
    	
		if($("#realName").val()=="" ){
			alert("您的信息没有填写完整，请重新填写");
			return false;
			}

		var formone = document.getElementById("formone");
	    document.getElementById("anquan_hide_btn").disabled=true;
	    document.getElementById("anquan_hide_btn").innerHTML="正在提交...";
		formone.submit();
	}
   */
    $(document).ready(function(){
    	$(".u_left_sec:first li:eq(1)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    /*	
    	 function onSubmit() {
    			if($("input").val()==""){
    				alert("充值金额不能为0!");
    				return false;}
    			$(this).parent().parent().parent().hide().siblings(".tijiao_checkok").show(); 
    	  	  //$(this).parent().parent().siblinds().children(".anquan_label").children(".yishe").css("display","block");
    	  	  $(this).parent().parent().parent().parent().siblings(".anquan_label").children(".yishe").css("display","block").siblings(".anquan_right").css("display","none");
    	
    	 }
    */
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
         
       
         
         $(".anquan_hide input").blur(function(){
        	 var val=$(this).val();                	        	 
        	 if($(this).is("#answer")){
       		  
       		  if(val==""){
       			  $(this).parent().siblings(".tishitext").text("您输入的答案为空！请重新输入");
       			  
       		  }
       		  
       	  }
        	 if( $(this).is('#phone') ){
         		
         		if(val==""){
         			$(this).parent().siblings(".tishitext").text("您的手机号为空，请重新填写。"); 	 
         		 }else if(val.length!=11){
         			$(this).parent().siblings(".tishitext").text("您的手机号填写不正确，请重新填写。"); 
         		 }else{
         			$(this).parent().siblings(".tishitext").text("您的手机号填写正确。"); 
         		 } 
         	 }          	       	 
        	 
        	 if($(this).is('#realName')){
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
        		        	      	 
        	 if($(this).is('#identityCard')){
        		 var reg = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;  
				  if($('#identityCard').val()==""){

					   $(this).parent().siblings(".tishitext").text("您的身份证为空。");
					   return false;
					  }				  				  
				  else if(!reg.test($('#identityCard').val())){
                      $(this).parent().siblings(".tishitext").text("您的身份证填写不正确。");
					   return false;      
        		 }else{
                      $(this).parent().siblings(".tishitext").text("您的身份证填写正确。");
					   return true;      
        		 }   				  				  
				  			  				  				 
			  }
        	         	 
        	 if($(this).is('#mail')){				 
				   var cc= /^([a-zA-Z0-9]|[._])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;				  
				      if($('#mail').val()==""){
      			    	$(this).parent().siblings(".tishitext").text("您的邮箱为空！请重新填写。");     
      			    	return false;
      			    } else if (!(cc.test($('#mail').val()))){        			    	
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
          
     	$(window).on('scroll', function(){
	        if($(window).scrollTop()<500){
	            $(".absolute_bac1").hide();
	        }
	        if($(window).scrollTop()>=500){
	            $(".absolute_bac1").show(); 
	        }
	      });
	            $(".absolute_bac1").click(function(){
	               $("html,body").animate({scrollTop:0},500);  		            
	            });	 
     
});

  //js本地图片预览，兼容ie[6-9]、火狐、Chrome17+、Opera11+、Maxthon3、360浏览器
    function PreviewImage(fileObj,imgPreviewId,divPreviewId){
         var allowExtention=".jpg,.bmp,.gif,.png";//允许上传文件的后缀名document.getElementById("hfAllowPicSuffix").value;
         var extention=fileObj.value.substring(fileObj.value.lastIndexOf(".")+1).toLowerCase();            
         var browserVersion= window.navigator.userAgent.toUpperCase();
         if(allowExtention.indexOf(extention)>-1){ 
             if(fileObj.files){//兼容chrome、火狐7+、360浏览器5.5+等，应该也兼容ie10，HTML5实现预览
                if(window.FileReader){
                     var reader = new FileReader(); 
                     reader.onload = function(e){
                         document.getElementById(imgPreviewId).setAttribute("src",e.target.result);
                     }  
                     reader.readAsDataURL(fileObj.files[0]);
                 }else if(browserVersion.indexOf("SAFARI")>-1){
                     alert("不支持Safari浏览器6.0以下版本的图片预览!");
                 }
             }else if (browserVersion.indexOf("MSIE")>-1){//ie、360低版本预览
                if(browserVersion.indexOf("MSIE 6")>-1){//ie6
                     document.getElementById(imgPreviewId).setAttribute("src",fileObj.value);
                 }else{//ie[7-9]
                     fileObj.select();
                     if(browserVersion.indexOf("MSIE 9")>-1)
                         fileObj.blur();//不加上document.selection.createRange().text在ie9会拒绝访问
                    var newPreview =document.getElementById(divPreviewId+"New");
                     if(newPreview==null){
                         newPreview =document.createElement("div");
                         newPreview.setAttribute("id",divPreviewId+"New");
                         newPreview.style.width = document.getElementById(imgPreviewId).width+"px";
                         newPreview.style.height = document.getElementById(imgPreviewId).height+"px";
                         newPreview.style.border="solid 1px #d2e2e2";
                     }
                     newPreview.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + document.selection.createRange().text + "')";                            
                     var tempDivPreview=document.getElementById(divPreviewId);
                     tempDivPreview.parentNode.insertBefore(newPreview,tempDivPreview);
                     tempDivPreview.style.display="none";                    
                 }
             }else if(browserVersion.indexOf("FIREFOX")>-1){//firefox
                 var firefoxVersion= parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);
                 if(firefoxVersion<7){//firefox7以下版本
                    document.getElementById(imgPreviewId).setAttribute("src",fileObj.files[0].getAsDataURL());
                 }else{//firefox7.0+                    
                     document.getElementById(imgPreviewId).setAttribute("src",window.URL.createObjectURL(fileObj.files[0]));
                 }
             }else{
                 document.getElementById(imgPreviewId).setAttribute("src",fileObj.value);
             }         
         }else{
             alert("仅支持"+allowExtention+"为后缀名的文件!");
             fileObj.value="";//清空选中文件
            if(browserVersion.indexOf("MSIE")>-1){                        
                 fileObj.select();
                 document.selection.clear();
             }                
             fileObj.outerHTML=fileObj.outerHTML;
         }
     }
  function updatePassword(){
	  if($('#oldPassword').val() != ''){
	    	if($('#password').val() != ''){
	            $.ajax({
	                type: 'POST',
	                url: '<c:url value="/user/updatePasswordajax"/>',
	                data: 'oldPassword='+$('#oldPassword').val()+'&password='+$('#password').val(),
	                dataType: 'text',
	                success: function(data) {
	                    if(data == '"success"') {
	                    	alert("密码修改成功！"); 
	                    } 
	                }
	            });
	        }else{
	             alert('请输入原始密码！ ');
	        }
	     }else{
	     	alert('请输入新密码！');
	     }   
  }
  function passwordProtection(){
	  if($('#answer').val()!=''){
	            $.ajax({
	                type: 'POST',
	                url: '<c:url value="/user/passwordProtection"/>',
	                data: 'answer='+$('#answer').val(),
	                dataType: 'text',
	                success: function(data) {
	                    if(data == '"success"') {
	                    	alert("密码保护设置成功！"); 
	                    } 
	                }
	            });
	            }else{
	            	alert("请输入小于25个字的答案！")
	            }
  }
  function checkAnswer(){
		if ($('#answer').val() != '') {
			$.ajax({
				type : 'POST',
				url : '<c:url value="/user/checkAnswer"/>',
				data : 'name=' + $('#name').val()+'&answer='+$('#answer').val(),
				dataType : 'text',
				success : function(data) {
					if (data == '"success"') {
						$("#Tip_Answer").html(
								'<span class="tip_p01" >答案正确！</span>');
						$("#ensure").removeAttr("disabled");
					} else {
						$("#Tip_Answer").html(
								'<span class="tip_f01" >答案不正确！</span>');
						$("#ensure").attr("disabled",true);
					}
				}
			});
		}else{
			$("#ensure").attr("disabled",true);
			$("#Tip_Answer").html(
			'<span class="tip_f01">答案为空！</span>');
			
		}
	}
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
                        <div class="anquan_label label1">
                         <span>用户名</span>
                         <span>已设置</span>
                         <span>${name}</span>
                        </div> 
                   </li>
                
                   <li style="display:none">
                   <form action="<%=path%>/welcome/identityCardVerification" method="post" enctype="multipart/form-data" id="formone">
                        <div class="anquan_label label2">
                         <span>实名认证</span>
                          <c:if test="${userinfo.identityCard!=null}">
                            <span>已设置</span>
                     	  </c:if>
	                      <c:if test="${userinfo.identityCard==null}">
	                        <span class="anquan_right">认证</span>
	                      </c:if>
                        </div>
                       <div class="anquan_hide" style="display:none;">
                         <ul>
                           <li>
                             <span><strong>*</strong>用户名</span>
                             <span><input type="text" id="name" name="name" value="${name}"></input></span> 
                           </li>
                           <li>
                           <span><strong>*</strong>真实姓名</span>
                           <span><input type="text" id="realName" name="realName"></input></span> 
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
                           <li><span><strong>*</strong>身份证号码</span>
                           <span>
                           <input type="text" id="identityCard" name="identityCard"></input>
                           </span><span class="tishitext" style="width:auto"></span>
                           </li>
                           <li>
                             <span><strong>*</strong>上传正面证件照</span>
                             <span><input type="file" id="file01" name="myfiles" onchange="PreviewImage(this,'imgHeadPhoto1','divPreview1')" size="20"/></span><span class="tishitext" style="width:auto"></span></li>
                           <li id="pic_height"><span></span>
                            <span id="postcar">
                            <div id="divPreview1">
      						 <img id="imgHeadPhoto1" src="" style="width: 200px; height: 200px; border: solid 1px #d2e2e2;" alt="" />
 							</div>
 							</span>
 						   </li>                         
                         <li><span><strong>*</strong>上传背面证件照</span><span>  <input type="file" id="file02" name="myfiles" onchange="PreviewImage(this,'imgHeadPhoto2','divPreview2')" size="20"/></span><span class="tishitext" style="width:auto"></span></li>
                          <li id="pic_height"><span></span>
                          <span id="postcar"> 
                            <div id="divPreview2">
      						 <img id="imgHeadPhoto2" src="" style="width: 200px; height: 200px; border: solid 1px #d2e2e2;" alt="" />
 						    </div>
				 		  </span>
				 		  </li>
                           <li id="text-align_style" style="display:none">  
                                <span style="width:300px;" id="text-align_style">
                                <input type="checkbox" class="box_wh"></input>我已阅读并同意签署 <a href="<%=path%>/zhucexieyi.jsp" class="wd_color">《中租宝服务协议》</a></span>    
                           </li>
                           <li id="text-align_style" style="display:none">  
                                <span style="width:300px;" id="text-align_style"><input type="checkbox" class="box_wh"></input>我已阅读并同意签署 <a href="<%=path%>/yinsitiaokuan.jsp" class="wd_color">《委托收付资金协议》</a></span>    
                           </li>
                           <li><span></span><span><a onclick="onSubmitone()"    class="anquan_hide_btn" style="width:80px; float:left;">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                       </form>
                   </li>
                   <li style="display:none">
                   <form action="<%=path %>/welcome/phoneVerification" method="post">
                       <div class="anquan_label label3">
                         <span>手机认证</span>
                          <c:if test="${userinfo.phone!=null}">
                         <span>已设置</span>
                     	</c:if>
                     	<c:if test="${userinfo.phone==null}">
                         <span class="anquan_right">认证</span>
                        </c:if>
                        </div>
                        <form action="<%=path%>/welcome/phoneVerification">
                       <div class="anquan_hide" style="display:block">
                          <ul>
                           <li><span><strong>*</strong>手机号码</span><span><input type="text" id="jbPhone"></input></span> <span id="jbPhoneTip" class="tishitext" style="display:block"></span></li>
                           <li><input type="button" id="btnSendCode" name="btnSendCode" value="免费获取验证码" onclick="sendMessage()" /></li>
                           <li><span><strong>*</strong>短信验证码</span><span><input type="text" id="SmsCheckCode" name="SmsCheckCode" ></input></span></li>
                           <li><span><input type="button" value="提交"></input></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">手机认证成功！</div>
                       </div>
                       </form>
                   </li>
                   <li>
                        <div class="anquan_label label4">
                         <span>邮箱验证</span>
                         
                        <c:if test="${userinfo.regState=='s'}">
                         <span>已设置</span>
                     	</c:if>
                     	<c:if test="${userinfo.regState==null||userinfo.regState=='f'}">
                         <span class="anquan_right">认证</span>
                        </c:if>
                        </div>
                       <div class="anquan_hide" style="display:none">
                          <ul>
                          <form action="<%=path %>/welcome/emailVerification" method="post" id="form">
                           <li><span><strong>*</strong>邮箱验证</span><span><input type="text" id="mail" name="mail"></input></span><span class="tishitext" style="width:auto;"></span></li>
                           <li><span></span><a value="提交"  class="anquan_hide_btn" style="width:80px;" onclick="onSubmit()">提交</a></li>
                         </form>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">邮箱验证成功,请重新登录！</div>
                       </div>
                   </li>
                   <li >
                        <div class="anquan_label label5">
                         <span>登录密码</span>
                         <span class="anquan_right">修改</span>
                        </div>
                       <div class="anquan_hide" style="display:none">
                      
                          <ul>
                           <li><span><strong>*</strong>原登录密码</span><span><input type="password" id="oldPassword" name="oldPassword"></input></span></li>
                           <li><span><strong>*</strong>新登录密码</span><span><input type="password" id="password" name="password"></input></span></li>
                           <li><span><strong>*</strong>再次输入登录密码</span><span><input type="password" id="newpassword"></input></span><span class="tishitext" style="width:auto"></span></li>
                          
                           <c:if test="${userinfo.answer!=bull}">
                           <li><span><strong>*</strong>请选择问题：</span><span>
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
						 <li><span><strong>*</strong>请输入答案：</span><span><input type="text" id="answer" name="answer" onblur="checkAnswer()"></input></span><span id="Tip_Answer"></span></li>
                           </c:if>
                         <li><span></span><span><input type="button" class="anquan_hide_btn" value="提交" onclick="updatePassword();" id="ensure" style="width:80px; float:left;"/></span></li>
                         </ul>
                    
                         <div class="tijiao_checkok" style="display:none">密码修改成功,请重新登录！</div>
                       </div>
                   </li>
                   <li style="display:block">
                       <div class="anquan_label label6" style="display:none">
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
                        <div class="anquan_label label7">
                         <span>密码保护</span>
                         
                         <c:if test="${userinfo.answer!=null}">
                         <span>已设置</span>
                     	</c:if>
                     	<c:if test="${userinfo.answer==null}">
                         <span class="anquan_right">认证</span>
                        </c:if>
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
                           <li><span><strong>*</strong>输入答案</span><span><input type="text" id="answer" name="answer"></input></span><span class="tishitext" style="width:auto"></span></li>
                           <li><span><input type="button" class="anquan_hide_btn" value="提交" onclick="passwordProtection()"> </span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">密码保护设置成功,请重新登录！</div>
                       </div>
                   </li>
                 </ul>
               </div>
         </div>       
       
      </div>
  <!-- absolute_right start -->
	<%@ include file="/includes/absolute.jsp" %>
	<!-- absolute_right end -->
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>