<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理PtoB项目</title>
<link href="<%=path%>/css/style1.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="wrap">
	<div class="header">
    	<div class="logo"></div>
        <h1>网站管理后台</h1>
    </div>
	<div class="cl"></div>
    <div class="top_nav">
    	<ul>
        	<li><a href="javascript:;" class="btn_gray">PtoB产品管理</a></li>
            <li><a href="javascript:;" class="btn_gray">添加PtoB产品</a></li>
        	<li><a href="javascript:;" class="btn_gray">PtoB产品管理</a></li>
            <li><a href="javascript:;" class="btn_gray">网站公告管理</a></li>
        	<li><a href="javascript:;" class="btn_gray">PtoB产品管理</a></li>
            <li><a href="javascript:;" class="btn_gray">网站公告管理</a></li>
        </ul>
    </div>
    <div class="cl"></div>
  <div class="content">
  	<h2>管理PtoB项目</h2>
    <div class="dataSearch">
    	<dd>请输入项目名称：</dd>
        <input type="search" />
        <input type="submit" class="submitBtn" />
    </div>
    <div class="dataList cl">
    	<table width="100%" border="0" cellpadding="5" cellspacing="1">
  <tr>
    <td>项目图片</td>
    <td>项目名称</td>
    <td>融资金额</td>
    <td>融资进度</td>
    <td>修改时间</td>
    <td>项目管理</td>
  </tr>
  <tr>
    <td><img width="50" /></td>
    <td>光耀东方 投资项目</td>
    <td>3000万</td>
    <td>25%</td>
    <td>2014-8-4 14:32:35</td>
    <td><p><a href="#">修改</a><a href="#">删除</a></p></td>
  </tr>
  <tr>
    <td><img width="50" /></td>
    <td>光耀东方 投资项目</td>
    <td>3000万</td>
    <td>25%</td>
    <td>2014-8-4 14:32:35</td>
    <td><a href="#">修改</a></td>
  </tr>
  <tr>
    <td><img width="50" /></td>
    <td>光耀东方 投资项目</td>
    <td>3000万</td>
    <td>25%</td>
    <td>2014-8-4 14:32:35</td>
    <td><a href="#">修改</a></td>
  </tr>
  <tr>
    <td><img width="50" /></td>
    <td>光耀东方 投资项目</td>
    <td>3000万</td>
    <td>25%</td>
    <td>2014-8-4 14:32:35</td>
    <td><a href="#">修改</a></td>
  </tr>
  <tr>
    <td><img width="50" /></td>
    <td>光耀东方 投资项目</td>
    <td>3000万</td>
    <td>25%</td>
    <td>2014-8-4 14:32:35</td>
    <td><a href="#">修改</a></td>
  </tr>
</table>

    </div>
  </div>
  <div class="cl"></div>
</div>
</body>
</html>
