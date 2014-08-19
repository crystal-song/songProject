<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ include file="/includes/taglibs.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>项目展示</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
$(document).ready(function(){
	var a=$("#load_bar").text();
	//alert(a)
	//$(".bar1").css('width',a)
	$('.redus a').click(function(e){
		//alert('a');
		$(this).addClass('redus_first').siblings().removeClass('redus_first');	
		});	
		
	$('.floor_bottom').each(function(){
		//var b=$(this).children('.baifenbi').text()
	
		var a= $(this).children("span").children("a:first").text()
		$(this).siblings('.loding_bar').children().css('width',a)
		//alert(b)
	
		});
	});

    window.onload=function(){
	var myblur= document.getElementById('blur')
	      myblur.onfocus=function(){
		  if(myblur.value=="搜索"){
			  myblur.value="";
			  myblur.style.color="#000"	 
			  }  
			 }  
		  myblur.onblur=function(){
			  
			 if(myblur.value==""){
			   myblur.value="搜索"
			   myblur.style.color="#ccc"	 
			   }	 		  
			  }	
	}
</script>
</head>
<body>
<div class="header">
  <div class="zth_01">
	<div class="logo01"><a href="index.html"><img src="images/sy_17.jpg"></a></div>
    <div class="nav_01">
    	<ul>
        	<li><a href="index.html">首页</a></li>
            <li><a href="touzi.html">浏览项目</a></li>
            <li><a href="zhanghu.html">开放平台</a></li>
            <li><a href="baozhang.html">新手帮助</a></li>
            <li><a href="help.html">发起项目</a></li>
        </ul>
    </div>
    <div class="nav_search">
      <div class="search_border">
        <input type="text" value="搜索" class="input" id="blur"/>
        <span></span>
      </div>  
    </div>
   <div class="denglu">
      <span><a class="deng">登陆</a></span>
      <span><a>注册</a></span>
    </div>    
  </div>
</div>
<div class="main">
    <div class="con_top">
       <ul class="content_nav_left">
         <li ><a href="#" class="nav_left_first">全部</a></li>
         <li><a href="#">科技</a></li>
         <li><a href="#">艺术</a></li>
         <li><a href="#">设计</a></li>
         <li><a href="#">音乐</a></li>
         <li><a href="#">影视</a></li>
         <li><a href="#">出版</a></li>
         <li><a href="#">动漫</a></li>
         <li><a href="#">公益</a></li>
         <li><a href="#">其他</a></li>
       </ul>
       <ul class="content_nav_right">
         <li><a href="#">众筹制造</a></li>
         <li><a href="#">原创手工</a></li>
         <li><a href="#">硬件设备</a></li>
       </ul>
    </div>
    <div class="see">
      <div class="see_left">
        <a class="see_red" style="color:#fff">所有项目</a>
        <a style="border-left:none">众筹中</a>
        <a style="border-left:none">已成功</a>
      </div>
      <div class="see_right">
        <select name="deal_sort">
            <option selected="selected">默认排序</option>
            <option selected="selected">最新上线</option>
            <option>最高目标金额</option>
            <option>最多支持人数</option>
            <option>最多支持金额</option>
        </select>    
      </div>
    </div>
    <div class="main_content">     
          <ul class="clearfix">
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a id="load" class="baifenbi" style="float:left; text-align:left;">91%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a id="load" class="baifenbi" style="float:left; text-align:left;">20%</a>
                         <a style="float:left; color:#a4a4a4;">已达</a>
                   </span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a>
                         <a style="color:#a4a4a4;">已筹资</a>
                   </span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em>
                         </a><a style="float:right; color:#a4a4a4;">剩余时间</a>
                   </span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a id="load" class="baifenbi" style="float:left; text-align:left;">81%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">71%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
             <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">61%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a id="load" class="baifenbi" style="float:left; text-align:left;">51%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">41%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">22%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">65%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">11%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">34%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">59%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            
            </li>
            <li>
             <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">6%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">77%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
             <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">47%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">64%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">23%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">44%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">52%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
            <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming">Withings智能无线血压仪——随时随地关爱健康</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><i>¥&nbsp;&nbsp;</i>60000</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a class="baifenbi" style="float:left; text-align:left;">21%</a><a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a></span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">25<em>天</em></a><a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
              </div>
            </li>
          </ul>
           <div class="redus">
             <a class="redus_last">下一页</a>
             <a>6</a>
             <a>...</a>
             <a>4</a>
             <a>3</a>
             <a>2</a>
             <a class="redus_first">1</a>   
           </div>   
    </div> 
 </div>     
 <div class="locus">
     <div class="fenlan">
        <dl>    
          <dt>众筹项目</dt> 
          <dd>
          <a>科技</a>
          <em>/</em>
          <a>艺术</a>
          <em>/</em>
          <a>设计</a>
          <em>/</em>
          <a>音乐</a>
          <em>/</em>
          </dd>
          <dd>
          <a>影视</a>
          <em>/</em>
          <a>出版</a>
          <em>/</em>
          <a>动漫游戏</a>
          <em>/</em>
          <a>公益</a>
          <em>/</em>
          </dd>
          <dd>
          <a>公开课</a>
          <em>/</em>
          <a>农业</a>
          <em>/</em>
          <a>其他</a>
          <em>/</em>
          </dd>
        </dl>
        <dl>        
          <dt>关于</dt>
          <dd>
          <a>关于众筹</a>
          <em>/</em>
          <a>联系我们</a>
          <em>/</em>
          <a>帮助中心</a>
          <em>/</em>
          </dd>
          <dd>
          <a>团队介绍</a>
          <em>/</em>
          <a>服务协议</a>
          <em>/</em>
          <a>项目发起规范</a>
          <em>/</em>
          </dd>
        </dl>
        <dl>
          <dt>关注我们</dt>
          <dd>
          <a>百度贴吧</a>
          <em>/</em>
          <a>QQ空间</a>
          <em>/</em>
          <a>新浪微博</a>
          <em>/</em>
          </dd> 
          <dd>
         <a>豆瓣小站</a>
          <em>/</em> 
          </dd> 
        </dl>
        <dl>
          <dt>服务</dt>
          <dd>
          <a>投资融资服务</a>
          <em>/</em>
          </dd>
        </dl>
     </div>
  
  </div>           
  <div class="repeat">       
        <div class="repeat_top">
         <span>友情链接:</span>
          <p>
          <a href="#">和讯网</a>
          <a href="#">雷锋网</a>
          <a href="#">36氪</a>
          <a href="#">hao123</a>
          <a href="#">360安全网</a>
          <a href="#">北青网</a>
          <a href="#">凤凰网</a>
          <a href="#">金融界</a>
          <a href="#">财新网</a>
          <a href="#">钛媒体</a>
          <a href="#">IMGII</a>
          <a href="#">电影网</a>
          <a href="#">雅昌艺术网</a>
          <a href="#">V电影</a>
          <a href="#">易观网</a>
          <a href="#">投资界</a>
          <a href="#">亿邦动力社区</a>
          <a href="#">拉勾网</a>
          <a href="#">金融工场</a>
          <a href="#">投融中国联盟</a>
          <a href="#">友成基金会</a>
          <a href="#">人人生活</a>
          <a href="#">众筹导航</a>
          </p>
        </div>
        <div class="repeat_bottom">页面版权所有：中投汇融财富管理中心    京ICP备13011445号</div>
  </div>

</body>
</html>