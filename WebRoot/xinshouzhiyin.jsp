<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ include file="/includes/taglibs.jsp" %>

<title>新手指引 - 中租宝</title>


</head>

<body>

<!-- content start -->
 <div class="new_person"> 
      <div class="new_fir">
	       <div class="new_top">
	        <span><div >中租宝</div><div class="newpoint">新手指引</div></span>	        
	       </div>
	       <a class="top_line" href="<%=path%>/wel">回到首页</a>
	      <div class="msg_zhong">
	        <p>中租宝，是中投汇融投资管理有限公司旗下的众筹网络平台</p>
	        <p><strong>中投汇融</strong>是国内首批企业债领域的财富投资管理公司。我们汇集了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台。
            </p>
            <p class="def"></p>
            <p class="abc"></p>
	        <p>中租宝开创了企业债新时代，首次提出高标准、严要求挑选合作伙伴，只接受优质担保机构（信用评级A+级以上，政府重点扶持项目）企业的银行级理财项目，并有专家风控团队，为投资者提供100%本息保障，最高超过银行活期同期存款30倍的高收益理财项目。通过中租宝，您可以将手中富余资金出借给盈利能力强的中小企业，并获得高收益的利息回报，分享企业高速发展的红利。
           </p>
	      </div>
      </div>
      <div class="new_sec">
          <div class="sec_left"></div>
          <div class="jiantou_left"></div>
          <div class="sec_con"></div>
          <div class="jiantou_right"></div>
          <div class="sec_right"></div>
      </div>
          <div class="new_sec">
             <div class="sec_left_wd">
               <span class="sec_titile">投资人</span>
               <p>投资人想投资，通过中租宝保障高收益，实物资产抵押,担保机构本息保障，中租宝专家风控团队层层防控。</p>
             </div>
             <div class="sec_con_wd">
               <span class="sec_titile">中租宝</span>
               <p style="width:300px;margin:0">中租宝作为中介平台，融资企业获得借款资金支持，投资人获得经济收益和物资回报双丰收。</p>
             </div>
             <div class="sec_right_wd">
               <span class="sec_titile">融资方</span>
               <p>中租宝作为中介平台，融资企业获得借款资金支持，投资人获得经济收益和物资回报双丰收。</p>
             </div>
          </div>
          
      <div class="new_th" >  
          <div class="new_th_title"></div>     
          <dl style="margin-top:50px">
           <dt>安全性:</dt>
           <dd class="ws_hei">优质担保机构100%本息保障，实物资产抵押，双重保障，第三方支付机构严格进行资金监管，安全无忧，层层保护您的资金安全。
           </dd>
           <dt>高收益:</dt>
           <dd>年化收益9~14%，募满后立即计息。
           </dd>
           <dt>低门槛</dt>
           <dd>200起投，   按百递增。</dd>
          </dl>
          <div class="new_th_title2"></div>  
          <div class="new_th_pic"></div>
          <div class="qiandai"></div>
          <div class="gunlun"></div>
          <div class="shengzi"></div>
          <div class="sheng_shui"></div>
          <div class="ren_top"></div>
          <div class="ren_bottom"></div>
      </div>
     <div class="per_bottom"> 
       <div class="wid">
	      <div class="diannao"></div>
	       <div class="diannao01">
	        <a href="<%=path%>/login.jsp" class="xin_btn01"><strong>注册登录</strong></a>
	        <a class="jiantou_down1"></a>
	        <a href="<%=path%>/anquanshezhi.jsp" class="xin_btn02"><strong>身份认证</strong></a>
	        <a class="jiantou_down2"></a>
	        <a href="<%=path%>/gate/recharge" class="xin_btn03"><strong>投资充值</strong></a>
	        <a class="jiantou_down3"></a>
	        <a href="<%=path%>/gate/service" class="xin_btn04"><strong>坐享收益</strong></a>	      
	      </div> 
	    </div>
    </div>
</div>


<!-- content end -->
<!-- absolute_right start -->
	  <%-- <%@ include file="/includes/absolute.jsp" %> --%>
<!-- absolute_right end -->
<div class="absolute_right" style="height:180px;">
      <div style="width:50px; height:50px; bottom:10%">
        <span class="absolute_bac1"><a href="#" >返回顶部</a></span>
      </div>
      
      
   
      <div style="display:none">
        <span class="absolute_bac4"><a href="#" >意见反馈</a></span>
      </div>      
    </div>
</body>
</html>

