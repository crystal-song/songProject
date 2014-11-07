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
<meta content="中租宝，是北京中投汇融投资管理有限公司旗下的众筹网络平台，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>我要投资 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />

 <script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  

<script type="text/javascript" >

$(document).ready(function(e){
	  $(".nav_big a").eq(1).addClass("bd_btom").siblings().removeClass("bd_btom");
    $(".right_lable li").click(function(){
      var index = $(this).index();
      $(this).addClass('right_lable_red').siblings().removeClass('right_lable_red');
      $(".touzi_cont div.con_list").eq(index).css("display","block").siblings().css("display","none");
    });
});


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
	/* alert("ccccccccccc"+pag); */
	   
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
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="clear"></div>
<!-- 
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
                            <li value="10">10%以下</li>
                            <li value="15">10%-15%</li>
                            <li value="20">15%-20%</li>
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
        
        
     
 -->
 
 <div id="bodyframe" style="VISIBILITY: hidden">  
 <!-- <IFRAME frameBorder=1 id=heads src="framepage.htm" style="HEIGHT: 200px; LEFT: 220px; POSITION: absolute; TOP: 200px; WIDTH: 500px"> -->   
  
<form  action="<%=path%>/product/allProduct" id="form" method="post"   class="box"  style="display:'none'"   >
 <input type="hidden"   name="pageNo" id="pageNo" value="${pageNo}"   /> 
 <input type="hidden"   name="yearIncome" id="yearIncome"   value="${product.yearIncome}"   />
<input type="hidden"   name="financingMoney" id="financingMoney"  value="${product.financingMoney}" />
<input type="hidden"   name="financingPeriod" id="financingPeriod" value="${product.financingPeriod}" />
<input type="hidden"   name="financingProgress" id="financingProgress" value="${product.financingProgress}" /> 
<input type="hidden"   name="projectStatus" id="projectStatus" value="${product.projectStatus}" /> 

<input name="imgbtn"  id="imgbtn"   type="submit"  value="查询" />
<!--  <button id="update" ></button> --> 
 
</form>
 <!--  </IFRAME> -->  
 </div>   




<!-- <div onclick="document.all.bodyframe.style.visibility='visible'" style="background-color: red; cursor: hand; height: 22; left: 300; position: absolute; top: 137; width: 74; z-index: 1"> 
<font color="#ffffff">显示iFrame</font></p> 
</div> 
<div onclick="document.all.bodyframe.style.visibility='hidden'" style="background-color: red; cursor: hand; height: 22; left: 400; position: absolute; top: 137; width: 74; z-index: 1"> 
<font color="#ffffff">隐藏iFrame</font> 
</div> 555555 -->
 

        
        
         <input type="hidden" name="page.pageNo" id="pageNo" value="1" />
        
