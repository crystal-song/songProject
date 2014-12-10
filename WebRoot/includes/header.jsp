<%@ page language="java"  pageEncoding="UTF-8"%>

<!--  
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
        	<span id="profileLink">尊敬的<b style="color: #F00" id="userName">${name}</b>，您好！&nbsp;&nbsp;<a href="<%=path%>/profile.jsp">我的账户</a>&nbsp;&nbsp;<a href="<%=path%>/welcome/logout">【退出】</a></span>
        	</c:if>
        	<c:if test="${empty name}">  
        	<span id="loginLink"><a href="<%=path%>/login.jsp">登陆</a>&nbsp;&nbsp;<a href="<%=path%>/reg.jsp"  >注册</a></span>
        	</c:if>
        </div>
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="zth">
	<!-- <div class="logo"><a href="<%=path%>/wel" title="中投汇 首页"><img src="<%=path%>/images/logo.png" alt="返回首页"></a></div> -->
   <!--   <div class="logo"><a href="<%=path%>/wel" title="中投汇 首页"><h2 class="logo_style">中租宝</h2></a></div>
    <div class="nav">
    	<ul>
        	<%-- <li><a href="<%=path%>/index.jsp">首页</a></li> --%>
        	<li><a href="<%=path%>/wel">首页</a></li>
            <li><a href="<%=path%>/product/allProduct">我要投资</a></li> 
            <li style="display:none"><a href="<%=path%>/crowdfunding/allCrowdfunding">参与众筹</a></li>
            <li><a href="<%=path%>/wel/account">我的账户</a></li>
            <li><a href="<%=path%>/guarantee/getchannel">新闻公告</a></li>
            <li><a href="<%=path%>/wel/help">帮助中心</a></li>
            <li><a href="<%=path%>/chushenwenjian.jsp">发起项目</a></li>
            
        </ul>
    </div>
</div>
-->

<script type="text/javascript">
   $(document).ready(function(e) {
	
      // if(var navIndex!=null&&navIndex!=-1)$(".nav_big li").eq(navIndex).addClass("bd_btom");
  // if(var navIndex!=null&&navIndex!=-1)$(".nav_big a").eq(navIndex).addClass("bd_btom").siblings().removeClass("bd_btom");


   });
</script>

<!--[if lt IE 8]>
<div class="ie_text">亲爱的用户您使用的浏览器版本过低，我们强烈建议您更新最新版本的浏览器查看.
<div class="res"></div>
</div>

<![endif]-->
<div class="header">
 <div class="top">
  <ul>
    <li>联系我们
        <div class="list01">
         <a href="<%=path%>/question.jsp">常见问题</a>
         <a href="<%=path%>/contact.jsp">联系客服</a>
        </div>
    </li>
    <li>关于我们
	    <div class="list02">
		    <a href="<%=path%>/help_con.jsp">企业介绍</a>
		    <a href="<%=path%>/security.jsp">安全策略</a>
		    <a href="<%=path%>/notice.jsp">法律声明</a>
	    </div>
  </li>
    <li class="head_red" style="display:none">我的账户</li>
    <div class="list03" style="display:none">
      <a href="<%=path%>/wel/account">账户管理</a>
      <a href="<%=path%>/wel/account">资产管理</a>
    </div>
  </ul>
  <div class="list04"></div>
  </div>
</div>

<div class="nav_bac">
  <div class="nav">
          <div class="logo"></div>
          <ul class="nav_big">
            <li><a href="<%=path%>/wel"><span><strong>首页</strong></span><p>Home</p></a></li>
            <li><a href="<%=path%>/product/allProduct"><span><strong>我要投资</strong></span><p>Investment</p></a></li>
            <li><a href="<%=path%>/wel/account"><span><strong>我的账户</strong></span><p>Account</p></a></li>
            <li><a href="<%=path%>/guarantee/getchannel"><span><strong>新闻公告</strong></span><p>News</p></a></li>
            <li><a href="<%=path%>/help_con.jsp"><span><strong>帮助中心</strong></span><p>Help</p></a></li>
            <li><a href="<%=path%>/faqixiangmu.jsp"><span><strong>发起项目</strong></span><p>Application</p></a></li>
          </ul>
          <div class="login">
               <c:if test="${empty name}">
                <a class="wd_red a_fir" href="<%=path%>/reg.jsp" style="line-height:40px; font-size:16px;" ><strong>注册</strong></a>
                <a class="a_sec" href="<%=path%>/login.jsp" style="line-height:40px; font-size:16px;"><strong>登录</strong></a>
              </c:if>
             
             <c:if test="${!empty name}">
              <span class="username">您好，<strong>${name}</strong></span>         
              <div class="tuichu">
                  <ul>
                    <li class="zhang"><a href="<%=path%>/wel/account" class="acount">我的账户</a></li>
                    <li  class="zhang" style="background:#fff"><a href="<%=path%>/welcome/logout" class="out">退出</a></li>
                  </ul>
              </div>
            </c:if> 
          </div>
  </div>                                                    
</div>


<script type="text/javascript">
$(document).ready(function(){
	  
	$('.res').click(function(){
		$('.ie_text').css('display','none');
	  });	

    $(".header li").mouseover(function(){ 
      var index=$(this).index();      
      $('.top div').eq(index).show();
    $(this).addClass('head_red').siblings().removeClass('head_red');
     

    }).mouseout(function(){
       var index=$(this).index();
       $('.top div').eq(index).hide();
    });

    $(".top div").mouseover(function(){ 
      var index=$(this).index();
      $(this).show();
     
    }).mouseout(function(){
       var index=$(this).index();
       $(this).hide();
    });
    $(".username").mouseover(function(){
    	
       $(".tuichu").show();
       $(".tuichu").mouseover(function(){
      	  $(this).show();
        });
      }).mouseout(function(){
       $(".tuichu").hide();
      });
      $(".tuichu").mouseover(function(){
      $(this).show();
      }).mouseout(function(){
      $(this).hide();
      });

});
</script>
