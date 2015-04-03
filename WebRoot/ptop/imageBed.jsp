<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传无水印图片</title>


 <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
   <!--  <title>UMEDITOR 完整demo</title> -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/up/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <link href="/css/style1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>   
    <script type="text/javascript" charset="utf-8" src="<%=path%>/up/umeditor.configg.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path%>/up/umeditor.min.js"></script>
    <script type="text/javascript" src="<%=path%>/up/lang/zh-cn/zh-cn.js"></script>
    <script src="/js/uploadPreview.min.js" type="text/javascript"></script>
      
</head>

<body>

<div id="wrap">
<!-- header -->
 <%@ include file="/includes/manage_nav.jsp" %> 
 <!-- header end -->
    <div class="cl"></div>
  <div class="content">
  	<h2>上传无水印图片</h2>
  
                <li>
                    <dd>项目图片：</dd>
             
                <dt><script type="text/plain"   id="picture" style="width:100%;height:100px;">
 </script>  <br />尺寸：250*158</dt>  
                </li>
              

<script type="text/javascript">

//实例化编辑器
var um = UM.getEditor('picture');


function createEditor() {
    enableBtn();
    um = UM.getEditor('picture');
}
function getAllHtml() {
    alert(UM.getEditor('picture').getAllHtml())
}

</script>


</body>
</html>



