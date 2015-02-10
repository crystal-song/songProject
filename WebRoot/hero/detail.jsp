<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/includes/taglibs.jsp" %> 

<title>项目详情 - 我的众筹 - 中租宝</title>
</head>
<body style="background:#f6f6f6">

<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<div id="campaign">
   <div class="zhong_msgcon">     
          <div id="funding_area"> 
		    <div class="center">
		      <h2 class="campaign_title"><a>${hero.name}</a></h2>
		    </div>
            <div class="clearfix">
	        <div id="image">
	          <img src="${hero.main_image_file_name}" />
	        </div>
		     <div id="backing">
		        <ul>
		            <li class="stats" id="backers">${hero.stats_number_of_contributions} <span>支持</span>
		            </li>
		            <li class="stats">${hero.fixed_payment_amount }<span>已支持 ${hero.goal_dollars }</span>
		            </li>
		          <li class="stats" id="days" >${hero.datenum}${hero.datetype }
		           <span style="width:100px"> 后结束</span>
		          </li>
		        </ul>
		          <div id='progress_bg' class='small'>
		            <div id='progress'  style='width: 50%;'>
		            </div>           
		          </div> 
		          <div class="clear"></div>    
		          <div class="reserve_back"></div>            
		        <div id="reserve_container">         
		          <div class="call_to_action_button">
		              <a class="blue_button" id="main_cta"  href="/juanzeng1.jsp">
		                          支持
		              </a>
		          </div>          
		          <div class="call_to_action_description">           
		          </div>
		        </div>
		     </div>
           </div>
           <div class="share"></div>
          </div>
      </div>
                     
</div>
<div class="zhong_con">
         <div class="hei_con">
				${hero.main_content}         
         </div>
         <div class="hei_right">
           <div class="rewards_sidebar">
				<h3>支持</h3>
				<ul>
					<li id="rewards_click">
						<a class="rev_mon" href="/juanzeng1.jsp">
						<p class="price_zhong">￥100</p>
						<p class="title_zhong" href="http://ptobchina.com/">支持100元</p>
						<p class="image_reward"><img src="#" /></p>
						<p class="description_zhong">1）我们会登记您的姓名在功德簿和祈福名单里，这两样宝贝将会长久的安放在莲师大殿里，
						      必将会受到莲花生大士的恒久加持和保佑。 2）您还会得到我们学校全体师生长久的诵经回向和永久祝福。
						</p>
						<p class="rew_font">配送费用：<strong>免运费</strong></p>
						<p class="delivery_zhong">预计回报发送时间: 2015年5月</p>
						<p class="claimed_zhong"> 已有<label style="color:#ff665f">200</label>人支持 </p>
					   </a>
					</li>
					<li id="rewards_click">
						<a class="rev_mon" href="/juanzeng1.jsp">
						<p class="price_zhong">￥3,000</p>
						<p class="image_reward"><img src="#" /></p>
						<p class="title_zhong" href="http://ptobchina.com/">支持3000元</p>
						<p class="description_zhong">1）我们会登记您提供的8个姓名在功德簿和祈福名单里，这两样宝贝将会长久的放在莲师大殿里，必将会受到莲花生大士的恒久加持和保佑。而且您也会得到我们学校全体师生长久的诵经回向和永久祝福。 2）您将会收到我们寄出的色达风景明信片一套（10-12张） 3）我们将为您专门刻三块玛尼石，放在学校的玛尼墙里，得到亘古恒久的功德加持。 4）您将成为汇知学校的尊贵功德主和善心人士，邀请您在合适的时间访问汇知学校。</p>
						<p class="rew_font">配送费用：<strong>免运费</strong></p>
						<p class="delivery_zhong">预计回报发送时间: 2015年10月</p>
						<p class="claimed_zhong"> 已有<label style="color:#ff665f">200</label>人支持</p>
						</a>
					</li>
					<li id="rewards_click" style="border-bottom:none">
						<a class="rev_mon" href="/juanzeng1.jsp" >
						<p class="price_zhong">￥3,000</p>
						<p class="image_reward"><img src="#" /></p>
						<p class="title_zhong" href="http://ptobchina.com/">支持3000元</p>
						<p class="description_zhong">1）我们会登记您提供的8个姓名在功德簿和祈福名单里，这两样宝贝将会长久的放在莲师大殿里，必将会受到莲花生大士的恒久加持和保佑。而且您也会得到我们学校全体师生长久的诵经回向和永久祝福。 2）您将会收到我们寄出的色达风景明信片一套（10-12张） 3）我们将为您专门刻三块玛尼石，放在学校的玛尼墙里，得到亘古恒久的功德加持。 4）您将成为汇知学校的尊贵功德主和善心人士，邀请您在合适的时间访问汇知学校。</p>
						<p class="rew_font">配送费用：<strong>免运费</strong></p>
						<p class="delivery_zhong">预计回报发送时间: 2015年10月</p>
						<p class="claimed_zhong"> 已有<label style="color:#ff665f">200</label>人支持</p>
						</a>
					</li>
		</div>	
    </div>
    <div class="clear"></div>
    <div class="rew_btn"><a href="/juanzeng1.jsp">我要支持</a></div>
