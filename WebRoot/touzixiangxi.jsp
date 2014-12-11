<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<Link href="/favicon.ico" rel="Shortcut Icon">
<title>项目：${product1.projectName} - 我要投资 - 中租宝</title>

<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
 <%@ include file="/includes/taglibs.jsp" %> 
<script type="text/javascript" src="<%=path%>/js/jquery-1.8.2.js"></script>

<link href="<%=path%>/css/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
 
 <script type="text/javascript" src="<%=path%>/js/jquery-1.8.2.js"></script>
 <script type="text/javascript" src="<%=path%>/js/jquery-ui.js"></script>
 <script type="text/javascript" src="<%=path%>/js/jquery-ui.min.js"></script>
 <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
 

<script type="text/javascript">

window.onload=function(){

    var myblur= document.getElementById('buyAmount');    
       myblur.onfocus=function(){
         if(myblur.value=="投资金额不低于200元"){        	
           myblur.value="";
           myblur.style.color="#000";
           }     
   }      
     myblur.onblur=function(){      
      if(myblur.value==""){
        myblur.value="200";
        myblur.style.color="#ccc" ;  
    }
      document.getElementById("preview_amount").value=myblur.value;
  }  
}

/*提交表单*/

function mysubmit(){
	if($("#buyAmount").val()==0||$("#buyAmount").val()=="投资金额不低于200元"){
		alert("投资金额不能为空！");
		return false;
		}
	//if($("#buyAmount").val()%100!=0){alert("投资金额必须为100的整数倍！");return false;}
	/*
	if($("#buyAmount").val()<200){
		alert("投资金额不能低于200元！");
		return false;
	}*/
	var form = document.getElementById("form");
	    form.submit();	
}	


 $(document).ready(function(e) { 
	 //---------收益计算器------------
	//console.log("-------go-------");
	    var rate_lv=$(".lev_start").length;
		calc();
		$("#preview_amount").change(function(e) {
			if($(this).val()<parseInt($(".lev_start").eq(0).html())){
				$(this).val(parseInt($(".lev_start").eq(0).html()));
				}
			if($(this).val()>parseInt($(".lev_max").eq(rate_lv-1).html())){
				$(this).val(parseInt($(".lev_max").eq(rate_lv-1).html()));
				}
	        calc();
	        
	    });
		function calc(){
			//console.log("-------calc-------");
			var t=parseInt($("#preview_amount").val());
			var r=0;
			if(t%100!=0){alert("投资金额必须为100的整数倍！");return false;}
			for(i=0;i<rate_lv;i++){
				if(t>=parseInt($(".lev_start").eq(i).html())&&t<=parseInt($(".lev_max").eq(i).html())){
					if(parseInt($(".lev_mi").eq(i).html())>0){
					r=parseFloat($(".lev_rate").eq(i).html())+parseFloat($(".lev_ri").eq(i).html())*parseInt((t-parseInt($(".lev_start").eq(i).html()))/parseInt($(".lev_mi").eq(i).html()));
					
					}else{
						r=parseFloat($(".lev_rate").eq(i).html());
						}
					r=r/100;
					//console.log("-lv:"+i+"-m:"+t+"-r:"+r+"--");
					}
				}
			$("#preview_rate").val(parseFloat(parseInt(r*10000)/100)+"%");	
			$("#preview_income").html(parseFloat(parseInt(t*r*100)/100)+"元");
			//console.log("|-"+t*r);
			}
		$(".jisuan_btn_left").click(function(){
			  $("#preview_amount").val(200);
			  $("#preview_income").html(0+"元");
			  
			   
		  });
		
		
		//---------收益计算器结束-------------

	 $("#buyAmount").keyup(function(){
		  
		    var str= /^[0-9]*$/;
		    var val=$("#buyAmount").val();
		    if(!(str.test(val))){  	   
				   $('.neirong').html("您输入的金额不是数字,请重新输入");
				   return false;
			    }
		    $('.neirong').css('display','block');
	
		    if(!(str.test(val))){  	   
				   $('.neirong').html("您输入的金额不是数字,请重新输入");
				   return false;
			    }
			    if(val<200){
				   $('.neirong').html("您输入的金额小于200元,请重新输入");
				   return false;
			    }
			    if(val>5000000){
					   $('.neirong').html("您输入的金额大于五百万元,请重新输入");
					   return false;
				    }
			    if(parseInt(val)%100!=0){	
				  $('.neirong').html("输入的资金必须是100的整数倍");
				  return false;
				   }
			      $('.neirong').html('您要投入的实际金额为:'+val);	   
	 
	 });	
 
	 $(".nav_big a").eq(1).addClass("bd_btom").siblings().removeClass("bd_btom");
	 $(".nav_big a").eq(1).children("p").addClass("headwd_color");
       $(window).on('scroll', function(){
               checkText();
              // alert($(this).scrollTop())
       });

       var nav_height=parseInt($('.small_nav').offset().top);
     
       function checkText(){
           var top = parseInt($(this).scrollTop());
           if(top>nav_height){
              $(".small_nav").addClass("text");
           }else if($(".small_nav").hasClass('text')&&(top!=nav_height)){
              $(".small_nav").removeClass("text");
           }
       }

      $(".small_nav li").click(function(){
           var i=$(this).index();
           var top = parseInt($(this).scrollTop());
           var title_top=parseInt($('.pro_con_title').eq(i).offset().top);
           var small_height=$(".small_nav").height();
           $(".small_nav").addClass("text");
           $(this).addClass('sm_nav_fir').siblings().removeClass('sm_nav_fir');
           $(window).scrollTop(title_top-small_height-50);
      });
      
      var timer=null;
      var num=1;
      timer=setInterval(autoplay,3000);
      function autoplay(nn){
        if(nn!=null)num=nn+num;
        if(num>22){num=0}
        if(num<0){num=22}
        $('.ziliao_pic li').eq(num).hide().fadeIn().siblings().hide();          
        num++; 
        }
 
      $(".ban_right").click(function(){
        autoplay(0);
        clearInterval(timer);
           timer=setInterval(autoplay,3000);
        });
      $(".ban_left").click(function(){

        var index=$('.ziliao_pic li').index();
        autoplay(-2);
        clearInterval(timer);
           timer=setInterval(autoplay,3000);
        });
 	$(".syl_table").hover(function(){
 		$(this).css("height","auto");
 	},function(){
 		$(this).css("height","60px");
 	});
 	
 	 $(".jisuan").click(function(){
 		 $("#dialog01").css("display","block");
 		 
 		 
 	 });
 	$(".right_cha").click(function(){
 		$("#dialog01").css("display","none");
 	});
 	
 });  
 
    
