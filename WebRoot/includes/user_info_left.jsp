<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/includes/taglibs.jsp" %>
    
        <ul>
           <li class="fir_li">账户主页</li>
           <li>
              <div class="u_left_mian u_left_red"><i class="mian_pic03"></i><span>账户管理</span></div>
               <ul class="u_left_sec">
                <li>
                  <a href="<%=path%>/wel/account">个人信息</a>
                </li>
				<li style="display:block;">
                  <a href="<%=path%>/anquanshezhi.jsp">安全设置</a>
                </li>
                <li style="border-bottom:0; display:none">
                  <a href="<%=path%>/tongzhishezhi.jsp" >通知设置</a>
                </li>
                <li style="border-bottom:0;">
                  <a href="<%=path%>/account/tuijian" >推荐管理</a>
                </li>
              </ul>
           </li>
           <li>
              <div class="u_left_mian"><i class="mian_pic01"></i><span>资产管理</span></div>
              <ul class="u_left_sec">
                <li>
                 <a href="<%=path%>/gate/service" >资产统计</a>
                </li>
                <li>
                 <a href="<%=path%>/gate/recharge">充值</a>
                </li>
                <li>
                 <a href="<%=path%>/gate/drawMoney">提现</a>
                </li>
                <li>
                 <a href="<%=path%>/account/liquan?page=1&catlog=0">我的礼券</a>
                </li>

              </ul>
           </li>

           <li>
              <div class="u_left_mian"><i class="mian_pic02"></i><span>投资管理</span></div>
              <ul class="u_left_sec">
                <li style="display:none;">
                  <a href="<%=path%>/yitou.jsp">已投项目</a>
                </li>
                <li style="display:none;">
                  <a href="<%=path%>/shoucang.jsp">收藏项目</a>
                </li>
                <li>
                  <a href="<%=path%>/gate/userProject">我的项目</a>
                </li>
                <c:if test="${userinfo.isborrow==true }">
                <li>
                  <a href="<%=path%>/loan/loanProduct">我的借款</a>

                </li>
                </c:if>
                <li>
                  <a href="<%=path%>/transRecord/queryTransRecord?time=timeall&type=typeall">交易记录</a>
                </li>
                <li style="display:none;">
                  <a href="<%=path%>/zhaiquan.jsp">债权转让</a>
                </li>
              </ul>
           </li>
           
           <li style="display:none">
             <div class="u_left_mian"><i class="mian_pic04"></i><span>消息管理</span></div>
              <ul class="u_left_sec">
                <li style="border-bottom:0">
                  <a href="<%=path%>/xitongxiaoxi.jsp">系统消息</a>
                </li>
              </ul>
           </li>
         </ul>
        <input type="hidden" id="username" value="${name }"  />
<script type="text/javascript">

    $(document).ready(function(){
      
     // $(".u_left_sec:first li:eq(0)").children("a").css("color","#fc652e");
      $(".u_left_mian").click(function(){    	
    	  $(this).addClass('u_left_red').parent().siblings().children(".u_left_mian").removeClass("u_left_red");
    	  $(this).parent().siblings().children(".u_left_sec").slideUp();
    	  $(this).siblings().slideToggle("slow");
      });
    	if(indexs!=null){
    		$(".u_left_mian").eq(indexs).addClass("u_left_red").parent().siblings().children(".u_left_mian").removeClass("u_left_red");
    		$(".u_left_mian").eq(indexs).siblings(".u_left_sec").css("display","block");
    		//.css("display","block")
    	}
    	$(".u_left_mian").click(function(){
         	
    	});
			
		}
    	
    );
</script>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
