<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%@ include file="/includes/taglibs.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="中租宝，是北京中投汇融投资管理有限公司旗下的众筹网络平台，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
var navIndex=2;  
    $(document).ready(function(){
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    	
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
          
          $(".u_left_mian").click(function(){
              $(this).siblings().slideToggle("slow");
            });
          
          $(".user_left li").mouseover(function(){
              var index=$(this).index();
              var min_label=$(this).children(".u_left_mian");

               if(index==1){
                     min_label.children(".mian_pic01").css('background-image','url("<%=path%>/img/images-2014-11/tubiao011.png")');
                     return true;
                     }
               if(index==2){
                     min_label.children(".mian_pic02").css('background-image','url("<%=path%>/img/images-2014-11/tubiao012.png")');
                     return true;
                     } 
               if(index==3){
                     min_label.children(".mian_pic03").css('background-image','url("<%=path%>/img/images-2014-11/tubiao013.png")');
                     return true;
                     }
               if(index==4){
                     min_label.children(".mian_pic04").css('background-image','url("<%=path%>/img/images-2014-11/tubiao014.png")');
                     return true;
                     }                 
                     
            }).mouseout(function(){

               var index=$(this).index();
               var min_label=$(this).children(".u_left_mian");
               
              if(index==1){
                min_label.children(".mian_pic01").css('background-image','url("<%=path%>/img/images-2014-11/tubiao01.png")');
                return true;
              }
              if(index==2){
                min_label.children(".mian_pic02").css('background-image','url("<%=path%>/img/images-2014-11/tubiao02.png")');
                return true;
              }
              if(index==3){
                min_label.children(".mian_pic03").css('background-image','url("<%=path%>/img/images-2014-11/tubiao03.png")');
                return true;
              }
              if(index==4){
                min_label.children(".mian_pic04").css('background-image','url("<%=path%>/img/images-2014-11/tubiao04.png")');
                return true;
              }
            });
       
});
        
</script>
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
	                        <span class="tip">详情</span>
	                          <div id="tishik01">
	                            <span class="border_left01"></span>
	                            <div  class="border_cent01">注册时的用户名不可更改</div>
	                            <span class="border_right01"></span>
	                          </div>
	                 </li>
                     <li><span>真实姓名</span>
	                      <span class="span_le">${user1.realName}</span>
	                      <span class="tip"><a href="<%=path%>/anquanshezhi.jsp">立即认证</a></span>
	                      <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01" ><a href="<%=path%>/anquanshezhi.jsp">您未进行实名认证，请认证</a></div>
	                           <span class="border_right01"></span>
	                      </div></li>
                     <li><span>身份证号码</span>
	                      <span class="span_le">${user1.identityCard}</span>
	                      <span class="tip"><a href="<%=path%>/anquanshezhi.jsp">立即认证</a></span>
	                      <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01"><a href="<%=path%>/anquanshezhi.jsp">您未绑定身份证，请绑定</a></div>
	                           <span class="border_right01"></span>
	                      </div></li>
                     <li><span>手机号码</span>
	                      <span class="span_le">${user1.phone}</span>
	                      <span class="tip"><a href="<%=path%>/anquanshezhi.jsp">立即认证</a></span>
	                        <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01"><a href="<%=path%>/anquanshezhi.jsp">您未绑定手机号码，请绑定</a></div>
	                           <span class="border_right01"></span>
	                        </div></li>
                     <li><span>邮箱地址</span>
	                      <span class="span_le">${user1.email}</span>
	                      <span class="tip"><a href="<%=path%>/anquanshezhi.jsp">立即认证</a></span>
	                        <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01"><a href="<%=path%>/anquanshezhi.jsp">您未绑定邮箱，请绑定</a></div>
	                           <span class="border_right01"></span>
	                        </div></li>
	                 <li>
	                      <span>易宝账号</span>
	                      <span class="span_le"><%-- ${registerYeePay1.platformUserNo} --%>${user1.realName}</span>
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
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>