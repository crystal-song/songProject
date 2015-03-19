<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mftour.spring.service.IUserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %> 
<title>安全设置 - 我的账户 - 中租宝</title>
<script type="text/javascript" src="<%=path%>/js/sms.js" ></script>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="user_con">
    <div class="user_left">
      <!-- user_left start -->
           <%@ include file="/includes/user_info_left.jsp" %>
         <!-- user_left end -->
    </div>
    
          <div class="user_right">  
            <div class="zichan_con">        
               <div class="pro_con_title" style="margin-top:5px;"><strong>安全设置</strong>
                </div>
               <div class="con_list_new">
                 <ul class="anquan">
                   <li>
                        <div class="anquan_label label1">
                         <span>用户名</span>
                         <span>已设置</span>
                         <span>${name}</span>
                        </div> 
                   </li>
                   <li style="display:none">
                   <form action="<%=path%>/welcome/identityCardVerification" method="post" enctype="multipart/form-data" id="formone">
                        <div class="anquan_label label2">
                         <span>实名认证</span>
                          <c:if test="${userinfo.identityCard!=null}">
                            <span>已设置</span>
                     	  </c:if>
	                      <c:if test="${userinfo.identityCard==null}">
	                        <span class="anquan_right">认证</span>
	                      </c:if>
                        </div>
                       <div class="anquan_hide" style="display:none;">
                         <ul>
                           <li>
                             <span><strong>*</strong>用户名</span>
                             <span><input type="text" id="name" name="name" value="${name}"></input></span> 
                           </li>
                           <li>
                           <span><strong>*</strong>真实姓名</span>
                           <span><input type="text" id="realName" name="realName"></input></span> 
                           <span class="tishitext" style="width:auto;"></span> 
                           </li>
                           <li>
                             <span><strong>*</strong>证件类型</span>
                             <span>
	                          <select>
	                              <option value="">身份证</option>
	                              <option value="">军官证</option>
	                              <option value="">台胞证</option>
	                              <option value="">护照</option>
	                          </select>
                             </span>
                          </li>
                           <li><span><strong>*</strong>身份证号码</span>
                           <span>
                           <input type="text" id="identityCard" name="identityCard"></input>
                           </span><span class="tishitext" style="width:auto"></span>
                           </li>
                           <li>
                             <span><strong>*</strong>上传正面证件照</span>
                             <span><input type="file" id="file01" name="myfiles" onchange="PreviewImage(this,'imgHeadPhoto1','divPreview1')" size="20"/></span><span class="tishitext" style="width:auto"></span></li>
                           <li id="pic_height"><span></span>
                            <span id="postcar">
                            <div id="divPreview1">
      						 <img id="imgHeadPhoto1" src="" style="width: 200px; height: 200px; border: solid 1px #d2e2e2;" alt="" />
 							</div>
 							</span>
 						   </li>                         
                         <li><span><strong>*</strong>上传背面证件照</span><span>  <input type="file" id="file02" name="myfiles" onchange="PreviewImage(this,'imgHeadPhoto2','divPreview2')" size="20"/></span><span class="tishitext" style="width:auto"></span></li>
                          <li id="pic_height"><span></span>
                          <span id="postcar"> 
                            <div id="divPreview2">
      						 <img id="imgHeadPhoto2" src="" style="width: 200px; height: 200px; border: solid 1px #d2e2e2;" alt="" />
 						    </div>
				 		  </span>
				 		  </li>
                           <li id="text-align_style" style="display:none">  
                                <span style="width:300px;" id="text-align_style">
                                <input type="checkbox" class="box_wh"></input>我已阅读并同意签署 <a href="<%=path%>/zhucexieyi.jsp" class="wd_color">《中租宝服务协议》</a></span>    
                           </li>
                           <li id="text-align_style" style="display:none">  
                                <span style="width:300px;" id="text-align_style"><input type="checkbox" class="box_wh"></input>我已阅读并同意签署 <a href="<%=path%>/yinsitiaokuan.jsp" class="wd_color">《委托收付资金协议》</a></span>    
                           </li>
                           <li><span></span><span><a onclick="onSubmitone()" class="anquan_hide_btn" style="width:80px; float:left;">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                       </form>
                   </li>
                   <li style="display:none">
                   <form action="<%=path %>/welcome/phoneVerification" method="post">
                       <div class="anquan_label label3">
                         <span>手机认证</span>
                          <c:if test="${userinfo.phone!=null}">
                         <span>已设置</span>
                     	</c:if>
                     	<c:if test="${userinfo.phone==null}">
                         <span class="anquan_right">认证</span>
                        </c:if>
                        </div>
                        <form action="<%=path%>/welcome/phoneVerification">
                       <div class="anquan_hide" style="display:block">
                          <ul>
                           <li><span><strong>*</strong>手机号码</span><span><input type="text" id="jbPhone"></input></span> <span id="jbPhoneTip" class="tishitext" style="display:block"></span></li>
                           <li><input type="button" id="btnSendCode" name="btnSendCode" value="免费获取验证码" onclick="sendMessage()" /></li>
                           <li><span><strong>*</strong>短信验证码</span><span><input type="text" id="SmsCheckCode" name="SmsCheckCode" ></input></span></li>
                           <li><span><input type="button" value="提交"></input></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">手机认证成功！</div>
                       </div>
                       </form>
                   </li>
                   <li>
                        <div class="anquan_label label4">
                         <span>邮箱验证</span>
                         
                        <c:if test="${userinfo.regState=='s'}">
                         <span>已设置</span>
                     	</c:if>
                     	<c:if test="${userinfo.regState==null||userinfo.regState=='f'}">
                         <span class="anquan_right">认证</span>
                        </c:if>
                        </div>
                       <div class="anquan_hide" style="display:none">
                          <ul>
                          <form action="<%=path %>/welcome/emailVerification" method="post" id="form">
                           <li><span><strong>*</strong>邮箱验证</span><span><input type="text" id="mail" name="mail"></input></span><span class="tishitext" style="width:auto;"></span></li>
                           <!-- <li><span></span><a class="anquan_hide_btn" style="width:80px;" onclick="onSubmit()">提交</a></li> -->
                           <li><span></span><input type="submit" value="提交"  class="anquan_hide_btn" style="width:80px;"></input></li>
                         </form>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">邮箱验证成功,请重新登录！</div>
                       </div>
                   </li>
                   <li >
                        <div class="anquan_label label5">
                         <span>登录密码</span>
                         <span class="anquan_right">修改</span>
                        </div>
                       <div class="anquan_hide" style="display:none">
                      
                          <ul>
                           <li><span><strong>*</strong>原登录密码</span><span><input type="password" id="oldPassword" name="oldPassword"></input></span></li>
                           <li><span><strong>*</strong>新登录密码</span><span><input type="password" id="password" name="password"></input></span></li>
                           <li><span><strong>*</strong>再次输入登录密码</span><span><input type="password" id="newpassword"></input></span><span class="tishitext" style="width:auto"></span></li>
                          
                           <c:if test="${userinfo.answer!=bull}">
                           <li><span><strong>*</strong>请选择问题：</span><span>
                               <span>
                                <select>
                                  <option value="8">你孩子的名字叫什么</option>
                                  <option value="9">你孩子的生日是哪天</option>
                                  <option value="1">你爸爸的名字叫什么</option>
                                  <option value="2">你爸爸的生日是哪天</option>
                                  <option value="3">你妈妈的名字叫什么</option>
                                  <option value="4">你妈妈的生日是哪天</option>
                                  <option value="5">最难忘的日子</option>
                                  <option value="6">你的学号是多少</option>
                                  <option value="7">你的老家在哪里</option>
                                </select>
                               </span> 
					     </li>
						 <li><span><strong>*</strong>请输入答案：</span><span><input type="text" id="answer" name="answer" onblur="checkAnswer()"></input></span><span id="Tip_Answer"></span></li>
                           </c:if>
                         <!-- <li><span></span><span><input type="button" class="anquan_hide_btn" value="提交" onclick="updatePassword();" id="ensure" style="width:80px; float:left;"/></span></li> -->
                         <li><span></span><span><input type="button" class="anquan_hide_btn" value="提交" onclick="updatePassword();" id="ensure" style="width:80px; float:left;"/></span></li>
                         </ul>
                    
                         <div class="tijiao_checkok" style="display:none">密码修改成功,请重新登录！</div>
                       </div>
                   </li>
                   <li style="display:block">
                       <div class="anquan_label label6" style="display:none">
                         <span>支付密码</span>
                         <span class="yishe">已设置</span>
                         <span class="anquan_right">认证</span>
                        </div>
                       <div class="anquan_hide" style="display:none">
                          <ul>
                           <li><span><strong>*</strong>输入支付密码</span><span><input type="text" id="zhifu_password"></input></span></li>
                           <li><span><strong>*</strong>再次输入支付密码</span><span><input type="text" id="new_zhifu_password"></input></span><span class="tishitext" style="width:auto"></span></li>
                           <li><span><a href="#" class="anquan_hide_btn">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                   </li>
                   <li style="display:none">
                        <div class="anquan_label label7">
                         <span>密码保护</span>
                         
                         <c:if test="${userinfo.answer!=null}">
                         <span>已设置</span>
                     	</c:if>
                     	<c:if test="${userinfo.answer==null}">
                         <span class="anquan_right">认证</span>
                        </c:if>
                        </div>
                       <div class="anquan_hide">
                          <ul>
                           <li><span><strong>*</strong>请选择问题</span>
                               <span>
                                <select>
                                  <option value="8">你孩子的名字叫什么</option>
                                  <option value="9">你孩子的生日是哪天</option>
                                  <option value="1">你爸爸的名字叫什么</option>
                                  <option value="2">你爸爸的生日是哪天</option>
                                  <option value="3">你妈妈的名字叫什么</option>
                                  <option value="4">你妈妈的生日是哪天</option>
                                  <option value="5">最难忘的日子</option>
                                  <option value="6">你的学号是多少</option>
                                  <option value="7">你的老家在哪里</option>
                                </select>
                               </span>
                          </li>
                           <li><span><strong>*</strong>输入答案</span><span><input type="text" id="answer" name="answer"></input></span><span class="tishitext" style="width:auto"></span></li>
                           <li><span><input type="button" class="anquan_hide_btn" value="提交" onclick="passwordProtection()"> </span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">密码保护设置成功,请重新登录！</div>
                       </div>
                   </li>
                 </ul>
               </div>
         </div>       
       
      </div>
  <!-- absolute_right start -->
	<%@ include file="/includes/absolute.jsp" %>
	<!-- absolute_right end -->
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>

