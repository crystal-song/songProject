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


 <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
   <!--  <title>UMEDITOR 完整demo</title> -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="<%=path%>/up/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <link href="<%=path%>/css/style1.css" rel="stylesheet" type="text/css" />
    <%-- <script type="text/javascript" src="<%=path%>/up/third-party/jquery.min.js"></script> --%>
    <script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>   
    <script type="text/javascript" charset="utf-8" src="<%=path%>/up/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path%>/up/umeditor.min.js"></script>
    <script type="text/javascript" src="<%=path%>/up/lang/zh-cn/zh-cn.js"></script>
    <script src="<%=path%>/js/uploadPreview.min.js" type="text/javascript"></script>
    
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
    
    
    
    


  
  <script type="text/javascript" charset="utf-8">


       /*  function addOrUpdateUser() {
           

            $.post("resource/addOrUpdate", $("#form").serializeArray(), function (data) {
                $('#MyPopWindow').window('close');
                $('#hotelTable').datagrid('reload');
                $.messager.alert('提示', data.mes, 'info');
            });
        } */

        $(document).ready(function(){ 
        	
        	/* alert("ddddddddddddddddddddd"); */
        	
        	    
        	/* $('#mes').val(); */
        	if($('#mes').val()!=''){
        		alert($('#mes').val());
        	}
        	
        	
        	/* if( r!=null){
        		alert(r);
        	} */
        	    	
        	     	
        	/*  $("#file").uploadPreview({ Img: "ImgPr", Width: 120, Height: 120});
        	alert("cccccccccccccccccccccccccccc");  */
        	
        	
        });   
        
        
        /* $(function () {
        	
            $("#file").uploadPreview({ Img: "ImgPr", Width: 250, Height: 158});
            alert("cccccccccccccccccccccccccccc");
        });  */

        
    </script>
    
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
        	<li><a href="<%=path%>/Login/queryproduct" class="btn_gray">PtoB产品管理</a></li>
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
  	
  	

  		<form  action="<%=path%>/Login/addproduct" id="form" method="post"   class="box"  style="display:'none'"   >
    	<div class="dataForm">
    <input type="hidden" name="mes" id="mes" value="${mes}" />
    <input type="hidden" name="enterpriseCertificate" id="enterpriseCertificate" value="" />
    <input type="hidden" name="projectPicture" id="projectPicture" value="" />
        	<ul>
                <li>
                    <dd>项目名称：</dd>
                    <input type="text" name="projectName"  id="projectName" />
                    <dt>1111</dt>
                </li>
                <li>
                    <dd>企业编号：</dd>
                    <input type="text" name="enterpriseNumber"  id="enterpriseNumber"   />
                    <dt></dt>
                </li>
                <li>
                    <dd>项目图片：</dd>
                   <!--  <input  type="file" id="file" name="file"  /> -->
                    
                    <!--style给定宽度可以影响编辑器的最终宽度-->
<!--  <script type="text/plain"   id="Editor" style="width:1000px;height:100px;"> -->
  <!--  <p>这里我可以写一些输入提示</p> -->
