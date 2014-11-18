<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mftour.spring.service.IUserService"%>
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
            //alert($(this).text());
            if($(this).text()=="认证"){

               $(this).text("取消认证");

            }else if($(this).text()=="取消认证"){
              $(this).text("认证");
            }
         }); 
         $(".u_left_mian").click(function(){
              $(this).siblings().slideToggle("slow");
            }); 
         $(".anquan_hide_btn").click(function(){
        	  $(this).parent().parent().parent().hide().siblings(".tijiao_checkok").show();
        	 
         });
         $(".anquan_hide input").blur(function(){
        	 var val=$(this).val();
        
        	 
        	 if( $(this).is('#phone') ){
        		var phone= $('#phone').parent().siblings('.tishitext');
        		if(val.length!=11||val==""){
        			 phone.css('display','block');	 
        		 }else{
        			 phone.css('display','none');
        		 } 
        	 }
        	 
        	 if( $(this).is('#username') ){
         		var username = $('#username').parent().siblings('.tishitext');
         		//alert(username);
         		if(val=="" || checkusername(val)){
         			username.show();
         		 }else{
         			username.hide();	
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
        		 
         		var carno= $('#carno').parent().siblings('.tishitext');
         		
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
         		     alert('ok');
         		    return true;  
         		   } else{
         			  alert('fail');
         			 return false;
         		   } 
         		}  
         		
         	 }
         	 
        	 if( $(this).is('#file01') ){
         		var file01= $('#file01').parent().siblings('.tishitext');
         		if(val==""){
         			 file01.css('display','block');	 
         		 }else{
         			 file01.css('display','none');
         		 } 
         	 }
        	 
        	 if( $(this).is('#file02') ){
          		var file02= $('#file02').parent().siblings('.tishitext');
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
           		      实名认证成功,请重新登录！
                 </ul>
               </div>
               <div></div>
               <div></div>
               <div></div>
               <div></div>
               <div></div>
         </div>       
       
      </div>
  
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>