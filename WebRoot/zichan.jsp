<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

 <%@ include file="/includes/taglibs.jsp" %>
<title>资产统计 - 我的账户 - 中租宝</title>

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
          <p class="zichan_num"><span>资产总值:</span><strong><span id="balance_info">${account.balanceTotal}</span><i>元</i></strong>
          <a href="/gate/recharge" class="char red">充值</a>
          <a href="/gate/drawMoney" class="char">提现</a>
          <a href="/transRecord/queryTransRecord?time=timeall&type=typeall" class="char">交易记录</a>          
          </p>
          <ul class="zichan_bar">
            <li>
              <div class="li_pic back01"></div>
              <div class="li_right">
                 <div class="li_top"><span title="即用户可用来投资的账户余额。">可用余额</span><strong><span style="text-align:right" id="availableAmount_info">${account.availableMoney}</span><i>元</i></strong>
                 </div>
                 <div class="li_loadbar"><div id="availableAmount_bar"></div></div>
              </div>
            </li>
            <li>
              <div class="li_pic back02"></div>
              <div class="li_right">
                 <div class="li_top"><span title="即已用来投资的金额。">冻结余额</span><strong><span style="text-align:right" id="freezeAmount_info">${account.frozen_money_invest}</span><i>元</i></strong>
                 </div>
                 <div class="li_loadbar"><div style="background:#c7df95;" id="freezeAmount_bar"></div></div>
              </div>
            </li>

          </ul>
           <p class="zichan_num"><a href="/account/liquan?page=1&catlog=0"  class="num_div_fir" title="点击查看我的礼券"><span>可用礼券：</span><strong><span style="width:40px">${count}</span></strong> 张</a>
            <a class="num_div" href="/account/tuijian" title="点击邀请好友">（立即邀请好友，双方均可获得礼券！）</a>  
          </p>
          <div class="clear"></div>

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
</html>
<script type="text/javascript">
 var head_index=2; 
</script>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="/static/js/zhongzubao.js?va=4"></script>
<script type="text/javascript">  
    var indexs=1;
    var ap=0;
    var fp=0;

    $(document).ready(function(){
    	$(".u_left_sec:eq(1) li:eq(0)").children("a").css("color","#fc652e");
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

