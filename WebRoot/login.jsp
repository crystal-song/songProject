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


<title>用户登录 - 我的账户 - 中租宝</title>

<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />


<script type="text/javascript" >

function query(){
	/* alert("ccccccccccc"); */
 
	
    if($('#name').val() != ''){
    	if($('#password').val() != ''){
            $.ajax({
                type: 'POST',
                url: '<c:url value="/welcome/login"/>',
                data: 'name='+$('#name').val()+'&password='+$('#password').val(),
                dataType: 'text',
                success: function(data) {
                	/* alert("dd"+data+'"success"'); */
                    if(data == '"success"') {
                    	/* alert("登陆成功"); */
                    	$('#form').submit();
                        /* window.open('<c:url value="/welcome/session"/>', '_self'); */
                    } else {
                    	$('#password').val('');
                       alert('用户名或密码错误！');
                    }
                }
            });
        }else{
             alert('请输入密码！ ');
        }
     }else{
     	alert('请输入用户名！');
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
                
           

</script>

</head>


<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<!-- <div class="clear"></div> -->
<!-- banner start -->
<%-- <%@ include file="/includes/banner.jsp" %> --%>
<!-- banner end  -->
<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>


 <form action="<%=path%>/welcome/session"  id="form" method="post">
<div class="zh">
	<div class="zh_fra">
    	<div class="zh_left"><img src="<%=path%>/images/dl_09.jpg"></div>
    	 
        <div class="zh_right">
        	<div><input name="name"  id="name" type="text" class="zh_wby" value="请输入姓名"/></div>
            <div><input name="password" id="password"  type="password" class="zh_wby" value="请输入密码"/></div>
            <div class="zh_bot"><input name="imgbtn"  id="imgbtn"   type="button" onclick="query()" class="btn_login" ><a href="<%=path%>/reg.jsp"><img src="<%=path%>/images/dl01_05.jpg" /></a>
</div>
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
