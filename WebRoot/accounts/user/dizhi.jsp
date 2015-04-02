<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mftour.spring.service.IUserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/includes/taglibs.jsp" %> 
<title>我的地址 - 我的账户 - 中租宝</title>

<body>
	
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="black_bac"></div>
<div class="user_con">
    <div class="user_left">
      <!-- user_left start -->
         <%@ include file="/includes/user_info_left.jsp" %>
      <!-- user_left end -->
    </div>
    <div class="user_right">
      <div class="zichan_con checkheight">
              <div class="pro_con_title" style="margin-top: 5px; background:url(/img/images-2014-11/red_line_big.png) 104px 12px no-repeat;">
                <strong>收货地址管理</strong>
              </div>
              <a class="tianjiadizhi"></a>
              <div class="dizhi_msg">
              <a class="add_dizhi"></a>
              <p class="little_head" style="display:none">添加收货地址:</p>                
             </div>
              <div class="clear"> </div>
              <span class="dizhispan"></span>
               
              <div class="fir_title" style="display:none">
			   
					<div class="tianjia">添加地址</div>
					<a id="del" href="javascript:void(0)" class="del_di">删除收货地址</a>
			  </div> 
			  
			  <span class="dizhispan"></span>
		           <div class="dizhi_input dizhi_add">
				      <form action="#" name="d_form" >	      
		                <ul>
		                 <li>
		                    <span>省/直辖市<strong>*</strong></span>
		                    <select id="s_province" name="s_province"></select> 
		                    <span>城市<strong>*</strong></span>		                  
		                    <select id="s_city" name="s_city" ></select> 		            
		                  </li>		                   
		                  <li class="di_hei"><span>详细地址<strong>*</strong></span><textarea id="detail"></textarea></li>
		                  <li><span>邮编<strong>*</strong></span><input type="text" id="code"/></li>
		                  <li><span>收货人姓名<strong>*</strong></span><input type="text" id="name"/></li>
		                  <li><span>手机号码<strong>*</strong></span><input type="text" id="phone"/></li>
		                </ul> 		                		                
		                <div class="chose">   
		                  <a class="subbtn" >确认添加</a> 
		                  <a class="subbtn1" >返回</a>  
		                </div> 
                     </form>		             		             
		           </div>
					   
					<div class="clear"></div>			
					<div class="dizhi_table">
			           <ul>            
			             <li class="fi_li">
			               <span><strong>收件人</strong></span>
			               <span><strong>所在地区</strong></span>
			               <span id="table_wid"><strong>详细地址</strong></span>
			               <span><strong>邮编</strong></span>
			               <span><strong>手机/电话</strong></span>
			               <span><strong>操作</strong></span>
			               <span><strong>默认地址</strong></span>
			             </li>
			             <c:forEach var="a" items="${address}" varStatus="i">
			             <input type="hidden" value="" name="addressid" id="addressid">
			              <li style="height:auto" v="${a.id }" class="add_hide">
			              
			              <div class="msglist">
			               <span class="name_frame name_${a.id }" >${a.name }</span>
			               <span class="province_frame province_${a.id }" >${a.province }</span>
			               <%-- <span>${a.city }</span> --%>
			               <!-- <span id="table_wid">XX小区XX号楼XX单元XX室XX小区XX号楼XX单元XX室</span>   -->
			               <span id="table_wid" class="detail_frame detail_${a.id} " >${a.detail }</span> 			             
			               <span class="code_frame code_${a.id }" >${a.code }</span>
			               <span class="phone_frame phone_${a.id }" >${a.phone }</span>
			               <span><a class="m_green modify_form" >修改</a>|<a id="del"  class="m_green delete" >删除</a></span>
			               <span><input type="radio" name="chbox" class="chbox"></input></span> 
			               </div>    
			                <iframe id="ii_${a.id }" style="display:none; width:700px; height:400px; border:0px; scrolling:no; allowtransparency:true ;background-color:transparent" src="Mform.jsp">
			                
			                </iframe>                       			              			              
	                      </li>	  
	                           <div id="dialog01"  class="dialognew" style="height:170px;">
							<div class="dialog_title">
								<strong>提示</strong>
								<div class="right_cha"></div>
							</div>
							<div class="touzi_text">
								<p class="p_font textpiont"><i class="piont_pic"></i>确定删除吗？</p>
							</div>
							<a class="silbtn" v="${a.id }">确定</a>
							<a class="diabtn1" >取消</a>
	                     </div>              
			            </c:forEach>
			           
			           </ul>
             </div>
										                      
                        
                        
                       <div id="dialog01"  class="dialog_add" style="height:170px;">
							<div class="dialog_title">
								<strong>提示</strong>
								<div class="right_cha"></div>
							</div>
							<div class="touzi_text">
								<p class="p_font textpiont"><i class="piont_pic"></i>添加成功!</p>
							</div>
							<a class="diabtn">确定</a>						
	                   </div> 
    </div>
    <!-- absolute_right start -->
	     <%@ include file="/includes/absolute.jsp" %>
	<!-- absolute_right end -->
