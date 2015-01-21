<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %> 

<title>中租宝 | 最稳健的P2B理财平台</title>
<link href="<%=path%>/css/style-2014-11.css?v=1" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 
</head>
<body style="background:#f6f6f6">

<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>

<div class="juancon">
   <div class="juantitle">
       为藏区的孩子筹建一座运动场
   </div>
   <div class="juan_con_left">
     <div class="jcon_fir">
       <div class="fir_title">请输入金额</div>
       <div class="j_input"><input type="text" class="j_input_hide"></div>
       <span class="j_wen">*最少100元</span>
     </div>
     <div class="jcon_fir">
       <div class="fir_title">请选择你的支持</div>
       <div class="j_new"><input type="radio" class="j_radio01"></div>
       <span class="j_wen01">无私捐赠</span>
     </div>   
      <div class="jcon_sec">
         <input type="radio" class="j_radio02"/>
         <span class="j_wen01">￥100</span>
         <span class="j_wen01 j_msg">
           <dl>
           <dt>支持100元</dt>
           <dd style="height:100px">1)  我们会登记您的姓名在功德簿和祈福名单里，这两样宝贝将会长久的安放在莲师大殿里，必将会受到莲花生大士的恒久加持和保佑。
           </dd>
           <dd style="height:60px">2)  您还会得到我们学校全体师生长久的诵经回向和永久祝福。</dd>
           <dd> 预计回报发送时间：<strong>2015年5月</strong></dd>
           </dl>           
         </span>
      </div>  
       <div class="jcon_sec j_bac_new" style="height:400px">
         <input type="radio" class="j_radio02"/>
         <span class="j_wen01">￥3000</span>
         <span class="j_wen01 j_msg">
           <dl>
           <dt>支持3000元</dt>
           <dd style="height:125px">1) 1）我们会登记您提供的6个姓名在功德簿和祈福名单里，这两样宝贝将会长久的放在莲师大殿里，必将会受到莲花生大士的恒久加持和保佑。而且您也会得到我们学校全体师生长久的诵经回向和永久祝福。

           </dd>
           <dd >2) 您将会收到我们寄出的色达风景明信片一套（10-12张）</dd>
           <dd style="height:64px">3)我们将为您专门刻二块玛尼石，放在学校的玛尼墙里，得到亘古恒久的功德加持。</dd>
           <dd> 预计回报发送时间：<strong>2015年10月</strong></dd>
           </dl>
         </span>
      </div>  
      <div class="fir_title">收货地址 <div class="tianjia">添加地址</div></div>
      <div class="dizhi">       
        <div>
          <p style="margin-top:26px;">北京（王大海收）</p>
          <p>北京市朝阳区工体北路十三号院1号楼1501-1502室</p> 
          <p>13523238888</p>       
        </div>
        <div>
          <p style="margin-top:26px;">北京（王大海收）</p>
          <p>北京市朝阳区工体北路十三号院1号楼1501-1502室</p> 
          <p>13523238888</p>    
        
        </div>
        <div>
          <p style="margin-top:26px;">北京（王大海收）</p>
          <p>北京市朝阳区工体北路十三号院1号楼1501-1502室</p> 
          <p>13523238888</p>           
        </div>
      </div>   
      <a class=""></a>
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
$(document).ready(function(e){
	$(".dizhi div").click(function(){
		$(this).css("background","url(<%=path%>/img/images-2014-11/kuang.png)  no-repeat");
		$(this).siblings().css("background","url(<%=path%>/img/images-2014-11/kuang1.png)  no-repeat");
	})
	
	
});
 
</script>

</html>
