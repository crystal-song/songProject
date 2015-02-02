<%@ page language="java"  pageEncoding="UTF-8"%>
<!--[if lt IE 8]>
<div class="ie_text">亲爱的用户您使用的浏览器版本过低，我们强烈建议您更新至最新版本的浏览器查看.
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
   <li><a href="<%=path%>/xinshouzhiyin.jsp" class="head_red" target="_blank">新手指引</a>

   </li>
   <li class="head_red" style="display:none">我的账户
	    <div class="list03" style="display:none">
	      <a href="<%=path%>/wel/account">账户管理</a>
	      <a href="<%=path%>/wel/account">资产管理</a>
	    </div>
   </li>
  </ul>
  <a href="http://jq.qq.com/?_wv=1027&k=ZpAZ0O" class="qun_msg head_red" target=_blank>加入中租宝官方交流群：425296487</a>
  <div class="list04"></div>
  </div>
</div>

<div class="nav_bac">
  <div class="nav">
          <a class="logo" href="<%=path%>/" title="中租宝首页"></a>
          <ul class="nav_big">
            <li>
              <a href="<%=path%>/">
                <span><strong>首页</strong></span>
                <p>Home</p>
              </a>
            </li>
            <li>
               <a href="<%=path%>/product/allProduct">
                 <span><strong>我要投资</strong></span>
                 <p>Investment</p>
               </a>
            </li>
            <li><a href="<%=path%>/gate/service"><span><strong>我的账户</strong></span><p>Account</p></a></li>
            <li><a href="<%=path%>/zhongcou.jsp"><span><strong>我要众筹</strong></span><p>Crowdfunding</p></a></li> 
            <li><a href="<%=path%>/guarantee/getchannel"><span><strong>新闻公告</strong></span><p>News</p></a></li>
            <li><a href="<%=path%>/help_con.jsp"><span><strong>帮助中心</strong></span><p>Help</p></a></li>
            <li><a href="<%=path%>/faqixiangmu.jsp"><span><strong>发起项目</strong></span><p>Application</p></a></li>
            
          </ul>
          <div class="login" >
               <c:if test="${empty name}">

                <a class="a_fir" href="<%=path%>/welcome/reg" style="line-height:40px; font-size:16px; margin-left:50px;" ><strong>注册</strong></a>
                <a class="wd_red a_sec" href="<%=path%>/login.jsp" style="line-height:40px; font-size:16px;"><strong>登录</strong></a>

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
  <!-- <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2::52" alt="点击这里给我发消息" title="点击这里给我发消息"/></a> -->                                                  
</div>


<script type="text/javascript">
$(document).ready(function(){
	var index_reg="";
	$('.res').click(function(){
		$('.ie_text').css('display','none');
	  });
	
	$(".nav_big li").click(function(){
		$(this).addClass("bd_btom").siblings().removeClass("bd_btom");
	//	$(this).children("a").children("span").children("p").addClass("headwd_color").siblings().removeClass("headwd_color");
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
