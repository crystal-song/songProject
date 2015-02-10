<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/includes/taglibs.jsp" %> 

<title>我的众筹 - 中租宝</title>

</head>
<body>

<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="content01">
   <div class="z_list_title">
    <a class="z_title_bac">所有项目</a>
    <a>众筹中</a>  
    <a>已筹满</a>
    <a>即将开启</a>
   </div>
   <div class="crowd_con">
   	<c:forEach var="s" items="${heros.list}" varStatus="i">
     <div class="crowd_list">
        <div class="crowd_pic"><a href="/hero/get-by-id?id=${s.id}"><img src="${s.main_image_file_name}" /></a></div>
        <div class="crowdpro_name">名称：<a href="/zhongchou_msg.jsp">${s.name}</a></div>
        <div class="crowd_bar"><div></div></div>
        <div class="crowd_wd">
          <div class="crow_left">
            <span>${s.stats_number_of_contributions} </span>
            <span>支持者</span>
          </div>
          <div class="crow_right">
             <span>${s.datenum}</span>
             <span>${s.datetype}后结束</span>
          </div>
        </div>
     </div>
</c:forEach> 

   
   <div class="clear"></div>
				<div class="next_list" >
					<a href="javascript:jumpPage(1)">首页</a>
					<c:if test=""></c:if>
					<c:if test="${page.pageNo > 1}">
						<a href="javascript:jumpPage(${page.pageNo-1})">上一页</a>
					</c:if>
					<div class="pageNum"></div>
					<c:if test="${page.pageNo < page.totalPage}">
						<a href="javascript:jumpPage(${page.pageNo+1})">下一页</a>
					</c:if>
					<a href="javascript:jumpPage(${page.totalPage})">末页</a>
				</div>
   
</div>                

 
<!-- absolute_right start -->
	 <%@ include file="/includes/absolute.jsp" %>
<!-- absolute_right end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->

</body>
</html>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript">
var navIndex=2;  
var indexs=0;
    $(document).ready(function(){
    	
    	$(".u_left_sec:eq(0) li:eq(5)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(3).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".nav_big a").eq(3).children("p").addClass("headwd_color");      

    	$(".right_cha").click(function(){
   		 $(".newye").css("display","none")
   		 window.location.reload(true);		
   	 }) 
   	 $(".diabtn").click(function(){
   		 alert("aa")
   		 $(".newye").css("display","none")
   		 window.location.reload(true);
   	 }) 
   	 
   	 
 	var thispage=${page.pageNo};
	var totalpage=${page.totalPage};
	if(totalpage>1){		
		pagerInit(totalpage,thispage);
	}else{
		$(".next_list").css("display","none")
	} 

});
 
</script>

<script type="text/javascript">
 var myFilter=new Array();

  function jumpPage(pag){
  
	/* $('#pageNo').val(pag); 	    	    
	$("#yearIncome").val(myFilter[0]);
	$("#financingPeriod").val(myFilter[1]);
	$("#financingMoney").val(myFilter[2]);
	$("#financingProgress").val(myFilter[3]);
	$("#projectStatus").val(myFilter[4]);    
	 $("#form" ).submit();  */
 }  
	

window.onload=function(e) {
	
	var thispage=${page.pageNo};
	var totalpage=${page.totalPage};		
		pagerInit(totalpage,thispage);
	//pagerInit(20,3);//${page.totalPage},${page.pageNo}		

   
function pagerInit(a,b){//${page.totalPage},${page.pageNo}
	var totalPages=a;
	var curPage=b;
	if(curPage>totalPages)return false;
	var endPage=curPage+5>totalPages-1?totalPages-1:curPage+5;
	var startPage=endPage-7>2?endPage-7:2;
	endPage=startPage+7>totalPages?totalPages:startPage+7;
	//console.log(startPage+"/"+endPage+"/"+curPage);
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
}                
          
</script>

