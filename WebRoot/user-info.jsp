<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ include file="/includes/taglibs.jsp" %>

<title>我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  

</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<!-- "url('<%=path%>/img/images-2014-11/renzheng01.png 40px 7px no-repeat')"  -->
<div class="user_con">
    <div class="user_left">
      <!-- user_left start -->
           <%@ include file="/includes/user_info_left.jsp" %>
         <!-- user_left end -->
    </div>
        <div class="user_right">  
        <div class="zichan_con">        
          <div class="pro_con_title" style="margin-top:5px;"><strong>个人信息</strong>
          </div>
               <div class="con_list">
                  <div class="con_pic" style="display:none"></div>
                   <ul class="con_name">
                     <li>
                         <span>用户名</span>
	                        <span class="span_le">${user1.name}</span>
	                        <span class="tip" style="background: url('<%=path%>/img/images-2014-11/renzheng01.png') 40px 7px no-repeat;">详情</span>
	                          <div id="tishik01">
	                            <span class="border_left01"></span>
	                            <div  class="border_cent01">注册时的用户名不可更改</div>
	                            <span class="border_right01"></span>
	                          </div>
	                 </li>
                     <li style="display:none"><span>真实姓名</span>
	                      <span class="span_le">
	                      <c:if test="${not empty user1.realName}"> 
	                      ${fn:substring(user1.realName,0,1)}
	                      <c:forEach var="j" begin="1" end="${fn:length(user1.realName)-1}" step="1">*</c:forEach>
	                      </c:if> 
	                      </span>
	                      <c:if test='${ empty registerYeePay1.code}'>
	                      <span class="tip"><a href="<%=path%>/anquanshezhi.jsp">立即认证</a></span>
	                      <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01" ><a href="<%=path%>/anquanshezhi.jsp">您未进行实名认证，请认证。</a></div>
	                           <span class="border_right01"></span>
	                      </div>
	                      </c:if>
	                 <c:if test='${registerYeePay1.code==1}'>
	                           <span class="tip" id="green_back">已认证</span>
	                           <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01"><a href="javascript:;">您已认证真实姓名。</a></div>
	                           <span class="border_right01"></span>
	                        </div>
	                    </c:if>
	                 </li>
                     <li style="display:none"><span>身份证号码</span>
	                      <span class="span_le">
	                      <c:if test="${not empty user1.identityCard}">
	                      ${fn:substring(user1.identityCard,0,7)}********${fn:substring(user1.identityCard,15,18)}
	                      </c:if>
	                      </span>
	                      <c:if test='${ empty registerYeePay1.code}'>
	                      <span class="tip"><a href="<%=path%>/anquanshezhi.jsp">立即认证</a></span>
	                      <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01"><a href="<%=path%>/anquanshezhi.jsp">您未绑定身份证，请绑定。</a></div>
	                           <span class="border_right01"></span>
	                      </div>
	                      </c:if>
	                 <c:if test='${registerYeePay1.code==1}'>
	                           <span class="tip" id="green_back">已认证</span>
	                           <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01"><a href="javascript:;">您已认证身份证。</a></div>
	                           <span class="border_right01"></span>
	                        </div>
	                    </c:if>
	                 </li>
                     <li style="display:none"><span>手机号码</span>
	                      <span class="span_le">
	                       <c:if test="${not empty user1.phone}">
	                      ${fn:substring(user1.phone,0,3)}****${fn:substring(user1.phone,7,11)}
	                      </c:if>
	                      </span>
	                      <span class="tip"><a href="<%=path%>/anquanshezhi.jsp">立即认证</a></span>
	                        <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01"><a href="<%=path%>/anquanshezhi.jsp">您未绑定手机号码，请绑定</a></div>
	                           <span class="border_right01"></span>
	                        </div></li>
                     <li style="display:none"><span>邮箱地址</span>
	                      <span class="span_le">${user1.email}</span>
	                      <c:if test="${user1.regState==null||user1.regState=='f' }">
	                      <span class="tip"><a href="<%=path%>/anquanshezhi.jsp">立即认证</a></span>
	                        <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01"><a href="<%=path%>/anquanshezhi.jsp">您未绑定邮箱，请绑定</a></div>
	                           <span class="border_right01"></span>
	                        </div>
	                        </c:if>
	                         <c:if test="${user1.regState=='s'}">
	                           <span class="tip" id="green_back">已认证</span>
	                           <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01"><a href="javascript:;">您已绑定邮箱。</a></div>
	                           <span class="border_right01"></span>
	                        </div>
	                    </c:if>
	                  </li>
	                 <li>
	                      <span>易宝账号</span>
	                      <span class="span_le"><%-- ${registerYeePay1.platformUserNo} --%>
	                      <c:if test="${not empty user1.realName}"> 
	                      ${fn:substring(user1.realName,0,1)}<c:forEach var="j" begin="1" end="${fn:length(user1.realName)-1}" step="1">*</c:forEach>
	                      </c:if>
	                      </span>
	                      <c:if test='${ empty registerYeePay1.code}'>
	                      <span class="tip"><a href="<%=path%>/gate/register" target="_blank">立即认证</a></span>
	                        <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01"><a href="<%=path%>/gate/register" target="_blank">您未绑定易宝账号，请绑定！</a></div>
	                           <span class="border_right01"></span>
	                        </div>
	                     </c:if>
	                     <c:if test='${registerYeePay1.code==1}'>
	                           <span class="tip" id="green_back">已认证</span>
	                           <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01"><a href="javascript:;">您已绑定易宝账户。</a></div>
	                           <span class="border_right01"></span>
	                        </div>
	                    </c:if>
	                </li>
                   </ul>
                   <a class="user_pink" href="<%=path%>/user/getuserbyName?name=${user1.name}">修改个人信息</a>
                   <ul class="con_name lame">
                     <li><span>性别</span><span class="span_le">${user1.sex}</span></li>
                     <li><span>出生日期</span><span class="span_le">${ser1.dateOfBirth}</span></li>
                     <li><span>最高学历</span><span class="span_le">${user1.educationBackground}</span></li>
                     <li><span>毕业院校</span><span class="span_le">${user1.schoolOfGraduation}</span></li>
                     <li><span>婚姻状态</span><span class="span_le">${user1.maritalStatus}</span></li>
                     <li><span>居住地址</span><span class="span_le">${user1.address}</span></li>
                     <li><span>公司行业</span><span class="span_le">${user1.companyIndustry}</span></li>
                     <li><span>公司规模</span><span class="span_le">${user1.companyScale}</span></li>
                     <li><span>所在职位</span><span class="span_le">${user1.position}</span></li>
                     <li><span>每月收入</span><span class="span_le">${user1.income}</span></li> 
                   </ul>
               </div>       
           </div>
         </div>
</div>
<!-- absolute_right start -->
	<%@ include file="/includes/absolute.jsp" %>
<!-- absolute_right end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
<script type="text/javascript">
var navIndex=2;  
var indexs=0;
    $(document).ready(function(){
    	$(".u_left_sec:eq(0) li:eq(0)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".nav_big a").eq(2).children("p").addClass("headwd_color");
    	
    	$(".tip").mouseover(function(){
            //alert("aa");
           
                $(this).siblings("#tishik01").css("display","block");
                $(this).siblings("#tishik01").mouseover(function(){
                $(this).show();
             }).mouseout(function(){
                $(this).hide();    
             });

          }).mouseout(function(){
             $(this).siblings("#tishik01").css("display","none");      
          });
              
          
});
        
</script>
</html>