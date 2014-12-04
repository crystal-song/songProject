<%@ page language="java"  pageEncoding="UTF-8"%>

     <!--    <div class="clear_height"></div>
                	<div class="profile_l">
        		<div class="avatar"><a href="#"><img /></a></div>
        		<div class="user_info">
        			<div class="user_name">xxx</div>
        			<div class="user_safelv">安全等级：中</div>
        			<div class="user_safetag">
        				<div id="id_verify" class="id_verify_no"></div>
        				<div id="mobile_verify" class="mobile_verify_yes"></div>
        				<div id="email_verify" class="email_verify_yes"></div>
        				<div id="pwd_verify" class="pwd_verify_no"></div>
        			</div>
        		</div>
        	</div>        	<div class="clear_height  btm_border"></div>
        	-->
      
     <!--  
      <div class="msg_left_top">
           <div class="name">
                 <div class="pic">
                   <h3></h3>
                 </div>
                 <span><strong>${user1.name}</strong></span>
           </div>
           <div class="left_btm" style="height:12px;">
                  <span class="sp1" style="display:none"><a href="<%=path%>/anquanshezhi.jsp" title="您未认证个人实名信息, 点击认证"></a></span>
                  <span class="sp2" style="display:none"><a href="<%=path%>/anquanshezhi.jsp" title="您未绑定身份证，点击绑定"></a></span>
                  <span class="sp3" style="display:none"><a href="<%=path%>/anquanshezhi.jsp" title="您未绑定手机号，点击绑定"></a></span>
                  <span class="sp4" style="display:none"><a href="<%=path%>/anquanshezhi.jsp" title="您未绑定邮箱，点击绑定"></a></span>
                  <span class="sp5" style="display:none"><a href="<%=path%>/anquanshezhi.jsp" title="您未注册易宝支付账号，点击注册"></a></span>                  
           </div>
           <div class="loadbar">
             <div class="red_bar"></div>
           </div>
           <div class="view">
             <span>安全等级：<strong>低</strong></span>
             <a href="#">[提升]</a>
           </div>
       </div>
       <div class="msg_left_cent">
          <a class="msg_nav">
               <i style="background:url(<%=path%>/img/tubiao5.png) no-repeat"></i>
               <span>账户主页</span>
          </a>
          <div class="select_nav">
              <a  class="msg_nav">
                <i class="bac_change_1"></i>
                <span>资产管理</span>
              </a>
              <ul style="display:none">
                  <%-- <li><a href="<%=path%>/zichan.jsp">资产统计</a></li> --%>
                   <li><a href="<%=path%>/gate/service">资产统计</a></li>
                  <li><a href="<%=path%>/gate/recharge">充值</a></li>
                  <li><a href="<%=path%>/tixian.jsp">提现</a></li>
              </ul>
          </div>
          <div class="select_nav" style="display:none">
              <a  class="msg_nav">
	              <i class="bac_change_2"></i>
	              <span>消息管理</span>
              </a>
              <ul>
                  <li><a  href="<%=path%>/zhanneitongzhi.jsp">站内信息</a></li>                  
              </ul>
          </div>
          <div class="select_nav">
              <a class="msg_nav" style="margin-bottom: 0px;">
                  <i class="bac_change_3"></i>
                  <span>账户管理</span>
              </a>
              <ul style="display:none" >
                  <li><a href="<%=path%>/user-info.jsp">个人信息</a></li>
                  <li style="border-bottom:0;"><a href="<%=path%>/anquanshezhi.jsp">安全设置</a></li>
                  <li style="border-bottom:0; display:none" ><a href="<%=path%>/tongzhishezhi.jsp">通知设置</a></li>
                  
              </ul>
          </div>    
       </div>
        -->	
      
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
                <li style="border-bottom:0; display:">
                  <a href="<%=path%>/tongzhishezhi.jsp" >通知设置</a>
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
                 <a href="<%=path%>/gate/binding">绑定银行卡</a>
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
                <li>
                  <a href="<%=path%>/transRecord/queryTransRecord?time_type=seven_all">交易记录</a>
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
        
<script type="text/javascript">

    $(document).ready(function(){
    	 
      $(".u_left_mian").click(function(){    	
    	  $(this).addClass('u_left_red').parent().siblings().children(".u_left_mian").removeClass("u_left_red");
    	  $(this).parent().siblings().children(".u_left_sec").slideUp();
      });
    	if(indexs!=null){
    		$(".u_left_mian").eq(indexs).addClass("u_left_red").parent().siblings().children(".u_left_mian").removeClass("u_left_red");
    		$(".u_left_mian").eq(indexs).siblings(".u_left_sec").css("display","block");
    		//.css("display","block")
    	}
    	
    });
</script>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        