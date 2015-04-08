<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加焦点图</title>
<link href="/up/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
<link href="/css/style1.css" rel="stylesheet" type="text/css" />
      <script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>    
    <script type="text/javascript" src="/up/lang/zh-cn/zh-cn.js"></script>

</head>

<body>
<div id="wrap">
<!-- header -->
 <%@ include file="/includes/manage_nav.jsp" %> 
 <!-- header end -->
    <div class="cl"></div>
  <div class="content">
  	<h2>添加焦点图</h2>
  	
  	
    	<div class="dataForm">
    	<form  action="/Login/addbanner" id="form" method="post"    >
        	
        	
                 <li>
                    <dd>焦点图内容：</dd>
                    <textarea rows="10" cols="20" id="bannerContext" name="bannerContext"></textarea> 
                    <dt></dt>
                </li>
      
                 <input type="submit" value="提交" />
                
             </form>
   	  </div>
  </div>
  
  
  
  <div class="cl"></div>
</div>

</body>
</html>