</div>

<!-- absolute_right start -->
	 <%@ include file="/includes/absolute.jsp" %>
<!-- absolute_right end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->

</body>
</html>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript">
var navIndex=2;  
var indexs=0;

$(document).ready(function(e){
	var down=0;
	var up=0;
	$(".u_left_sec:eq(0) li:eq(0)").children("a").css("color","#fc652e");
	$(".nav_big a").eq(3).addClass("bd_btom").siblings().removeClass("bd_btom");
	$(".nav_big a").eq(3).children("p").addClass("headwd_color");
	
	
	$(".dizhi div").click(function(){
		$(this).css("background","url(/img/images-2014-11/kuang.png)  no-repeat");
		$(this).siblings().css("background","url(/img/images-2014-11/kuang1.png)  no-repeat");
	})
	var offsettop_fir=parseInt($(".hei_right").offset().top);
	var heiright_height=$(".hei_right").height();
	//alert(heiright_height)
	$(window).on("scroll",function(){
		//rightBar();		
	});
	
	function rightBar(){
		var scroll_height=parseInt($(this).scrollTop());		
		var win_height=$(window).height();//window height
		var offset_height=parseInt($(".hei_right").offset().top);
		var offset_left=parseInt($(".hei_right").offset().left);	
		var con_offset=parseInt($(".hei_con").offset().top);
		var con_height=$(".hei_con").height();
		var h=parseInt(heiright_height+offset_height-win_height+50);
		var ch=parseInt(con_offset+con_height-win_height);
		var Ztop=win_height-heiright_height-50;
		 $(".rew_font strong").html(scroll_height+"scrolltop");
		 $(".delivery_zhong").html(offsettop_fir+"hhhh") 
		 /* $(".title_zhong").html(win_height+"winhei") */
		 $(".price_zhong").html(con_height+"divhei") 
		/* $(".claimed_zhong label").html(parseInt(offset_height)+"offsettop") */
		
	//超过侧边栏	
/* 	if(scroll_height>up){
		if(h<scroll_height){			
		     $(".hei_right").addClass("fix_bottom"); 
		     $(".hei_right").css({"left":offset_left,"top":Ztop});	  		    
		}		
	//超过内容栏	
		if(ch<scroll_height){
		   var Ctop=win_height-heiright_height-(scroll_height-con_height-con_offset+win_height)-50; 		       
			    $(".hei_right").css({"left":offset_left,"top":Ctop});	          	             	      
         }
         up=scroll_height;
         
	}else{
		$(".hei_right").css({"position":"absolute","top":offsettop_fir}); 
		//回滚
		//超过内容栏
		
		
		
	} */
	
	
		/*  if(scroll_height>up){
				if(h<scroll_height){			
				     $(".hei_right").addClass("fix_bottom"); 
				     $(".hei_right").css({"left":offset_left,"top":Ztop});	        
				}				
				if(ch<scroll_height){
					   var Ctop=win_height-heiright_height-(scroll_height-con_height-con_offset+win_height)-50; 		       
					    $(".hei_right").css({"left":offset_left,"top":Ctop});	          	             	      
		        }			
		         up=scroll_height;
		         
			}else{
				//$(".hei_right").css({"position":"absolute","top":offsettop_fir}); 
				if(ch>scroll_height){
					if(h<scroll_height){
						
					}
					$(".hei_right").css({"position":"absolute","top":offsettop_fir}); 					
				}		
				
			} */ 
		
  }
	
});
 
</script>


