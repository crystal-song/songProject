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
<script type="text/javascript">
var navIndex=1;
</script>

<script type="text/javascript" >

var myFilter=new Array();

function filterChange(){
	var filterIndex= new Array();
	switch (myFilter[0]){
	case 10:
		filterIndex[0]=1;
		break;
	case 15:
		filterIndex[0]=2;
		break;
	case 20:
		filterIndex[0]=3;
		break;
		break;
	default:
		filterIndex[0]=0;
	}
	switch (myFilter[1]){
	case 3:
		filterIndex[1]=1;
		break;
	case 6:
		filterIndex[1]=2;
		break;
	case 12:
		filterIndex[1]=3;
		break;
	case 24:
		filterIndex[1]=4;
		break;	
	default:
		filterIndex[1]=0;
	}
	switch (myFilter[2]){
	case 200:
		filterIndex[2]=1;
		break;
	case 500:
		filterIndex[2]=2;
		break;
	case 1000:
		filterIndex[2]=3;
		break;
	case 2000:
		filterIndex[2]=4;
		break;
	default:
		filterIndex[2]=0;
	}
	switch (myFilter[3]){
	case 50:
		filterIndex[3]=1;
		break;
	case 80:
		filterIndex[3]=2;
		break;
	case 100:
		filterIndex[3]=3;
		break;
	default:
		filterIndex[3]=0;
	}

	switch (myFilter[4]){
	case 2:
		filterIndex[4]=1;
		break;
	case 3:
		filterIndex[4]=2;
		break;
	case 4:
		filterIndex[4]=3;
		break;
	default:
		filterIndex[4]=0;
	}
	$(".filter li").removeClass("dq");
	for(i=0;i<5;i++){
		$(".filter").eq(i).children("li").eq(filterIndex[i]).addClass("dq");
	}
}

function pa(clicked){
	myFilter[clicked.parent().index(".filter")]=clicked.attr("value");
/* 	for(i=0;i<5;i++){
		$("#form input").eq(i).val(myFilter[i]);
		console.log(i+">>"+$("#form input").eq(i).val());
	} */
	$("#yearIncome").val(myFilter[0]);
	$("#financingPeriod").val(myFilter[1]);
	$("#financingMoney").val(myFilter[2]);
	$("#financingProgress").val(myFilter[3]);
	$("#projectStatus").val(myFilter[4]);
	$("#pageNo").val(1);
	console.log(myFilter);
	//alert("avd");
	
	$("#form" ).submit();
}

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



	    
	    
	/* $("#form" ).submit(); */

/*  }
	 */
 
 

    /*  function pa(){   */
/*  $(document).ready(function(){ 
	 
	    $('.tz_nr li').click(function(){    
			
			var n=0;
		 $(this).addClass('dq').siblings().removeClass('dq');     
			$('.tz_nr .dq').each(function(){
				
				var param=[];
				var b=['a','b','c','d','e'];
				param.push($(this).val()); */	
				
				/*  alert(b[n]+'='+param);  */
				/*  alert("n"+n);
				 alert("param"+param); */
/* 				 if(n==0){
			     $('#yearIncome').val(param); 
				 }if(n==1){
					 $('#financingPeriod').val(param);
				 }if(n==2){
					 $('#financingMoney').val(param);
				 }if(n==3){
					 $('#financingProgress').val(param);
				 }if(n==4){
					 $('#projectStatus').val(param);
				 }
				n++;	 */	
				/* alert(b[0]); */
				/* alert(param); */
				 
				
				
/* 				});
			alert("avd");
			
			 $("#form" ).submit();
			
	  	});
			 });     */

/*   }    */
  

