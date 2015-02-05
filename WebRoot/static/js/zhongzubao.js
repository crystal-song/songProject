
/*index*/
$(document).ready(function(e){
	var navIndex=0;  
	$(".nav_big a").eq(0).addClass("bd_btom").siblings().removeClass("bd_btom");
	$(".nav_big a").eq(0).children("p").addClass("headwd_color")
		
	$(".news_title li").click(function(){
		        var index= $(this).index();
		        $(this).addClass('news_title_bac').siblings().removeClass('news_title_bac');
		        $(".news_label ul").eq(index).css("display","block").siblings().css("display","none")
	});	 
		 $(".open_time").each(function(i, e){		
			var stars=e.id.split("_");
			var val01=e.value;
			val01=val01.substr(0,val01.length-2);
			var time_id=stars[2];
			var time_new=val01.replace(/\-/g,"/");	
			var pro_status=$(this).siblings(".floor_num").children(".aim").children(".pro_status").text();
			 if(pro_status=="预热中"){
	           Forinterval(time_new,time_id);  
			} 
			 if(pro_status=="已满标" || pro_status=="还款中" || pro_status=="已完成" || pro_status=="融资中"){
				 $(this).siblings(".floor_num").children(".floor_img").children(".last_time").css("display","none"); 
			}
			 
			 if(pro_status=="还款中"){
			    	$(this).siblings(".floor_num").children(".aim").children(".pro_status").css("background","#9fa1a1")
			    }
			    else if(pro_status=="已满标"){
			    	$(this).siblings(".floor_num").children(".aim").children(".pro_status").css("background","#ff9900")
		        }	       
		        else if(pro_status=="已完成"){
		        	$(this).siblings(".floor_num").children(".aim").children(".pro_status").css("background","#ccc")
		        }
		        else if(pro_status=="融资中"){
		        	$(this).siblings(".floor_num").children(".aim").children(".pro_status").css("background","#f9b72c")
			    }	
		}); 	            
});
	
	
/*daojishi*/
 
   function getRTime(time_new, time_id){
        var EndTime = new Date(time_new);
        var NowTime = new Date();
        var t =EndTime.getTime() - NowTime.getTime();
        var d=Math.floor(t/1000/60/60/24);        
        var h=Math.floor(t/1000/60/60%24);        
        var m=Math.floor(t/1000/60%60); 
        var s=Math.floor(t/1000%60);  
        if(d+h+m+s==0){
        	  document.location.reload();
         	clearInterval(timer);
         }
        
         $('#t_d_'+time_id).text(d+"天");
         $('#t_h_'+time_id).text(h+"时");
         $('#t_m_'+time_id).text(m+"分");
         $('#t_s_'+time_id).text(s+"秒"); 
         if(d==0 && h<24){
         	$('#t_s_'+time_id).show();
         	$('#t_d_'+time_id).hide();
         	
         }else{
        	$('#t_s_'+time_id).hide()
         }
    }
    function Forinterval(time_new,time_id){
    var timer=	window.setInterval(function(){
    	  getRTime(time_new, time_id);
        }, 1000);
}    