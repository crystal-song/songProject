<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/includes/taglibs.jsp" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
        <ul>
           <li class="fir_li">账户主页</li>
           <li>
              <div class='u_left_mian ${fn:startsWith(pageContext.request.requestURI, "/accounts/user") ? "u_left_red":""}'><i class="mian_pic03"></i><span>账户管理</span></div>
              
               <ul class="u_left_sec" style='${fn:startsWith(pageContext.request.requestURI, "/accounts/user") ? "display:block":""}'>
                <li>
                  <a href="/wel/account" style='${pageContext.request.requestURI == "/accounts/user/user-info.jsp" ? "color: rgb(252, 101, 46);":""}'>个人信息</a>
                </li>
				<li style="display:block;">
                  <a href="/accounts/user/anquanshezhi.jsp" style='${pageContext.request.requestURI == "/accounts/user/anquanshezhi.jsp" ? "color: rgb(252, 101, 46);":""}'>安全设置</a>
                </li>
                <li style="border-bottom:0; display:none">
                  <a href="/user/tongzhishezhi.jsp" >通知设置</a>
                </li>
                <li style="border-bottom:0;">
                  <a href="/account/tuijian" style='${pageContext.request.requestURI == "/accounts/user/tuijian.jsp" ? "color: rgb(252, 101, 46);":""}'>推荐管理</a>
                </li>
                <li style="border-bottom:0;display:none;">
                  <a href="/hero/addr" style='${pageContext.request.requestURI == "/accounts/user/dindian.jsp" ? "color: rgb(252, 101, 46);":""}'>我的地址</a>
                </li>
              </ul>
           </li>
           <li>
              <div class='u_left_mian ${fn:startsWith(pageContext.request.requestURI, "/accounts/zichan") ? "u_left_red":""}'><i class="mian_pic01"></i><span>资产管理</span></div>
              <ul class="u_left_sec" style='${fn:startsWith(pageContext.request.requestURI, "/accounts/zichan") ? "display:block":""}'>
                <li>

                 <a href="/gate/service" style='${pageContext.request.requestURI == "/accounts/zichan/zichan.jsp" ? "color: rgb(252, 101, 46);":""}'>资产统计</a>

                </li>
                <li>
                 <a href="/gate/recharge" style='${pageContext.request.requestURI == "/accounts/zichan/chongzhi.jsp" ? "color: rgb(252, 101, 46);":""}'>充值</a>
                </li>
                <li>
                 <a href="/gate/drawMoney" style='${pageContext.request.requestURI == "/accounts/zichan/tixian.jsp" ? "color: rgb(252, 101, 46);":""} style='${pageContext.request.requestURI == "/accounts/zichan/zichan_ok.jsp" ? "color: rgb(252, 101, 46);":""}''>提现</a>
                </li>
                <li>
                 <a href="/account/liquan?page=1&catlog=0" style='${pageContext.request.requestURI == "/accounts/zichan/liquan.jsp" ? "color: rgb(252, 101, 46);":""}'>我的礼券</a>
                </li>

              </ul>
           </li>

           <li>
              <div class="u_left_mian ${fn:startsWith(pageContext.request.requestURI, "/accounts/touziguanli") ? "u_left_red":""}"><i class="mian_pic02 "></i><span>投资管理</span></div>
              <ul class="u_left_sec" style='${fn:startsWith(pageContext.request.requestURI, "/accounts/touziguanli") ? "display:block":""}'>
            
               
                <li>
                  <a href="/gate/userProject" style='${pageContext.request.requestURI == "/accounts/touziguanli/wodexiangmu.jsp" ? "color: rgb(252, 101, 46);":""}' >我的项目</a>
                </li>
                <c:if test="${userinfo.isborrow==true }">
     
                <li>
                
                  <a href="/loan/loanProduct"  style='${pageContext.request.requestURI == "/accounts/touziguanli/loanOrder.jsp" ? "color: rgb(252, 101, 46);":""}${pageContext.request.requestURI == "/accounts/touziguanli/myLoan.jsp" ? "color: rgb(252, 101, 46);":""}${pageContext.request.requestURI == "/accounts/touziguanli/loanDetail.jsp" ? "color: rgb(252, 101, 46);":""}' >我的借款</a>

                </li>
                </c:if>
                <li>
                  <a href="/transRecord/queryTransRecord?time=timeall&type=typeall"  style='${pageContext.request.requestURI == "/accounts/touziguanli/jiaoyi.jsp" ? "color: rgb(252, 101, 46);":""}' >交易记录</a>
                </li>

      <li style="display:none">
                  <a href="/hero/my">我的众筹</a>

                </li>  
              
              </ul>
           </li>
           
           <li style="display:none">
             <div class="u_left_mian"><i class="mian_pic04"></i><span>消息管理</span></div>
              <ul class="u_left_sec">
                <li style="border-bottom:0">
                  <a href="/xitongxiaoxi.jsp">系统消息</a>
                </li>
              </ul>
           </li>
         </ul>
        <input type="hidden" id="username" value="${name }"  />
      
