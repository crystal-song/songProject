<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ include file="/includes/taglibs.jsp" %> 


  <%-- <%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我要投资</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />

<%--  <script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  --%>

<!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->


<script type="text/javascript" >


function jumpPage(pag){
	alert("ccccccccccc"+pag);
	   
	    $('#pageNo').val(pag); 
	$("#form" ).submit();
	
	

	
	/*  var pageNo=1;
	 var  pageSize=2;
	 var  name="ddddd";
	  */
	
 	/* window.open('<c:url value="/product/allProduct"/>', '_self');   */
 /* 	$.post("/product/allProduct", { name: "name"} ); */
/*  if($('#pageNo').val() != ''){
	 alert("ddddddddddd");
	 alert("ccccc"+$('#pageNo').val()); */
            /* $.ajax({
                type: 'POST',
                url: '<c:url value="/product/session"/>',  */
               /*  data: 'pageNo='+$('#pageNo').val(),
                dataType: 'text',
                success: function(data) {
                	alert("ddddddd")
                	alert("dd"+data+'"success"');
                   
                } */
          /*   });   */
/*  }   */  
          

        
	
}


   

   
                
           

</script>

</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<!-- banner start -->
<%@ include file="/includes/banner.jsp" %>
<!-- banner end  -->
<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>
<div class="frame">
	<div class="tz_left">
    
    	<div class="tz">
        	<div><img src="<%=path%>/images/touzi_03.jpg"></div>
            <div class="tz_nr">
            	<div class="tz_one">
                	<div class="tz_one_left">融资年利率：</div>
                    <div class="tz_one_right">
                    	<ul>
                        	<li class="dq">全部</li>
                            <li>10%以下</li>
                            <li>10%-15%</li>
                            <li>15%-20%</li>
                        </ul>
                    </div>
                </div>
                <div class="tz_one">
                	<div class="tz_one_left">存续时间：</div>
                    <div class="tz_one_right">
                    	<ul>
                        	<li class="dq">全部</li>
                            <li>60天以下</li>
                            <li>60-180天</li>
                            <li>180-360天</li>
                        </ul>
                    </div>
                </div>
                <div class="tz_one">
                	<div class="tz_one_left">项目规模：</div>
                    <div class="tz_one_right">
                    	<ul>
                        	<li>全部</li>
                            <li>200万以下</li>
                            <li>200-500万</li>
                            <li class="dq">500-1000万</li>
                            <li>1000万以上</li>
                        </ul>
                    </div>
                </div>
                <div class="tz_one">
                	<div class="tz_one_left">融资进度：</div>
                    <div class="tz_one_right">
                    	<ul>
                        	<li class="dq">全部</li>
                            <li>50%以下</li>
                            <li>50%-80%</li>
                            <li>80以上</li>
                        </ul>
                    </div>
                </div>
                <div class="tz_one">
                	<div class="tz_one_left">项目状态：</div>
                    <div class="tz_one_right">
                    	<ul>
                        	<li>全部</li>
                            <li>未满在投</li>
                            <li class="dq">企业还款中</li>
                            <li>企业已还款</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
        
     


 <div id="bodyframe" style="VISIBILITY: hidden"> 
<!--  <IFRAME frameBorder=1 id=heads src="framepage.htm" style="HEIGHT: 200px; LEFT: 220px; POSITION: absolute; TOP: 200px; WIDTH: 500px">    -->
<form  action="<%=path%>/product/allProduct" id="form" method="post"   class="box"  style="display:'none'"   >
<input type="text"   name="pageNo" id="pageNo"  />
<!-- <input type="text"   name="name" />
<input type="text"   name="name" /> -->
<input name="imgbtn"  id="imgbtn"   type="submit"  value="查询" />
<button id="update" ></button>
</form>
 <!--  </IFRAME>   -->
