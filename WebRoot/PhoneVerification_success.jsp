<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mftour.spring.service.IUserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ include file="/includes/taglibs.jsp" %> 

<title>安全设置 - 我的账户 - 中租宝</title>
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
                 手机认证成功！
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
