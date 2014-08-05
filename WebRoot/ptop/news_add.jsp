<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加新闻公告</title>
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
  	<h2>添加新闻公告</h2>
    	<div class="dataForm">
        	<ul>
                <li>
                    <dd>文章标题：</dd>
                    <input type="text" />
                    <dt>1111</dt>
                </li>
                <li>
                    <dd>标题图片：</dd>
                    <input type="file" />
                    <dt><img alt="项目图片预览" width="250" height="158" /><br />尺寸：250*158</dt>
                </li>
                <li>
                    <dd>文章来源：</dd>
                    <input type="text" value="中投汇融"/>
                    <dt></dt>
                </li>
                <li>
                    <dd>文章内容：</dd>
                    <textarea name="abstract" cols="" rows="" class="bigArea"></textarea>
                    <dt></dt>
                </li>
                <li>
                <dd>设置文章属性：</dd>
                 <p>
                      <label>
                        <input type="checkbox" name="payBackMethod" value="复选框" id="payBackMethod_0" />
                        <span>置顶</span></label>
				</p>
                    <dt></dt>
                </li>
                <li>
                    <dd>发布时间：</dd>
                    <input type="date" />
                    <dt></dt>
                </li>
                <li>
                <dd></dd>
                 <input type="submit" title="提交" value="提交" class="submitBtn"/>
                 <input type="submit" title="预览" value="预览" class="submitBtn"/>
                </li>
            </ul>
   	  </div>
  </div>
  <div class="cl"></div>
</div>

</body>
</html>
