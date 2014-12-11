<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>交易记录 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<%@ include file="/includes/taglibs.jsp" %>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;    
    var indexs=2;
    $(document).ready(function(){
    	$(".u_left_sec:eq(2) li:eq(3)").children("a").css("color","#fc652e");

    	 var url=location.search;
	       //alert(url);
	       var str=url.substr(1);
	       var element=str.split("=");
	       var canshu=element[1];
	      //alert(canshu)
	      /*
	       if(canshu=="seven_all"){
	    	   
	    	   $(".new_fir li:eq(0)").addClass('label_bak').siblings().removeClass('label_bak');
	       }*/
	      
	       
	        if(canshu=="onemonth_all"){
	    	   $(".new_fir li:eq(1)").addClass('label_bak').siblings().removeClass('label_bak');
	       }
	       else if(canshu=="threemonth_all"){
	    	   $(".new_fir li:eq(2)").addClass('label_bak').siblings().removeClass('label_bak');
	       }
	       else if(canshu=="all_all"){
	    	   $(".new_sec li:eq(0)").addClass('label_bak').siblings().removeClass('label_bak');
	    	   $(".new_fir li:eq(3)").addClass('label_bak').siblings().removeClass('label_bak');
	    	  
	    	   $(".label_sec li").click(function(){
    	       if($(this).parent().hasClass("new_sec")){
    	    	   $(".new_sec li:eq(0)").addClass('label_bak').siblings().removeClass('label_bak');
    	       }
    	       else if($(this).parent().hasClass("new_fir")){
    	    	   $(".new_fir li:eq(3)").addClass('label_bak').siblings().removeClass('label_bak');
    	       }    	 
	         });
	    	  
	       }
	       else if(canshu=="recharge_all"){
	    	   $(".new_sec li:eq(1)").addClass('label_bak').siblings().removeClass('label_bak');
	       }
	       else if(canshu=="drawmoney_all"){
	    	   $(".new_sec li:eq(2)").addClass('label_bak').siblings().removeClass('label_bak');
	       }
	       else if(canshu=="transferinfo_all"){
	    	   $(".new_sec li:eq(3)").addClass('label_bak').siblings().removeClass('label_bak');
	       }  	
           
           
/*
                  var a=${time_type}
            	  if(a=='onemonth_all'){            		
            		  $(".new_fir li:eq(1)").addClass('label_bak').siblings().removeClass('label_bak');
            	  } 
            	  if(a=='threemonth_all'){
            		  $(".new_fir li:eq(2)").addClass('label_bak').siblings().removeClass('label_bak');
            	  }
            	  if(a=='all_all'){
            		  $(".new_sec li:eq(0)").addClass('label_bak').siblings().removeClass('label_bak');
       	    	      $(".new_fir li:eq(3)").addClass('label_bak').siblings().removeClass('label_bak');
            	  }
            	  if(a=='recharge_all'){
            		  $(".new_sec li:eq(1)").addClass('label_bak').siblings().removeClass('label_bak');
            	  }
*/
            
    	    $(".u_left_mian").click(function(){
    	          $(this).siblings().slideToggle("slow");
    	        });
});

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
          <div class="pro_con_title" style="margin-top:5px;"><strong>交易记录</strong>
          </div>
               <div class="con_list">
                  <ul class="list_label">
                    <li>
                      <ul class="label_sec new_fir">
                        <li class="label_bak"><a href="<%=path%>/transRecord/queryTransRecord?time_type=seven_all">最近七天</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time_type=onemonth_all">一个月</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time_type=threemonth_all">三个月</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time_type=all_all">全部</a></li>
                      </ul>
                    </li>
                    <li>
                      <ul class="label_sec new_sec">
                        <li class="label_bak"><a href="<%=path%>/transRecord/queryTransRecord?time_type=all_all">全部</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time_type=recharge_all">充值</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time_type=drawmoney_all">提现</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time_type=transferinfo_all">投资</a></li>
                        <li style="display:none">收益</li>
                        <li style="display:none">回收本金</li>
                      </ul>
                    </li>
                    <li><ul class="label_third">
                        <li>订单编号</li>
                        <li>时间</li>
                        <li>交易类型</li>
                        <li>交易详情</li>
                        <li id="bord_right">金额</li>
                      </ul></li>
                      <c:if test="${userinfo.name!=null}">
                       <c:if test="${recordsize==0}">
                 		 <div >
                    		<p>暂无交易记录</p>
                 		 </div>
                 	   </c:if>
                  
                      <c:if test="${ not empty list11}">
                      <c:forEach var="t" items="${list11 }">
                      <ul class="jiaoyi_msg">
                            <li>${t.requestNo}</li>
                            <li>${t.transDate }</li>
                            <li>${t.type}</li>
                            <li>${t.projectName}</li>
                            <li>${t.transAmount }</li>
                            
                      </ul>  
                      </c:forEach>    
                      </c:if>  
                      </c:if>          
                  </ul>
                  
                 
               </div> 
               
            <div class="clear"></div>    
        	<div class="next_list">
      
           <a href="<%=path %>/transRecord/queryTransRecord?pageNo=1&time_type=${time_type}">首页</a> 
				<c:if test="${page.pageNo > 1}"><a href="<%=path %>/transRecord/queryTransRecord?pageNo=${page.pageNo-1}&time_type=${time_type}">上一页</a>  </c:if> 
				<div class="pageNum"></div>								 
				<c:if test="${page.pageNo < page.totalPage}">  <a href="<%=path %>/transRecord/queryTransRecord?pageNo=${page.pageNo+1}&time_type=${time_type}">下一页</a>  </c:if>  								
		   <a href="<%=path %>/transRecord/queryTransRecord?pageNo=${page.totalPage}&time_type=${time_type}">末页</a>                   
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