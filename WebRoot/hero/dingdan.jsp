<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

 <%@ include file="/includes/taglibs.jsp" %>
<title>订单详情 - 我的账户 - 中租宝</title>
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
 
        <div class="ding_con">
         <div class="pro_con_title" style="margin-top:5px;"><strong>订单信息</strong></div>
         <div class="ding_msg">
              <div class="nei_ding">
                <span>订单名称:</span>
                <span><strong>${payment.title }</strong></span>
              </div>
              <div class="nei_ding">
                <span>订单状态:</span>
                <span><strong>已完成</strong></span>
              </div>
              <div class="nei_ding">
                <span>订单号:</span>
                <span><strong>${payment.id }</strong></span>
              </div>             
              <div class="nei_ding">
                <span>交易日期:</span>
                <span><strong>${payment.created_at }</strong></span>
              </div>              
         </div>
         <div class="shou_msg">
            <div class="shou_con">
            <div class="shou_fir">
              <h2>收货人信息</h2>
              <div><span>收货人:</span><span>${payment.name }</span></div>
              <div><span>地&nbsp;&nbsp;址:</span><span style="width:200px">${payment.detail }</span></div>
              <div><span>联系电话:</span><span style="width:200px">${payment.phone }</span></div>
             </div>
             <div class="shou_sec">
               <div class="shoucon_left">
                  <div class="shou_title">商品名称</div>
                  <div class="shou_table">${reward.title }</div>
                  <div class="ta_font">${reward.description }</div>
                 
               </div>
              
             </div>
             <div class="zongjine">
              <div class="z_monney">￥${payment.amount + payment.user_fee_amount  }</div>
              <span>商品总金额:&nbsp;&nbsp;</span>
             </div>
            </div>
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
</html>


