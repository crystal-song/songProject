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
<meta content="网贷,债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>中租宝</title>
<link href="<%=path%>/css/guwen_style.css?v=1" rel="stylesheet" type="text/css" />
</head>
<body>

<!--[if lt IE 8]>
<div class="ie_text">你在使用 IE5.5 以上低于 IE8 版本的IE浏览器，建议您更新浏览器版本至IE8以上查看.
<div class="res"></div>
</div>

<![endif]-->
<div class="head">
	<div class="left"></div>
	<div class="right">
		<a href="<%=path%>/product/allProduct">投资理财</a>
		<a href="<%=path%>/" class="font_tou">进入首页</a>
	</div>
</div>	
<div class="main">
  <div class="num1" id="div1">
  	<div class="top"><img src="<%=path%>/img/images-2014-11/huodong/images/wenzi.png"></div>
    <div class="bottom">
      	<div class="li01"><span>李言平</span></div>
      	<div class="li02"><span class="jingqing">敬请<br/>期待</span>  	
        </div>
      	<div class="li02"><span class="jingqing">敬请<br/>期待</span></div>
    </div>
  </div>
  <div class="num2" id="div2" >
  	   <div class="photo">
  	   	 <span class="name"><strong>李言平</strong></span>
  	   	 <span><strong>顾问</strong></span>
         <div class="photo_msg">中国企业投融资中心 执行主任&nbsp;&nbsp;&nbsp;&nbsp;民政部慈孝特困老人基金会 副会长&nbsp;&nbsp;&nbsp;&nbsp;北京各省市驻京机构商务协会 常务&nbsp;&nbsp;&nbsp;&nbsp;华瑞金融投资有限公司 董事长
         </div>
  	   </div> 	
  	   <div class="word">
  	              李言平博士长期致力于产业与金融结合实践与研究，积累了广泛的人脉资源、金融资源、产业资源、各级政府资源及各类智库资源等，服务于地方政府、企事业单位。</div> 

      <div class="picture">
         <div class="pic1"><img src="<%=path%>/img/images-2014-11/huodong/images/li02.jpg" width="500" height="333" /></div>
         <div class="pic2"><img src="<%=path%>/img/images-2014-11/huodong/images/li01.jpg" width="500" height="333" /></div>
         <div class="pic3"><img src="<%=path%>/img/images-2014-11/huodong/images/li03.jpg" width="500" height="333" /></div>
      </div>
  </div>
  <div class="num3" id="div3" >
      <div class="weizhi"></div>
  </div>
  <div class="num4" id="div4" >
      <div class="weizhi01"></div>
  </div>
  <div class="num5" id="div5">
      <div class="title">
        <h1>中租宝</h1>
        <p>中租宝，是北京中投汇融投资管理有限公司旗下的众筹网络平台</p>
        <p>中投汇融投资管理有限公司（以下简称“中投汇融”）成立于工体北路，注册资本5001万，现有员工150人，管理总资产50亿。</p>
        <p>公司定位：以互联网金融、资产管理、投资咨询为主业的综合性现代金融服务企业。</p>
        <p>公司目前两大体系分别为线上“中租宝”电商平台和线下中投汇融财富管理中心，公司旗下产业涵盖矿产、畜牧、科技能源、金融（融资租赁）行业，年产值近1亿。</p>
        <div class="saomiao"></div>
      </div>
      <div class="clear"></div>
		<%@ include file="/includes/footer.jsp" %>
		<!-- footer end -->
  </div>
</div>

<script type="text/javascript"> 
var hei =  window.innerHeight;
var wid=window.innerWidth;
var div1_screen = document.getElementById('div1');
var div2_screen = document.getElementById('div2');
var div3_screen = document.getElementById('div3');
var div4_screen = document.getElementById('div4');

div1_screen.style.height=hei +'px'; 
div2_screen.style.height=hei +'px';
div3_screen.style.height=hei +'px';
div4_screen.style.height=hei +'px'; 


</script>
</body>
</html>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
$(document).ready(function(){
	// if(var navIndex!=null&&navIndex!=-1)$(".nav_big li").eq(0).addClass("bd_btom");
	$(".nav_big a").eq(0).addClass("bd_btom").siblings().removeClass("bd_btom");
	  
	$('.res').click(function(){
		$('.ie_text').css('display','none');
	  });
});	
	
</script>