<div class="tou_con">
   <div class="con_left">
   <!-- con_left -->
      <%@ include file="/includes/news_list_right.jsp" %>
   <!-- con_left end-->   
      <div class="guanggao" style="display:none"></div>
   </div>
   <div class="con_right">
     <div class="right_lable">
      <ul>
        <li class="right_lable_red">全部项目</li>
        <li style="display:none">融资中</li>
        <li style="display:none">已成功</li>
        <li style="display:none">按条件查找</li>      
      </ul>
       <select class="deal_sort" style="display:none">
            <option selected="selected">默认排序</option>
            <option selected="selected">最新上线</option>
            <option>最高目标金额</option>
            <option>最多支持人数</option>
            <option>最多支持金额</option>
        </select>
     </div>
     <div class="select_sort">
       <ul>
         <li>期限
           <select class="sec_style">
            <option selected="selected">默认排序</option>
            <option selected="selected">最新上线</option>
            <option>最高目标金额</option>
            <option>最多支持人数</option>
            <option>最多支持金额</option>
           </select>
         </li>
         <li>年化利率
          <select class="sec_style">
            <option selected="selected">默认排序</option>
            <option selected="selected">最新上线</option>
            <option>最高目标金额</option>
            <option>最多支持人数</option>
            <option>最多支持金额</option>
          </select>
         </li>
         <li>金额
          <select class="sec_style">
            <option selected="selected">默认排序</option>
            <option selected="selected">最新上线</option>
            <option>最高目标金额</option>
            <option>最多支持人数</option>
            <option>最多支持金额</option>
          </select> 
         </li>
         <li>投标完成度
          <select class="sec_style">
            <option selected="selected">默认排序</option>
            <option selected="selected">最新上线</option>
            <option>最高目标金额</option>
            <option>最多支持人数</option>
            <option>最多支持金额</option>
          </select>
         </li>
         <li><input type="submit" value="查找"/></li>
       </ul>
     </div>
     <div class="touzi_cont">
             <div class="con_list">
         <ul>
          <c:if test="${ not empty list}">
            <c:forEach var="s" items="${list}" varStatus="i">
          <li>
            <div class="floor_num01">
                 <a class="floor_img01">${s.projectPicture}
                  <div class="hot"></div>
                  <div class="last_time01">剩余时间:<strong>&nbsp;&nbsp;28</strong>天</div>
                 </a>
                 <a class="shuoming01" href="getProductByid?id=${s.id}" title="${s.projectName}">${s.projectName}</a>
                 <div class="aim01">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><em>￥&nbsp;&nbsp;</em>${s.financingMoney}</span>
                   <a>融资中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b" style="width:<c:if test='${empty s.financingProgress}'>0</c:if><c:if test='${not empty s.financingProgress}'>${s.financingProgress<100?s.financingProgress==null?0:s.financingProgress:100}</c:if>%" title="融资进度：${s.financingProgress}%"></div>
                 </div>
                 <div class="floor_bottom01">
                   <span><a class="baifenbi01" style="float:left; text-align:left;"><c:if test='${empty s.financingProgress}'>0</c:if>${s.financingProgress}%</a>
                   <a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi01"><em>￥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a>
                   </span>
                   <span><a class="baifenbi01" style="float:right; text-align:right;">${s.yearIncome}</a>
                   <a style="float:right; color:#a4a4a4;">年华收益率</a></span>
                 </div>
                 <div class="botm_btn01">
                  <a href="product/getProductByid?id=${s.id}" class="btn_org">了解详情</a>
                 </div>
            </div> 
            </li>
             </c:forEach>
               </c:if>
          </ul>            
     </div>
        <div class="clear"></div>
      <div class="next_list">
       
							
								 
								 <a href="javascript:jumpPage(1)">首页</a> 
								 
								<c:if test=""></c:if>
								 
								 <c:if test="${page.pageNo > 1}"><a href="javascript:jumpPage(${page.pageNo-1})">上一页</a>  </c:if> 
								 <div class="pageNum"></div>
								 
								   <c:if test="${page.pageNo < page.totalPage}">  <a href="javascript:jumpPage(${page.pageNo+1})">下一页</a>  </c:if>  
								
								<a href="javascript:jumpPage(${page.totalPage})">末页</a> 
								
							
      <!--  
      <a href="#" class="a1">首页</a>
         <a href="#" class="a2"></a>
         <a href="#">1</a>
         <a href="#">2</a>
         <a href="#">3</a>
         <a href="#">4</a>
         <a href="#">5</a>
         <a href="#">...</a>
         <a href="#">20</a>
         <a href="#" class="a3"></a>
         <a href="#" class="a4">尾页</a>
         <span>跳到</span>
         <span><input type="text" /></span>
         <span>页</span>
         <span><input type="submit" class="btn_sub" value="确定"/></span>   
      -->
      <!-- 
        <a href="javascript:jumpPage(1)">首页</a> 
			<c:if test=""></c:if>								 
			<c:if test="${page.pageNo > 1}"><a href="javascript:jumpPage(${page.pageNo-1})">上一页</a>  </c:if> 
			<div class="pageNum"></div>								 
			<c:if test="${page.pageNo < page.totalPage}">  <a href="javascript:jumpPage(${page.pageNo+1})">下一页</a>  </c:if>  
			<a href="javascript:jumpPage(${page.totalPage})">末页</a>   
			
      -->			     
        </div>
     </div>
   </div>
  
 </div>      
        <!-- 
        <div class="clear_height"></div>
        <div class="ind_list">
            <div class="xq_left"><a href="product/getProductByid?id=${s.id}">${s.projectPicture}</a></div>
            <div class="ind_right">
                <div class="tuijian">
                
                    <div class="tj_left">推荐项目:<span class="hong"><a href="getProductByid?id=${s.id}">${s.projectName}</a></span></div>
                    <div class="tj_right">
                        <div class="tj_jd">融资进度：<c:if test='${empty s.financingProgress}'>0</c:if>${s.financingProgress}%<c:if test='${s.financingProgress==100}'><img src="<%=path%>/img/touzi_sec.jpg"></c:if></div>
                        <div class="tj_jd_pic"><div class="progress_80"><div class="progress_bar" style="width:<c:if test='${empty s.financingProgress}'>0</c:if><c:if test='${not empty s.financingProgress}'>${s.financingProgress<100?s.financingProgress==null?0:s.financingProgress:100}</c:if>%" title="融资进度：${s.financingProgress}%"></div></div></div>
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
    -->   
            
    <!--     
<div class="clear_height"></div>
	<div>
        <div class="num">        
							
								 
								 <a href="javascript:jumpPage(1)">首页</a> 
								 
								<c:if test=""></c:if>
								 
								 <c:if test="${page.pageNo > 1}"><a href="javascript:jumpPage(${page.pageNo-1})">上一页</a>  </c:if> 
								 <div class="pageNum"></div>
								 
								   <c:if test="${page.pageNo < page.totalPage}">  <a href="javascript:jumpPage(${page.pageNo+1})">下一页</a>  </c:if>  
								
								<a href="javascript:jumpPage(${page.totalPage})">末页</a> 
								
							</div> 
			
    
    </div>
    </div>
    <div class="tz_right">
 
    </div>
    <div class="clear"></div>
</div>
 -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