</script>
</head>

<body>

<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<!-- 
<div class="clear"></div>
<div class="one"></div>
<div class="clear"></div>

<div class="xx">
	<div class="xx_fra">
	    <div class="lactation">当前位置：<a href="<%=path%>/" >首页</a> >> <a href="<%=path%>/product/allProduct" >我要投资</a> >> 项目详情</div>
    		<div class="clear_height"></div>
    	<div class="xx_left">
    		
        	<div class="xx_one">
            	<div class="xxo_bor">
                	<div class="xxo_left">${product1.projectPicture}</div>
                    <div class="xxo_right">
                    	<div class="xxo_one">                  	   
                        	<div class="xxo_font">项目名称：<span class="ckxq_red">${product1.projectName}</span></div>
                            <div class="xxo_font">企业编号：${product1.enterpriseNumber}</div>
                            <div class="xxo_font">信用等级：<img src="<%=path%>/images/qualityRate_${product1.qualityRating}.jpg" style="margin-bottom:-3px;"><span style="padding-left:120px;">融资金额:<span class="cu hong">${product1.financingMoney}万</span><br></span></div>
                        </div>
                         <div class="xx_font">年化收益：<span class="ckxq_red1">${product1.yearIncome}%</span>&nbsp;&nbsp; 还款日期:<span class="ckxq_red1">${product1.repaymentTime}</span>&nbsp;&nbsp;还款方式：<span class="zi14">${product1.repaymentWay}</span></div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="tzxx">
                <div class="xxo_font">年化预期收益率：</div>
                <table width="100%"  bgcolor="#dedede" align="center" cellspacing="1" cellpadding="0" border="0" class="syl_table">
                 <tr>
                 <td bgcolor="#fff" align="center"><b>阶段起点金额</b></td>
                 <td bgcolor="#fff" align="center"><b>起始利率</b></td>
                 <td bgcolor="#fff" align="center"><b>投资增幅</b></td>
                 <td bgcolor="#fff" align="center"><b>利率增幅</b></td>
                 <td bgcolor="#fff" align="center"><b>阶段上限金额</b></td>
                 </tr>
                 
 	<c:if test="${ not empty li}">
        <c:forEach var="s" items="${li}" varStatus="i">
        <tr>
        <td bgcolor="#fff" align="center"><span>${s.startMoney}</span></td>
        <td bgcolor="#fff" align="center"><span>${s.startInterestRate}</span></td>
         <td bgcolor="#fff" align="center"><span>${s.moneyIncrease}</span></td>
       	<td bgcolor="#fff" align="center"><span>${s.interestRateIncrease}</span></td>
        <td bgcolor="#fff" align="center"><span>${s.highestMoney}</span></td>
        </tr>
         </c:forEach>
			</c:if> 
			</table>
			<div class="clear_height" style="height:20px;"></div>
                 <div class="tzxx_left">
                    	担保机构:<span class="cu">${product1.guaranteeInstitution}</span><br>
			100%本息保障<br>
			距离企业还款结项还有300天<br> 
			企业生产经营正常，还款正常
                    </div>
                    <div class="tzxx_right">

                    </div> 
                </div>
                
            </div>
		            <div class="clear_height"></div>
		            <div class="wenzi">
		                <div class="con_nav">
		                 <ul>
		                   <li class="nav_first" style="border-left:0"><strong><a>项目描述</a></strong></li> 
		                   <li><a>担保机构</a></li>
		                   <li><a>资金运转</a></li>
		                   <li><a>风险控制</a></li>
		                   <li><a>企业背景</a></li>
		                   <li><a>企业信息</a></li>
		  
		                   <li class="shu"><a>投资详情</a></li>
		                   <li class="zheng"><a>相关证件</a></li>
		                 </ul>
		                </div>
		            	<div class="wz_one">项目描述</div>
		                <div class="wz_nr">${product1.projectIntroduce}</div>
		                <div class="wz_one">担保机构简介及担保意见</div>
		                <div class="wz_nr"><span class="cu">担保机构简介：</span>${product1.guaranteeInstitutionIntroduce}<br>
		&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">担保机构意见：</span>${product1.collateralOpinion}</div>
						<div class="wz_one">资金运转</div>
		                <div class="wz_nr"><span class="cu">资金用途：</span>${product1.fundUse}<br>
		&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">还款来源：</span>${product1.repaymentSource}</div>
						<div class="wz_one">风险控制措施</div>
		                <div class="wz_nr"><span class="cu">担保机构：</span>${product1.guaranteeInstitution}<br>
		&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">抵押物信息：</span><br>
		&nbsp;&nbsp;&nbsp;&nbsp;${product1.guarantee}<br>
		&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">风险控制措施：</span><br>
		&nbsp;&nbsp;&nbsp;&nbsp;${product1.riskControl}<br>
		</div>
						<div class="wz_one">企业背景</div>
		                <div class="wz_nr">${product1.companyProfile}<br>
		</div>
		                <div class="wz_one">企业信息</div>
		                <div class="wz_nr"><span class="cu">营业范围：</span>${product1.businessScope}<br>
		&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">经营状况：</span>&nbsp;&nbsp;${product1.stateOfOperation}<br>
		</div>
           <div class="wz_one" ><a>投资详情</a></div>
                    <div class="wz_nr" >
                    <div class="table_xiangqing" style="height:auto;">
                    <table width="100%"  bgcolor="#dedede" align="center" cellspacing="1" cellpadding="0" border="0">
                              <tr>
                                <td height="30" bgcolor="#990000" align="center" width="30%">
                                    <strong>
                                    <span style="font-family:'Microsoft YaHei'; color:#FFF;font-size:12px;" >投资人</span>
                                    </strong>
                                </td>
                                <td bgcolor="#990000" align="center" width="40%">
                                    <strong>
                                    <span style="font-family:'Microsoft YaHei'; color:#FFF; font-size:12px;">投资人身份证</span>
                                    </strong>
                                </td>
                                <td bgcolor="#990000" align="center" width="30%">
                                    <strong>
                                    <span style="font-family:'Microsoft YaHei'; color:#FFF; font-size:12px;">投资金额</span>
                                    </strong>
                                </td>
                              </tr>
                              </table>
                       </div>             
                       <div class="table_xiangqing">
                            <table width="100%"  bgcolor="#dedede" align="center" cellspacing="1" cellpadding="0" border="0">
                              
                              <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
                              <tr>
                                <td height="30" bgcolor="#FFFFFF" align="center" width="30%"> fn:substring(s.investor,0,1)s.investor -->
                              <!--   	<span >${fn:substring(s.investor,0,1)}<c:if test="${fn:length(s.investor)>2}">*</c:if>*</span>
                                </td>
                                <td bgcolor="#FFFFFF" align="center" width="40%">
                                	<span ><c:if test="${fn:length(s.identityCard)==18}">
											${fn:substring(s.identityCard,0,7)}********${fn:substring(s.identityCard,15,18)}
											</c:if>
											<c:if test="${fn:length(s.identityCard)!=18}">-</c:if>
											</span>
                                </td>
                                <td bgcolor="#FFFFFF" align="center" width="30%">
                                	<span >${s.investmentAmount}万元</span>
                                </td>
                              </tr>                            
                                </c:forEach>
        </c:if>
        </table>           
                    </div>
                    </div>
            <div  class="wz_one" ><a>相关证件</a></div>
                    <div class="wz_nr" ><br> -->

        <!-- &nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">他项权证：</span><br> --><!--  ${product1.enterpriseCertificate}-->
                   <%--  <img src="<%=path%>/images/20140708132140144014.jpg" width="581" height="800" />
                    <img src="<%=path%>/images/20140708132035433543.jpg" width="720" height="523" />
                    <img src="<%=path%>/images/20140708132013601360.jpg" width="720" height="989" />   --%>
                   
