<%@ page language="java"  pageEncoding="UTF-8"%>
<!-- 焦点图 -->
<div class="banner_bg">
    <div class="banner_fra">
     <ul class="ban_show">
          <li class="a1"><img src="<%=path%>/img/banner02.gif" width="1100" height="300" /></li>
          <li style="display:none"><img src="<%=path%>/img/banner01.jpg" width="1100" height="300" /></li>
          <li style="display:none" style="background:url(img/banner01.jpg) no-repeat"><img src="<%=path%>/img/banner03.gif" width="1100" height="300" /></li>
     </ul>
     <ol>
       <li class="current"></li>
       <li></li>
       <li></li>
     </ol>
  <div class="ban_left" ></div>
  <div class="ban_right" ></div> 
  </div>

    
    
</div>

<script type="text/javascript">
//焦点图代码

	   
	   $(function(){
		   var timer=null;
		   var num=1;
		   timer=setInterval(autoplay,3000);
		   function autoplay(nn){
			   if(nn!=null)num=nn+num;
			 if(num>2){num=0}
			 if(num<0){num=2}
			  $('.banner_fra ul li').eq(num).hide().fadeIn().siblings().hide();   
			  $('.banner_fra ol li').eq(num).addClass('current').siblings().removeClass('current');
			   num++; 
			   }

		   $(".banner_fra ol li").mouseover(function(e){
	               var index=$(this).index();
	               clearInterval(timer);
	       		 $('.banner_fra ul li').eq(index).hide().fadeIn().stop(true,true).siblings().hide();  
				 $('.banner_fra ol li').eq(index).addClass('current').siblings().removeClass('current');
			   }).mouseout(function(e){
				   clearInterval(timer);
				   timer=setInterval(autoplay,3000)
				   });;
		   
		   $(".ban_right").click(function(){
			  
			   autoplay(0);
			   clearInterval(timer);
				timer=setInterval(autoplay,3000)
			   });
		   $(".ban_left").click(function(){
			   var index=$('.banner_fra ul li').index();
			   autoplay(-2);
			   clearInterval(timer);
				timer=setInterval(autoplay,3000)
			   });
		   });

//焦点图代码结束

</script>

