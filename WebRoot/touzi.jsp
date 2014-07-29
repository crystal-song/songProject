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

 <script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  

<!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>  -->


<script type="text/javascript" >

 /*  $(document).ready(function(){
    
$('.tz_nr li').click(function(){
	
	var n=0;
 $(this).addClass('dq').siblings().removeClass('dq');     
	$('.tz_nr .dq').each(function(){
		var param=[];
		var b=['a','b','c','d','e'];
		param.push($(this).val());	
		alert(b[n]+'='+param);
		n++;		
		
		
		});
	
	});

});	   */
 

     function pa(){  
 /* $(document).ready(function(){ 
	 
	    $('.tz_nr li').click(function(){    */
			
			var n=0;
		 $(this).addClass('dq').siblings().removeClass('dq');     
			$('.tz_nr .dq').each(function(){
				
				var param=[];
				var b=['a','b','c','d','e'];
				param.push($(this).val());	
				
				/*  alert(b[n]+'='+param);  */
				/*  alert("n"+n);
				 alert("param"+param); */
				 if(n==0){
			     $('#yearIncome').val(param); 
				 }if(n==1){
					 $('#financingPeriod').val(param);
				 }if(n==2){
					 $('#financingMoney').val(param);
				 }if(n==3){
					 $('#financingProgress').val(param);
				 }if(n==4){
					 $('#repaymentWay').val(param);
				 }
				n++;		
				/* alert(b[0]); */
				/* alert(param); */
				 
				
				
				});
			alert("avd");
			
			 $("#form" ).submit();
			
	 /* 	});
			 });    */

  }   
  

function jumpPage(pag){
	alert("ccccccccccc"+pag);
	   
	    $('#pageNo').val(pag); 
	    
	    pa();
	    
	    
	    
	/* $("#form" ).submit(); */

 }
	
	

	
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
          

        
	



window.onload=function(e) {
	pagerInit(${page.totalPage},${page.pageNo});//${page.totalPage},${page.pageNo}
}
   
function pagerInit(a,b){//${page.totalPage},${page.pageNo}
	var totalPages=a;
	var curPage=b;
	if(curPage>totalPages)return false;
	var endPage=curPage+5>totalPages-1?totalPages-1:curPage+5;
	var startPage=endPage-7>2?endPage-7:2;
	endPage=startPage+7>totalPages?totalPages:startPage+7;
	console.log(startPage+"/"+endPage+"/"+curPage);
	var str='';
	var spl='<span>...</span>';
	$(".pageNum").html('<a href="javascript:jumpPage(1)" class="pager">1</a>');
	if(startPage>2){$(".pageNum").html($(".pageNum").html()+spl);}
      for(i=startPage;i<endPage;i++){
    	  str='<a href="javascript:jumpPage('+i+')" class="pager">'+i+'</a>';
    	  $(".pageNum").html($(".pageNum").html()+str);
		}
      if(endPage<totalPages-1){$(".pageNum").html($(".pageNum").html()+spl);}
    $(".pageNum").html($(".pageNum").html()+'<a href="javascript:jumpPage('+totalPages+')" class="pager">'+totalPages+'</a>');
    $(".pager").eq(curPage-startPage+1).addClass("pageNumCur");
	$(".pageNumCur").attr("href","javascript:;");	
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
                        	<li class="dq" value="1" onclick="pa()" >全部</li>
                            <li value="10"  onclick="pa()" >10%以下</li>
                            <li value="15"  onclick="pa()" >10%-15%</li>
                            <li value="20"  onclick="pa()"  >15%-20%</li>
                        </ul>
                    </div>
                </div>
                <div class="tz_one">
                	<div class="tz_one_left">存续时间：</div>
                    <div class="tz_one_right">
                    	<ul>
                        	<li class="dq" value="1" onclick="pa()"  >全部</li>
                            <li value="60" onclick="pa()" >60天以下</li>
                            <li value="180" onclick="pa()" >60-180天</li>
                            <li value="360" onclick="pa()" >180-360天</li>
                        </ul>
                    </div>
                </div>
                <div class="tz_one">
                	<div class="tz_one_left">项目规模：</div>
                    <div class="tz_one_right">
                    	<ul>
                        	<li value="1" onclick="pa()" >全部</li>
                            <li value="200" onclick="pa()" >200万以下</li>
                            <li value="500" onclick="pa()" >200-500万</li>
                            <li class="dq" value="1000" onclick="pa()" >500-1000万</li>
                            <li value="2000" onclick="pa()" >1000万以上</li>
                        </ul>
                    </div>
                </div>
                <div class="tz_one">
                	<div class="tz_one_left">融资进度：</div>
                    <div class="tz_one_right">
                    	<ul>
                        	<li class="dq" value="1" onclick="pa()"  >全部</li>
                            <li value="50"  onclick="pa()" >50%以下</li>
                            <li value="80" onclick="pa()"  >50%-80%</li>
                            <li value="100"  onclick="pa()" >80以上</li>
                        </ul>
                    </div>
                </div>
                <div class="tz_one">
                	<div class="tz_one_left">项目状态：</div>
                    <div class="tz_one_right">
                    	<ul>
                        	<li value="1" onclick="pa()"  >全部</li>
                            <li value="2" onclick="pa()"  >未满在投</li>
                            <li class="dq" value="3" onclick="pa()"  >企业还款中</li>
                            <li value="4"  onclick="pa()" >企业已还款</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
        
     


 <!-- <div id="bodyframe" style="VISIBILITY: hidden">  -->
<!--  <IFRAME frameBorder=1 id=heads src="framepage.htm" style="HEIGHT: 200px; LEFT: 220px; POSITION: absolute; TOP: 200px; WIDTH: 500px">    -->
<form  action="<%=path%>/product/allProduct" id="form" method="post"   class="box"  style="display:'none'"   >
<!-- <input type="text"   name="pageNo" id="pageNo"  /> -->
 <input type="text"   name="yearIncome" id="yearIncome"  />
<input type="text"   name="financingMoney" id="financingMoney"  />
<input type="text"   name="financingPeriod" id="financingPeriod"  />
<input type="text"   name="financingProgress" id="financingProgress"  /> 
<input type="text"   name="projectStatus" id="projectStatus"  /> 

<input name="imgbtn"  id="imgbtn"   type="submit"  value="查询" />
<!-- <button id="update" ></button> -->
</form>
 <!--  </IFRAME>   -->
<!-- </div>   -->




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
        
<div class="clear_height"></div>
	<div>
        <div class="num">
         
								 <%-- <span> 第${page.pageNo}页, 共${page.totalPage}页  </span>  --%>
								 <a href="javascript:jumpPage(1)">首页</a> 
								<c:if test=""></c:if>
								 <c:if test="${page.pageNo > 1}"><a href="javascript:jumpPage(${page.pageNo-1})">上一页</a>  </c:if> 
								 <div class="pageNum"></div>
								   <c:if test="${page.pageNo < page.totalPage}">  <a href="javascript:jumpPage(${page.pageNo+1})">下一页</a>  </c:if>  
								<%--  <a href="#" onclick="jumpPage(${current-1})" class="org">上一页</a> --%>
								<a href="javascript:jumpPage(${page.totalPage})">末页</a> 
							</div> 
			
    
    </div>
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
