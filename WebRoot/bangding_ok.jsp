<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ include file="/includes/taglibs.jsp" %> 
<title>用户中心页面</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />

</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<div class="msg_con">
  <div class="queren_con" >
   <div class="sucess_title"><strong>绑定银行卡申请提交成功！</strong></div>   
      <div class="tishi bang">
           <p><strong>温馨提示</strong></p>
            <ul>
              <li>绑定银行卡预计需要1-2个工作日，请您耐心等待。</li>
              <li>您可以通过“提现”页面随时查询银行卡的绑定状态。</li>              
            </ul> 
     </div>   
   <div class="title_sec" style="display:none">您可以进行以下操作</div>
   <ol class="sec_list" style="display:none">
   <li>前去项目中心<strong><a href="<%=path%>/product/allProduct" class="con_link">[浏览项目]</a></strong>，查看详细信息，进行投资。</li>
   <li>去个人中心查看<strong><a href="<%=path%>/wel/account" class="con_link">[个人信息]</a></strong>。</li>
   <li><a href="<%=path%>/gate/recharge" class="sec_btn_org">去充值</a></li>
   <li><a href="<%=path%>gate/drawMoney" class="sec_btn_org">去提现</a></li>
   </ol>
   <div class="sec_product" style="display:none">
	   <div class="sec_pro_show"></div> 
   </div>

  </div>        
</div>

<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;          
</script>
</html>