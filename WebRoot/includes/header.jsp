<%@ page language="java"  pageEncoding="UTF-8"%>

<script type="text/javascript">
   $(document).ready(function(e) {
	
      // if(var navIndex!=null&&navIndex!=-1)$(".nav_big li").eq(navIndex).addClass("bd_btom");
  // if(var navIndex!=null&&navIndex!=-1)$(".nav_big a").eq(navIndex).addClass("bd_btom").siblings().removeClass("bd_btom");


   });
</script>
<div class="header">
 <div class="top">
  <ul>
    <li>联系我们</li>
    <li>关于我们</li>
    <li class="head_red" style="display:none">我的账户</li>
  </ul>
  <div class="list01">
    <a href="<%=path%>/question.jsp">常见问题</a>
    <a href="<%=path%>/contact.jsp">联系客服</a>
  </div>
  <div class="list02">
    <a href="<%=path%>/help.jsp">企业介绍</a>
    <a href="<%=path%>/security.jsp">安全策略</a>
    <a href="<%=path%>/notice.jsp">法律声明</a>
  </div>
  <div class="list03">
    <a href="<%=path%>/wel/account">账户管理</a>
    <a href="<%=path%>/wel/account">资产管理</a>
  </div>
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
                <a class="wd_red" href="<%=path%>/reg.jsp" ><strong>注册</strong></a>
                <a href="<%=path%>/login.jsp" ><strong>登录</strong></a>
              </c:if>
             
             <c:if test="${!empty name}">
              <span class="username">您好，<strong>${name}</strong></span>
           
              <div class="tuichu">
                  <ul>
                    <li class="zhang"><a href="<%=path%>/wel/account" class="acount">我的账户</a></li>
                    <li  class="zhang"><a href="<%=path%>/welcome/logout">退出</a></li>
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

});
</script>
