<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%@ include file="/includes/taglibs.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<Link href="/favicon.ico" rel="Shortcut Icon">
<title>项目：${product1.projectName} - 我要投资 - 中投汇</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css_new/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/jquery-ui-1.11.1/js/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/jquery-ui-1.11.1/js/jquery-ui.min.css" rel="stylesheet" type="text/css" />



 <script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
 <script type="text/javascript" src="<%=path%>/jquery-ui-1.11.1/js/jquery-ui.js"></script>
 <script type="text/javascript" src="<%=path%>/jquery-ui-1.11.1/js/jquery-ui.min.js"></script>
 <script type="text/javascript">
var navIndex=1;
</script>
   
<script type="text/javascript">
$(document).ready(function(){
	
	var scroplltop=$(window).scrollTop();
	var nav_height=parseInt($('.con_nav').offset().top);
	$('.con_nav li').click(function(){
		var nav_height=parseInt($('.con_nav').height());
		var i=$(this).index();
		$('.con_nav').addClass('text');
		$(this).addClass('nav_first').siblings().removeClass('nav_first');
		
	    var top1=parseInt($('.wz_one').eq(i).offset().top);	
		$(window).scrollTop(top1-nav_height-40);
		});	

		$(window).on('scroll', function(){
				checkText();
			});
	$('.btn_bottom').hide()	;		
	function checkText(){
			
			var top = parseInt($(this).scrollTop());
			if(top>500){			
				$('.btn_bottom').show();
				}else{		
				$('.btn_bottom').hide()	;
					}	
			var text=$('.con_nav');		
			if(top>nav_height){ 
				$('.con_nav').addClass('text');				
			}else if(text.hasClass('text')&&(top!=nav_height)){
				  $('.con_nav').removeClass('text');
				}
		}			
		$('.btn_bottom').click(function(){
			$("html,body").animate({scrollTop:0},500);	
		    });
		
		$("#input").keydown(function(){
			
			
		});
		
		
		$("#input").keyup(function(){

	           var str= /^[0-9]*$/;
	           var val=$("#input").val();
	           $('.neirong').css('display','block');
			 
		       if(!(str.test(val))){  	   
				   $('.neirong').html("您输入的金额不是数字,请重新输入");
				   return false;
			    }
			    if(val<100){
				   $('.neirong').html("您输入的金额小于100元,请重新输入");
				   return false;
			    }
			    if(val>500000){
					   $('.neirong').html("您输入的金额大于500000元,请重新输入");
					   return false;
				    }
			    if(parseInt(val)%100!=0){	
				  $('.neirong').html("输入的资金必须是100的整数倍");
				  return false;
				   }
			      $('.neirong').html('您要投入的实际金额为:'+val);		   
		});	
});		

window.onload=function(){
	var myblur= document.getElementById('input')
	
	      myblur.onfocus=function(){
	    	  
		  if(myblur.value=="请输入资金"){
			  myblur.value="";
			  myblur.style.color="#000"	 
			  } 	  
			 }
	      
		  myblur.onblur=function(){
			 
			 if(myblur.value==""){
			   myblur.value="请输入资金"
			   myblur.style.color="#ccc"	 
			   }	 		  
	}
	 
}
		
</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<!-- banner start -->
<%@ include file="/includes/banner.jsp" %>
<!-- banner end  -->
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
                            <div class="xxo_font">信用等级：<img src="<%=path%>/images/qualityRate_${product1.qualityRating}.jpg" style="margin-bottom:-3px;"><span style="padding-left:120px;">分享到：<img src="<%=path%>/images/xx_09.jpg">&nbsp;<img src="<%=path%>/images/xx_11.jpg">&nbsp;<img src="<%=path%>/images/xx_13.jpg"></span></div>
                        </div>
                        <div class="xx_font">年化收益：<span class="ckxq_red1">${product1.yearIncome}%</span>&nbsp;&nbsp;还款日期:<span class="ckxq_red1">${product1.repaymentTime}</span>&nbsp;&nbsp;还款方式：<span class="zi14">${product1.repaymentWay}</span></div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="tzxx">
                	<div class="tzxx_left">
                    	担保机构:<span class="cu">${product1.guaranteeInstitution}</span><br>
100%本息保障<br>
<!-- 距离企业还款结项还有300天<br> -->
企业生产经营正常，还款正常
                    </div>
                    <div class="tzxx_right">
                    	融资金额:<span class="cu hong">${product1.financingMoney}万</span><br>
融资进度：<span class="cu hong">${product1.financingProgress}<c:if test='${empty product1.financingProgress}'>0</c:if>%</span><br>
<div class="progress_160"><div class="progress_bar" style="width:<c:if test='${not empty product1.financingProgress}'>${product1.financingProgress<100?product1.financingProgress:100}</c:if><c:if test='${empty product1.financingProgress}'>0</c:if>%"></div></div>

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
                                <td height="30" bgcolor="#FFFFFF" align="center" width="30%"><!-- fn:substring(s.investor,0,1)s.investor -->
                                	<span >${fn:substring(s.investor,0,1)}<c:if test="${fn:length(s.investor)>2}">*</c:if>*</span>
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
                    <div class="wz_nr" ><br>
        <!-- &nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">他项权证：</span><br> -->${product1.enterpriseCertificate}
                   <%--  <img src="<%=path%>/images/20140708132140144014.jpg" width="581" height="800" />
                    <img src="<%=path%>/images/20140708132035433543.jpg" width="720" height="523" />
                    <img src="<%=path%>/images/20140708132013601360.jpg" width="720" height="989" />   --%>
                    </div>
                    
                    
                   
           <div class="btn_bottom"></div>
            </div>
        </div>
        <div class="xx_right">
        <!-- xx right -->
          <div class="cr_bg" style="height:220px;">
            	<div class="cr_tit">
                	<div class="cr_font">投资份额</div>
                    <div class="cr_more"><img src="<%=path%>/images/sy_50.jpg"></div>
                </div>
                <div class="cr_nr">
                	<div class="fen"><span>可投资金额</span><strong><span class="fen_red">50,000.00</span></strong><i>元</i></div>              	
                	<div class="neirong" style="display:none"></div>
                	<div class="jin_input"><input type="text" class="jin_text" value="请输入资金" id="input"></input>元</div>
                	<div class="jin_input"><a id="touzi_dialog" href="<%=path%>/touzicheck.jsp"><strong>立即投资</strong></a><a class="jisuan" style="display:none"></a></div>
                </div>
            </div>
		 <%@ include file="/includes/news_list_right.jsp" %>
    	<!-- xx right end-->
    	</div>
    	<div class="clear"></div>
    </div>
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
