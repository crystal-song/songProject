<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>

<title>我的账户</title>
</head>


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


 <form action="welcome/session"  id="form" method="post">
<div class="zh">
	<div class="zh_fra">
    	<div class="zh_left"><img src="<%=path%>/images/dl_09.jpg"></div>
    	 
        <div class="zh_right">
        	<div><input name="name"  id="name" type="text" class="zh_wby" /></div>
            <div><input name="password" id="password"  type="text" class="zh_wby" /></div>
            <div class="zh_bot"><input name="imgbtn"  id="imgbtn"   type="button" onclick="query()" class="btn_login" >　<a href="<%=path%>/reg.jsp"><img src="images/dl01_05.jpg" /></a>
            </div>
        </div>
         
    </div>
</div>
</form>


<div class="clear_height"></div>

<!-- links start -->

<!-- links end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" >


function query(){
	alert("ccccccccccc");
 
	
    if($('#name').val() != ''){
    	if($('#password').val() != ''){
            $.ajax({
                type: 'POST',
                url: '<c:url value="/welcome/login"/>',
                data: 'name='+$('#name').val()+'&password='+$('#password').val(),
                dataType: 'text',
                success: function(data) {
                	alert("dd"+data+'"success"');
                    if(data == '"success"') {
                    	alert("登陆成功");
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



   
                
           

</script>