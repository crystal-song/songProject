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
<title>安全设置 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;    
    $(document).ready(function(){
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
        $(".anquan_right").click(function(){
        	
            $(this).parent().siblings(".anquan_hide").slideToggle();
            //alert($(this).text());
            if($(this).text()=="认证"){

               $(this).text("取消认证");

            }else if($(this).text()=="取消认证"){
              $(this).text("认证");
            }
         }); 
         $(".u_left_mian").click(function(){
              $(this).siblings().slideToggle("slow");
            }); 
         $(".anquan_hide_btn").click(function(){
        	  $(this).parent().parent().parent().hide().siblings(".tijiao_checkok").show();
        	 
         });
      
});
        
</script>

</head>

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
                        <div class="anquan_label">
                         <span>用户名</span>
                         <span>已设置</span>
                         <span>asdoi</span>
                        </div> 
                   </li>

                   <li>
                        <div class="anquan_label">
                         <span>实名认证</span>
                         <span>已设置</span>
                         <span class="anquan_right">认证</span>
                        </div>
                       <div class="anquan_hide">
                         <ul >
                           <li><span><strong>*</strong>用户名</span><span></span></li>
                           <li><span><strong>*</strong>真实姓名</span><span><input type="text"></span></li>
                           <li><span><strong>*</strong>证件类型</span><span>
                          <select>
                              <option value="">身份证</option>
                              <option value="">军官证</option>
                              <option value="">台胞证</option>
                              <option value="">护照</option>
                          </select>
                          </span></li>
                           <li><span><strong>*</strong>身份证号码</span><span><input type="text"></span></li>
                           <li><span><strong>*</strong>上传正面证件照</span><span><input type="file" id="file01"></input></span></li>
                           <li id="pic_height"><span></span><span id="postcar"><div></div></span></li>
                           <li><span><strong>*</strong>上传背面证件照</span><span><input type="file" id="file02"></input></span></p></li>
                           <li id="pic_height"><span></span><span id="postcar"><div></div></span></li>
                           
                           <li id="text-align_style">  
                                <span style="width:300px;" id="text-align_style"><input type="checkbox" class="box_wh">我已阅读并同意签署 <a href="#" class="wd_color">《中汇宝服务协议》</a></span>    
                           </li>
                           <li id="text-align_style">  
                                <span style="width:300px;" id="text-align_style"><input type="checkbox" class="box_wh">我已阅读并同意签署 <a href="#" class="wd_color">《委托收付资金协议》</a></span>    
                           </li>
                           <li><span><a href="#" class="anquan_hide_btn">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                   </li>
                   <li>
                       <div class="anquan_label">
                         <span>手机认证</span>
                         <span>已设置</span>
                         <span class="anquan_right">认证</span>
                        </div>
                       <div class="anquan_hide">
                          <ul>
                           <li style="width:500px;"><span><strong>*</strong>手机号码</span><span><input type="text"></span><a class="sent">获取验证码</a></li>
                           <li><span><strong>*</strong>短信验证码</span><span><input type="text"></span></li>
                           <li><span><a href="#" class="anquan_hide_btn">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                   </li>
                   <li>
                       <div class="anquan_label">
                         <span>邮箱验证</span>
                         <span>已设置</span>
                         <span class="anquan_right">认证</span>
                        </div>
                       <div class="anquan_hide">
                          <ul>
                           <li><span><strong>*</strong>邮箱验证</span><span><input type="text"></span></li>
                           <li><span><a href="#" class="anquan_hide_btn">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                   </li>
                   <li>
                       <div class="anquan_label">
                         <span>登录密码</span>
                         <span>已设置</span>
                         <span class="anquan_right">认证</span>
                        </div>
                       <div class="anquan_hide">
                          <ul>
                           <li><span><strong>*</strong>原登录密码</span><span><input type="text"></span></li>
                            <li><span><strong>*</strong>新登录密码</span><span><input type="text"></span></li>
                           <li><span><strong>*</strong>再次输入登录密码</span><span><input type="text"></span></li>
                           <li><span><a href="#" class="anquan_hide_btn">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                   </li>
                   <li>
                       <div class="anquan_label">
                         <span>支付密码</span>
                         <span>已设置</span>
                         <span class="anquan_right">认证</span>
                        </div>
                       <div class="anquan_hide">
                          <ul>
                           <li><span><strong>*</strong>输入支付密码</span><span><input type="text"></span></li>
                           <li><span><strong>*</strong>再次输入支付密码</span><span><input type="text"></span></li>
                           <li><span><a href="#" class="anquan_hide_btn">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                   </li>
                   <li>
                        <div class="anquan_label">
                         <span>密码保护</span>
                         <span>已设置</span>
                         <span class="anquan_right">认证</span>
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
                           <li><span><strong>*</strong>输入答案</span><span><input type="text"></span></li>
                           <li><span><a href="#" class="anquan_hide_btn">提交</a></span></li>
                         </ul>
                         <div class="tijiao_checkok" style="display:none">实名认证已成功！</div>
                       </div>
                   </li>
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