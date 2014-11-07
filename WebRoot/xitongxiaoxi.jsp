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
<title>提现 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;    
    $(document).ready(function(){
        $(".label_sec li").click(function(){
            $(this).addClass('label_bak').siblings().removeClass('label_bak');
       });
         $(".list_up").click(function(){
            $(this).parent().siblings(".msg_hide").slideToggle();
            //alert($(this).text());
            //alert($(this).html());
          
            if($(this).html()=="[展开<i></i>]"){
               $(this).html("[收起<i></i>]");
            }else if($(this).html()=="[收起<i></i>]"){
              $(this).html("[展开<i></i>]");
            }

            var read=$(this).siblings().children("strong");
            //alert(read);
            if(read.text()=="未读"){
              read.text("");

            }
         }); 
         $(".u_left_mian").click(function(){
              $(this).siblings().slideToggle("slow");
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
        <div class="zichan_con01">        
          <div class="pro_con_title" style="margin-top:5px;"><strong>系统消息</strong>
          </div>
               <div class="con_list">
                  <ul class="list_label">
                    <li>
                      <ul class="label_sec">
                        <li class="label_bak">全部</li>
                        <li>未读</li>
                        <li>已读</li>
                      </ul>
                    </li>
                  </ul>
                  <ul class="msg_list">
                    <li>
                        <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                    <li>
                         <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                    <li>
                         <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                    <li>
                         <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide" style="display:none;">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                    <li>
                         <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide" style="display:none;">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                    <li>
                         <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                    <li>
                         <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                    <li>
                         <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>

                  </ul>
                
               </div>
               
        <div class="next_list">
           <a href="#" class="a1">首页</a>
           <a href="#" class="a2"></a>
           <a href="#">1</a>
           <a href="#">2</a>
           <a href="#">3</a>
           <a href="#">4</a>
           <a href="#">5</a>
           <a href="#">...</a>
           <a href="#">20</a>
           <a href="#" class="a3"></a>
           <a href="#" class="a4">尾页</a>
           <span>跳到</span>
           <span><input type="text" /></span>
           <span>页</span>
           <span><input type="submit" class="btn_sub" value="确定"/></span>
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