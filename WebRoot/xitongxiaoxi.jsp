<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%@ include file="/includes/taglibs.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="中租宝，是北京中投汇融投资管理有限公司旗下的众筹网络平台，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>提现 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">  
var indexs=3;
    var navIndex=3;    
    $(document).ready(function(){
        $(".label_sec li").click(function(){
            $(this).addClass('label_bak').siblings().removeClass('label_bak');
       });
         $(".list_up").click(function(){
            $(this).parent().siblings(".msg_hide").slideToggle();
            //alert($(this).text());
            //alert($(this).html());
          
            if($(this).html()=="[展开<i></i>]"){
               $(this).html("[收起<i></i>]");
            }else if($(this).html()=="[收起<i></i>]"){
              $(this).html("[展开<i></i>]");
            }

            var read=$(this).siblings().children("strong");
            //alert(read);
            if(read.text()=="未读"){
              read.text("");

            }
         }); 
         $(".u_left_mian").click(function(){
              $(this).siblings().slideToggle("slow");
            }); 
});
  
    
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
         
         
<div class="user_con">
    <div class="user_left">
      <!-- user_left start -->
           <%@ include file="/includes/user_info_left.jsp" %>
         <!-- user_left end -->
    </div>
          <div class="user_right">  
        <div class="zichan_con01">        
          <div class="pro_con_title" style="margin-top:5px;"><strong>系统消息</strong>
          </div>
               <div class="con_list">
                  <ul class="list_label">
                    <li>
                      <ul class="label_sec">
                        <li class="label_bak">全部</li>
                        <li>未读</li>
                        <li>已读</li>
                      </ul>
                    </li>
                  </ul>
                  <ul class="msg_list">
                    <li>
                        <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                    <li>
                         <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                    <li>
                         <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                    <li>
                         <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide" style="display:none;">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                    <li>
                         <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide" style="display:none;">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                    <li>
                         <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                    <li>
                         <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                    <li>
                         <p class="msg_list_title">【系统消息】恭喜您通过实名认证！
                          <span><strong>未读</strong></span>     
                          <span class="list_up">[展开<i></i>]</span>
                          <span class="list_time">2014.09.14</span>
                        </p>
                        <div class="msg_hide">
                          <p class="xinxi">恭喜你通过了实名认证！</p>
                        </div>
                    </li>
                  </ul>                
               </div>
               
        <div class="next_list">
           <!--  <a href="#" class="a1">首页</a>
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
           <span><input type="submit" class="btn_sub" value="确定"/></span>-->
            <a href="javascript:jumpPage(1)">首页</a> 
								 
								<c:if test=""></c:if>
								 
								 <c:if test="${page.pageNo > 1}"><a href="javascript:jumpPage(${page.pageNo-1})">上一页</a>  </c:if> 
								 <div class="pageNum"></div>
								 
								   <c:if test="${page.pageNo < page.totalPage}">  <a href="javascript:jumpPage(${page.pageNo+1})">下一页</a>  </c:if>  
								
								<a href="javascript:jumpPage(${page.totalPage})">末页</a> 
        </div>        
      </div>
   </div> 
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>