<!-- 
                   
                    </div>
                   
           <div class="btn_bottom"></div>
            </div>
        </div>
        <div class="xx_right">
 -->
        <!-- xx right -->
<!--          
          <div class="cr_bg" style="height:auto;" >
            	<div class="cr_tit">
                	<div class="cr_font">投资份额</div>
                    <div class="cr_more"><img src="<%=path%>/images/sy_50.jpg"></div>
                </div>
                <div class="cr_nr" id="touzi_fir">
                <p align="left" style="font-size:14px;">融资进度：<span class="cu hong" id="zijine">${product1.financingProgress}<c:if test='${empty product1.financingProgress}'>0</c:if>%</span><br>
<div class="progress_160"><div class="progress_bar" style="width:<c:if test='${not empty product1.financingProgress}'>${product1.financingProgress<100?product1.financingProgress:100}</c:if><c:if test='${empty product1.financingProgress}'>0</c:if>%"></div></div>
</p>
                <form id="form" role="form" action="<%=path%>/gate/transfer" method="post" target="_blank" style="padding:0px;">
                	<div class="fen"><span>可投资金额</span><strong><span class="fen_red">${product1.financingMoney-product1.realityMoney}</span></strong><i>元</i></div>              	
                	<div class="neirong" style="display:none"></div>
                	<div class="jin_input"><input type="text" class="jin_text" value="" id="buyAmount" name="buyAmount"></input>元</div>
                	<div class="jin_"><input type="hidden" class="jin_text" value="${product1.enterpriseNumber}" id="enterpriseNumber" name="enterpriseNumber"></input></div>
                	<div class="jin_"><input type="hidden" class="jin_text" value="${product1.projectName}" id="projectName" name="projectName"></input></div>
                	<div class="jin_"><input type="hidden" class="jin_text" value="${product1.financingMoney}" id="financingMoney" name="financingMoney"></input></div>
                	<div class="jin_input"><a id="touzi_dialog" href="javascript:;" onclick="mysubmit();" ><strong>立即投资</strong></a><a class="jisuan" style="display:none"></a></div>
                	</form>
                </div>
               <div class="clear" style="height:20px;"></div>
            </div>
            <div class="clear_height"></div>
 -->            
		
    	<!-- xx right end-->
    	<!-- 
    	</div>
    	<div class="clear"></div>
    </div>
