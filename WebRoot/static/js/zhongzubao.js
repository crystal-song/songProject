
(function(){

	
	

//index.jsp
	/*定时器*/
	$(".nav_big a").eq(head_index).addClass("bd_btom").siblings().removeClass("bd_btom");
	$(".nav_big a").eq(head_index).children("p").addClass("headwd_color");
		
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
			var pro_status01=$(this).siblings(".floor_num01").children(".aim01").children(".pro_status").text();
			var statusLabel=$(this).siblings(".floor_num").children(".aim").children(".pro_status");
			var statusLabel01=$(this).siblings(".floor_num01").children(".aim01").children(".pro_status");
			 if(pro_status=="预热中" || pro_status01=="预热中")	{			
				 $(this).siblings(".floor_num").children(".floor_img").children(".last_time").css("display","block"); 
				 $(this).siblings(".floor_num01").children(".floor_img01").children(".last_time01").css("display","block");
	             Forinterval(time_new,time_id);  
			} 
			 
			    if(pro_status=="还款中" || pro_status01=="还款中"){
				    statusLabel.css("background","#9fa1a1");
				    statusLabel01.css("background","#9fa1a1");
			    }
			    else if(pro_status=="已满标" || pro_status01=="已满标"){
			    	statusLabel.css("background","#ff9900");
			    	statusLabel01.css("background","#ff9900");
		        }	       
		        else if(pro_status=="已完成" || pro_status01=="已完成"){
		        	statusLabel.css("background","#ccc");
		        	statusLabel01.css("background","#ccc");
		        }
		        else if(pro_status=="融资中" || pro_status01=="融资中"){
		        	statusLabel.css("background","#f9b72c");
		        	statusLabel01.css("background","#f9b72c");
		        }	
		}); 	 

	
		 function getRTime(time_new, time_id){
		        var EndTime = new Date(time_new);
		        var NowTime = new Date();
		        var t =EndTime.getTime() - NowTime.getTime();
		        var d=Math.floor(t/1000/60/60/24);        
		        var h=Math.floor(t/1000/60/60%24);        
		        var m=Math.floor(t/1000/60%60); 
		        var s=Math.floor(t/1000%60);  
		        if(d+h+m+s==0){
		        	$(".last_time").css("display","none");
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
		    
		    
		    //--------banner焦点图幻灯片------//
		  	   var timer=null;
				   var num=1;
				   timer=setInterval(autoplay,3000);
				   function autoplay(nn){
					 if(nn!=null)num=nn+num;
					 if(num>=3){num=0}
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
						   timer=setInterval(autoplay,3000);
						   });
				   
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
		   
            //------header------//
				   
					$(".username_fir").mouseover(function(){
					       $(".tuichu_fir").show();
					       $(".tuichu_fir").mouseover(function(){
					      	  $(this).show();
					        });
					      }).mouseout(function(){
					       $(".tuichu_fir").hide();
					      });
					      $(".tuichu_fir").mouseover(function(){
					      $(this).show();
					      }).mouseout(function(){
					      $(this).hide();
					      }); 
				   
				   
/*touzi.jsp*/	 
	
		    $(".right_lable li").click(function(){
		        var index = $(this).index();
		        $(this).addClass('right_lable_red').siblings().removeClass('right_lable_red');
		        $(".touzi_cont div.con_list").eq(index).css("display","block").siblings().css("display","none");
		      });
		 
		      

		      
/*touzixiangxi.jsp*/		 
		 
		      
		     /*验证输入的投资金额是否正确*/
		      $("#buyAmount").keyup(function(){
				  
				    var str= /^[0-9]*$/;
				    var val=$("#buyAmount").val();
				    
				    
				    if(!(str.test(val))){  	   
						   $('.neirong').html("您输入的金额不是数字,请重新输入");
						   return false;
					    }
				    $('.neirong').css('display','block');
			
				    if(!(str.test(val))){  	   
						   $('.neirong').html("您输入的金额不是数字,请重新输入");
						   return false;
					    }
					    if(val<200){
						   $('.neirong').html("您输入的金额小于200元,请重新输入");
						   return false;
					    }
					    if(val>touzi_money){
							   $('.neirong').html("您的投资金额大于可投资投资金额");
							   return false;
						    }
					    if(parseInt(val)%100!=0){	
						  $('.neirong').html("输入的资金必须是100的整数倍");
						  return false;
						   }
					      $('.neirong').html('您要投入的实际金额为:'+val);	   
			 
			 });	
		 		
		      
		      /*获取投资额焦点*/		      
		      $("#buyAmount").focus(function(){
		    	 	var tixian_val=$("#buyAmount").val();
		    	 	$("#buyAmount").val("");	  	
		    	 });
		      /*导航浮动*/
		      function checkText(){
		           var top = parseInt($(this).scrollTop());
		           if(top>nav_height){
		              $(".small_nav").addClass("text");
		           }else if($(".small_nav").hasClass('text')&&(top!=nav_height)){
		              $(".small_nav").removeClass("text");
		           }
		       }
		     /*计算器*/
				$(".jisuan_btn_left").click(function(){
					  $("#preview_amount").val(200);
					  $("#preview_income").html(0+"元");
					  
					   
				  });
		     
				
			/*投资收益表鼠标滑动显示*/	
			 	$(".syl_table").hover(function(){
			 		$(this).css("height","auto");
			 	},function(){
			 		$(this).css("height","60px");
			 	});
		      
			/*导航浮动*/ 	
			     $(".small_nav li").click(function(){
			           var i=$(this).index();
			           var top = parseInt($(this).scrollTop());
			           var title_top=parseInt($('.pro_con_title').eq(i).offset().top);
			           var small_height=$(".small_nav").height();
			           $(".small_nav").addClass("text");
			           $(this).addClass('sm_nav_fir').siblings().removeClass('sm_nav_fir');
			           $(window).scrollTop(title_top-small_height-50);
			      });
			/*计算器*/     
			 	 $(".jisuan").click(function(){
			 		 $("#dialog01").css("display","block");		 
			 	 });			 	 
			 	$(".right_cha").click(function(){
			 		 $("#dialog01").css("display","none");
					 $(".newye").css("display","none")
					 window.location.reload(true);		
				 }) 				 
				 $(".diabtn").click(function(){
					 $(".newye").css("display","none")
					 window.location.reload(true);
				 }) 
				 
/*touzicheck*/	
				 
			//-----50元礼券复选框----//
				 
				 $("#reward").click(function(){
					  $(".fukuan").css("display","block");
					  var real_fukuan=$("#paymentAmount").val()
					  $(".border_none").val(real_fukuan-50+"元")
				   });	
			 	
				   $(".right_cha").click(function(){
					   window.location.reload(true);
			      });
				   
				   $("#paymentAmount").keyup(function(){
					   var payment=$(this).val();
					   var payment=$(this).val();		   
					   document.getElementById("mysubmit_btn").disabled=true;   

						if(payment!=parseInt(payment)){
							$(".liquan_y").text("投资金额必须为整数！");
							return false;
					    } 				
						else if(parseInt(payment) < 200){
					        $(".liquan_y").text("投资金额必须大于200！");
					        return false;
					    }		   
						else if(parseInt(payment)%100!=0){
							$(".liquan_y").text("投资金额必须为100的整数倍！");
							return false;			
						}else{
							document.getElementById("mysubmit_btn").disabled=false;
							$(".liquan_y").text("投资满3000元可使用礼券！");
						} 
					   
					   if($(this).val()<3000){									  
					     	$(".liquan_hide").css("display","none")						     	
					 	  }  else{
					 		$(".liquan_hide").css("display","block");
					 		if($(".liquan_check").val()==""){
						    	   $(".liquan_hide").css("display","none")
						      }
					 	  }						  
				   });	
				   
				   if($("#paymentAmount").val()<3000 || $(".liquan_check").val()==""){
				       	$(".liquan_hide").css("display","none"); 	       
			    	}  	 
		   
			       	
})()



     