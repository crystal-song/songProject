
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ include file="/includes/taglibs.jsp" %>

<title>用户中心修改 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  

</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<!-- 
<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>
<div class="msg_con">
   <div class="msg_left">	 
   </div>
   <div class="msg_right">
       <div class="msg_main">
           <div class="msg_title">
             <h2>个人信息</h2>
             <a href="<%=path%>/user/cancelUpdate?name=${user1.name}">取消修改</a>
           </div>
           <div class="user_con">
               <div class="photo">
                   <span></span>
               </div>
               <div class="center">
                   <ul class="user_con_name">
                     <li class="mg_right">用户名</li><li>aaa${user1.name}</li>
                     <li class="mg_right">真实姓名</li><li>aaa${user1.realName}</li>
                     <li class="mg_right">身份证号码</li><li>aaa${user1.identityCard}</li>
                     <li class="mg_right">手机号码</li><li>aaa${user1.phone}</li>
                     <li class="mg_right">邮箱地址</li><li>aaa${user1.email}</li>
                     <li class="mg_right">易宝账号</li><li>aaa${user1.email}</li>
                   </ul>   
               </div>
               <div class="user_right">
                   <ul class="user_check">
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">用户注册时填写的用户名，不可更改</div><span class="box_right"></span></div><p class="xiangqing">详情</p></li>
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未认证个人实名信息， <a href="<%=path%>/anquanshezhi.jsp">实名认证</a></div><span class="box_right"></span></div><p>未认证</p></li>                  
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未绑定身份证，实名认证即可成功绑定身份证， <a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div><span class="box_right"></span></div><p>未认证</p></li>
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未绑定手机号， <a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div><span class="box_right"></span></div><p>未认证</p></li>
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未绑定邮箱号， <a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div><span class="box_right"></span></div><p>未认证</p></li>            
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未注册易宝账号， <a href="<%=path%>/#">请注册</a></div><span class="box_right"></span></div><p>未注册</p></li> 
                   </ul>
               
               </div>             
           </div>
           <div class="user_con_last">
               <form id="form"  action="<%=path%>/user/update" id="form" method="post" style="width:866px; height:595px; overflow:hidden ">
                 <input type="hidden"  name="id" id="id" value="${user1.id}" />
                 <input type="hidden"  name="name" id="name" value="${user1.name}" />
                 <input type="hidden"  name="password" id="password" value="${user1.password}" />
                 <input type="hidden"  name="realName" id="realName" value="${user1.realName}" />
                 <input type="hidden"  name="identityCard" id="identityCard" value="${user1.identityCard}" />
                 <input type="hidden"  name="phone" id="phone" value="${user1.phone}" />
                 <input type="hidden"  name="email" id="email" value="${user1.email}" />
                <div class="center_last">
                   <ul class="user_con_last_name">
                     <li>性别(不可修改)</li>
                     <li>出生日期(不可修改)</li>
                     <li>最高学历</li>
                     <li>毕业院校</li>
                     <li>婚姻状态</li>
                     <li>居住地址</li>
                     <li>公司行业</li>
                     <li>公司规模</li>
                     <li>职位</li>
                     <li>月收入</li> 
                   </ul>
                   <ul class="user_con_last_mag">
                     <li></li>
                     <li></li>
                     <li> 
                       <select class="select01"  name="educationBackground"   value="${user1.educationBackground}" >
                         <option checked="checked">请选择</option>
                         <option>高中或以下</option>
                         <option>大专</option>
                         <option>大学本科</option>
                         <option>研究生及以上</option> 
                       </select></li>
                     <li><input type="text" class="text01"   name="schoolOfGraduation"  value="${user1.schoolOfGraduation}"   /></li>
                     <li><input type="radio" name="maritalStatus" value="未婚"/>未婚<input type="radio" value="已婚" name="maritalStatus"/>已婚<input type="radio" name="maritalStatus" value="其他"  checked="true" />其他</li>
                     <li><input type="text" class="text01"  name="address" value="${user1.address}"   /></li>
                     <li> 
                       <select class="select01" name="companyIndustry" value="${user1.companyIndustry}"  >
                            <option value="">请选择</option>
                            <option value="制造业">制造业</option>
                            <option value="IT">IT</option>
                            <option value="政府机关">政府机关</option>
                            <option value="媒体/广告">媒体/广告</option>
                            <option value="零售/批发">零售/批发</option>
                            <option value="教育/培训">教育/培训</option>
                            <option value="公共事业">公共事业</option>
                            <option value="交通运输业">交通运输业</option>
                            <option value="房地产业">房地产业</option>
                            <option value="能源业">能源业</option>
                            <option value="金融/法律">金融/法律</option>
                            <option value="餐饮/旅馆业">餐饮/旅馆业</option>
                            <option value="医疗/卫生/保健">医疗/卫生/保健</option>
                            <option value="建筑工程">建筑工程</option>
                            <option value="农业">农业</option>
                            <option value="娱乐服务业">娱乐服务业</option>
                            <option value="体育/艺术">体育/艺术</option>
                            <option value="公益组织">公益组织</option>
                            <option value="其它">其它</option> 
                       </select>
                       </li>
                     <li>
                       <select class="select01"  name="companyScale" value="${user1.companyScale}" >
                            <option value="">请选择</option>
                            <option value="10人以下">10人以下</option>
                            <option value="10-100人">10-100人</option>
                            <option value="100-500人">100-500人</option>
                            <option value="500人以上">500人以上</option> 
                       </select>
                     </li>
                     <li><input type="text" class="text01"  name="position"   value="${user1.position}" /></li>
                     <li>
                       <select class="select01"  name="income" value="${user1.income}">
                            <option value="">请选择</option>
                            <option value="1000元以下">1000元以下</option>
                            <option value="1001-2000元">1001-2000元</option>
                            <option value="2000-5000元"> 2000-5000元</option>
                            <option value="5000-10000元">5000-10000元</option>
                            <option value="10000-20000元">10000-20000元</option>
                            <option value="20000-50000元">20000-50000元</option>
                            <option value="50000元以上">50000元以上</option> 
                       </select>       
                     </li>
                   </ul>    
               </div>
               <div class="clear"></div>
               <div class="use_btn">
                <a href="<%=path%>/user/cancelUpdate?name=${user1.name}"><input type="button" class="submit02" value="取消"/></a>
                <input type="submit" class="submit01" value="保存"/>
               </div>
                </form>
              
           </div>
           <div class="user_bottom">
            <h3>温馨提示:</h3>
            <ol>
              <li>请您根据自身真实情况填写，中租宝会对用户的所有资料进行严格保密。</li>
              <li>使用过程遇到问题，请联系客服，400-600-4300。 </li>
            </ol>
           </div>
       </div>
   </div>    
