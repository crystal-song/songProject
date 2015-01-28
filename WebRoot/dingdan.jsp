<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ include file="/includes/taglibs.jsp" %>
<title>资产统计 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
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
                <span><strong>为藏区建一个篮球场</strong></span>
              </div>
              <div class="nei_ding">
                <span>订单状态:</span>
                <span><strong>已完成</strong></span>
              </div>
              <div class="nei_ding">
                <span>订单号:</span>
                <span><strong>153465687</strong></span>
              </div>             
              <div class="nei_ding">
                <span>交易日期:</span>
                <span><strong>2015.01.25</strong></span>
              </div>              
         </div>
         <div class="shou_msg">
            <div class="shou_con">
            <div class="shou_fir">
              <h2>收货人信息</h2>
              <div><span>收货人:</span><span>刘晓莉</span></div>
              <div><span>地&nbsp;&nbsp;址:</span><span style="width:200px">朝阳北路世茂工三1111号</span></div>
              <div><span>联系电话:</span><span style="width:200px">123456789</span></div>
             </div>
             <div class="shou_sec">
               <div class="shoucon_left">
                  <div class="shou_title">商品名称</div>
                  <div class="shou_table">支持100元</div>
                  <div class="ta_font">1）我们会登记您的姓名在功德簿和祈福名单里，这两样宝贝将会长久的安放在莲师大殿里，必
    将会受到莲花生大士的恒久加持和保佑。</div>
                  <div class="ta_font">2）您还会得到我们学校全体师生长久的诵经回向和永久祝福。
预计回报发送时间：<strong>2015年5月</strong>  </div>
                 
               </div>
               <div class="shoucon_right">
                  <div class="shou_title">商品名称</div>
                  <div class="shou_line">20</div>
               </div>
             </div>
             <div class="zongjine">
              <div class="z_monney">￥5000</div>
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
<script type="text/javascript">
 
var navIndex=3;    
var indexs=2;
var ap=0;
var fp=0;

$(function(){
    $(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    $(".u_left_sec:eq(2) li:eq(5)").children("a").css("color","#fc652e");    
    $(".nav_big a").eq(2).children("p").addClass("headwd_color");
})
        
</script>
</html>