function jumpPage(pag){
	alert("ccccccccccc"+pag);
	   
	    $('#pageNo').val(pag); 
	    
	   /*  pa(); */
	    
	   $("#yearIncome").val(myFilter[0]);
	$("#financingPeriod").val(myFilter[1]);
	$("#financingMoney").val(myFilter[2]);
	$("#financingProgress").val(myFilter[3]);
	$("#projectStatus").val(myFilter[4]);
	    
	    
	 $("#form" ).submit(); 

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
	myFilter=[${product.yearIncome},${product.financingPeriod},${product.financingMoney},${product.financingProgress},${product.projectStatus}]
	if(myFilter[0]==null){
		myFilter=[1,1,1,1,1];
	}
	console.log(myFilter);
	filterChange();
	$(".filter li").bind("click",function(e){
		pa($(this));
	});
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
    if(totalPages>1)$(".pageNum").html($(".pageNum").html()+'<a href="javascript:jumpPage('+totalPages+')" class="pager">'+totalPages+'</a>');
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
                    	<ul class="filter">
                        	<li class="dq" value="1" >全部</li>
                            <li value="10"  >10%以下</li>
                            <li value="15"  >10%-15%</li>
                            <li value="20"   >15%-20%</li>
                        </ul>
                    </div>
                </div>
                <div class="tz_one">
                	<div class="tz_one_left">存续时间：</div>
                    <div class="tz_one_right">
                    	<ul class="filter">
                        	<li class="dq" value="1"  >全部</li>
                            <li value="3" >3个月以下</li>
                            <li value="6" >3-6个月</li>
                            <li value="12" >6-12个月</li>
                            <li value="24" >12个月以上</li> 
                        </ul>
                    </div>
                </div>
                <div class="tz_one">
                	<div class="tz_one_left">项目规模：</div>
                    <div class="tz_one_right">
                    	<ul class="filter">
                        	<li value="1" >全部</li>
                            <li value="200" >200万以下</li>
                            <li value="500" >200-500万</li>
                            <li class="dq" value="1000" >500-1000万</li>
                            <li value="2000" >1000万以上</li>
                        </ul>
                    </div>
                </div>
                <div class="tz_one">
                	<div class="tz_one_left">融资进度：</div>
                    <div class="tz_one_right">
                    	<ul class="filter">
                        	<li class="dq" value="1"  >全部</li>
                            <li value="50"  >50%以下</li>
                            <li value="80"  >50%-80%</li>
                            <li value="100"  >80以上</li>
                        </ul>
                    </div>
                </div>
                <div class="tz_one">
                	<div class="tz_one_left">项目状态：</div>
                    <div class="tz_one_right">
                    	<ul class="filter">
                        	<li value="1"  >全部</li>
                            <li value="2"  >未满在投</li>
                            <li class="dq" value="3"  >企业还款中</li>
                            <li value="4"  >企业已还款</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
        
     


 <div id="bodyframe" style="VISIBILITY: hidden">  
<!--  <IFRAME frameBorder=1 id=heads src="framepage.htm" style="HEIGHT: 200px; LEFT: 220px; POSITION: absolute; TOP: 200px; WIDTH: 500px">    -->
<form  action="<%=path%>/product/allProduct" id="form" method="post"   class="box"  style="display:'none'"   >
 <input type="hidden"   name="pageNo" id="pageNo" value="${pageNo}"   /> 
 <input type="hidden"   name="yearIncome" id="yearIncome"   value="${product.yearIncome}"   />
<input type="hidden"   name="financingMoney" id="financingMoney"  value="${product.financingMoney}" />
<input type="hidden"   name="financingPeriod" id="financingPeriod" value="${product.financingPeriod}" />
<input type="hidden"   name="financingProgress" id="financingProgress" value="${product.financingProgress}" /> 
<input type="hidden"   name="projectStatus" id="projectStatus" value="${product.projectStatus}" /> 

<input name="imgbtn"  id="imgbtn"   type="submit"  value="查询" />
<!-- <button id="update" ></button> -->
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
            <div class="xq_left"  style="width:50px; height:50px;" >${s.projectPicture}</div>
            <div class="ind_right">
                <div class="tuijian">
                
                    <div class="tj_left">推荐项目:<span class="hong"><a href="getProductByid?id=${s.id}">${s.projectName}</a></span></div>
                    <div class="tj_right">
                        <div class="tj_jd">融资进度：${s.financingProgress}%</div>
                        <div class="tj_jd_pic"><div class="progress_80"><div class="progress_bar" style="width:${s.financingProgress<100?s.financingProgress:100}%" title="融资进度：${s.financingProgress}%"></div></div></div>
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
                        <div class="xq04_nr"><img src="<%=path%>/images/qualityRate_${s.qualityRating}.jpg" style="margin-bottom:-3px;"></div>
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
			<!-- news_list start  -->
			<%@ include file="/includes/news_list_right.jsp" %>
			<!-- news_list end  -->
    </div>
    <div class="clear"></div>
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