</div>
 -->

<div class="tou_con">
    <div class="con_left">
      <!-- con_left -->
      <%@ include file="/includes/news_list_right.jsp" %>
      <!-- con_left end-->
      <div class="guanggao"></div>
   </div>
   
   <div class="con_right01">
    <p class="bianhao">
     <span class="con_pic01"><strong>项目：${product1.projectName}</strong></span>

     <span class="bianhao_right">企业编号：${product1.enterpriseNumber}  </span>
    </p>
     <div class="pro_msg">
       <div class="pro_pic">${product1.projectPicture}</div>
       <div class="pro_con01" style="display:none;">
       
       
       </div>
       <div class="pro_con">
       <ul>
         <li class="pro_title">还款方式：按月付息、到期还款</li>
         <li style="padding-left:15px;">投资周期：${product1.financingPeriod*30}天</li>
         <li><span style="margin-right:0">信用等级：</span>
           <span style="margin-left:0"><img src="<%=path%>/img/images-2014-11/star_${product1.qualityRating}.png" style="margin-bottom:-3px;"></span>
           <span class="pro_r">
             <a class="pro_bac_logo01" href="http://www.sina.com.cn/"></a>
             <a class="pro_bac_logo02" href="http://www.qq.com"></a>
             <a class="pro_bac_logo03" href="http://t.qq.com"></a>
           </span>
           </li>
           <li><span style="width:90px;">融资金额</span><span style="width:90px;">年化收益</span><span style="width:90px;">还款日期</span></li>
           <li class="bac_red_wd">
              <span style="width:90px;"><strong><i>￥</i>${product1.financingMoney}万元</strong></span>
              <span style="width:90px;"><strong>${product1.yearIncome}%</strong></span>
              <span style="width:90px;"><strong>${product1.repaymentTime}</strong></span>
           </li>
           <li>
             <span>融资进度：</span>
             <div class="load_bar">
               <div style="width:<c:if test='${not empty product1.financingProgress}'>${product1.financingProgress<100?product1.financingProgress:100}</c:if><c:if test='${empty product1.financingProgress}'>0</c:if>%"></div>
             </div>
             <span><c:if test='${not empty product1.financingProgress}'>${product1.financingProgress<100?product1.financingProgress:100}</c:if><c:if test='${empty product1.financingProgress}'>0</c:if>%</span>
           </li>
           <li class="pro_msg_bot" style="display:none">
             <div class="gray_bar1"><span>剩余天数</span><span>28</span></div>
             <div class="gray_bar1"><span>参投人数</span><span>20</span></div>
             <div>百分百本息保障,企业生产经营正常,还款正常</div>
           </li>
        </ul>
        
       </div>
       <div class="pro_gress" style="display:none">
       <ul>
          <li>
             <span>融资进度</span>
             <div class="load_bar">
               <div style="width:<c:if test='${not empty product1.financingProgress}'>${product1.financingProgress<100?product1.financingProgress:100}</c:if><c:if test='${empty product1.financingProgress}'>0</c:if>%"></div>
             </div>
             <span>80%</span>
           </li>
           <li class="pro_msg_bot">
             <div class="gray_bar1"><span>剩余天数</span><span>28</span></div>
             <div class="gray_bar1"><span>参投人数</span><span>20</span></div>
             <div>百分百本息保障,企业生产经营正常,还款正常</div>
           </li>
       </ul>
       </div>
       <c:if test="${ empty product1.buyType}"><!-- 线下 -->
       <div class="pro_right">
         <span class="pro_right_title"><strong>投资金额</strong></span>
         <span>可投资金额：${product1.financingMoney-product1.realityMoney}万元
         </span>
         <div class="neirong"></div>         
         <span><a class="red_touzi"  id="dialog-link" href="<%=path%>/xianxia.jsp">立即投资</a></span>
         <span class="pro_right_label">200元起投<i class="label_min"></i></span>
       </div>
       </c:if>
       <c:if test="${ not empty product1.buyType}"><!-- 线上 -->
       <form id="form" role="form" action="<%=path%>/gate/transfer" method="post" target="_blank" style="padding:0px;">
       <div class="pro_right">
         <span class="pro_right_title"><strong>投资金额</strong></span>
         <span>可投资金额： ${product1.financingMoney*10000-product1.realityMoney}元
         </span>
         <div class="neirong"></div>
         <span><input type="number" class="text01" value="200" id="buyAmount"  name="buyAmount" min="200"/></span>
         <div class="jin_"><input type="hidden"  value="${product1.enterpriseNumber}" id="enterpriseNumber" name="enterpriseNumber"></input></div>
                	<div class="jin_"><input type="hidden"  value="${product1.projectName}" id="projectName" name="projectName"></input></div>
                	<div class="jin_"><input type="hidden"  value="${product1.financingMoney}" id="financingMoney" name="financingMoney"></input></div>
         
         <span><a class="red_touzi"  id="dialog-link" href="javascript:;" onclick="mysubmit();" >立即投资</a><i class="jisuan"></i></span>
         <span class="pro_right_label">200元起投<i class="label_min"></i></span>
       </div>
       </form>
       </c:if>
      </div>   
 <!--弹出窗口 -->   
 
       <div id="dialog" title="投资金额确认" style="display:none">
        <p class="zijin">您成功投资<strong class="touzi_money">2000</strong>元</p>
       </div>
       <div id="dialog01" title="收益计算器" style="display:none">
         <div class="dialog_title"><strong>收益计算器</strong>
          <div class="right_cha"></div>
         </div>
         <div class="touzi_text">
          <span>投资金额：</span>
          <span class="touz_right"><input type="text" id="preview_amount" value="200"></input></span>
         </div>
         <div class="touzi_text">
          <span>预期收益率：</span>
          <span class="touz_right"><input type="text" value="10%" id="preview_rate"></input></span>
         </div>     
         <div class="touzi_text"  style="display:none">
          <span>投资期限：</span>
          <span class="touz_right"><select id="preview_period">
            <option value="6">6个月</option>
            <option selected="selected" value="12">12个月</option>
            <option value="24">24个月</option>
          </select></span>
         </div>
         <div class="touzi_text">
          <span>预期总收益：</span>
          <span class="touz_right" id="preview_income">0元</span>
         </div>
         <div class="jisuan_btn">
          <input type="reset" value="重置" class="jisuan_btn_left"></input>
          <input type="submit" value="开始计算" class="jisuan_btn_right"></input>
         </div>
       </div>


	<div class="syl_table" style="clear:both;">
     <table width="100%"  bgcolor="#dedede" align="center" cellspacing="1" cellpadding="2" border="0">
                 <tr>
                 <td bgcolor="#fff" align="center"><b>阶段起点金额</b></td>
                 <td bgcolor="#fff" align="center"><b>起始利率</b></td>
                 <td bgcolor="#fff" align="center"><b>投资增幅</b></td>
                 <td bgcolor="#fff" align="center"><b>利率增幅</b></td>
                 <td bgcolor="#fff" align="center"><b>阶段上限金额</b></td>
                 </tr>
                 <c:if test="${ not empty li}">
        <c:forEach var="s" items="${li}" varStatus="i">
	        <tr>
	        <td bgcolor="#fff" align="center"><span class="lev_start">${s.startMoney}</span></td>
	        <td bgcolor="#fff" align="center"><span class="lev_rate">${s.startInterestRate}</span></td>
	        <td bgcolor="#fff" align="center"><span class="lev_mi">${s.moneyIncrease}</span></td>
	       	<td bgcolor="#fff" align="center"><span class="lev_ri">${s.interestRateIncrease}</span></td>
	        <td bgcolor="#fff" align="center"><span class="lev_max">${s.highestMoney}</span></td>
	        </tr>
         </c:forEach>
			</c:if> 
      </table>
      </div> 

      <ul class="small_nav">
            <li class="sm_nav_fir">
              <a>投资记录</a>
            </li> 
            <li><a>项目描述</a></li>
            <li><a>资金运转</a></li>
            <li><a>企业信息</a></li>
            <li><a>担保机构及意见</a></li>
            <li class="shu"><a>风险控制</a></li>
            <li class="zheng"><a>相关证件</a></li>
      </ul>
      <div class="pro_con_title"><strong>投资记录</strong></div>
       <ul class="table_mag">
       <li><span>投资人</span><span>投资人证件号</span><span>投资金额</span><span>状态</span></li>
		<c:if test="${ not empty list}">
		<c:forEach var="s" items="${list}" varStatus="i">
		<c:if test="${ empty product1.buyType}"><!-- 线下 -->
		<li>
		<span>${fn:substring(s.investor,0,1)}<c:if test="${fn:length(s.investor)>2}">*</c:if>*</span>
		<span >
			<c:if test="${fn:length(s.identityCard)==18}">${fn:substring(s.identityCard,0,7)}********${fn:substring(s.identityCard,15,18)}
			</c:if>
			<c:if test="${fn:length(s.identityCard)!=18}">-
			</c:if>
		</span>
		<span >${s.investmentAmount}万元</span>
		<span>成功</span>
		</li>
		</c:if>
		 <c:if test="${ not empty product1.buyType && not empty s.code}"><!-- 线上 -->
		<li>
		<span>${fn:substring(s.investor,0,2)}<c:forEach var="j" begin="1" end="${fn:length(s.investor)-3}" step="1">*</c:forEach>${fn:substring(s.investor,fn:length(s.investor)-1,fn:length(s.investor))}
		</span>
		<span >
			<c:if test="${fn:length(s.identityCard)==18}">${fn:substring(s.identityCard,0,7)}********${fn:substring(s.identityCard,15,18)}
			</c:if>
			<c:if test="${fn:length(s.identityCard)!=18}">-
			</c:if>
		</span>
		<span >${s.investmentAmount}元</span>
		<span>成功</span>
		</li>
		</c:if>
		</c:forEach>
		</c:if>
		</ul> 