</div>


<div class="clear"></div>
<div class="one"></div>
<div class="clear"></div>

<div class="clear_height"></div>
 -->
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
	                        <span>${user1.name}</span>
	                        <span class="tip" style="background: url('<%=path%>/img/images-2014-11/renzheng01.png') 40px 7px no-repeat;">详情</span>
	                          <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01">注册时的用户名不可更改</div>
	                           <span class="border_right01"></span>
	                           </div>
	                     </li>
	                     <li style="display:none">
	                      <span>真实姓名</span>
	                      <span>${user1.realName}</span>
	                      <span class="tip">立即认证</span>
	                      <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01" >您未进行实名认证，<a href="<%=path%>/anquanshezhi.jsp">请认证</a></div>
	                           <span class="border_right01"></span>
	                      </div>
	                    </li>
	                     <li style="display:none">
	                      <span>身份证号码</span>
	                      <span>${user1.identityCard}</span>
	                      <span class="tip">立即认证</span>
	                      <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01">您未绑定身份证，<a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div>
	                           <span class="border_right01"></span>
	                      </div>
	                    </li>
	                     <li style="display:none">
	                      <span>手机号码</span>
	                      <span>${user1.phone}</span>
	                      <span class="tip">立即认证</span>
	                        <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01">您未绑定手机号码，<a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div>
	                           <span class="border_right01"></span>
	                        </div>
	                    </li>
	                     <li style="display:none">
	                      <span>邮箱地址</span>
	                      <span>${user1.email}</span>
	                      <span class="tip">立即认证</span>
	                        <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01">您未绑定邮箱，<a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div>
	                           <span class="border_right01"></span>
	                        </div>
	                    </li>
	                    <li><span>易宝账号</span>
	                      <span>${registerYeePay1.platformUserNo}</span>
	                      <span class="tip">立即认证</span>
	                        <div id="tishik01">
	                           <span class="border_left01"></span>
	                           <div class="border_cent01">您未绑定易宝账号，<a href="<%=path%>/gate/register" target="_blank">请绑定</a></div>
	                           <span class="border_right01"></span>
	                        </div></li>
	                   </ul>
	                   
             <ul class="con_name lame">
                      <form id="form"  action="<%=path%>/user/update" id="form" method="post" style="width:866px; height:595px; overflow:hidden ">
		                 <input type="hidden"  name="id" id="id" value="${user1.id}" />
		                 <input type="hidden"  name="name" id="name" value="${user1.name}" />
		                 <input type="hidden"  name="password" id="password" value="${user1.password}" />
		                 <input type="hidden"  name="realName" id="realName" value="${user1.realName}" />
		                 <input type="hidden"  name="identityCard" id="identityCard" value="${user1.identityCard}" />
		                 <input type="hidden"  name="phone" id="phone" value="${user1.phone}" />
		                 <input type="hidden"  name="email" id="email" value="${user1.email}" />
                     <li><span>性别(不可修改)</span><span class="modify"></span></li>
                     <li><span>出生日期(不可修改)</span><span class="modify">aaa</span></li>
                     <li><span>最高学历</span><span class="modify">
                         <select class="select01"  name="educationBackground"   value="${user1.educationBackground}" >
                           <option checked="checked">请选择</option>
                           <option>高中或以下</option>
                           <option>大专</option>
                           <option>大学本科</option>
                           <option>研究生及以上</option> 
                       </select>
                     </span></li>
                     <li><span>毕业院校</span><span class="modify"><input type="text" class="input_wd"></span></li>
                     <li><span>婚姻状态</span><span class="modify">
                      <input type="radio" value="未婚" class="radio_width" name="radio_one"/>未婚
                      <input type="radio" value="已婚" class="radio_width" name="radio_one"/>已婚
                      <input type="radio"  value="其他"  checked="true" class="radio_width" name="radio_one"/>其他</span>
                    </li>
                     <li><span>居住地址</span><span class="modify"><input type="text" class="input_wd"></span></li>
                     <li><span>公司行业</span><span class="modify">
                         <select class="select01" name="companyIndustry" value="${user1.companyIndustry}"  >
                            <option value="">请选择</option>
                            <option value="制造业">制造业</option>
                            <option value="IT">IT</option>
                            <option value="政府机关">政府机关</option>
                            <option value="媒体/广告">媒体/广告</option>
                            <option value="零售/批发">零售/批发</option>
                            <option value="教育/培训">教育/培训</option>
                            <option value="公共事业">公共事业</option>
                            <option value="交通运输业">交通运输业</option>
                            <option value="房地产业">房地产业</option>
                            <option value="能源业">能源业</option>
                            <option value="金融/法律">金融/法律</option>
                            <option value="餐饮/旅馆业">餐饮/旅馆业</option>
                            <option value="医疗/卫生/保健">医疗/卫生/保健</option>
                            <option value="建筑工程">建筑工程</option>
                            <option value="农业">农业</option>
                            <option value="娱乐服务业">娱乐服务业</option>
                            <option value="体育/艺术">体育/艺术</option>
                            <option value="公益组织">公益组织</option>
                            <option value="其它">其它</option> 
                       </select>
                     </span></li>
                     <li><span>公司规模</span><span class="modify">
                            <select class="select01"  name="companyScale" value="${user1.companyScale}" >
                            <option value="">请选择</option>
                            <option value="10人以下">10人以下</option>
                            <option value="10-100人">10-100人</option>
                            <option value="100-500人">100-500人</option>
                            <option value="500人以上">500人以上</option> 
                       </select>
                     </span></span></li>
                     <li><span>职位</span><span class="modify"><input type="text" class="input_wd"></span></li>
                     <li><span>月收入</span><span class="modify">
                            
                            <select class="select01"  name="income" value="${user1.income}">
                            <option value="">请选择</option>
                            <option value="1000元以下">1000元以下</option>
                            <option value="1001-2000元">1001-2000元</option>
                            <option value="2000-5000元"> 2000-5000元</option>
                            <option value="5000-10000元">5000-10000元</option>
                            <option value="10000-20000元">10000-20000元</option>
                            <option value="20000-50000元">20000-50000元</option>
                            <option value="50000元以上">50000元以上</option> 
                       </select>
                     </span></li>
                     <li><span class="span_left">
                           <input type="submit" class="submit01" value="保存"/>
                          </span>
                         <span class="modify span_right" >
                           <a href="<%=path%>/user/cancelUpdate?name=${user1.name}" class="bac">取消</a>
                           </span>
                     </li>
                     </form>
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