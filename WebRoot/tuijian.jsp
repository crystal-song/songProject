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
          <div class="pro_con_title" style="margin-top:5px;"><strong>推荐管理</strong></div>
            
               <ul class="tui_li">
                  <li><span>用户名：</span><span>aaa</span></li>      
                  <li><span>我的推荐人：</span><span>bbb</span></li>
                  <li><span>我的推广链接：</span><span>www.pppp.com</span></li>
                  <li>
                     <span style="padding-left:18px;">我的推广内容：</span>
                     <span style="width:168px"><div class="bshare-custom"><a title="分享到微信" class="bshare-weixin"></a><a title="分享到QQ空间" class="bshare-qzone"></a><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span class="BSHARE_COUNT bshare-share-count">0</span></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script> </span>
                  </li>    
               </ul>                            
               <div class="tui_pic">
                  <div class="tui_left"></div>
                  <textarea class="tui_right" value="理财生活两手抓，中租宝帮您发发发" name="MSG" cols=33 rows=4></textarea>               
               </div>
               <p class="tui_num">我推荐的 1/3</p> 
               
				<table border="0" cellpadding="0" cellspacing="1" bgcolor="#ccc" class="tui_tab">
					  <tr>
					    <td bgcolor="#FFFFFF">用户名&nbsp;&nbsp;</td>
					    <td bgcolor="#FFFFFF">注册时间</td>
					  </tr>
					  <tr>
					    <td bgcolor="#FFFFFF">&nbsp;11111</td>
					    <td bgcolor="#FFFFFF">&nbsp;22</td>
					  </tr>
					  <tr>
					    <td bgcolor="#FFFFFF">&nbsp;33333333</td>
					    <td bgcolor="#FFFFFF">&nbsp;</td>
					  </tr>
					  <tr>
					    <td bgcolor="#FFFFFF">&nbsp;55</td>
					    <td bgcolor="#FFFFFF">&nbsp;6</td>
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

    $(document).ready(function(){

	
    	 
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
</html>