<!--       <ul class="table_mag">
        <li><span>投资人</span><span>投资人证件号</span><span>投资金额</span><span>投资时间</span><span>状态</span></li>
        <li><span>郭*</span><span>220************789</span><span>60万</span><span>2014-6-6</span><span>成功</span></li>
        <li><span>郭*</span><span>220************789</span><span>60万</span><span>2014-6-6</span><span>成功</span></li>
        <li><span>郭*</span><span>220************789</span><span>60万</span><span>2014-6-6</span><span>成功</span></li>
        <li><span>郭*</span><span>220************789</span><span>60万</span><span>2014-6-6</span><span>成功</span></li>
        <li><span>郭*</span><span>220************789</span><span>60万</span><span>2014-6-6</span><span>成功</span></li>
        <li><span>郭*</span><span>220************789</span><span>60万</span><span>2014-6-6</span><span>成功</span></li>
        <li><span>郭*</span><span>220************789</span><span>60万</span><span>2014-6-6</span><span>成功</span></li>
        <li><span>郭*</span><span>220************789</span><span>60万</span><span>2014-6-6</span><span>成功</span></li>
        <li><span>郭*</span><span>220************789</span><span>60万</span><span>2014-6-6</span><span>成功</span></li>
        <li><span>郭*</span><span>220************789</span><span>60万</span><span>2014-6-6</span><span>成功</span></li>
      </ul> -->

   <div class="pro_con_title"><strong>项目描述</strong></div>
      <div class="zijin">
        <p class="zijin_msg">${product1.projectIntroduce}</p>        
      </div>
      
      <div class="pro_con_title"><strong>资金运转</strong></div>
      
      <div class="zijin">
         <p>资金用途</p>
         <p class="zijin_msg">${product1.fundUse}</p>
        <!-- <p>查看详情</p> -->
        <div style="display:none;"></div>
        <p>还款来源</p>
        <p class="zijin_msg">${product1.repaymentSource}</p>  
      </div>
      <div class="pro_con_title"><strong>企业信息</strong></div>      
      <div class="zijin">
          <p>企业背景</p>
          <p class="zijin_msg">${product1.companyProfile}</p>
          <!-- <p>查看详情</p> -->
          <div style="display:none;"></div>
          <p>业务范围</p>
          <p class="zijin_msg">${product1.businessScope}</p>
          <div></div>
          <p>经营状况</p>
          <p class="zijin_msg">${product1.stateOfOperation}</p>
     </div>   
     <div class="pro_con_title" id="p_c_t02"><strong>担保机构及担保意见</strong></div>      
      <div class="zijin">         
          <p>担保机构简介</p>
          <p class="zijin_msg">${product1.guaranteeInstitutionIntroduce}</p> 
          <p>担保机构意见</p>
          <p class="zijin_msg">${product1.collateralOpinion}</p> 
     </div>
     <div class="pro_con_title"><strong>风险控制</strong></div>      
      <div class="zijin">
          <p>担保机构</p>
          <p class="zijin_msg">${product1.guaranteeInstitution}</p>
          <p>抵押物信息</p>
          <p class="zijin_msg">${product1.guarantee}</p> 
          <p>风险控制措施</p>
          <p class="zijin_msg">${product1.riskControl}</p> 
     </div>
     <!-- 
         <div class="wz_one">项目描述</div>
		                <div class="wz_nr">${product1.projectIntroduce}</div>
		                <div class="wz_one">担保机构简介及担保意见</div>
		                <div class="wz_nr"><span class="cu">担保机构简介：</span>${product1.guaranteeInstitutionIntroduce}<br>
		&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">担保机构意见：</span>${product1.collateralOpinion}</div>
						<div class="wz_one">资金运转</div>
		                <div class="wz_nr"><span class="cu">资金用途：</span>${product1.fundUse}<br>
		&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">还款来源：</span>${product1.repaymentSource}</div>
						<div class="wz_one">风险控制措施</div>
		                <div class="wz_nr"><span class="cu">担保机构：</span>${product1.guaranteeInstitution}<br>
		&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">抵押物信息：</span><br>
		&nbsp;&nbsp;&nbsp;&nbsp;${product1.guarantee}<br>
		&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">风险控制措施：</span><br>
		&nbsp;&nbsp;&nbsp;&nbsp;${product1.riskControl}<br>
		</div>
						<div class="wz_one">企业背景</div>
		                <div class="wz_nr">${product1.companyProfile}<br>
		</div>
		                <div class="wz_one">企业信息</div>
		                <div class="wz_nr"><span class="cu">营业范围：</span>${product1.businessScope}<br>
		&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">经营状况：</span>&nbsp;&nbsp;${product1.stateOfOperation}<br>
		</div>
           <div class="wz_one" ><a>投资详情</a></div>
     
      -->
     <div class="pro_con_title"><strong>相关资料</strong></div> 
     <div class="ziliao_pic">
     ${product1.enterpriseCertificate}
      <%--<div class="ban_left"></div>
      <div class="ban_right"></div>
        <ul>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132140144014.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132091019101.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132035433543.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132078307830.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132013601360.jpg" width="355px" height="500px"></li>

         <li><img src="<%=path%>/img/images-2014-11/zhengjian/2014070813230369369.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/2014070813230818818.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132310561056.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132313691369.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132315781578.jpg" width="355px" height="500px"></li>

         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132326952695.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132331613161.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132331983198.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132335753575.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132336953695.jpg" width="355px" height="500px"></li>

         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132348994899.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132361546154.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132374447444.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132380868086.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140708132396009600.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140731170538603860.jpg" width="355px" height="500px"></li>
         <li><img src="<%=path%>/img/images-2014-11/zhengjian/20140731170564286428.jpg" width="355px" height="500px"></li>
       </ul> --%>
       
     </div>
    </div>
</div> 
<!-- absolute start -->
<%@ include file="/includes/absolute.jsp" %>
<!-- absolute end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->



</body>
</html>
