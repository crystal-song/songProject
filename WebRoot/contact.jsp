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
<title>联系客服 - 帮助中心 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<%@ include file="/includes/taglibs.jsp" %>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
var navIndex=5;
var index=4;
$(document).ready(function(e) {
$(".nav_big a").eq(4).addClass("bd_btom").siblings().removeClass("bd_btom");
$(".nav_big a").eq(4).children("p").addClass("headwd_color");
$(".news_ul a").eq(5).addClass("aqbz").siblings().removeClass("aqbz");
});
</script>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
</head>
<body>
<!-- top start -->
<%@ include file="/includes/header.jsp" %>
<!-- top end -->
<div class="news_location">当前位置：<a href="<%=path%>/index.jsp" >首页</a> >> <a href="<%=path%>/help_con.jsp" >
帮助中心</a> >> <a href="<%=path%>/contact.jsp" >联系我们</a></div>
<div class="user_con_news">
<div class="news_left">
<!-- left menu -->
<%@ include file="/includes/left_help.jsp" %>
<!-- left end -->
</div>
<!-- right content -->
<div class="right_news_con">
<div class="contaction">
<p>名称：中投汇融投资管理有限公司</p>
<p>地址：北京市朝阳区工体北路13号院1号楼</p>
<p>电话：010-84243099/3199</p>
<p>传真号：010-84243990</p>
<p>email：cs@ptobchina.com</p>
<p>简介：中租宝，北京市朝阳区工体北路13号院1号楼1501-1502室。 邮编：100020</p>
</div>
<div style="width:800px;height:550px;border:#ccc solid 1px;" id="dituContent"></div>
</div>
</div>
<!-- right end -->
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
<script type="text/javascript">
//创建和初始化地图函数：
function initMap(){
createMap();//创建地图
setMapEvent();//设置地图事件
addMapControl();//向地图添加控件
addMarker();//向地图中添加marker
}
//创建地图函数：
function createMap(){
var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
var point = new BMap.Point(116.456081,39.942065);//定义一个中心点坐标
map.centerAndZoom(point,18);//设定地图的中心点和坐标并将地图显示在地图容器中
window.map = map;//将map变量存储在全局
}
//地图事件设置函数：
function setMapEvent(){
map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
map.enableScrollWheelZoom();//启用地图滚轮放大缩小
map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
map.enableKeyboard();//启用键盘上下左右键移动地图
}
//地图控件添加函数：
function addMapControl(){
//向地图中添加缩放控件
var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
map.addControl(ctrl_nav);
//向地图中添加缩略图控件
var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
map.addControl(ctrl_ove);
//向地图中添加比例尺控件
var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
map.addControl(ctrl_sca);
}
//标注点数组
var markerArr = [{title:"中投汇融投资管理有限公司",content:"地址：北京市朝阳区工体北路13号院1号楼1501-1502室",point:"116.455582|39.941954",isOpen:0,icon:{w:23,h:25,l:46,t:21,x:9,lb:12}}
];
//创建marker
function addMarker(){
for(var i=0;i<markerArr.length;i++){
var json = markerArr[i];
var p0 = json.point.split("|")[0];
var p1 = json.point.split("|")[1];
var point = new BMap.Point(p0,p1);
var iconImg = createIcon(json.icon);
var marker = new BMap.Marker(point,{icon:iconImg});
var iw = createInfoWindow(i);
var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
marker.setLabel(label);
map.addOverlay(marker);
label.setStyle({
borderColor:"#808080",
color:"#333",
cursor:"pointer"
});
(function(){
var index = i;
var _iw = createInfoWindow(i);
var _marker = marker;
_marker.addEventListener("click",function(){
this.openInfoWindow(_iw);
});
_iw.addEventListener("open",function(){
_marker.getLabel().hide();
})
_iw.addEventListener("close",function(){
_marker.getLabel().show();
})
label.addEventListener("click",function(){
_marker.openInfoWindow(_iw);
})
if(!!json.isOpen){
label.hide();
_marker.openInfoWindow(_iw);
}
})()
}
}
//创建InfoWindow
function createInfoWindow(i){
var json = markerArr[i];
var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
return iw;
}
//创建一个Icon
function createIcon(json){
var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
return icon;
}
initMap();//创建和初始化地图
</script>
</html> 