<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/taglibs.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>帮助中心 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
var navIndex=5;
var index=0;
$(document).ready(function(e) {
    $(".news_ul li").click(function(e){
       var index=$(this).index();
       $(this).children("div").addClass("news_wd_color");
       $(this).siblings().children("div").removeClass("news_wd_color");
       $(".news_right ul").eq(index).css("display","block").siblings().css("display","none");
    });
    $(".news_ul li").click(function(e){
       var index=$(this).index();
       $(this).children("div").addClass("news_wd_color");
       $(this).siblings().children("div").removeClass("news_wd_color");
       $(".news_right ul").eq(index).css("display","block").siblings().css("display","none")
    });
    $(".bei_title i").click(function(){
      $(this).parent().siblings(".news_list_hide").slideToggle();
     
    });
    

});
</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
   <div class="user_con">
       <div class="news_left">
          <div class="n_left_title">新闻中心</div>
           <ul class="news_ul"> 
             <li><div class="news_wd_color"><span>关于我们</span></div></li>
             <li><div><span>常见问题</span></div></li>
             <li><div><span>安全策略</span></div></li>
             <li><div><span>法律声明</span></div></li>
             <li><div><span>联系客服</span></div></li>
           </ul>   
       </div>   
       <div class="news_right position_top">
           <ul class="webside">
             <li>
                 <div class="bei_title"><span>光耀东方集团9月返息公告</span>
                 </div>                
             </li>
             <li><div class="bei_title"><span>光耀东方集团9月返息公告</span>
                 </div>
             </li>
             <li><div class="bei_title"><span>光耀东方集团9月返息公告</span>
                 </div>
              </li>
             <li><div class="bei_title"><span>光耀东方集团9月返息公告</span>
                 </div>
             </li>
           </ul>
           <ul class="webside" style="display:none">
             <li><div class="bei_title"><span>光耀东方集团9月返息公告</span>
                 </div>
             </li>
             <li><div class="bei_title"><span>光耀东方集团9月返息公告</span>
                 </div>
             </li>
             <li><div class="bei_title"><span>光耀东方集团9月返息公告</span>
                 </div>
             </li>
             <li><div class="bei_title"><span>光耀东方集团9月返息公告</span>
                 </div>
             </li>
           </ul>         
       </div>
   </div>
     
<div class="clear_height"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
