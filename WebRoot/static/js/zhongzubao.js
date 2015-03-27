
(function(){

	
	

//index.jsp
	/*定时器*/
	//$(".nav_big a").eq(head_index).addClass("bd_btom").siblings().removeClass("bd_btom");
	//$(".nav_big a").eq(head_index).children("p").addClass("headwd_color");
		
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
				   
				    $(".top li:eq(0)").mouseover(function(){
				          $(".list01").css("display","block")		    	
				    }).mouseout(function(){
				    	  $(".list01").css("display","none")
				    	
				    });
				    $(".top li:eq(1)").mouseover(function(){
				          $(".list02").css("display","block")		    	
				    }).mouseout(function(){
				    	  $(".list02").css("display","none")
				    	
				    });
				   
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
					 $(".newye").css("display","none");
					 $(".black_bac").css("display","none");
					// window.location.reload();
					 //location.reload();
				 }) 				 
				 $(".diabtn").click(function(){
					 $(".newye").css("display","none");
					 $(".black_bac").css("display","none");
					// window.location.reload();
					 //location.reload();
				 }) 
				 
/*touzicheck*/	
				 
			//-----50元礼券复选框----//
				 
				 $("#reward").click(function(){
					  $(".fukuan").css("display","block");
					  var real_fukuan=$("#paymentAmount").val()
					  $(".border_none").val(real_fukuan-50+"元")
				   });	
			 	
				  
				   var acc_m=$("#validmoney").val();
				   var vcc_tr= $("#valid_trans").val()
				   $("#paymentAmount").keyup(function(){
					   var payment=$(this).val();
					   	   
					   document.getElementById("mysubmit_btn").disabled=true;   
					   if(payment==""){
							$(".liquan_y").text("投资金额不能为空！");
							return false;
					    }
					  					   					   
					   else if(payment!=parseInt(payment)){
							$(".liquan_y").text("投资金额必须为整数！");
							return false;
					    } 				
						else if(parseInt(payment) < 200){
					        $(".liquan_y").text("投资金额必须大于等于200！");
					        return false;
					    }
						else if(parseInt(payment)>vcc_tr){
						    $(".liquan_y").text("投资金额不能超过您的项目的目标投资金额！");
							return false;
							   
						}
						else if(parseInt(payment)>acc_m || parseInt(payment)>=2100000000){
						    $(".liquan_y").text("投资金额不能超过您的账户余额！");
							return false;
							   
						}
						else if(parseInt(payment)%100!=0){
							$(".liquan_y").text("投资金额必须为100的整数倍！");
							return false;	
							}

						else{
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
		  //userleft
				   
				   $(".u_left_mian").click(function(){    	
				    	  $(this).addClass('u_left_red').parent().siblings().children(".u_left_mian").removeClass("u_left_red");
				    	  $(this).parent().siblings().children(".u_left_sec").slideUp();
				    	  $(this).siblings().slideToggle("slow");
				   });
				   var indexs
				   
				   if(indexs!=null){
				          $(".u_left_mian").eq(indexs).addClass("u_left_red").parent().siblings().children(".u_left_mian").removeClass("u_left_red");
				    	  $(".u_left_mian").eq(indexs).siblings(".u_left_sec").css("display","block");
				    		
				   }	   
		 //anquanshezhi	   
				   
				   $(".anquan_right").click(function(){        	
			            $(this).parent().siblings(".anquan_hide").slideToggle();            
			            if($(this).text()=="认证"){

			               $(this).text("取消认证");

			            }else if($(this).text()=="取消认证"){
			              $(this).text("认证");
			            }
			            
			            if($(this).text()=="修改"){

			                $(this).text("取消修改");

			             }else if($(this).text()=="取消修改"){
			               $(this).text("修改");
			             }
			            
			         }); 
				   
				   
				   
				   
				   $(".anquan_hide_btn").click(function(){
				       	  $(this).parent().parent().parent().hide().siblings(".tijiao_checkok").show(); 
				       	  $(this).parent().parent().parent().parent().siblings(".anquan_label").children(".yishe").css("display","block").siblings(".anquan_right").css("display","none");
				        });
				         
				         $(".anquan_hide input").blur(function(){
				        	 var val=$(this).val();                	        	 
				        	 if($(this).is("#answer")){
				       		  
				       		  if(val==""){
				       			  $(this).parent().siblings(".tishitext").text("您输入的答案为空！请重新输入");      			  
				       		  }       		  
				       	  }
			        	 if( $(this).is('#phone') ){
			         		
			         		if(val==""){
			         			$(this).parent().siblings(".tishitext").text("您的手机号为空，请重新填写。"); 	 
			         		 }else if(val.length!=11){
			         			$(this).parent().siblings(".tishitext").text("您的手机号填写不正确，请重新填写。"); 
			         		 }else{
			         			$(this).parent().siblings(".tishitext").text("您的手机号填写正确。").css("color","#169616"); 
			         		 } 
			         	 }          	       	 
			        	 
			        	 if($(this).is('#realName')){
			        		 var Expression=/[^\u4E00-\u9FA5]/;  
			        		 if(val==""){         			  
			         			  $(this).parent().siblings(".tishitext").text("您的姓名为空。");                     	 	                			
			         		 }else if(Expression.test(val)){
			         			 $(this).parent().siblings(".tishitext").text("您的姓名不正确！请重新填写。"); 
			         		 }else{         			
			         			  $(this).parent().siblings(".tishitext").text("您的姓名填写正确。").css("color","#169616");     		 
			         		      }  
			        		 
			         	     function checkusername(val){            	    	          	     
			         	    	       	    	
			         	    	  if(Expression.test(val)==true){           	    		        	    	
			         	    		return true;          	    		
			         	    	}         	    	
			         	      	  else{             	    	
			         	    	    return false;          	    	  
			         	    	}          	    	
			         	     } 				  				  		  
					}
			        		        	      	 
			        	 if($(this).is('#identityCard')){
			        		 var reg = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;  
							  if($('#identityCard').val()==""){

								   $(this).parent().siblings(".tishitext").text("您的身份证为空。");
								   return false;
								  }				  				  
							  else if(!reg.test($('#identityCard').val())){
			                      $(this).parent().siblings(".tishitext").text("您的身份证填写不正确。");
								   return false;      
			        		 }else{
			                      $(this).parent().siblings(".tishitext").text("您的身份证填写正确。").css("color","#169616");
								   return true;      
			        		 }   				  				  
							  			  				  				 
						  }
			        	         	 
			        	 if($(this).is('#mail')){				 
							   var cc= /^([a-zA-Z0-9]|[._])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;				  
							      if($('#mail').val()==""){
			      			    	$(this).parent().siblings(".tishitext").text("您的邮箱为空！请重新填写。");     
			      			    	return false;
			      			    } else if (!(cc.test($('#mail').val()))){        			    	
			      			    	$(this).parent().siblings(".tishitext").text("您的邮箱格式不正确！请重新填写。");     
			      			    	return false;        				      			         				
			      			  }else{       			           				  
			      				   $(this).parent().siblings(".tishitext").text("您的邮箱填写正确。").css("color","#169616");
			      				      
			      				    return true;        			
			      			  }				  
						}      	 
			        	 if( $(this).is('#file01') ){
			         		
			         		if(val==""){
			         			$(this).parent().siblings(".tishitext").text("您的正面证件照为空。"); 
			         		 }else{
			         			$(this).parent().siblings(".tishitext").text("您的正面证件照上传成功。"); 
			         		 } 
			         	 }
			        	 
			        	 
			        	 if( $(this).is('#file02') ){
			          		
			          		if(val==""){
			          			$(this).parent().siblings(".tishitext").text("您的背面证件照为空。");  
			          		 }else{
			          			$(this).parent().siblings(".tishitext").text("您的背面证件照上传成功。"); 
			          		 } 
			          	 }
				          	      	 
		        	  if($(this).is('#newpassword')){				   	   				
							var ps = $("#password").val();
							var pas = $("#newpassword").val();
							if(ps=="" || pas==""){						
							  $(this).parent().siblings(".tishitext").text("您的密码为空。");
								  return false;
							}else if(ps!=pas){

					          $(this).parent().siblings(".tishitext").text("兩次輸入的密碼不一致。");
								 return false;
							}else{						
							  $(this).parent().siblings(".tishitext").text("您的密码输入正确").css("color","#169616");
								  return true;
		                       }
					 }
		                   	  
	        	    if($(this).is('#new_zhifu_password')){	   				
						var ps01 = $("#zhifu_password").val();
						var pas01 = $("#new_zhifu_password").val();					
						if(ps01=="" || pas01==""){						
						  $(this).parent().siblings(".tishitext").text("您的密码为空。");
							  return false;
						}else if(ps01!=pas01){
				          $(this).parent().siblings(".tishitext").text("兩次輸入的密码输入不一致。");
							 return false;
						}else if(ps01==pas01){						
						  $(this).parent().siblings(".tishitext").text("兩次輸入一致。");
							  return true;
	                     }
				     }
		         });
				                  
				         
	    //absolute
				         
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
		//baozhang
				                
				                
	                $(".news_ul li").click(function(e){
	                    var index=$(this).index();
	                    $(this).children("div").addClass("news_wd_color");
	                    $(this).siblings().children("div").removeClass("news_wd_color");
	                    $(".news_right ul").eq(index).css("display","block").siblings().css("display","none");
	                 });
	                    var news_height= $(".news_right").height();   
	                    var left_height= $(".news_left").height();
	                  if(news_height>260){    	
	                  	$(".user_con_news").css("height",news_height+100);
	                  }
	                  var newsid=$(".newsId").val();	
		
		//faqixiangmu
		                  
		                  
                  $(".webside li").click(function(){    	 
                      $(this).children(".news_list_hide").slideToggle();
                    });
                    
                    $(".daohang a").click(function(){
                        var index= $(this).index();
                        $(this).addClass('daohang_bac').siblings().removeClass('daohang_bac');
                        $(".webside").eq(index).css("display","block").siblings(".webside").css("display","none")
                    }); 
                    
        //zichan            
                   	var ta=parseInt($("#balance_info").html());
                	var aa=parseInt($("#availableAmount_info").html());
                	var fa=parseInt($("#freezeAmount_info").html());
                	if(ta==0){
            	    	$("#availableAmount_bar").css("width","1%");
            	    	$("#freezeAmount_bar").css("width","1%");
                	}else{
            	    	$("#availableAmount_bar").css("width",aa/ta*100+"%");
            	    	$("#freezeAmount_bar").css("width",fa/ta*100+"%");
                	}
                    
		                  
})()
















     