
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %> 

<title>用户注册 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
</head>

<body style="background:#f7f7f7">
<!-- 
<div class="frame">
<!-- page content -->
 <div class="top_head">
   <div class="logo"></div>
   <div class="wel_reg"></div>
 </div>
<div class="blank_block">
  <div class="blank_block_title"><span class="new_reg01">新用户注册</span><div class="blank_right">已有中租宝账户? 请<a href="<%=path%>/login.jsp" style="color:#e72634">直接登录</a></div></div>
    <form action="<%=path %>/welcome/regEmail" id="Form1"  method="post" style="padding:0px;">
        <div class="blank_block_content reg">
          <p><span class="reg_left_style">用户名：</span><input name="name" id="name"  type="text" class="input_item" onblur="chk_name()" /><span class="green_right new1"></span></p>
          <div id="tip_username"><span class="tip_n">请输入用户名！</span></div>
          <p><span class="reg_left_style">密　码：</span><input name="password" id="password" type="password" class="input_item" onblur="chk_pwd()"/><span class="green_right new2"></span></p>
          <div id="tip_userpwd"><span class="tip_n">请输入密码！</span></div>
          <p><span class="reg_left_style">确认密码：</span><input name="newpassword" id="newpassword" type="password" class="input_item" onblur="chk_repwd()"/><span class="green_right new3"></span></p>
          <div id="tip_userrepwd"><span class="tip_n">请重复密码！</span></div>
          <p><span class="reg_left_style">安全邮箱：</span><input name="email" id="email" type="text" class="input_item" onblur="chk_email()"/><span class="green_right new4"></span></p>
          <div id="tip_useremail"><span class="tip_n">请输入邮箱！</span></div> 
          <p style="width:480px"><span class="reg_left_style">　验证码：  </span><input type="text"  id="vcode" value="" class="input_item" onblur="validateCode()"/>
					<img  id="code" type="4" align="absmiddle" src="" style="cursor: pointer;height:24px;margin-bottom:6px;">
					<a href="#" mce_href="#" onclick="javascript:show();return false; " style="font-size:12px;">看不清,换一张!</a>
					 <div id="tip_validatecode"><span class="tip_n">请输入验证码！</span></div> 
		  </p>
<!--           <p>　推荐人：<input name="referee" id="referee" type="text" class="input_item"/></p>
          <div id="tip_referee"><span class="tip_n"></span></div>      
 -->
 
          <p class="xieyi_font"><input  type="checkbox" checked="checked" id="agreement">我已阅读并同意中租宝
           <a target="_blank" href="<%=path%>/zhucexieyi.jsp">《使用协议》</a>及
           <a target="_blank" href="<%=path%>/yinsitiaokuan.jsp">《隐私条款》</a></p>
           <p><input name="imgbtn" type="button"  onclick="check()" class="btn_reg_new" value="立即注册"></p>
          </div>          
          <div class="two_pic"></div>
      </form>
    </div> 
</div>


</body>
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
		                   // $(".green_right").css("backfround","url(/img/images-2014-11/green_right.jpg) 0 4px  no-repeat")
		               		$(".new1").css("display","block");  
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
		  $(".new2").css("display","block"); 
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
		  $(".new3").css("display","block"); 
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
		  $(".new4").css("display","block"); 
	  }
}
   function check(){ 
		chk_name();
		chk_pwd();
		chk_repwd();
		chk_email();
		if(c_name&&c_pwd&&c_repwd&&c_email){
	
	/* alert("all check pass!"); */
	/*  Form.action="welcome/register"; 
	 Form.submit();  */
	 	if(!$("#agreement").attr("checked")){alert("请仔细阅读并同意《用户协议》和《隐私条款》！"); return false;}
	                    	
	        $('#Form1').submit(); 
	         
		}
	
 }
   var code ; //在全局 定义验证码 
function createCode(){  
    code = "";  
    var codeLength = 5;//验证码的长度  
    //所有候选组成验证码的字符，可以用中文  
    var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C',
    		'D','E','F','G','H','I','J','K','L','M','N','O','P',
    		'Q','R','S','T','U','V','W','X','Y','Z','a','b','c',
    		'd','e','f','g','h','i','j','k','l','m','n','o','p',
    		'q','r','s','t','u','v','w','x','y','z');  
    for(var i=0;i<codeLength;i++){  
        var charIndex = Math.floor(Math.random()*60);  
        code +=selectChar[charIndex];  
    }  
    return code;  
}  
function validateCode (){  
    var inputCode = document.getElementById("vcode").value.toLowerCase();  
    if(inputCode.length <=0){ 
    	validate=false;
    	$("#tip_validatecode").html('<span class="tip_f">请输入验证码！</span>');
    }  
    else if(inputCode != code.toLowerCase()){  
    	validate=false;
    	$("#tip_validatecode").html('<span class="tip_f">验证码不正确！</span>');
        show();//刷新验证码  
    }else{  
    	validate=true;
    	$("#tip_validatecode").html('<span class="tip_p">验证码正确！</span>');
    }  
}  
function show(){  
        //显示验证码  
        document.getElementById("code").src="CodeServlet?code="+createCode();  
}  
window.onload = function() {
		//document.onload=show();  
        show();//页面加载时加载验证码  
        //这时无论在ie还是在firefox中，js没有加载完，页面的东西是不会被执行的；  
    }  
</script>
</html>