<script type="text/javascript">
      $(function(){
    	  var timer=null;
    	  var num=-100;
    	  var add=200;
    	  var top= -850; 
    	  var s=-1;
    	  $(window).on('scroll',function(){
    		 man();
    	  });     	 
    	 function man(){
    		 var scrolltop=$(window).scrollTop();  		 	 
    		     /* if(top<0){
    		    	 if(scrolltop>s){   		    		  
    		    		  top+=8;
    	    		    }else{
    	    		     // top--;
    	    		    }
    	    			s=scrolltop; 			
     			//$(".qiandai").text(scrolltop);
     		
     		  }else{
     			  top=0
     		  }  */
     		  		  
    		// down();	 
     		  
     		  if(scrolltop>500){
     			  
     			//setInterval(down,3000);  
     			//timer=setInterval(down,1000);
	     		/* 	var rentop=$(".ren_top").css("top");
	     			 if(rentop>=500){
	     				//clearInterval(timer);
	     				rentop=500;
	     			} 
     			 $(".new_th_title2").text(rentop);
     			 $(window).off('scroll',function(){
     	    		 
     	    	 });
     			   */
     			  var rentop=$(".ren_top").css("top");
     			  $(".ren_top").animate({top:"550px"},8000,function(){
     				 $(".ren_top").css("display","none");
     				 $(".ren_bottom").css("display","block")
     			  });
     			  $(".sheng_shui").animate({height:"850px"},8000)
     			  function stop(){
     				// $(".ren_top").css("display","none")
     			  }
     			   //$(".ren_top").css("display","none")
     			 
     			  //$(".ren_bottom").css("display","block")
     			   /* if($(".ren_top").css("top")>=500){
     				  $(".ren_top").stop();
     			   } */
     			 //$("#box").animate({height:"300px"});
     			   
     			   
     		  }
     		  
     		  
    	 } 
    	   function down(){    		 
     		 $(".ren_top").css("top",num);
     		  $(".sheng_shui").css("height",add);     		 
     		//  $(".top_line").css("top",top);
     		 
     		 // top+=5;
     		 //  if(top>=0){
     		 //  top=0;
     		 // }     		      
     		      num++;
     		      add++;

     	  }
    	   
    	   
    	   $(".xin_btn01").mouseover(function(){
    		   $(this).css('background','url(<%=path%>/img/images-2014-11/xin_btn1_1.png) 0px -10px no-repeat')
    	   }).mouseout(function(){
    		   $(this).css('background','url(<%=path%>/img/images-2014-11/xin_btn1.png) 0px -10px no-repeat')
    		   
    	   });
    	   $(".xin_btn02").mouseover(function(){
    		   $(this).css('background','url(<%=path%>/img/images-2014-11/xin_btn2_2.png) 0px -10px no-repeat')
    	   }).mouseout(function(){
    		   $(this).css('background','url(<%=path%>/img/images-2014-11/xin_btn2.png) 0px -10px no-repeat')
    		   
    	   });
    	   $(".xin_btn03").mouseover(function(){
    		   $(this).css('background','url(<%=path%>/img/images-2014-11/xin_btn3_3.png) 0px -10px no-repeat')
    	   }).mouseout(function(){
    		   $(this).css('background','url(<%=path%>/img/images-2014-11/xin_btn3.png) 0px -10px no-repeat')
    		   
    	   });
    	   $(".xin_btn04").mouseover(function(){
    		   $(this).css('background','url(<%=path%>/img/images-2014-11/xin_btn4_4.png) 0px -10px no-repeat')
    	   }).mouseout(function(){
    		   $(this).css('background','url(<%=path%>/img/images-2014-11/xin_btn4.png) 0px -10px no-repeat')
    		   
    	   });
    	 
      })
      
</script>
 <script type="text/javascript">
       
    $(document).ready(function(){
    $(".absolute_bac1").hide();
    $(".absolute_right a").hide();
    $(".absolute_right span").mouseover(function(){
       $(this).children().show();

   }).mouseout(function(){
       $(this).children().css("display","none");
   });
       $(".absolute_bac2").mouseover(function(){
         $(this).siblings(".erweima_bac").show();
       }).mouseout(function(){
         $(this).siblings(".erweima_bac").hide();
       });
	$(window).on('scroll', function(){
       if($(window).scrollTop()<500){
           $(".absolute_bac1").hide();
       }
       if($(window).scrollTop()>=500){
           $(".absolute_bac1").show(); 
       }
     });
           $(".absolute_bac1").click(function(){
              $("html,body").animate({scrollTop:0},500);  		            
           });	 
    }); 
    </script>
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fb22f51366ffad7f2637952d4acb0eade' type='text/javascript'%3E%3C/script%3E"));
</script>
