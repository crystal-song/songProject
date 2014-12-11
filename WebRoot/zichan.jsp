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
<title>资产统计 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
 <%@ include file="/includes/taglibs.jsp" %> 
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;    
    var indexs=1;
    var ap=0;
    var fp=0;
    
    $(document).ready(function(){
    	$(".u_left_sec:eq(1) li:eq(0)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".nav_big a").eq(2).children("p").addClass("headwd_color");
    	$(".u_left_mian").click(function(){
            $(this).siblings().slideToggle("slow");
          });
    	var ta=parseInt($("#balance_info").html());
    	var aa=parseInt($("#availableAmount_info").html());
    	var fa=parseInt($("#freezeAmount_info").html());
    	if(ta==0){
	    	$("#availableAmount_bar").css("width","1%");
	    	$("#freezeAmount_bar").css("width","1%");
    	}else{
	    	$("#availableAmount_bar").css("width",aa/ta*100+"%");
	    	$("#freezeAmount_bar").css("width",fa/ta*100+"%");
    	}
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
          <div class="pro_con_title" style="margin-top:5px;"><strong>资产统计</strong></div>
          <p class="zichan_num"><span>资产总值:</span><strong><span id="balance_info">${balance}</span><i>元</i></strong>
          <a href="<%=path%>/gate/recharge" class="char red">充值</a>
          <a href="<%=path%>/gate/drawMoney" class="char">提现</a>
          <a href="<%=path%>/transRecord/queryTransRecord?time_type=seven_all" class="char">交易记录</a>          
          </p>
          <ul class="zichan_bar">
            <li>
              <div class="li_pic back01"></div>
              <div class="li_right">
                 <div class="li_top"><span title="即用户可用来投资的账户余额。">可用余额</span><strong><span style="text-align:right" id="availableAmount_info">${availableAmount}</span><i>元</i></strong>
                 </div>
                 <div class="li_loadbar"><div id="availableAmount_bar"></div></div>
              </div>
            </li>
            <li>
              <div class="li_pic back02"></div>
              <div class="li_right">
                 <div class="li_top"><span title="即已用来投资的金额。">冻结余额</span><strong><span style="text-align:right" id="freezeAmount_info">${freezeAmount}</span><i>元</i></strong>
                 </div>
                 <div class="li_loadbar"><div style="background:#c7df95;" id="freezeAmount_bar"></div></div>
              </div>
            </li>
<!--             <li>
              <div class="li_pic back03"></div>
              <div class="li_right">
                 <div class="li_top"><span>可用余额</span><strong><span style="text-align:right">500,000</span><i>元</i></strong>
                 </div>
                 <div class="li_loadbar"><div style="background:#bae9ff;"></div></div>
              </div>
            </li> -->
          </ul>
          <div class="clear"></div>
 <!--          <div class="clear"></div>
          <div class="pro_con_title" style="margin-top:5px;"><strong>待收收益</strong></div>
          <div class="zichan_bar">
            <div class="shouyi_left">
               <p>待收收益总计<strong><span>20000</span>元</strong></p>
               <p>9月预收收益<strong><span>10000</span>元</strong></p>
             </div>
            <div class="shouyi_right" style="display:none"><img src="images/tibiao_r2_c2.png" /></div>
          </div>
          <div class="pro_con_title" style="margin-top:5px;"><strong>已收收益</strong></div>
          <div class="zichan_bar">
               <span class="lan">
                 <div class="li_right_01">
                   <div class="li_top"><span>已收收益总计</span><strong><span style="text-align:right">500,000</span><i>元</i></strong>
                   </div>
                   <div class="li_loadbar"><div style="background:#c7df95;"></div></div>
                </div>
              </span>

              <span class="lan">
                <div class="li_right_01">
                   <div class="li_top"><span>×××项目收益</span><strong><span style="text-align:right">500,000</span><i>元</i></strong>
                   </div>
                   <div class="li_loadbar"><div style="background:#c7df95;"></div></div>
                </div>
            </span>
          </div> 
          <div class="pro_con_title" style="margin-top:5px;"><strong>累计投资</strong></div>
          <div class="zichan_bar">
               <span class="lan">
                 <div class="li_right_01">
                   <div class="li_top"><span>累计投资</span><strong><span style="text-align:right">500,000</span><i>元</i></strong>
                   </div>
                   <div class="li_loadbar"><div style="background:#c7df95;"></div></div>
                </div>
              </span>
            
              <span class="lan">
                <div class="li_right_01">
                   <div class="li_top"><span>可用金额</span><strong><span style="text-align:right">500,000</span><i>元</i></strong>
                   </div>
                   <div class="li_loadbar"><div style="background:#c7df95;"></div></div>
                </div>
            </span>
          </div> -->
        </div>
      </div>     
  
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>