<script type="text/javascript">
 
    $(document).ready(function(){

        function onSubmit() {
    		if($("#mail").val()==""){
    			alert("邮箱不能为空!");
    			return false;
    			}
    		var form = document.getElementById("form");  
    		form.submit();
    	}
   	   	    	  
    });


 
  function updatePassword(){
	  if($('#oldPassword').val() != ''){
	    	if($('#password').val() != ''){
	            $.ajax({
	                type: 'POST',
	                url: '<c:url value="/user/updatePasswordajax"/>',
	                data: 'oldPassword='+$('#oldPassword').val()+'&password='+$('#password').val(),
	                dataType: 'text',
	                success: function(data) {
	                    if(data == '"success"') {
	                    	alert("密码修改成功！"); 
	                    } 
	                }
	            });
	        }else{
	             alert('请输入原始密码！ ');
	        }
	     }else{
	     	alert('请输入新密码！');
	     }   
  }
  function passwordProtection(){
	  if($('#answer').val()!=''){
	            $.ajax({
	                type: 'POST',
	                url: '<c:url value="/user/passwordProtection"/>',
	                data: 'answer='+$('#answer').val(),
	                dataType: 'text',
	                success: function(data) {
	                    if(data == '"success"') {
	                    	alert("密码保护设置成功！"); 
	                    } 
	                }
	            });
	            }else{
	            	alert("请输入小于25个字的答案！")
	            }
  }
  function checkAnswer(){
		if ($('#answer').val() != '') {
			$.ajax({
				type : 'POST',
				url : '<c:url value="/user/checkAnswer"/>',
				data : 'name=' + $('#name').val()+'&answer='+$('#answer').val(),
				dataType : 'text',
				success : function(data) {
					if (data == '"success"') {
						$("#Tip_Answer").html(
								'<span class="tip_p01" >答案正确！</span>');
						$("#ensure").removeAttr("disabled");
					} else {
						$("#Tip_Answer").html(
								'<span class="tip_f01" >答案不正确！</span>');
						$("#ensure").attr("disabled",true);
					}
				}
			});
		}else{
			$("#ensure").attr("disabled",true);
			$("#Tip_Answer").html(
			'<span class="tip_f01">答案为空！</span>');
			
		}
	}
</script>