</div>  
<!-- <div onclick="document.all.bodyframe.style.visibility='visible'" style="background-color: red; cursor: hand; height: 22; left: 300; position: absolute; top: 137; width: 74; z-index: 1"> 
<font color="#ffffff">显示iFrame</font></p> 
</div> 
<div onclick="document.all.bodyframe.style.visibility='hidden'" style="background-color: red; cursor: hand; height: 22; left: 400; position: absolute; top: 137; width: 74; z-index: 1"> 
<font color="#ffffff">隐藏iFrame</font> 
</div> 555555 -->
 

        
        
         <input type="hidden" name="page.pageNo" id="pageNo" value="1" />
        
        <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
        <div class="clear_height"></div>
        <div class="ind_list">
            <div class="xq_left"><img src="<%=path%>/images/sy_63.jpg"></div>
            <div class="ind_right">
                <div class="tuijian">
                
                    <div class="tj_left">推荐项目:<span class="hong"><a href="getProductByid?id=${s.id}">${s.projectName}</a></span></div>
                    <div class="tj_right">
                        <div class="tj_jd">融资进度：${s.financingProgress}</div>
                        <div class="tj_jd_pic"><img src="<%=path%>/images/sy_76.jpg"></div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="xq_table">
                    <div class="xq01">
                        <div class="xq01_tit">年化收益</div>
                        <div class="xq01_nr hong">${s.yearIncome}%</div>
                    </div>
                    <div class="xq02">
                        <div class="xq01_tit">融资金额</div>
                        <div class="xq01_nr">${s.financingMoney}万</div>
                    </div>
                    <div class="xq03">
                        <div class="xq01_tit">还款日期</div>
                        <div class="xq01_nr">${s.repaymentTime}</div>
                    </div>
                    <div class="xq04">
                        <div class="xq01_tit">企业等级</div>
                        <div class="xq04_nr"><img src="<%=path%>/images/sy_66.jpg"></div>
                    </div>
                </div>
            </div>
        </div>
      
        </c:forEach>
      <%--     <div>
	  <tags:page page="${page}"/>
	</div>   --%>
	
	 
        </c:if>
        
        
      
       
        <div>
         
								 第${page.pageNo}页, 共 ${page.totalPage}  页  
								<a href="javascript:jumpPage(1)">首页</a>
								<c:if test=""></c:if>
								 <c:if test="${page.pageNo > 1}"><a href="javascript:jumpPage(${page.pageNo-1})">上一页</a>  </c:if> 
								   <c:if test="${page.pageNo < page.totalPage}">  <a href="javascript:jumpPage(${page.pageNo+1})">下一页</a>  </c:if> 
								<%--  <a href="#" onclick="jumpPage(${current-1})" class="org">上一页</a> --%>
								<a href="javascript:jumpPage(${page.totalPage})">末页</a> 
							</div> 
			
			
			
						
        <div class="clear_height"></div>
        <div class="num"><img src="<%=path%>/images/touzi_11.jpg"></div>
    
    
    </div>
    <div class="tz_right">
    	<div class="cr_bg">
            <div class="cr_tit">
                <div class="cr_font">网站公告</div>
                <div class="cr_more"><img src="<%=path%>/images/sy_50.jpg"></div>
            </div>
            <div class="cr_nr">
                <ul>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                </ul>
            </div>
        </div>
        <div class="clear_height"></div>
        <div class="cr_bg">
            <div class="cr_tit">
                <div class="cr_font">项目到期公告</div>
                <div class="cr_more"><img src="<%=path%>/images/sy_50.jpg"></div>
            </div>
            <div class="cr_nr">
                <ul>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                </ul>
            </div>
        </div>
        <div class="clear_height"></div>
        <div class="cr_bg">
            <div class="cr_tit">
                <div class="cr_font">项目还款公告</div>
                <div class="cr_more"><img src="<%=path%>/images/sy_50.jpg"></div>
            </div>
            <div class="cr_nr">
                <ul>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                </ul>
            </div>
        </div>
        <div class="clear_height"></div>
        <div class="cr_bg">
            <div class="cr_tit">
                <div class="cr_font">媒体报道</div>
                <div class="cr_more"><img src="<%=path%>/images/sy_50.jpg"></div>
            </div>
            <div class="cr_nr">
                <ul>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                </ul>
            </div>
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
