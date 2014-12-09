<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>提现 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
 <%@ include file="/includes/taglibs.jsp" %> 
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
var indexs=0;
    var navIndex=3;    
    $(document).ready(function(){
    	$(".u_left_sec:first li:eq(2)").children("a").css("color","#fc652e");
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
      
});

 $(function(){
		$("#sub").click(function(){
			
	                    	 alert("设置成功!");
	                  
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
                <div class="pro_con_title" style="margin-top:5px;"><strong>通知设置</strong>
                </div>

                <div class="con_list_life">
                <form action="<%=path %>/transnotice/add" method="post">

                  <ul class="tong">
                     <li style="background:#f3f3f3"><span></span><span>系统消息通知</span><span>邮件通知</span><!-- <span>短信通知</span> --></li>
                     <li><span>充值操作</span><span><input type="checkbox" name="noticeType1" value="系统消息通知"></input></span><span><input type="checkbox" checked="checked" name="noticeType1" value="邮件通知"></input></span><!-- <span><input type="radio" name="rechargeNoticeType" value="短信通知"></input></span> --></li>
                     <li><span>提现操作</span><span><input type="checkbox" name="noticeType2" value="系统消息通知"></input></span><span><input type="checkbox" name="noticeType2" checked="checked" value="邮件通知"></input></span><!-- <span><input type="radio" name="drawNoticeType" value="短信通知"></input></span> --></li>
                    <!--  <li><span>奖励兑付</span><span><input type="radio" name="jiangliNoticeType" value="系统消息通知"></input></span><span><input type="radio" name="jiangliNoticeType" checked="checked" value="邮件通知"></input></span><span><input type="radio" name="jiangliNoticeType" value="短信通知"></input></span></li> -->
                 </ul> 

                  <input type="submit" id="sub" value="确定"/>
                 </form>

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