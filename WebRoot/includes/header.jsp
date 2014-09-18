<%@ page language="java"  pageEncoding="UTF-8"%>

<div class="top">
	<div class="top_fra">
    	<div class="top_left">
        	<div class="kefu"><img src="<%=path%>/images/sy_04.jpg"></div>
            <div class="phone">010-84243099</div>
        </div>
    	<div class="top_right">
        	<div class="top_right">
        	<span id="datespan"></span> 
        	<c:if test="${!empty name}">     	
        	<span id="profileLink">尊敬的<b style="color: #F00" id="userName">${name}</b>，您好！&nbsp;&nbsp;<a href="<%=path%>/profile.jsp">我的账户</a></span>
        	</c:if>
        	<c:if test="${empty name}">  
        	<span id="loginLink"><a href="<%=path%>/login.jsp">登陆</a>&nbsp;&nbsp;<a href="<%=path%>/reg.jsp">注册</a></span>
        	</c:if>
        </div>
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="zth">
	<div class="logo"><a href="<%=path%>/wel" title="中投汇 首页"><img src="<%=path%>/images/logo.png" alt="返回首页"></a></div>
    <div class="nav">
    	<ul>
        	<%-- <li><a href="<%=path%>/index.jsp">首页</a></li> --%>
        	<li><a href="<%=path%>/wel">首页</a></li>
            <li><a href="<%=path%>/product/allProduct">我要投资</a></li>
            <li  style="display:none"><a href="<%=path%>/crowdfunding/allCrowdfunding">参与众筹</a></li>
            <li><a href="<%=path%>/wel/account">我的账户</a></li>
            <li><a href="<%=path%>/guarantee/getchannel">新闻公告</a></li>
            <li><a href="<%=path%>/wel/help">帮助中心</a></li>
            
        </ul>
    </div>
</div>
<script type="text/javascript">

if(navIndex!=null&&navIndex!=-1)$(".nav ul li").eq(navIndex).children("a").addClass("currentNav");

</script>