<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
  
<title>交易记录 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script>
var navIndex=3; 
var indexs=0;
$(function(){
	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
	$(".u_left_sec:first li:eq(3)").children("a").css("color","#fc652e");
	$(".zichan_con .tui_li li span:odd").css("text-align","left");
})
  

</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="user_con">
    <div class="user_left">
         <!-- user_left start -->
           <%@ include file="/includes/user_info_left.jsp" %>
         <!-- user_left end -->
    </div>
    <div class="user_right">  
        <div class="zichan_con">        
          <div class="pro_con_title" style="margin-top:5px;"><strong>我的礼券</strong></div>
          <div class="quan_label">
            <div class="quan_red">可用礼券</div>
            <div>已用礼券</div>
            <div>过期礼券</div>
          </div> 
          <table  bgcolor="#eee" border="0" cellpadding="0" cellspacing="1" class="quan_tab">
				  <tr>
				    <td bgcolor="#FFFFFF">礼券名称</td>
				    <td bgcolor="#FFFFFF">礼券状态</td>
				    <td bgcolor="#FFFFFF">礼券类型</td>
				    <td bgcolor="#FFFFFF">获得用途</td>
				    <td bgcolor="#FFFFFF">获得时间</td>
				    <td bgcolor="#FFFFFF">过期时间</td>
				  </tr>
				  <tr>
				    <td bgcolor="#FFFFFF">&nbsp;</td>
				    <td bgcolor="#FFFFFF">&nbsp;</td>
				    <td bgcolor="#FFFFFF">&nbsp;</td>
				    <td bgcolor="#FFFFFF">&nbsp;</td>
				    <td bgcolor="#FFFFFF">&nbsp;</td>
				    <td bgcolor="#FFFFFF">&nbsp;</td>
				  </tr>
				  <tr>
				    <td bgcolor="#FFFFFF">&nbsp;</td>
				    <td bgcolor="#FFFFFF">&nbsp;</td>
				    <td bgcolor="#FFFFFF">&nbsp;</td>
				    <td bgcolor="#FFFFFF">&nbsp;</td>
				    <td bgcolor="#FFFFFF">&nbsp;</td>
				    <td bgcolor="#FFFFFF">&nbsp;</td>
				  </tr>
				</table>                                                
            <div class="clear"></div>    
        	<div class="next_list">     
              <a href="<%=path %>/transRecord/queryTransRecord?pageNo=1&time=${time}&type=${type}">首页</a> 
				<c:if test="${page.pageNo > 1}"><a href="<%=path %>/transRecord/queryTransRecord?pageNo=${page.pageNo-1}&time=${time}&type=${type}">上一页</a>  </c:if> 
				  <div class="pageNum"></div>								 
				<c:if test="${page.pageNo < page.totalPage}">  <a href="<%=path %>/transRecord/queryTransRecord?pageNo=${page.pageNo+1}&time=${time}&type=${type}">下一页</a>  </c:if>  								
		      <a href="<%=path %>/transRecord/queryTransRecord?pageNo=${page.totalPage}&time=${time}&type=${type}">末页</a>                   
           </div>       
      </div>   
    </div>
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
<script type="text/javascript">
var navIndex=3;    
var indexs=1;
    $(document).ready(function(){
    	$(".u_left_sec:eq(1) li:eq(3)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".nav_big a").eq(2).children("p").addClass("headwd_color");
	
    	 
});

</script>
<script>
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
</html>