<!-- </script>  -->

 
                <dt><script type="text/plain"   id="Editor" style="width:600px;height:100px;"> 
    <p>这里我可以写一些输入提示</p> 
 </script>  <br />尺寸：250*158</dt>  
                </li>
                <li>
                    <dd>信用等级：</dd>
                    <input type="number"  name="qualityRating"  id="qualityRating"      min="1" max="5" value="1" step="1" />
                    <dt></dt>
                </li>
                <li>
                    <dd>年化收益：</dd>
                    <input type="number"  name="yearIncome"  id="yearIncome"     min="0.05" max="0.24" value="0.12" step="0.01" />
                    <dt></dt>
                </li>
                <li>
                    <dd>还款日期：</dd>
                    <input type="date" name="repaymentTime"  id="repaymentTime"  />
                    <dt></dt>
                </li>
                <li>
                    <dd>担保机构：</dd>
                    <input type="text" name="guaranteeInstitution"  id="guaranteeInstitution"  />
                    <dt></dt>
                </li>
                 <li>
                    <dd>还款方式：</dd>
                    <input type="text" name="repaymentWay"  id="repaymentWay" />
                    <dt>1111</dt>
                </li>
                <li>
                    <dd>融资金额：</dd>
                    <input type="number"  name="financingMoney"  id="financingMoney"     min="0" value="0" />
                    <dt></dt>
                </li>
                <li>
                    <dd>融资周期：</dd>
                    <input type="number"  name="financingPeriod"  id="financingPeriod"     min="0" value="0" />
                    <dt></dt>
                </li>
                
               <!--  <li>
                    <dd>重点信息：</dd>
                    <textarea name="abstract" cols="" rows=""></textarea>
                    <dt>显示在项目图片下方的综合摘要信息。</dt>
                </li> -->
                 <li>
                    <dd>公司介绍：</dd>
                    <textarea    name="companyProfile"  id="companyProfile"  cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>项目介绍：</dd>
                    <textarea  name="projectIntroduce"  id="projectIntroduce"     cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>担保意见：</dd>
                    <textarea  name="collateralOpinion"  id="collateralOpinion"    cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>担保机构介绍：</dd>
                    <textarea  name="guaranteeInstitutionIntroduce"  id="guaranteeInstitutionIntroduce"    cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>资金用途：</dd>
                    <textarea   name="fundUse"  id="fundUse"  cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>偿还来源：</dd>
                    <textarea   name="repaymentSource"  id="repaymentSource"  cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>抵押物信息：</dd>
                    <textarea   name="guarantee"  id="guarantee"  cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>风险控制：</dd>
                    <textarea   name="riskControl"  id="riskControl"  cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                 <li>
                    <dd>营业范围：</dd>
                    <textarea   name="businessScope"  id="businessScope"  cols="" rows=""></textarea>
                    <dt></dt>
                </li>
                 
                <li>
                    <dd>经营状况：</dd>
                    <textarea   name="stateOfOperation"  id="stateOfOperation"  cols="" rows=""></textarea>
                    <dt></dt>
                </li>
               
                
               
               <!--  <li>
                    <dd>相关证件：</dd>
                    <textarea name="abstract" cols="" rows=""></textarea>
                    <dt></dt>
                </li> -->
                
                  <!--  <li>
                    <dd>相关证件：</dd>
                    <textarea  name="abstract" cols="" rows=""></textarea>
                    <dt></dt>
                </li>  -->
                
                
        <h1>相关证件</h1>

<!--style给定宽度可以影响编辑器的最终宽度-->
<script type="text/plain"   id="myEditor" style="width:1000px;height:180px;">
    <p>这里我可以写一些输入提示</p>
</script>
                
             

                <li>
                <dd>设置项目属性：</dd>
                 <p>
                      <label>
                        <input type="checkbox" name="recommendType" id="recommendType"   value="1"  />
                        <span>推荐</span></label>
				</p>
                    <dt></dt>
                </li>
               <!--  <li>
                    <dd>发布时间：</dd>
                    <input type="date"   />
                    <dt></dt>
                </li> -->
               
                   
                <li>
                <dd></dd>
                 <input type="button"  title="提交"  onclick="getContent()"   value="提交" class="b"/>
                </li>
            </ul>
            
   	  </div>
   	  </form>
  </div>
  <div class="cl"></div>
</div>





<div>
     <h3 id="focush2"></h3> 
</div>
<script type="text/javascript">


//实例化编辑器
var um = UM.getEditor('Editor');
um.addListener('blur',function(){
    $('#focush2').html('编辑器失去焦点了')
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
    um = UM.getEditor('Editor');
}
function getAllHtml() {
    alert(UM.getEditor('Editor').getAllHtml())
}




    //实例化编辑器
    var um = UM.getEditor('myEditor');
    um.addListener('blur',function(){
        $('#focush2').html('编辑器失去焦点了')
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
        var arr = [];
        var arr1 = [];
     /*    arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为："); */
        arr.push(UM.getEditor('myEditor').getContent());
        alert(arr.join("\n"));
        $("#enterpriseCertificate").val(arr.join("\n"));
        
        
        arr1.push(UM.getEditor('Editor').getContent());
        alert(arr1.join("\n"));
        $("#projectPicture").val(arr1.join("\n"));
        
        
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







<%-- <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <title>UMEDITOR 完整demo</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="<%=path%>/up/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/up/third-party/jquery.min.js"></script>
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
<h1>UMEDITOR 完整demo</h1>

<!--style给定宽度可以影响编辑器的最终宽度-->
<script type="text/plain" id="myEditor" style="width:1000px;height:240px;">
    <p>这里我可以写一些输入提示</p>
</script>

<div>
     <h3 id="focush2"></h3> 
</div>
<script type="text/javascript">
    //实例化编辑器
    var um = UM.getEditor('myEditor');
    um.addListener('blur',function(){
        $('#focush2').html('编辑器失去焦点了')
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
        var arr = [];
     /*    arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为："); */
        arr.push(UM.getEditor('myEditor').getContent());
        alert(arr.join("\n"));
        $("#txt").val(arr.join("\n"));
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

<form  action="<%=path%>/Login/session" id="form" method="post"   class="box"  style="display:'none'"   >
 <input type="text"   name="txt" id="txt" value=""   /> 
 
<input name="imgbtn"  id="imgbtn"   type="submit"  value="查询" />

</form>

</body>
</html>
 --%>