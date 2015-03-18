<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mftour.spring.service.IUserService"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
<title>用户登录 - 我的账户 - 中租宝</title>

<script type="text/javascript" src="<%=path%>/js/sms.js" ></script>
</head>


<body onkeydown="keyLogin();">
<div class="black_bac"></div>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<!-- <div class="clear"></div> -->
<!-- banner start -->
<%-- <%@ include file="/includes/banner.jsp" %> --%>
<!-- banner end  -->
<div class="clear"></div>
<div class="clear_height"></div>


 <form action="<%=path%>/welcome/session"  id="form" method="post">
<div class="zh">
	<div class="zh_fra">
    	<div class="zh_left"><img src="<%=path%>/images/dl_09.jpg"></div>
    	 
        <div class="zh_right">
        	<div><input name="name"  id="name" type="text" class="zh_wby" value="请输入姓名" /></div>
            <div><input name="password" id="password"  type="password" class="zh_wby" value="请输入密码" /></div>
            <div id="tips"></div> 
            <div class="zh_bot"><input name="imgbtn"  id="imgbtn"   type="button" onclick="query()" class="btn_login" ><a href="<%=path%>/welcome/reg"><img src="<%=path%>/images/dl01_05.jpg" /></a>
            </div>
            <div class="forget_pwd"><a href="<%=path %>/forget.jsp" id="pwd_color">忘记密码?</a></div>
        </div>
        <div id="dialog01"  style="display:none; height:170px;">
	         <div class="dialog_title">
               <strong>温馨提示</strong>
	           <div class="right_cha"></div>
	         </div>
	         
	         <div class="touzi_text">
	           <p style="background:url('../img/images-2014-11/renzheng02.png') 26px 7px no-repeat" class="p_font">用户名或密码错误!</p>          
	         </div>	
	         <a class="diabtn">确定</a>                
        </div>
    </div>
</div>
</form>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>

<script type="text/javascript" >
function keyLogin(){
    event=event || window.event;
	  if (event.keyCode==13)  {
		 query();
	 } 

}


function query(){
    if($('#name').val() != ''){
    	if($('#password').val() != ''){

            $.ajax({
                type: 'POST',
                url: '<c:url value="/welcome/login"/>',
                data: 'name='+$('#name').val()+'&password='+$('#password').val(),
                dataType: 'text',
                success: function(data) {                
                    if(data == '"success"') {
                    	$('#form').submit();                    
                    } else {
                    	$('#password').val('');
                        $("#tips").text('*用户名或密码错误！ ');
                    }
                }
            });
        }else{	
             $("#tips").text('*请输入密码！ ');
        }
     }else{
            $("#tips").text("*请输入用户名");
             
     }   
}


window.onload=function(){
	var myblur= document.getElementById('name')
	var myblur01= document.getElementById('password')
	      myblur.onfocus=function(){
		  if(myblur.value=="请输入姓名"){
			  myblur.value="";
			  myblur.style.color="#000"	 
			  } 	  
			 }  
		  myblur.onblur=function(){
			  
			 if(myblur.value==""){
			   myblur.value="请输入姓名"
			   myblur.style.color="#ccc"	 
			   }	 		  
 
	}
		  
		  myblur01.onfocus=function(){
			  if(myblur01.value=="请输入密码"){
				  myblur01.value="";
				  myblur01.style.color="#000"	 
				  }  
			  
		  }	 
		  
		  myblur01.onblur=function(){
			  
				 if(myblur01.value==""){
				   myblur01.value="请输入密码"
				   myblur01.style.color="#ccc"	 
				   }	 		  
	 
		}
}  
              $(function(){
            	  
            	 $(".right_cha").click(function(){
            		 $("#dialog01").css("display","none")
            		  $(".black_bac").css("display","none");	
            	 }) 
            	 $(".diabtn").click(function(){
            		 $("#dialog01").css("display","none")
            		  $(".black_bac").css("display","none");	
            	 })            	  
              })            

</script>

