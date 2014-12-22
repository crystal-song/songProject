<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
  
<title>交易记录 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  

</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="user_con">
    <div class="user_left">
         <!-- user_left start -->
         <input type="hidden" id="time" value="${time}"></input>
         <input type="hidden" id="type" value="${type}"></input>
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
                        <li class="label_bak"><a href="<%=path%>/transRecord/queryTransRecord?time=timeall&type=all">全部</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time=7&type=all">最近七天</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time=30&type=all">一个月</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time=90&type=all">三个月</a></li>
                        
                      </ul>
                    </li>
                    <li>
                      <ul class="label_sec new_sec">
                        <li class="label_bak"><a href="<%=path%>/transRecord/queryTransRecord?time=all&type=typeall">全部</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time=all&type=充值">充值</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time=all&type=提现">提现</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time=all&type=投资">投资</a></li>
                        <li style="display:none"><a href="<%=path%>/transRecord/queryTransRecord?time=all&type=transferinfo">收到利息</a></li>
                        <li style="display:none"><a href="<%=path%>/transRecord/queryTransRecord?time=all&type=transferinfo">收到本金</a></li>
                        <li style="display:none"><a href="<%=path%>/transRecord/queryTransRecord?time=all&type=transferinfo">还款</a></li>
                        <li style="display:none"><a href="<%=path%>/transRecord/queryTransRecord?time=all&type=transferinfo">融资</a></li>
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
                      </ul>
                      </li>
                      <c:if test="${userinfo.name!=null}">
                       <c:if test="${recordsize==0}">
                 		 <li >
                    		暂无交易记录
                 		 </li>
                 	   </c:if>
                  
                      <c:if test="${ not empty transRecordList}">
                      <c:forEach var="t" items="${transRecordList }">
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
      
           <a href="<%=path %>/transRecord/queryTransRecord?pageNo=1&time=${time}&type=${type}">首页</a> 
				<c:if test="${page.pageNo > 1}"><a href="<%=path %>/transRecord/queryTransRecord?pageNo=${page.pageNo-1}&time=${time}&type=${type}">上一页</a>  </c:if> 
				<div class="pageNum"></div>								 
				<c:if test="${page.pageNo < page.totalPage}">  <a href="<%=path %>/transRecord/queryTransRecord?pageNo=${page.pageNo+1}&time=${time}&type=${type}">下一页</a>  </c:if>  								
		   <a href="<%=path %>/transRecord/queryTransRecord?pageNo=${page.totalPage}&time=${time}&type=${type}">末页</a>                   
        </div>       
      </div>   
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
<script type="text/javascript">
    var navIndex=3;    
    var indexs=2;
    $(document).ready(function(){
    	$(".u_left_sec:eq(2) li:eq(3)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".nav_big a").eq(2).children("p").addClass("headwd_color");
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
                   

    	    	var vale=$("#time").val();
    	    	var type_vale=$("#type").val();   	    	
    	    	if(vale=="timeall"){
    	    		$(".new_fir li:eq(0)").addClass('label_bak').siblings().removeClass('label_bak');
    	    	}
    	    	if(vale==7){
    	    		$(".new_fir li:eq(1)").addClass('label_bak').siblings().removeClass('label_bak');
    	    	}
    	    	if(vale==30){
    	    		$(".new_fir li:eq(2)").addClass('label_bak').siblings().removeClass('label_bak');
    	    	}
    	    	if(vale==90){
    	    		$(".new_fir li:eq(3)").addClass('label_bak').siblings().removeClass('label_bak');
    	    	}
  	    	
    	    	if(type_vale=="typeall"){
    	    		$(".new_sec li:eq(0)").addClass('label_bak').siblings().removeClass('label_bak');
    	    	}
    	    	if(type_vale=="充值"){
    	    		$(".new_sec li:eq(1)").addClass('label_bak').siblings().removeClass('label_bak');
    	    	}
    	    	if(type_vale=="提现"){
    	    		$(".new_sec li:eq(2)").addClass('label_bak').siblings().removeClass('label_bak');
    	    	}
    	    	if(type_vale=="投资"){
    	    		$(".new_sec li:eq(3)").addClass('label_bak').siblings().removeClass('label_bak');
    	    	}
    	    	if(type_vale=="收到利息"){
    	    		$(".new_sec li:eq(4)").addClass('label_bak').siblings().removeClass('label_bak');
    	    	}
    	    	if(type_vale=="收到本金"){
    	    		$(".new_sec li:eq(5)").addClass('label_bak').siblings().removeClass('label_bak');
    	    	}
    	    	if(type_vale=="还款"){
    	    		$(".new_sec li:eq(6)").addClass('label_bak').siblings().removeClass('label_bak');
    	    	}
    	    	if(type_vale=="融资"){
    	    		$(".new_sec li:eq(7)").addClass('label_bak').siblings().removeClass('label_bak');
    	    	}
});

</script>

</html>
