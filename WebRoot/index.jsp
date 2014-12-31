<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %> 

<title>中租宝</title>
<link href="<%=path%>/css/style-2014-11.css?v=1" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  

</head>
<body>

<!-- top start  -->

<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>

<!-- banner start -->
<%@ include file="/includes/banner.jsp" %>
<!-- banner end  -->


<div class="content">
  <div class="title">
       <div class="label"><strong>热门项目</strong></div>
  </div>
    <div class="shuju">
       <div class="new_production">
         <a class="images_pro" href="product/getProductByid?id=56"><img width="100%" height="100%" src="<%=path%>/img/images-2014-11/shengxian03.jpg"></a>
         <div class="meier_wd">                
           <h3><a href="product/getProductByid?id=56" style="color:#ff453e">百家社区生鲜便利连锁店01期</a></h3>       	
           <ul class="mei_msg">
            <li><span>融资金额</span><span class="wd_size"><strong>5,000,000</strong></span></li>
            <li><span>年化收益</span><span class="wd_size"><strong class="wd_size_col">14%</strong></span></li>
            <li><span>项目状况</span><span class="wd_size" style="font-size:12px;">融资中..</span></li>
            <li><span>信用等级</span><span class="wd_size new_span"><img  src="<%=path%>/img/images-2014-11/star_5.png"></span></li>
            <li><a href="product/getProductByid?id=56" class="touzi_mei">我要投</a></li>
           </ul>
         </div>
       </div>
       <div class="newpro_right">
         <dl>
           <dt><strong>企业定位</strong></dt>
           <dd><a class="newpro_wd01"></a>
           <span class="spanhign_right">
	           <a>灵活投资，低门槛 </a> 
	           <a style="font-size:12px;"><label style="color:red">200元起投</label>，操作灵活便捷</a>
           </span>         
           </dd>           
           <dd> 
              <a class="newpro_wd02"></a> 
              <span class="spanhign_right">
               <a>五层保障</a> 
	           <a style="font-size:12px;"><label style="color:red">200元起投</label>，操作灵活便捷</a>
              </span>
           </dd>
           <dd><a class="newpro_wd03"></a>
             <span class="spanhign_right">
               <a>高收益率 </a> 
	           <a style="font-size:12px; line-height:12px;">平均年化收益率<label style="color:red">12%</label>，最高<label style="color:red">14%</label>， 高于银行活期<label style="color:red">30倍</label>以上收益率</a>
             </span></dd>
           <dd><a class="newpro_wd04"></a><span class="spanhign_right">
           <a>专注P2B</a>  
           <a style="font-size:12px;">精选优质企业，远超P2P安全保障。</a>          
           </span></dd>
       </dl>
       </div>    
    </div> 
    <div class="clear"></div>
  

     <div class="title">
       <div class="label"><strong>推荐项目</strong></div>
       <a class="more" href="<%=path%>/product/allProduct">更多&nbsp;&nbsp;>></a>
     </div> 
     <div class="main">
       <ul>
        
	   <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">   
         <li>
              <div class="floor_num">
                 <a class="floor_img" href="product/getProductByid?id=${s.id}">
                 ${s.projectPicture}
                 <div class="hot"></div>
                 <!-- <div class="last_time">剩余时间:<strong>&nbsp;&nbsp;28</strong>天</div> -->
                 <div class="last_time">年化收益率:<strong>&nbsp;&nbsp;${s.yearIncome}%</strong></div>
                 </a>
                 <h3><a class="shuoming" href="product/getProductByid?id=${s.id}" title="${s.projectName}">${s.projectName}</a></h3>
                 <div class="aim">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span><%-- ${s.financingPeriod}个月 --%>30天</span>
                   <span style="width:110px;"><em>¥&nbsp;</em>${s.financingMoney}万元</span>
                   <a>${s.projectStatus==1?'预热中':s.projectStatus==2?'融资中':s.projectStatus==3?'还款中':'已完成' }</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b" style="width:<c:if test='${empty s.financingProgress}'>1</c:if><c:if test='${not empty s.financingProgress}'>${s.financingProgress<100?s.financingProgress==null?0:s.financingProgress:100}</c:if>%" title="融资进度：${s.financingProgress}%"></div>
                 </div>
                 <div class="floor_bottom">
                   <c:if test="${s.projectStatus!=1 }">
                   <span style="float:left; margin-left:3%;"><a style="float:left; color:#a4a4a4;">已达</a><a class="baifenbi" style="float:left; text-align:left;"><c:if test='${empty s.financingProgress}'>0</c:if>${s.financingProgress}%</a>
                   </span>
                   </c:if>
                   <c:if test="${s.projectStatus==1 }">
                   <span style="float:left; margin-left:3%;"><a style="float:left; color:#a4a4a4;">融资时间</a><a class="baifenbi" style="float:left; text-align:left;">${s.financeTime }</a>
                   </span>
                   </c:if>
                   <span style="display:none"  ><a style="color:#a4a4a4; float:left; ">已筹资</a><a class="baifenbi" style="float:left; text-align:left;">¥&nbsp;&nbsp;<c:if test='${empty s.realityMoney}'>0</c:if> ${s.realityMoney}</a>
                   </span>
                   <span style="float:right; margin-right:3%;"><a style="float:right; color:#a4a4a4;" >年化收益率</a><a class="baifenbi" style="float:right; text-align:right;">${s.yearIncome}%</a>
                  </span>
                 </div>
                 <div class="botm_btn">
                  <c:if test="${s.projectStatus==2 }">
                  <a href="product/getProductByid?id=${s.id}">我要投</a>
                  </c:if>
                  <a href="product/getProductByid?id=${s.id}" class="btn_org">了解详情</a>
                 </div>
              </div>
            </li>
      
        
	 <!-- 
			<div class="clear_height"></div>
            <div class="ind_list">
            
            	<%-- <div class="xq_left"><a href="product/getProductByid?id=${s.id}" title="${s.projectName}"><img src="<%=path%>/images/sy_63.jpg" /></a></div> --%>
            	<div class="xq_left"><a href="product/getProductByid?id=${s.id}">${s.projectPicture}</a></div>
                <div class="ind_right">
                	<div class="tuijian">
                    	<div class="tj_left">推荐项目:<span class="hong"><a href="product/getProductByid?id=${s.id}" title="${s.projectName}">${s.projectName}</a></span></div>
                        <div class="tj_right">
                        	<div class="tj_jd">融资进度：<c:if test='${empty s.financingProgress}'>0</c:if>${s.financingProgress}%</div>
                             <div class="tj_jd_pic"><div class="progress_80"><div class="progress_bar" style="width:<c:if test='${empty s.financingProgress}'>0</c:if><c:if test='${not empty s.financingProgress}'>${s.financingProgress<100?s.financingProgress==null?0:s.financingProgress:100}</c:if>%" title="融资进度：${s.financingProgress}%"></div></div></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="xq_table">
                    <a href="product/getProductByid?id=${s.id}" title="${s.projectName}">
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
                        </a>
                    </div>
                </div>
                
            </div>
            -->
          
            </c:forEach>
        </c:if>
       
     </ul>
   </div>
   <div class="title">
       <div class="label"><strong>最新动态</strong></div>
     </div>
   <div class="news">
    
   <div class="w_gonggao">
	      <ul class="news_title">
	        <li class="news_title_bac"><a id="new_bac" class="new_title01">网站公告</a><a class="new_logo1" href="<%=path%>/guarantee/getchannel">更多 >></a></li>       
	       </ul>
	      <div class="news_label">
		      <ul class="news_con">
		        <c:if test="${ not empty list2}">
			        <c:forEach var="s" items="${list2}" varStatus="i">
			            <li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
			        </c:forEach>
				</c:if>
		      </ul>      
	      </div>
     </div> 
     <div class="w_gonggao">
	      <ul class="news_title">
	        <li class="news_title_bac"><a id="new_bac" class="new_title02">还款公告</a><a class="new_logo1" href="<%=path%>/guarantee/getchannel">更多 >></a></li>       
	       </ul>
	      <div class="news_label">
		      <ul class="news_con">
		        <c:if test="${ not empty list3}">
                    <c:forEach var="s" items="${list3}" varStatus="i">
                    	<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
                    </c:forEach>
				</c:if>
		      </ul>      
	      </div>
     </div> 
     <div class="w_gonggao" style="margin-right:0">
	      <ul class="news_title">
	        <li class="news_title_bac"><a id="new_bac" class="new_title03">媒体报道 </a><a class="new_logo1" href="<%=path%>/guarantee/getchannel">更多 >></a></li>       
	       </ul>
	      <div class="news_label">
		      <ul class="news_con">
		        <c:if test="${ not empty list1}">
                   <c:forEach var="s" items="${list1}" varStatus="i">
                    	<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
                   </c:forEach>
				</c:if>
		      </ul>  
	      </div>
     </div> 
    </div> 
    <!-- absolute_right start -->
	 <%@ include file="/includes/absolute.jsp" %>
	<!-- absolute_right end -->
     
 </div>                  
  
<!-- links end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
<script type="text/javascript">
var navIndex=0;

	// if(var navIndex!=null&&navIndex!=-1)$(".nav_big li").eq(0).addClass("bd_btom");
	
/*
    $(".header li").mouseover(function(){ 
      var index=$(this).index();
      $('.top div').eq(index).show();

    $(this).addClass('head_red').siblings().removeClass('head_red');     
    }).mouseout(function(){
       var index=$(this).index();
       $('.top div').eq(index).hide();
    });

    $(".top div").mouseover(function(){ 
      var index=$(this).index();
      $(this).show();
     
    }).mouseout(function(){
       var index=$(this).index();
       $(this).hide();
    });

*/

$(document).ready(function(){
	$(".nav_big a").eq(0).addClass("bd_btom").siblings().removeClass("bd_btom");
	$(".nav_big a").eq(0).children("p").addClass("headwd_color")
		
	$(".news_title li").click(function(){
		        var index= $(this).index();
		        $(this).addClass('news_title_bac').siblings().removeClass('news_title_bac');
		        $(".news_label ul").eq(index).css("display","block").siblings().css("display","none")
		    });
		    		            
	});
</script>
</html>
