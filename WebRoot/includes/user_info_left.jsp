<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/includes/taglibs.jsp" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
        <ul>
           <li class="fir_li">账户主页</li>
           <li>
              <div class="u_left_mian "><i class="mian_pic03"></i><span>账户管理</span></div>
               <ul class="u_left_sec">
                <li>
                  <a href="/wel/account">个人信息</a>
                </li>
				<li style="display:block;">
                  <a href="/anquanshezhi.jsp">安全设置</a>
                </li>
                <li style="border-bottom:0; display:none">
                  <a href="/tongzhishezhi.jsp" >通知设置</a>
                </li>
                <li style="border-bottom:0;">
                  <a href="/account/tuijian" >推荐管理</a>
                </li>
                <li style="border-bottom:0;display:none;">
                  <a href="/hero/addr" >我的地址</a>
                </li>
              </ul>
           </li>
           <li>
              <div class="u_left_mian"><i class="mian_pic01"></i><span>资产管理</span></div>
              <ul class="u_left_sec">
                <li>

                 <a href="/gate/service" >资产统计</a>

                </li>
                <li>
                 <a href="/gate/recharge">充值</a>
                </li>
                <li>
                 <a href="/gate/drawMoney">提现</a>
                </li>
                <li>
                 <a href="/account/liquan?page=1&catlog=0">我的礼券</a>
                </li>

              </ul>
           </li>

           <li>
              <div class="u_left_mian ${fn:startsWith(pageContext.request.requestURI, "/accounts/touziguanli") ? "u_left_red":""}"><i class="mian_pic02 "></i><span>投资管理</span></div>
              <ul class="u_left_sec" style='${fn:startsWith(pageContext.request.requestURI, "/accounts/touziguanli") ? "display:block":""}'>
                <li style="display:none;">
                  <a href="/yitou.jsp">已投项目</a>
                </li>
                <li style="display:none;">
                  <a href="/shoucang.jsp">收藏项目</a>
                </li>
                <li>
                  <a href="/gate/userProject">我的项目</a>
                </li>
                <c:if test="${userinfo.isborrow==true }">
                <li>
                  <a href="/loan/loanProduct">我的借款</a>

                </li>
                </c:if>
                <li>
                  <a href="/transRecord/queryTransRecord?time=timeall&type=typeall">交易记录</a>
                </li>

      <li style="display:none">
                  <a href="/hero/my">我的众筹</a>

                </li>  
                <li style="display:none;">
                  <a href="/zhaiquan.jsp">债权转让</a>
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

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