</div>
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>

<script class="resources library" src="/js/area.js" type="text/javascript"></script>
<script type="text/javascript">_init_area();area();</script> 

<script type="text/javascript">

			$(".modify_form").click(function(){
				$(this).parent().parent().css("display","none").siblings("iframe").css("display","block");
				var num=$(this).parent().parent().parent().attr("v");
                var name_frame=$(this).parent().siblings(".name_frame").text();
				var detail_frame=$(this).parent().siblings(".detail_frame").text();
				var code_frame=$(this).parent().siblings(".code_frame").text();
				var phone_frame=$(this).parent().siblings(".phone_frame").text();

				 $('#ii_'+num).contents().find("#detail1").val(detail_frame);
				 $('#ii_'+num).contents().find("#name1").val(name_frame);
				 $('#ii_'+num).contents().find("#code1").val(code_frame);
				 $('#ii_'+num).contents().find("#phone1").val(phone_frame);   	
				 $('#ii_'+num).contents().find(".chose").attr("v",num);	
			})		
			
		  $(".delete").click(function(){
			  $(".dialognew").css("display","block")			  
		  })
		  
          $(".delete").click(function(){

				$(".dialognew").css("display","block");
				var delid=$(this).attr('v');
				$(".silbtn").attr("v",delid);
				
			}) 
			

		 
		 $(".silbtn").click(function(){		
			 $.ajax({
				   type: "POST",
				   url: "/hero/del/address",
				   data: {"id": $(this).attr("v")},
				   success: function(msg){				     
				     location.reload();  
				   }
		
				});
			 
		 });

		 
			$(".u_left_sec:eq(0) li:eq(4)").children("a").css(
					"color", "#fc652e");
			$(".nav_big a").eq(2).addClass("bd_btom").siblings()
					.removeClass("bd_btom");
			$(".nav_big a").eq(2).children("p").addClass(
					"headwd_color");
			
			$(".add_dizhi").click(function(){				
	    		$(".dizhi_add").css("display","block")
	    		$(this).hide();
	    		$(".little_head").css("display","block");
	    	})
	    	
			$(".dizhi div")
					.click(
							function() {
								$("#addressid").val($(this).attr("v"));
								$(this)
										.css("background",
												"url(/img/images-2014-11/kuang.jpg)  no-repeat");
								$(this)
										.siblings()
										.css("background",
												"url(/img/images-2014-11/kuang1.jpg)  no-repeat");
								
							})
			$(".j_radio02").click (
					function() {
						$("#rewardid").val($(this).attr("v"));
						$("#rewardamount").val($(this).attr("price"));
						$("#delivery_price").val($(this).attr("delivery_price"));
						$(this).parent().siblings(".jcon_sec").css(
								"display", "none");
						$(this).siblings(".rechose").css("display",
								"block")
					});
			$(".j_radio01").click (
					function() {
						$("#rewardid").val("");
						$("#rewardamount").val("");
						$("#delivery_price").val("");
						$(".jcon_fir").show();
						$(this).parent().siblings(".jcon_sec").css(
								"display", "none");
						$(this).siblings(".rechose").css("display",
								"block")
					});
			
			$(".rechose").click(
					function() {
						$(this).parent().siblings(".jcon_sec").css(
								"display", "block");
						$(this).css("display", "none")

					});
			
			$(".tianjia").click(function() {
				$(".xinzeng").slideToggle()
			});
		
			
			$(".subbtn").click(function(){
				
				if($("#s_province").val() == "" ||  $("#s_city").val() =="" || $("#name").val() == "" ||
						$("#detail").val() == "" ||
						$("#code").val() == "" ||
						$("#phone").val() == "" ){
					alert("请填写所有信息");
					return false;
				}
				$.ajax("/hero/add/address",
						{"data":{province: $("#s_province").val(),
							    city: $("#s_city").val(),
							    name: $("#name").val(),
							    detail: $("#detail").val(),
							    code: $("#code").val(),
							    phone: $("#phone").val()},
					    "type": "POST",
					    "success":function(data){
					    	
					    } 
					    }).done(function(data){
					    	if (data==="login"){
					    		alert("请登录");
					    		return false;
					    	}
					    	$(".dialog_add").css("display","block");
					    	$(".black_bac").css("display","block");
					    
					    	});
			});
		
			 
		
			
			$(".subbtn1").click(function(){
				$(".dizhi_add").css("display","none");
				$(".little_head").css("display","none");
				$(".add_dizhi").css("display","block")				 
			})
			
			$(".reback").click(function(){
				var dizhi_p=$(this).parent().parent().parent(".dizhi_input");
				dizhi_p.css("display","none")
				dizhi_p.siblings(".msglist").css("display","block");
				
			})
		
			$(".diabtn").click(function(){
				location.reload();
			})
		
			
			
	
</script>
 

