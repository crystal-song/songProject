<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加PtoB项目</title>
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
  	<h2>添加PtoB项目</h2>
    	<div class="dataForm">
        	<ul>
                <li>
                    <dd>项目名称：</dd>
                    <input type="text" />
                    <dt>1111</dt>
                </li>
                <li>
                    <dd>企业编号：</dd>
                    <input type="text" />
                    <dt></dt>
                </li>
                <li>
                    <dd>项目图片：</dd>
                    <input type="file" />
                    <dt><img alt="项目图片预览" width="250" height="158" /><br />尺寸：250*158</dt>
                </li>
                <li>
                    <dd>信用等级：</dd>
                    <input type="number" min="1" max="5" value="1" step="1" />
                    <dt></dt>
                </li>
                <li>
                    <dd>年化收益：</dd>
                    <input type="number" min="0.05" max="0.24" value="0.12" step="0.01" />
                    <dt></dt>
                </li>
                <li>
                    <dd>还款日期：</dd>
                    <input type="date" />
                    <dt></dt>
                </li>
                <li>
                    <dd>还款方式：</dd>
                    <p>
                      <label>
                        <input type="checkbox" name="payBackMethod" value="复选框" id="payBackMethod_0" />
                        <span>到期还本</span></label>
                      <label>
                        <input type="checkbox" name="payBackMethod_" value="复选框" id="payBackMethod_1" />
                        <span>按月付息</span></label>
                    </p>
<dt></dt>
                </li>
                <li>
                    <dd>融资金额：</dd>
                    <input type="number" min="0" value="0" />
                    <dt></dt>
                </li>
                <li>
                    <dd>融资进度：</dd>
                    <input type="number"  value="0" min="0" max="1" />
                    <dt></dt>
                </li>
                <li>
                    <dd>重点信息：</dd>
                    <textarea name="abstract" cols="" rows=""></textarea>
                    <dt>显示在项目图片下方的综合摘要信息。</dt>
                </li>
                <li>
                    <dd>项目描述：</dd>
                    <textarea name="abstract" cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>担保机构：</dd>
                    <textarea name="abstract" cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>资金运转：</dd>
                    <textarea name="abstract" cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>风险控制：</dd>
                    <textarea name="abstract" cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>企业背景：</dd>
                    <textarea name="abstract" cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>企业信息：</dd>
                    <textarea name="abstract" cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>投资详情：</dd>
                    <textarea name="abstract" cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>相关证件：</dd>
                    <textarea name="abstract" cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                <dd>设置项目属性：</dd>
                 <p>
                      <label>
                        <input type="checkbox" name="payBackMethod" value="复选框" id="payBackMethod_0" />
                        <span>推荐</span></label>
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
                 <input type="submit" title="提交" value="提交" class="b"/>
                </li>
            </ul>
   	  </div>
  </div>
  <div class="cl"></div>
</div>

</body>
</html>
