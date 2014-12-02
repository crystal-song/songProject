<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<%-- <link rel="stylesheet" href="<%=path%>/Newproduction/css/style.css">
<link rel="stylesheet" href="<%=path%>/Newproduction/css/jquery.fullPage.css"> --%>
<link  href="<%=path%>/css/css/style.css" rel="stylesheet" type="text/css" />
<link  href="<%=path%>/css/css/jquery.fullPage.css" rel="stylesheet" type="text/css" />
 <style type="text/css">
 .section { text-align: center; font: 50px "Microsoft Yahei"; color: #fff; position:relative;}
.sec1{background:url(<%=path%>/Newproduction/images/shouye.jpg) no-repeat 50%; background-size: cover; -moz-background-size: cover; -webkit-background-size: cover;}
.sec2{background:url(<%=path%>/Newproduction/images/pic4.jpg) no-repeat 50%; background-size: cover; -moz-background-size: cover; -webkit-background-size: cover;}
.sec3{background:url(<%=path%>/Newproduction/images/pic2.jpg) no-repeat 50%;  background-size: cover; -moz-background-size: cover; -webkit-background-size: cover;}
.sec4{background:url(<%=path%>/Newproduction/images/aa.jpg) no-repeat 50%;  background-size: cover; -moz-background-size: cover; -webkit-background-size: cover;}
.sec5{background:url(<%=path%>/Newproduction/images/pic1.jpg) no-repeat 50%; background-size: cover; -moz-background-size: cover; -webkit-background-size: cover;}
.sec6{background:url(<%=path%>/Newproduction/images/pic6.jpg) no-repeat 50%;  background-size: cover; -moz-background-size: cover; -webkit-background-size: cover;}
    </style>

<script src="<%=path%>/Newproduction/js/jquery-1.8.3.min.js"></script>
<script src="<%=path%>/Newproduction/js/jquery-ui-1.10.3.min.js"></script>
<script src="<%=path%>/Newproduction/js/jquery.fullPage.min.js"></script>

<script>
$(document).ready(function() {
	$("#message").animate({top:'+250px'},"slow");
	$('#label_01').animate({top:'+250px'},"slow");
	$('#label_02').animate({left:'+350px'},"slow");
	$('#left_title').animate({left:'+350px'},"slow");
	$('#left_title_sec').animate({left:'+550px'},"slow");
	$("#label05").animate({top:'+350px'},"slow");
	$("#label06").animate({left:'+350px'},"slow");
	$("#label07").animate({bottom:'+90px'},"slow");
	$("#pic6_title").animate({top:'+50px'},'slow');
	$.fn.fullpage({
		anchors: ['page1', 'page2', 'page3', 'page4','page5','page6'],
		navigation: true,
		css3: true,
		//navigationTooltips: ['fullPage.js', 'Powerful', 'Amazing', 'Simple'],
		afterLoad: function(anchorLink, index){
			    if(index == 1){
					$('#message').addClass('first');
					//$('#message').animate({top: '50%'});
					//$("#message").animate({top:'+250px'});
					}
				if(index == 2){
					$('#label_01').addClass('qiwen_01');
					$('.wd_01').text('深林覆盖90%');
					$('#label_02').addClass('lizi06');
					$('.wd_02').text('负离子72%');
					$('#label_03').addClass('shuiyuan_02');
					$('.wd_03').text('空气洁净95%')
					
				}	
				if(index == 3){
					$('#left_title').addClass('left_animate');
					$('#left_title_sec').addClass('left_title_sec01');
				}
				if(index == 4){
					$('#label05').addClass('qiwen05');
					$('.wd05').text('深林覆盖90%');
					$('#label06').addClass('lizi06');
					$('.wd06').text('负离子72%');
					$('#label07').addClass('shuiyuan07');
					$('.wd07').text('水源健康95%')
					$('#label08').addClass('shidu08');
					$('.wd08').text('天然食物92%')
					
				}	
			    if(index == 5){
					$('#label01').addClass('qiwen01');
					$('.wd01').text('气温');
					$('#label02').addClass('lizi02');
					$('.wd02').text('负离子');
					$('#label03').addClass('shuiyuan03');
					$('.wd03').text('水源');
					$('#label04').addClass('shidu04');
					$('.wd04').text('湿度');
				}
				
				//$('#infoMenu').toggleClass('whiteLinks', index ==4);
				
			},
		onLeave: function(index, direction){
				if (index == 3){
					$('.section').eq(index -1).removeClass('moveDown').addClass('moveUp');
					
				}
				else if(index == 3 && direction == 'up'){
					$('.section').eq(index -1).removeClass('moveUp').addClass('moveDown');
				}
				
				$('#staticImg').toggleClass('active', (index == 2 && direction == 'down' ) || (index == 4 && direction == 'up'));
				$('#staticImg').toggleClass('moveDown', index == 3 && direction == 'down');	
			}
	});
});
</script>
</head>

<body>

<div class="section sec1">
<div id="header"><span></span><a href="#" class="shouyelink">进入首页</a></div>
    <div id="message">
      <p>繁华都市，利益追逐</p>
      <p>诗意的生活画面</p>
      <p>只能常常出现在我们的梦境</p>
      <p class="four">难道这是我们要的生活？</p>
      <p>We are of life is this?</p>
    </div>  
</div>
<div class="section sec2">
    <div id="header02"><span></span><a href="#" class="shouyelink02">进入首页</a></div>
        <div id="label_01"><a class="wd_01"></a></div>
        <div id="label_02"><a class="wd_02"></a></div>
        <div id="label_03"><a class="wd_03"></a></div>
        <div class="pic2_con">金佛山由于特殊的地理位置和气候条件，在远古时期，缓冲了第四纪冰川的袭击，较为完整的保持了古老而又不同地质年代的原始生态，喀斯特地貌特征明显，被国内外专家评定为极有开发价值的自然风景区。</div>
</div>
<div class="section sec3">
    <div id="header03"><span></span><a href="#" class="shouyelink03">进入首页</a></div>
    <div id="number2">
    全球顶级的海岛度假圣地，哪怕只是惊鸿一瞥，她都会令你难以忘记。当你乘坐的飞机冲出云层，耀眼的白沙岛和绿宝石般的礁湖就会一下子呈现在你眼前。等不及飞机降落，你就会坚信，这里就是天堂。
    </div>
     <div class="beao"> 
        <h4 id="left_title">年享酒店居住权<div id="time">28</div>天</h4>
        <h5 id="left_title_sec">或<div id="time">10%</div>收益(年化)</h5>
    </div>
</div>
<div class="section sec4">
<div id="header04"><span></span><a href="#" class="shouyelink04">进入首页</a></div>
	   <div class="beao">  
        <div id="label05"><a class="wd05"></a></div>
        <div id="label06"><a class="wd06"></a></div>
        <div id="label07"><a class="wd07"></a></div>
        <div id="label08"><a class="wd08"></a></div>
        <div class="pic4_con">
          <h6>您将享有<div id="num">10%</div>实物产权</h6>
          <div class="pic4_con_bot">这里，是著名的“赌石”之城，是我国最靠近缅甸翡翠原产地的地区，位于云南省西部，国土面积5845平方公里。县城距省会昆明606公里，距缅甸密支那200公里，距印度雷多602公里，是中国通向南亚、东南亚的重要门户和节点。</div>
        </div>
    </div>
</div>
<div class="section sec5">
<div id="header05"><span></span><a href="#" class="shouyelink05">进入首页</a></div>
	<div id="title02">这里，是一个为半渔半农的集镇，面积约31平方公里，距离海口市105公里、三亚市180公里。但这里却是一个国际会议组织的永久性会址！这里是博鳌。</div>
    <h3></h3>	
    <p></p> 
    <div class="beao">  
        <div id="label01"><a class="wd01"></a></div>
        <div id="label02"><a class="wd02"></a></div>
        <div id="label03"><a class="wd03"></a></div>
        <div id="label04"><a class="wd04"></a></div>
    </div>
</div>
<div class="section sec6">
<div id="header06"><span></span><a href="#" class="shouyelink06">进入首页</a></div>
	<h6 id="pic6_title">中投汇融投资管理有限公司</h6>
    <div class="pic_con01">中投汇融投资管理有限公司成立于北京工体北路，注册资金五千零一万元人民币，是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干，立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台。
 
</div>
    <div class="pic_con02">公司主要以P2B即person-to-business,个人对（非金融机构）企业为主要运营模式。打破传统P2P平台的纯信用软风控运作模式，转变为以不动产为抵押物的硬风控运作模式,致力于为客户提供安全稳健的优质理财产品。</div>
    <div class="pic_con3">
      <p>中投汇融投资管理有限公司</p>
      <ul>
        <li>官方网站: www.ptobchina.com</li>
        <li>地址：北京市朝阳区工体北路13号院1号楼</li>
        <li>电话：010-84243099/3199   </li>
        <li>传真号：010-84243990</li>
        <li>Email：cs@ptobchina.com</li>
      </ul>
    </div>
</div>
</body>
</html>
