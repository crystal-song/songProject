
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

<title>用户注册</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" >
var c_name=false;
var c_pwd=false;
var c_repwd=false;
var c_email=false;

function chk_name(){
	
	 var name = $("#name").val();
	 var cc= /^[a-zA-Z][a-zA-Z0-9_]*$/;
	    if(name==null){
//	    alert('用户名不能為空  ');
	    $("#tip_username").html('<span class="tip_f">用户名不能为空！</span>');
	    c_name=false;
	    } else if (!(cc.test(name))){
//		  alert('用户名只能以字母开头 ');
		  $("#tip_username").html('<span class="tip_f">用户名只能以字母开头！</span>');
		  c_name=false;
		 //return false; 
	  } else{
		  
		  if($('#name').val() != ''){
		    	
		            $.ajax({
		                type: 'POST',
		                url: '<c:url value="/welcome/queryUser"/>',
		                data: 'name='+$('#name').val(),
		                dataType: 'text',
		                success: function(data) {
		                	/* alert("dd"+data+'"success"'); */
		                    if(data == '"success"') {
		                     $("#tip_username").html('<span class="tip_f">用户名已注册！</span>');
		                     c_name=false;
		                    	/* $('#form').submit(); */
		                        /* window.open('<c:url value="/welcome/session"/>', '_self'); */
		                    } else {
		                    	
		                    $("#tip_username").html('<span class="tip_p">用户名可以使用！</span>');
		               		  c_name=true; 
		                    }
		                }
		            });
		       
		     }
			
		  
		  
		 
	  }
}


function chk_pwd(){
	
	var ps = $("#password").val();
	  
	  var cc= /^[\w]{6,12}$/;	
		 
	  if (!(cc.test(ps))){
//		  alert('密码输入格式不正确，请输入6到12位数 ');
		  c_pwd=false;
		  $("#tip_userpwd").html('<span class="tip_f">密码输入格式不正确，请输入6到12位！</span>');
		// return false; 
	  }else{
		  c_pwd=true;
		  $("#tip_userpwd").html('<span class="tip_p">密码可以使用！</span>');
	  }
	  
}

function chk_repwd(){
	var ps = $("#password").val();
	var pas = $("#newpassword").val();
	if(pas==""){
		c_repwd=false;
		  $("#tip_userrepwd").html('<span class="tip_f">请重复密码！</span>');	
	}else if(ps!=pas){
//   	 alert("兩次輸入的密碼不一致 ");
   		c_repwd=false;
	  $("#tip_userrepwd").html('<span class="tip_f">两次输入不一致！</span>');
   	// return false; 
    }else{
    	c_repwd=true;
		  $("#tip_userrepwd").html('<span class="tip_p">两次输入一致！</span>');
    }
}
function chk_email(){
	
	var email = $("#email").val();
	 var cc= /^([a-zA-Z0-9]|[._])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	    if(email==null){
//	    alert('邮箱不能為空  ');
	    c_repwd=false;
		  $("#tip_useremail").html('<span class="tip_f">请输入邮箱！</span>');
	    } else if (!(cc.test(email))){
//		  alert('邮箱格式不正确  ');
		  c_repwd=false;
		  $("#tip_useremail").html('<span class="tip_f">邮箱格式不正确！</span>');
		// return false; 
	  }else{
		  c_email=true;
		  $("#tip_useremail").html('<span class="tip_p">邮箱可以使用！</span>');
	  }
}
   function check(){ 
		chk_name();
		chk_pwd();
		chk_repwd();
		chk_email();
		
		if(c_name&&c_pwd&&c_repwd&&c_email){
	
	alert("all check pass!");
	/*  Form.action="welcome/register"; 
	 Form.submit();  */
	 
	                    	
	        $('#Form1').submit(); 
	         
		}
	
 }


  
</script>
<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<!-- banner start -->
<%@ include file="/includes/banner.jsp" %>
<!-- banner end  -->
<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>
<div class="frame">
<!-- page content -->
<div class="blank_block">
  <div class="blank_block_title">用户注册</div>
    <form action="welcome/register" id="Form1"  method="post">
        <div class="blank_block_content reg">
          <p>　用户名：<input name="name" id="name"  type="text" class="input_item" onblur="chk_name()" /></p>
          <div id="tip_username"><span class="tip_n">请输入用户名！</span></div>
          <p>　密　码：<input name="password" id="password" type="password" class="input_item" onblur="chk_pwd()"/></p>
          <div id="tip_userpwd"><span class="tip_n">请输入密码！</span></div>
          <p>确认密码：<input name="newpassword" id="newpassword" type="password" class="input_item" onblur="chk_repwd()"/></p>
          <div id="tip_userrepwd"><span class="tip_n">请重复密码！</span></div>
          <p>安全邮箱：<input name="email" id="email" type="text" class="input_item" onblur="chk_email()"/></p>
          <div id="tip_useremail"><span class="tip_n">请输入邮箱！</span></div>
          <p><input name="imgbtn" type="button"   onclick="check()" class="btn_reg"></p>
          </div>
          
          <div class="two_pic"></div>
      </form>
    </div>
 <!-- page content end -->   
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