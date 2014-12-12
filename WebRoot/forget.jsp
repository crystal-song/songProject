<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">


<title>用户登录 - 找回密码 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<%@ include file="/includes/taglibs.jsp" %>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 

<script type="text/javascript" >
function chk_name() {
	//alert("aaa");
	var name = $("#name").val();
	var cc = /^[a-zA-Z][a-zA-Z0-9_]*$/;
	if(name==''){
		   // alert('用户名不能為空  ');
		$("#tip_username").html('<span class="tip_f01">用户名不能为空！</span>');
		c_name = false;
	}else{
		if ($('#name').val() != '') {

			$.ajax({
				type : 'POST',
				url : '<c:url value="/user/query"/>',
				data : 'name=' + $('#name').val(),
				dataType : 'text',
				success : function(data) {
					/* alert("dd"+data+'"success"'); */
					if (data == '"success"') {
						$("#tip_username").html(
								'<span class="tip_f01" style="color:#390">用户名存在！</span>');
						/* $('#form').submit(); */
						/* window.open('<c:url value="/welcome/session"/>', '_self'); */
					} else {
						$("#tip_username").html(
								'<span class="tip_f01">用户名不存在！</span>');
					}
				}
			});
		}

	}
}

function chk_email() {

	var email = $("#email").val();
	var cc = /^([a-zA-Z0-9]|[._])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	if (email=='') {
		// alert('邮箱不能為空  ');
		$("#tip_useremail").html('<div class="tip_f01">请输入邮箱！</div>');
	} else if (!(cc.test(email))) {
		//	  alert('邮箱格式不正确  ');
		$("#tip_useremail").html('<span class="tip_f01">邮箱格式不正确！</span>');
		// return false; 
	} else {
		/* $("#tip_useremail").html('<span class="tip_p">邮箱可以使用！</span>'); */
		$.ajax({
			type : 'POST',
			url : '<c:url value="/user/queryByEmail"/>',
			data : 'email=' + $('#email').val(),
			dataType : 'text',
			success : function(data) {
				if (data == '"success"') {
					$("#tip_useremail").html(
							'<span class="tip_f01" style="color:#390">邮箱存在！</span>');
				} else {
					$("#tip_useremail").html(
							'<span class="tip_f01">邮箱不存在！</span>');
				}
			}
		});
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
function validate (){  
    var inputCode = document.getElementById("vcode").value.toLowerCase();  
    if(inputCode.length <=0){  
    	$("#tip_validatecode").html('<span class="tip_f01">请输入验证码！</span>');
        return false;  
    }  
    else if(inputCode != code.toLowerCase()){  
    	$("#tip_validatecode").html('<span class="tip_f01">验证码不正确！</span>');
        show();//刷新验证码  
        return false;  
    }else{  
    	$("#tip_validatecode").html('<span class="tip_f01" style="color:#390">验证码正确！</span>');
        return true;  
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

</head>


<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="msg_con">
  <div class="queren_con">
   <div class="con_title"><strong>重新设置密码</strong></div>
 <form action="<%=path%>/user/findPassword"  id="form" method="post">
    	<table border="0" cellspacing="0" cellpadding="0" align="center"  width="100%" class="table_style">
			<tr>
				<td  style="color:#FF6633;font-weight:bold" width="100%">邮箱找回密码</td>
			</tr>
			
			 <tr>
						<td align="left"><span>用户名：</span>
						  <label>
					        <input name="name" type="text"  id="name" value=""  onblur="chk_name()"/>
					      </label>&nbsp;&nbsp;
					      <div id="tip_username" style="float:left">
							<!--  <span class="tip_n">请输入用户名！</span>-->
						 </div>
					   </td>
			 </tr>
			 <tr>
						<td align="left">&nbsp;<span>Email：</span>
						  <label>
					      <input name="email" type="text"  id="email" value="" onblur="chk_email()"/>
					      </label>&nbsp;&nbsp;
					      <div id="tip_useremail" style="float:left">
						<!--  <span class="tip_n">请输入邮箱！</span>-->
					</div>
					      
					      </td>
			 </tr>
			<tr>
					  <td align="left"><span>验证码：</span>
					  <label>
					      <input name="validatecode" type="text"  id="vcode" value="" onblur="validate()"/>
						  <img  id="code" type="4" align="absmiddle" src="" style="cursor: pointer;height:24px;margin-bottom:6px;">
					<a href="#" mce_href="#" onclick="javascript:show();return false;">看不清,换一张!</a>
					</label>&nbsp;&nbsp;
					 <div id="tip_validatecode" style="float:left"></div> 
					</td>
			    
					  </tr>
					  <tr></tr>
                      <tr>
                        <td style="text-align:left;"><input type="submit" value="找回密码"  class="check_btn01" onclick="query()"/></td>
                        <td align="left" id="left_b">
                        
		</td>
	</tr>
	                 </td>
                      </tr>					
				  </table>
				</td>
			</tr>
			</table>

</form>
</div>
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
