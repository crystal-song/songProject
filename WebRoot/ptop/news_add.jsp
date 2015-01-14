<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加新闻公告</title>
<link href="<%=path%>/up/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/css/style1.css" rel="stylesheet" type="text/css" />
    <%-- <script type="text/javascript" src="<%=path%>/up/third-party/jquery.min.js"></script> --%>
      <script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>    
    <script type="text/javascript" charset="utf-8" src="<%=path%>/up/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path%>/up/umeditor.min.js"></script>
    <script type="text/javascript" src="<%=path%>/up/lang/zh-cn/zh-cn.js"></script>
   
    
    
    
    
        <style type="text/css">
        h1{
            font-family: "微软雅黑";
            font-weight: normal;
        }
        .btn {
            display: inline-block;
            *display: inline;
            padding: 4px 12px;
            margin-bottom: 0;
            *margin-left: .3em;
            font-size: 14px;
            line-height: 20px;
            color: #333333;
            text-align: center;
            text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
            vertical-align: middle;
            cursor: pointer;
            background-color: #f5f5f5;
            *background-color: #e6e6e6;
            background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
            background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
            background-repeat: repeat-x;
            border: 1px solid #cccccc;
            *border: 0;
            border-color: #e6e6e6 #e6e6e6 #bfbfbf;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            border-bottom-color: #b3b3b3;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            *zoom: 1;
            -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
            -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .btn:hover,
        .btn:focus,
        .btn:active,
        .btn.active,
        .btn.disabled,
        .btn[disabled] {
            color: #333333;
            background-color: #e6e6e6;
            *background-color: #d9d9d9;
        }

        .btn:active,
        .btn.active {
            background-color: #cccccc \9;
        }

        .btn:first-child {
            *margin-left: 0;
        }

        .btn:hover,
        .btn:focus {
            color: #333333;
            text-decoration: none;
            background-position: 0 -15px;
            -webkit-transition: background-position 0.1s linear;
            -moz-transition: background-position 0.1s linear;
            -o-transition: background-position 0.1s linear;
            transition: background-position 0.1s linear;
        }

        .btn:focus {
            outline: thin dotted #333;
            outline: 5px auto -webkit-focus-ring-color;
            outline-offset: -2px;
        }

        .btn.active,
        .btn:active {
            background-image: none;
            outline: 0;
            -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
            -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .btn.disabled,
        .btn[disabled] {
            cursor: default;
            background-image: none;
            opacity: 0.65;
            filter: alpha(opacity=65);
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }
    </style>
    
     
    
    
    

</head>

<body>
<div id="wrap">
<!-- header -->
 <%@ include file="/includes/manage_nav.jsp" %> 
 <!-- header end -->
    <div class="cl"></div>
  <div class="content">
  	<h2>添加新闻公告</h2>
  	
  	
    	<div class="dataForm">
    	<form  action="<%=path%>/Login/addnews" id="form" method="post"    >
        	<input type="hidden"  name="depicts"  id="depicts" />
        	<input type="hidden"  name="channel"  id="channel" />
        	<input type="hidden" name="id" id="id" value="${news1.id}" />
      <ul>  	
        <li>
        <dd>请选择频道：</dd>
        <select name="chanel" id="chanel" >
           <!-- <option value="0">全部&nbsp;&nbsp;&nbsp;</option>  -->
           <c:if test="${ not empty list1}">
        <c:forEach var="s" items="${list1}" varStatus="i">
          <option value="${s.name}">${s.name}&nbsp;&nbsp;</option>
          </c:forEach>
  
        </c:if>
         
        </select> 
        </li>	
        	
                 <li>
                    <dd>文章标题：</dd>
                    <input type="text"  name="title"  id="title"  value="${news1.title}"  />
                    <dt></dt>
                </li>
               
                <li>
                    <dd>文章内容：</dd> 
                      <dt><script type="text/plain"   id="myEditor" style="width:100%;height:200px;">${news1.depicts}</script>
           </dt>
                </li>
                <li> 
                
            
                <dd>设置文章属性：</dd>
                 <p>
                 
                <select name="state" id="state" >
	            	<option value="0">不推荐</option>
	            	<option value="1">推荐</option>  
       			</select>
                 
                 
                    <!--   <label>
                        <input type="checkbox" name="state" id="state" value="1"  />
                        <span>置顶</span></label> -->
				</p>
                    <dt></dt>
                </li>
               
                <li>
                <dd></dd>
                 <input type="button" value="提交" onclick="getContent()"class="submitBtn"/>
                 <!-- <input type="submit" title="预览" value="预览" class="submitBtn"/> -->
                </li>
            </ul>
             </form>
   	  </div>
  </div>
  
  
  
  <div class="cl"></div>
</div>


<div>
     <h3 id="focush2"></h3> 
</div>
<script type="text/javascript">

    //实例化编辑器
    var um = UM.getEditor('myEditor');
    um.addListener('blur',function(){
        //$('#focush2').html('编辑器失去焦点了')
    });
    um.addListener('focus',function(){
        $('#focush2').html('')
    });
    //按钮的操作
    function insertHtml() {
        var value = prompt('插入html代码', '');
        um.execCommand('insertHtml', value)
    }
    function isFocus(){
        alert(um.isFocus())
    }
    function doBlur(){
        um.blur()
    }
    function createEditor() {
        enableBtn();
        um = UM.getEditor('myEditor');
    }
    function getAllHtml() {
        alert(UM.getEditor('myEditor').getAllHtml())
    }
    function getContent() {
    	if($("#title").val=''){
    		alert("文章标题不能为空！");
    		return false;
    	}
    	if($("#myEditor").val=''){
    		alert("文章内容不能为空！");
    		return false;
    	}
        var arr = [];
        arr.push(UM.getEditor('myEditor').getContent());
        $("#depicts").val(arr.join("\n"));
        $("#channel").val( $("#chanel").val());
        
        alert("添加成功")
        
          $("#form" ).submit();   
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UM.getEditor('myEditor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用umeditor')方法可以设置编辑器的内容");
        UM.getEditor('myEditor').setContent('欢迎使用umeditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UM.getEditor('myEditor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UM.getEditor('myEditor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UM.getEditor('myEditor').selection.getRange();
        range.select();
        var txt = UM.getEditor('myEditor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UM.getEditor('myEditor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UM.getEditor('myEditor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UM.getEditor('myEditor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UM.getEditor('myEditor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            domUtils.removeAttributes(btn, ["disabled"]);
        }
    }
</script>

</body>
</html>


