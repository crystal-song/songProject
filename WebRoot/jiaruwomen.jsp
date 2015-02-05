<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ include file="/includes/taglibs.jsp" %>
<title>加入我们 - 帮助中心 - 中租宝</title>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
</head>
<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="news_location">当前位置：<a href="<%=path%>/index.jsp" >首页</a> >> <a href="<%=path%>/help_con.jsp" >
         帮助中心</a> >> <a href="<%=path%>/contact.jsp" >加入我们</a></div> 
 <div class="user_con_news">
   <div class="news_left">
	<!-- left menu -->
	<%@ include file="/includes/left_help.jsp" %>
	<!-- left end -->
	</div>
	<!-- right content -->
     <div class="right_news_con"> 
        <dl>
        	   <dt>一、客服、客户关系维护专员客服部</dt>
        	   <p><strong>岗位职责：</strong></p>
        	   <dd>1. 对平台已经注册的客户进行电话拜访，提高潜在客户转化率；
               </dd>
               <dd>2. 对已有客户电话定期回访， 向客户提供准确、迅速、亲切、周到的服务，每逢节气以电话或短信群发的方式代表公司祝贺节日快乐；
               </dd>
               <dd>3. 建立客户回访信息资料，传达客户意见和建议；
               </dd>
               <dd>4. 协调客户，处理客户电话投诉；
               </dd>
               <dd>5. 积极配合公司对外的各项宣传活动；
               </dd>
               <dd>6. 完成上级安排的其它工作任务；
               </dd>
               <p><strong>任职要求：</strong></p>
               <dd>1. 大专以上学历，销售或金融专业优先考虑；
               </dd>
               <dd>2. 普通话标准，口头表达能力好，能够主动掌握话题，应变能力强；
        	   </dd>
        	   <dd>3. 学习能力强，能够快速学习新知识；
               </dd>
               <dd>4. 工作态度良好，热情，积极主动，能及时为客户服务，不计较个人得失，有奉献精神；
        	   </dd>
        	    <dd>5. 具客服岗位一年以上工作经验；
               </dd>
               
        	</dl>
        	<dl>
        	   <dt>二、线上顾问（应届生亦可）</dt>
        	   <p><strong>岗位职责：</strong></p>
        	   <dd>1.根据公司的统一规划，运用互联网营销等手段与潜在客户建立业务联系；
               </dd>
               <dd>2.开发和维护客户资源，根据客户需求向客户提供优质的信贷产品；
               </dd>
               <dd>3.以提高客户满意度和为客户创造价值为目标，提供高质量的售前、售中和售后客户服务。
               </dd>          
               <p><strong>任职要求：</strong></p>
               <dd>1.大学专科及以上学历，一年左右销售工作经验，优秀应届生亦可；
               </dd>
               <dd>2.熟悉互联网操作，开网店经验或者电话销售经验者优先考虑；
        	   </dd>
        	   <dd>3.良好的沟通和表达能力，乐观勤奋，愿意承担压力，期望挑战高薪。
               </dd>  
               <p>有意者请将简历发送至<a href="mailto:Wang.yi@ptobchina.com">Wang.yi@ptobchina.com</a>
               </p>             
        	</dl>
     </div>
  </div>
<!-- right end -->
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
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript">
var navIndex=5;
var index=4;
$(document).ready(function(e) {
	$(".nav_big a").eq(4).addClass("bd_btom").siblings().removeClass("bd_btom");
	$(".nav_big a").eq(4).children("p").addClass("headwd_color");
	$(".news_ul a").eq(6).addClass("aqbz").siblings().removeClass("aqbz");
	});
</script>

