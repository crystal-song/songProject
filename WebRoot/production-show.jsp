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
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
var navIndex=2;
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
    
    
    function jumpPage(pag){
    	/* alert("ccccccccccc"+pag); */
    	   
    	    $('#pageNo').val(pag); 
    	    
    	   
    	    
    	 
    	    
    	    
    	 $("#form" ).submit(); 

     }
</script>
</head>
<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="clear"></div>
<div class="one"></div>
<div class="main">
    <div class="con_top">
       <ul class="content_nav_left">
         <li ><a href="#" class="nav_left_first">全部</a></li>
         <!--  <li><a href="#">科技</a></li>
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
         <li><a href="#">硬件设备</a></li>-->
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
            <%-- <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="<%=path%>/img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
            </li> --%>
       <div id="bodyframe" style="VISIBILITY: hidden">  
<!--  <IFRAME frameBorder=1 id=heads src="framepage.htm" style="HEIGHT: 200px; LEFT: 220px; POSITION: absolute; TOP: 200px; WIDTH: 500px">    -->
<form  action="<%=path%>/crowdfunding/allCrowdfunding" id="form" method="post"   class="box"  style="display:'none'"   >
 <input type="hidden"   name="pageNo" id="pageNo" value="${pageNo}"   /> 


<input name="imgbtn"  id="imgbtn"   type="submit"  value="查询" />
<!-- <button id="update" ></button> -->
</form>
 <!--  </IFRAME>   -->
 </div>        
            
            
            
            <li>
            
            
             <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
              <div class="floor_num">
                 <a class="floor_img"><img src="<%=path%>/img/num1.png" width="256" height="170" />
                 </a><a href="getProductByid?id=${s.id}">
                 <h3><a class="shuoming" href="<%=path%>/crowdfunding/getCrowdfundingByid?id=${s.id}">${s.name}</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>${s.raiseTime}天</span>
                   <span><i>¥&nbsp;&nbsp;</i>${s.raiseMoney}</span>
                   <a>众筹中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b"></div>
                 </div>
                 <div class="floor_bottom">
                   <span><a id="load" class="baifenbi" style="float:left; text-align:left;">${s.raiseProportion}%</a>
                         <a style="float:left; color:#a4a4a4;">已达</a>
                   </span>
                   <span><a class="baifenbi"><em>¥&nbsp;&nbsp;</em>${s.realityMoney}</a>
                         <a style="color:#a4a4a4;">已筹资</a>
                   </span>
                   <span><a class="baifenbi" style="float:right; text-align:right;">${s.surplusTime}<em>天</em>
                         </a><a style="float:right; color:#a4a4a4;">剩余时间</a>
                   </span>
                 </div>
              </div>
              
               </c:forEach>
   
	 
        </c:if>
        
            </li>
           <%--  <li>
            
            
              <div class="floor_num">
                 <a class="floor_img"><img src="<%=path%>/img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
            </li> --%>
            <%-- <li>
             <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
            </li> --%>
            <%-- <li>
              <div class="floor_num">
                 <a class="floor_img"><img src="img/num1.png" width="256" height="170" />
                 </a>
                 <h3><a class="shuoming" href="<%=path%>/production-jianjie.jsp">Withings智能无线血压仪——随时随地关爱健康</a></h3>
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
            </li> --%>
          </ul>
           <div class="redus">
             <!-- <a class="redus_last">下一页</a> -->
            <!--  <a>6</a>
             <a>...</a>
             <a>4</a>
             <a>3</a>
             <a>2</a> -->
             	 <%-- <span> 第${page.pageNo}页, 共${page.totalPage}页  </span>  --%>
								 <a href="javascript:jumpPage(1)">首页</a> 
								<c:if test=""></c:if>
								 <c:if test="${page.pageNo > 1}"><a href="javascript:jumpPage(${page.pageNo-1})">上一页</a>  </c:if> 
								 <div class="pageNum"></div>
								   <c:if test="${page.pageNo < page.totalPage}">  <a href="javascript:jumpPage(${page.pageNo+1})">下一页</a>  </c:if>  
								<%--  <a href="#" onclick="jumpPage(${current-1})" class="org">上一页</a> --%>
								<a href="javascript:jumpPage(${page.totalPage})">末页</a>
            <!--  <a class="redus_first"></a>    -->
           </div>   
    </div> 
 </div>     
 <div class="clear_height"></div>
<!-- links start -->
<%@ include file="/includes/links.jsp" %>
<!-- links end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->

</body>
</html>