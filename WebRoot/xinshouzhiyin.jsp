<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ include file="/includes/taglibs.jsp" %>

<title>我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  

</head>

<body>

<!-- content start -->
 <div class="new_person"> 
      <div class="new_fir">
	       <div class="new_top">
	        <span>关于中租宝</span>
	        <div class="top_line"></div>
	       </div>
	      <div class="msg_zhong">
	        <p>中租宝，是中投汇融投资管理有限公司旗下的众筹网络平台</p>
	        <p><strong>中投汇融</strong>是国内首批P2B（微信托） 领域的财富投资管理公司。我们汇集了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台。
            </p>
            <p class="def"></p>
            <p class="abc"></p>
	        <p>中租宝开创了P2B的2.0新时代，首次提出高标准、严要求挑选合作伙伴，只接受优质担保机构（信用评级A+级以上，政府重点扶持项目）企业的银行级理财项目，并有专家风控团队，为投资者提供100%本息保障，最高超过银行活期同期存款30倍的高收益理财项目。通过中租宝，您可以将手中富余资金出借给盈利能力强的中小企业，并获得高收益的利息回报，分享企业高速发展的红利。
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
	      <div class="diannao"></div>
	      <div class="diannao01">
	        <a href="<%=path%>/login.jsp" class="left_wd_yel">注册登录</a>
	        <a>身份认证</a>
	        <a>投资充值</a>
	        <a>坐享收益</a>	      
	      </div>
      </div>
</div>


<!-- content end -->
<!-- absolute_right start -->
	<%-- <%@ include file="/includes/absolute.jsp" %> --%>
<!-- absolute_right end -->

</body>
<script type="text/javascript">
      $(function(){
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

     			
     			//$(".abc").text(scrolltop/50);
     			//$(".def").text(scrolltop);
     		
     		  }else{
     			  top=0
     		  }  */
     		  		  
    		// down();	 
     		  
     		  //if()
     		  
     		  
    	 } 
    	   function down(){    		 
     		  $(".ren_top").css("top",num);
     		  $(".sheng_shui").css("height",add);     		 
     		  $(".top_line").css("top",top);
     		 
     		 // top+=5;
     		 //  if(top>=0){
     		 //  top=0;
     		 // }
     		      
     		     // num++;
     		     // add++;

     	  }
    	 
      })
      
</script>
</html>