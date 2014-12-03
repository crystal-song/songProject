<%@ page language="java"  pageEncoding="UTF-8"%>
<div class="absolute_right">
      <div style="display:none">
        <span class="absolute_bac3"><a href="<%=path%>/contact.jsp" >联系客服</a></span>
      </div>
      <div style="display:none">
        <span class="absolute_bac2"><a href="#" >扫二维码</a></span>
        <div class="erweima_bac">
          <div class="erweima_big">            
          </div>
          <div class="erweima_small"></div>
        </div>
      </div>   
      <div style="display:none">
        <span class="absolute_bac4"><a href="#" >意见反馈</a></span>
      </div>
      
      <div>
        <span class="absolute_bac1"><a href="#" >返回顶部</a></span>
      </div>
    </div>
    
    <script type="text/javascript">
       
    $(document).ready(function(){
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