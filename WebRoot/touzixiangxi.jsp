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
<Link href="/favicon.ico" rel="Shortcut Icon">
<title>项目：${product1.projectName} - 我要投资 - 中投汇</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css_new/style.css" rel="stylesheet" type="text/css" />

 <script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
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
		});
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
    	<div class="xx_left">
    		<div class="lactation">当前位置：<a href="<%=path%>/" >首页</a> >> <a href="<%=path%>/product/allProduct" >我要投资</a> >> 项目详情</div>
    		<div class="clear_height"></div>
        	<div class="xx_one">
            	<div class="xxo_bor">
                	<div class="xxo_left">${s.projectPicture}</div>
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
融资进度：<span class="cu hong">${product1.financingProgress}%</span><br>
<div class="progress_160"><div class="progress_bar" style="width:${product1.financingProgress<100?product1.financingProgress:100}%"></div></div>

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
                                <td height="30" bgcolor="#FFFFFF" align="center" width="30%">
                                	<span style="font-family:'Microsoft YaHei';font-size:12px;">${s.investor}</span>
                                </td>
                                <td bgcolor="#FFFFFF" align="center" width="40%">
                                	<span style="font-family:'Microsoft YaHei';font-size:12px;">    
                                    ${s.identityCard}</span>
                                </td>
                                <td bgcolor="#FFFFFF" align="center" width="30%">
                                	<span style="font-family:'Microsoft YaHei';font-size:12px;">${s.investmentAmount}万元</span>
                                </td>
                              </tr>
                              
                                </c:forEach>
      
	 
        </c:if>
                           <!--    <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">王**</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                	<span style="font-family:'Microsoft YaHei';font-size:12px;">    
                                 1426311********410</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">15万元</span> 
                                </td>
                              </tr>
                                <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">王**</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                	<span style="font-family:'Microsoft YaHei';font-size:12px;">1101011********522</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                	<span style="font-family:'Microsoft YaHei';font-size:12px;">60万元</span> 
                                </td>
                              </tr>
                              <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                	<span style="font-family:'Microsoft YaHei';font-size:12px;">罗**</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                	<span style="font-family:'Microsoft YaHei';font-size:12px;">1101011********516</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                	<span style="font-family:'Microsoft YaHei';font-size:12px;">10万元</span> 
                                </td>
                              </tr>
                              <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                	<span style="font-family:'Microsoft YaHei';font-size:12px;">金*</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                	<span style="font-family:'Microsoft YaHei';font-size:12px;">1101051********539</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                	<span style="font-family:'Microsoft YaHei';font-size:12px;">20万元</span> 
                                </td>
                              </tr>
                                <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                	<span style="font-family:'Microsoft YaHei';font-size:12px;">金*</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">1101051********539</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">20万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">李**</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">1101061********34X</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">12万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">林*</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">3310211********021</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">10万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">王**</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">1101021********516</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">10万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">钟**</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">1326281********044</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">40万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">马**</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">1306221********617</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">10万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">赵**</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">1101061********929</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">10万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">黄*</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">4301241********298</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">25万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">史*</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">1101041********536</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">10万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">冯**</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">1427331********813</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">10万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">袁*</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">1101061********153</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">10万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">章**</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">3408111********820</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">30万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">徐**</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">1101051********816</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">15万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">王**</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">2301021********632</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">30万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">桂*</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">3601041********512</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">10万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">王*</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">1101061********314</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">10万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">陈*</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">1101081********516</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">10万元</span> 
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">杨**</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">6123011********925</span> 
                                </td>
                                <td align="center" bgcolor="#FFFFFF">
                                    <span style="font-family:'Microsoft YaHei';font-size:12px;">170万元</span> 
                                </td>
                            </tr> -->
                          </table>
                    </div>
                    </div>


            <div  class="wz_one" ><a>相关证件</a></div>
                    <div class="wz_nr" ><br>
        &nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">他项权证：</span><br>${product1.enterpriseCertificate}
                   <%--  <img src="<%=path%>/images/20140708132140144014.jpg" width="581" height="800" />
                    <img src="<%=path%>/images/20140708132035433543.jpg" width="720" height="523" />
                    <img src="<%=path%>/images/20140708132013601360.jpg" width="720" height="989" />   --%>
                    </div>
                    
                    
                   
           <div class="btn_bottom"></div>
            </div>
        </div>
        <div class="xx_right">
        <!-- xx right -->
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
