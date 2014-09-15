<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>项目简介</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
var navIndex=2;
$(document).ready(function(){
	var nav_top=parseInt($('#jianjie_nav').offset().top);
	var main_left_top=parseInt($('.main_left').offset().top)	
    var main_left_height=parseInt($('.main_left').height())	
	var main_top=main_left_top+main_left_height;
	$(window).on('scroll', function(){
				checkText();
			});
	$("#jianjie_nav a").click(function(){
		$(this).addClass('style01').siblings().removeClass('style01'); 
		
		});			
	    function checkText(){	
			var scroplltop = parseInt($(this).scrollTop());
            var text=$("#jianjie_nav");
			if(scroplltop>nav_top){ 
				$('#jianjie_nav').addClass('test');		
			}else if(scroplltop<nav_top && text.hasClass('test')){
				$('#jianjie_nav').removeClass('test');
			}
				
			if(scroplltop>main_top){
				$('#jianjie_nav').removeClass('test');
				//alert(main_top)
				}	
		}			
	  $('.tag_bot').click(function(){
		  var tag_name=$(this).siblings('.tag_name')
		  if(tag_name.css('display')=='none'){
			  tag_name.css('display','block')
			  $('.tag_bot').css('border-bottom','none')
			  }else if(tag_name.css('display')=='block'){
				tag_name.css('display','none')
				$('.tag_bot').css('border-bottom','1px dashed #e5e5e5')
				  }
		  });
		  
	   var a =$('.shu1').text();
	   $('.bar_body').children().css('width',a)
	   //alert(a)	  
	
	});
	
    window.onload=function(){
	var myblur= document.getElementById('blur')
	      myblur.onfocus=function(){
		  if(myblur.value=="搜索"){
			  myblur.value="";
			  myblur.style.color="#000"	 
			  }  
			 }  
		  myblur.onblur=function(){
			  
			 if(myblur.value==""){
			   myblur.value="搜索"
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
<div class="one"></div>
<div class="clear"></div>
<div class="content">
 <div class="main_con">
     <div class="main_left">
        <h1>codru儿童智能守卫</h1>
        <div class="person">
          <span class="faqiren">发起人</span>
          <a href="#"><strong>木风</strong></a>
          <span>广州深圳</span>
        </div>
        <div id="jianjie_nav">
           <a href="#" class="style01">项目主页</a>
           <a href="#">话题</a>
           <a href="#">支持者</a>
           <span class="sp_bac01"><strong>支持</strong></span>
           <span class="sp_bac02"><strong>喜欢</strong></span>
        </div>
        <div class="jianjie_con">
        <!-- <h1>关于我们</h1>
        <div class="profile">
             卡迪鲁科技是一家新兴的致力于智能穿戴产品的科技公司，拥有来自多个知名高新企业行业人员，自2013年末开始研发智能产品。我们团队经过资源整合与优化，于2014年第一季度制定             了我们首款产品-卡迪鲁儿童智能守卫。经过半年时间对同类产品的技术方案优化及穿戴的体验感的梳理，无论从功能设置、人机工程学，还是材料应用上，我们相信它将会带给用户优质的体验。
        </div> -->
        <!--  <h1>项目简介</h1>
        <div class="profile">
             卡迪鲁儿童智能守卫是一款主要针对3-13岁的儿童智能手表，孩子们只需带上一只智能守卫，作为监护人，就能随时监测到孩子的动向、地理位置等安全、学习信息。同时通过手机APP端实现对孩子的监控。
             <a href="#" title="卡迪鲁儿童智能守卫"><img src="img/zhongcou01.jpg" width="650" height="460" /></a>
        </div> -->
        <!-- <h1>产品介绍</h1>
        <div class="profile">
             <a href="#" title="卡迪鲁儿童智能守卫"><img src="img/zhongcou02.jpg" width="650" height="411" /></a>
             为人父母，我们时常担心熊孩子调皮捣蛋、不好好学习，带熊孩子出去玩担心他乱跑...而作为70、80的父亲母亲又多粗心大意.怎么办？别担心，我们来为您解决困扰，所有的问题，有了它，一切将不再是问题.
             <a href="#" title="卡迪鲁儿童智能守卫"><img src="img/zhongcou03.jpg" width="650" height="411" /></a>
             电子围栏警报，当我们通过地图以设备为中心划出范围，当调皮捣蛋的熊孩子走出这个范围，监护人即可收到警报提示信息。
             <a href="#" title="卡迪鲁儿童智能守卫"><img src="img/zhongcou05.jpg" width="650" height="474" /></a>
        </div> -->
        <!-- <h1>为什么我需要您的支持</h1>
        <div class="profile">
             codru儿童智能守卫已经完成硬件开发及产品的设计，前期工作我们重点在硬件的开发和测试。我们希望您的支持能够让我们快速的获得用户反馈意见，便于我们进一步的改进和更新软硬件产品，选择更优质的生产商和原材料供应商制造产品，保障即将生产的品质、提高产品安全性、也希望大家能帮助我们传播用户体验，让更多的70、80后，还有更多的熊孩子喜欢上它
        </div>
        <h1>我们的承诺与回报</h1>
        <div class="profile">
             我们承诺：众筹网的支持者将成为codru儿童智能守的首批使用者<br/> <br/>我们承诺：众筹网的支持者将以低于市场价格的众筹价格获得codru儿童智能守<br/><br/>我们承诺：众筹网的支持者将终身免平台服务费
        </div> -->
       ${crowdfunding1.projectIntroduction}
        <div class="biaoqian01">
         <!-- <p>分类<a href="#">科技</a></p>
         <p class="biaoqian02">标签：<a href="#">科技</a><a href="#">守卫</a><a href="#">儿童</a><a href="#">智能</a><a href="#">codru</a></p> -->
        </div>
       </div>  
     </div>
     <div id="main_right">
       <div class="m_r_top">
           <span class="m_r_red"><strong class="xin"  onclick="query()">喜欢</strong></span>
           <span class="m_r_blue"><strong class="zhichi">支持</strong></span>
       </div>
       <div class="m_r_cent">
         <span>目前累计金额</span>
         <p>¥<strong>${crowdfunding1.realityMoney}</strong></p>
         <a>众筹中</a>
         <span class="bur">此项目必须在 <strong>2014年09月06</strong>日 前得到 <strong>¥${crowdfunding1.raiseMoney}</strong> 的支持才可成功！</span>
         <div class="bar_aini">
           <div class="bar_body"><div></div></div>
           <div class="shu1">${crowdfunding1.raiseProportion}%</div>
         </div>
         <div class="dibu">
           <span>
             <p><strong>${crowdfunding1.surplusTime}天</strong></p>
             <p>剩余时间</p>
           </span>
           <span class="cen">
             <p><strong>${crowdfunding1.supporter}</strong></p>
             <p>支持者</p>
           </span>
           <span>
             <p><strong>${crowdfunding1.like}</strong></p>
             <p>喜欢</p>
           </span>
         </div>
       </div>
       
        <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
       <div class="m_r_bott">
          <div class="aside01">
            <a>
                <strong>支持¥${s.sustainMoney}</strong>    
            </a>
            <p>已有 <em>${s.supporter}</em> 位支持者 / 限额 <em>${s.limitQuantity}</em> 位</p>
          </div>
          <div class="aside02">
          ${s.productInfo}
          </div>
          <span>      
                <strong>支持¥${s.sustainMoney}</strong>    
          </span>   
       </div>  
       
        </c:forEach>
     
	 
        </c:if>
        <div class="m_r_bott">
          <div class="aside01">
            <a>
                <strong>支持¥189</strong>    
            </a>
            <p>已有 <em>122</em> 位支持者 / 限额 <em>200</em> 位</p>
          </div>
          <div class="aside02">
          谢谢您一起与codru为伴！<br/>
          感谢您的支持，作为回报，您将在项目结束后获得codru儿童智能守卫一台，我们将在2014年10月30日前为您发货。（codru儿童智能守卫共有玫红、橘色、蓝色、紫色、绿色5种颜色，请您          
          标注好您所想要的颜色，我们会按照您选择的颜色为您发货。）<br/><br/>
          配送费用：免运费<br/><br/>
          预计回报发送时间：项目成功结束后30天内 
          </div>
          <span>      
                <strong>支持¥189</strong>    
          </span>      
       </div>
       
        <div class="m_r_bott">
          <div class="aside01">
            <a>
                <strong>支持¥169</strong>    
            </a>
            <p>已有 <em>122</em> 位支持者 / 限额 <em>200</em> 位</p>
          </div>
          <div class="aside02">
          谢谢您一起与codru为伴！<br/>
          感谢您的支持，作为回报，您将在项目结束后获得codru儿童智能守卫一台，我们将在2014年10月30日前为您发货。（codru儿童智能守卫共有玫红、橘色、蓝色、紫色、绿色5种颜色，请您          
          标注好您所想要的颜色，我们会按照您选择的颜色为您发货。）<br/><br/>
          配送费用：免运费<br/><br/>
          预计回报发送时间：项目成功结束后30天内 
          </div>
          <span>      
                <strong>支持¥169</strong>    
          </span>
       </div>
     
        <div class="m_r_bott">
          <div class="aside01">
            <a>
                <strong>支持¥122</strong>    
            </a>
            <p>已有 <em>122</em> 位支持者 / 限额 <em>200</em> 位</p>
          </div>
          <div class="aside02">
          谢谢您一起与codru为伴！<br/>
          感谢您的支持，作为回报，您将在项目结束后获得codru儿童智能守卫一台，我们将在2014年10月30日前为您发货。（codru儿童智能守卫共有玫红、橘色、蓝色、紫色、绿色5种颜色，请您          
          标注好您所想要的颜色，我们会按照您选择的颜色为您发货。）<br/><br/>
          配送费用：免运费<br/><br/>
          预计回报发送时间：项目成功结束后30天内 
          </div>
          <span>      
                <strong>支持¥122</strong>    
          </span>
       </div>
 
       <div class="m_r_bott">
          <div class="aside01">
            <a>
                <strong>支持¥229</strong>    
            </a>
            <p>已有 <em>122</em> 位支持者 / 限额 <em>200</em> 位</p>
          </div>
          <div class="aside02">
          谢谢您一起与codru为伴！<br/>
          感谢您的支持，作为回报，您将在项目结束后获得codru儿童智能守卫一台，我们将在2014年10月30日前为您发货。（codru儿童智能守卫共有玫红、橘色、蓝色、紫色、绿色5种颜色，请您          
          标注好您所想要的颜色，我们会按照您选择的颜色为您发货。）<br/><br/>
          配送费用：免运费<br/><br/>
          预计回报发送时间：项目成功结束后30天内 
          </div>
          <span>      
                <strong>支持¥229</strong>    
          </span>
       </div>
     
     
      <div class="m_r_bott">
          <div class="aside01">
            <a>
            <strong>支持¥339</strong>    
            </a>
            <p>已有 <em>122</em> 位支持者 / 限额 <em>200</em> 位</p>
          </div>
          <div class="aside02">
          谢谢您一起与codru为伴！<br/>
          感谢您的支持，作为回报，您将在项目结束后获得codru儿童智能守卫一台，我们将在2014年10月30日前为您发货。（codru儿童智能守卫共有玫红、橘色、蓝色、紫色、绿色5种颜色，请您          
          标注好您所想要的颜色，我们会按照您选择的颜色为您发货。）<br/><br/>
          配送费用：免运费<br/><br/>
          预计回报发送时间：项目成功结束后30天内 
          </div>
          <span>      
                <strong>支持¥339</strong>    
        </span>
       
       </div>
       <div class="guanggao"><img src="<%=path%>/img/53e84ec254657_310x200.jpg" width="310" height="200" /></div>
    </div>
        
 <div class="con_bott">
      <div class="jinzhan">
            <h2>项目进展</h2>
            <a href="#">足迹</a>
            <a href="#">发起话题</a>
            <a href="#">发起人全部话题</a>
       </div>
       <p class="grop">这里记录了项目发起人更新的项目进展，您可以发起话题或评论与发起人进行交流。 </p>
       <div class="touxiang">
           <a></a>
           <span class="redname">发起人</span>
           <span>木风</span>
       </div>
      
          <div class="cin">
           <div class="con01">
               <div class="tag_time">3天前</div>
               <div class="tag_con">近期有很多朋友问我购买样品问题.我建议大家以众筹支持方式.9月下旬首批样品出来后我们会优先众筹发货.其他渠道样品购买会贵很多，时间上也会比众筹到手晚.</div>
               <div class="tag_bot"><a>评论(0)</a></div>
               <div class="tag_name" style="display:none;">
                  <div class="tag_text">
                      <textarea class="textarea01"></textarea>
                      <div class="tag_text_bottom">
                        请登录后评论，立即 <a href="#">登录</a> 或 <a href="#">注册</a>
                      </div>
                  </div>
                  <div class="tag_quote"></div>  
               </div>          
           </div>
           <div class="con01">
               <div class="tag_time">5天前</div>
               <div class="tag_con">近期有很多朋友问我购买样品问题.我建议大家以众筹支持方式.9月下旬首批样品出来后我们会优先众筹发货.其他渠道样品购买会贵很多，时间上也会比众筹到手晚.</div>
               <div class="tag_bot"><a>评论(0)</a></div>
               <div class="tag_name" style="display:none;">
                  <div class="tag_text">
                      <textarea class="textarea01"></textarea>
                      <div class="tag_text_bottom">
                        请登录后评论，立即 <a href="#">登录</a> 或 <a href="#">注册</a>
                      </div>
                  </div>
                  <div class="tag_quote"></div>
               </div>          
           </div>
           <div class="con01">
               <div class="tag_time">18天前</div>
               <div class="tag_con">近期有很多朋友问我购买样品问题.我建议大家以众筹支持方式.9月下旬首批样品出来后我们会优先众筹发货.其他渠道样品购买会贵很多，时间上也会比众筹到手晚.</div>
               <div class="tag_bot"><a>评论(0)</a></div>
               <div class="tag_name" style="display:none;">
                  <div class="tag_text">
                      <textarea class="textarea01"></textarea>
                      <div class="tag_text_bottom">
                        请登录后评论，立即 <a href="#">登录</a> 或 <a href="#">注册</a>
                      </div>
                  </div>
                  <div class="tag_quote"></div>
               </div>          
           </div>
           <div class="con01">
               <div class="tag_time">2014-7-10</div>
               <div class="tag_con">近期有很多朋友问我购买样品问题.我建议大家以众筹支持方式.9月下旬首批样品出来后我们会优先众筹发货.其他渠道样品购买会贵很多，时间上也会比众筹到手晚.</div>
               <div class="tag_bot"><a>评论(0)</a></div>
               <div class="tag_name" style="display:none;">
                  <div class="tag_text">
                      <textarea class="textarea01"></textarea>
                      <div class="tag_text_bottom">
                        请登录后评论，立即 <a href="#">登录</a> 或 <a href="#">注册</a>
                      </div>
                  </div>
                  <div class="tag_quote"></div>
               </div>          
           </div>  
           <div class="con01">
               <div class="tag_time">2014-7-8</div>
               <div class="tag_con">近期有很多朋友问我购买样品问题.我建议大家以众筹支持方式.9月下旬首批样品出来后我们会优先众筹发货.其他渠道样品购买会贵很多，时间上也会比众筹到手晚.</div>
               <div class="tag_bot"><a>评论(0)</a></div>
               <div class="tag_name" style="display:none;">
                  <div class="tag_text">
                      <textarea class="textarea01"></textarea>
                      <div class="tag_text_bottom">
                        请登录后评论，立即 <a href="#">登录</a> 或 <a href="#">注册</a>
                      </div>
                  </div>
                  <div class="tag_quote"></div>
               </div>        
           </div>        
      </div> 
      <div class="clear"></div>  
  </div>
  <div class="bott_four">
    <ul>
      <li>
         <div class="bott_pic1">
          <span>众筹中</span>
         </div>
         <div class="pic1_right">
             <h3><a>D-Link云监控摄像头——随时随地监控你的地盘</a></h3>
             <span>¥<strong>30,312</strong>(152%) ⁄ ¥20000 </span>
             <span>剩余时间：25天</span>
         </div>
      </li>
      <li>
         <div class="bott_pic1">
          <span>众筹中</span>
         </div>
         <div class="pic1_right">
             <h3><a>D-Link云监控摄像头——随时随地监控你的地盘></a></h3>
             <span>¥<strong>30,312</strong>(152%) ⁄ ¥20000 </span>
             <span>剩余时间：25天</span>
         </div>
      </li>
      <li>
         <div class="bott_pic1">
          <span>众筹中</span>
         </div>
         <div class="pic1_right">
             <h3><a>D-Link云监控摄像头——随时随地监控你的地盘</a></h3>
             <span>¥<strong>30,312</strong>(152%) ⁄ ¥20000 </span>
             <span>剩余时间：25天</span>
         </div>
      </li>
      <li>
         <div class="bott_pic1">
          <span>众筹中</span>
         </div>
         <div class="pic1_right">
             <h3><a>D-Link云监控摄像头——随时随地监控你的地盘</a></h3>
             <span>¥<strong>30,312</strong>(152%) ⁄ ¥20000 </span>
             <span>剩余时间：25天</span>
         </div>  
      </li>
    </ul>
  </div>  
 </div>
 
 <!-- links start -->
<%@ include file="/includes/links.jsp" %>
<!-- links end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->


</body>
</html>