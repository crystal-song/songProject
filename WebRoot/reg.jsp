
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">

<title>用户注册 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<%@ include file="/includes/taglibs.jsp" %> 
</head>
<script type="text/javascript" >
var c_name=false;
var c_pwd=false;
var c_repwd=false;
var c_email=false;
var validate=false;
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
		validate();
		if(c_name&&c_pwd&&c_repwd&&c_email&&validate){
	
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
    	$("#tip_validatecode").html('<span class="tip_P">验证码正确！</span>');
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
<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="frame">
<!-- page content -->
<div class="blank_block">
  <div class="blank_block_title">新用户注册</div>
    <form action="<%=path %>/welcome/regEmail" id="Form1"  method="post" style="padding:0px;">
        <div class="blank_block_content reg">
          <p>　用户名：<input name="name" id="name"  type="text" class="input_item" onblur="chk_name()" /></p>
          <div id="tip_username"><span class="tip_n">请输入用户名！</span></div>
          <p>　密　码：<input name="password" id="password" type="password" class="input_item" onblur="chk_pwd()"/></p>
          <div id="tip_userpwd"><span class="tip_n">请输入密码！</span></div>
          <p>确认密码：<input name="newpassword" id="newpassword" type="password" class="input_item" onblur="chk_repwd()"/></p>
          <div id="tip_userrepwd"><span class="tip_n">请重复密码！</span></div>
          <p>安全邮箱：<input name="email" id="email" type="text" class="input_item" onblur="chk_email()"/></p>
          <div id="tip_useremail"><span class="tip_n">请输入邮箱！</span></div> 
          <p>　验证码：  <input type="text"  id="vcode" value="" class="input_item" onblur="validateCode()"/>
					<img  id="code" type="4" align="absmiddle" src="" style="cursor: pointer;height:24px;margin-bottom:6px;">
					<a href="#" mce_href="#" onclick="javascript:show();return false;">看不清,换一张!</a>
					 <div id="tip_validatecode"><span class="tip_n">请输入验证码！</span></div> 
		  </p>
<!--           <p>　推荐人：<input name="referee" id="referee" type="text" class="input_item"/></p>
          <div id="tip_referee"><span class="tip_n"></span></div>           -->
          <p class="xieyi_font"><input  type="checkbox" checked="checked" id="agreement">我已阅读并同意中租宝
           <a target="_blank" href="<%=path%>/zhucexieyi.jsp">《使用协议》</a>及
           <a target="_blank" href="<%=path%>/yinsitiaokuan.jsp">《隐私条款》</a></p>
           <p><input name="imgbtn" type="button"  onclick="check()" class="btn_reg"></p>
          </div>          
          <div class="two_pic"></div>
      </form>
    </div>
 <!-- page content end -->   
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
