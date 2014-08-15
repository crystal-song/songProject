<%@ page language="java"  pageEncoding="UTF-8"%>
<!-- 焦点图 -->
<div class="banner_bg">
	<div class="banner_fra">
		<ul class="ban_show">
	          <li><img src="<%=path%>/img/banner1-3.jpg" width="1400" height="300" /></li>
	          <li style="display:none"><img src="<%=path%>/img/banner1-5.jpg" width="1400" height="300" /></li>
	          <li style="display:none"><img src="<%=path%>/img/banner1-1.jpg" width="1400" height="300" /></li>
	     </ul>
	     <ol>
	       <li class="current"></li>
	       <li></li>
	       <li></li>
	     </ol>
	    <div class="ban_left" style="display:none"></div>
	    <div class="ban_right" style="display:none"></div>
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
		 //console.log(num);	
		  $('.banner_fra ul li').eq(num).hide().fadeIn().siblings().hide();   
		  $('.banner_fra ol li').eq(num).addClass('current').siblings().removeClass('current');
		   num++; 
		   }
	   $(".banner_fra ol li").mouseover(function(e){
               var index=$(this).index();
			   
       		 $('.banner_fra ul li').eq(index).hide().fadeIn().siblings().hide();  
			 $('.banner_fra ol li').eq(index).addClass('current').siblings().removeClass('current');
			 
		   });   
	   $(".banner_fra ol li").mouseover(function(e){
		       clearInterval(timer);		   
		   }).mouseout(function(e){
			   clearInterval(timer);
			   timer=setInterval(autoplay,3000)
			   });   
	   $(".banner_fra").mouseover(function(e){
		    $(".ban_left").css('display','block'); 
		    $(".ban_right").css('display','block');
			
		   }).mouseout(function(e){
		    $(".ban_left").css('display','none'); 
		    $(".ban_right").css('display','none');
			
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

