<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%@ include file="/includes/taglibs.jsp"%>

<title></title>

</head>
<body>

<div class="dizhi_input xiugai" style="display:block">
						    <form action="#" name="d_form" >						      
				                <ul class="rechange">
				                  <li>
				                    <span>省/直辖市<strong>*</strong></span>
				                    <select id="s_province" name="s_province"></select> 
				                    <span>城市<strong>*</strong></span>		                  
				                    <select id="s_city" name="s_city" ></select> 		            
				                  </li> 		                   
				                  <li class="di_hei"><span>详细地址<strong>*</strong></span><textarea id="detail1" v="">${a.detail }</textarea></li>
				                  <li><span>邮编<strong>*</strong></span><input type="text"  id="code1"  v="" value="${a.code }"/></li>
				                  <li><span>收货人姓名<strong>*</strong></span><input type="text" id="name1" v="" value="${a.name }"/></li>
				                  <li><span>手机号码<strong>*</strong></span><input type="text" id="phone1"  v=""  value="${a.phone }"/></li>
				                </ul> 		                		                
				                <div class="chose" v="">   
				                  <a class="subbtn_add">确认修改</a> 
				                  <a class="subbtn1 reback" >返回</a>  
				                </div>          				                
		                     </form>		             		             
</div> 

</body>
</html>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script> 
<script class="resources library" src="/js/area.js" type="text/javascript"></script>
<script type="text/javascript">_init_area();area();</script> 
<script>


$(".subbtn_add").click(function(){
	
    var index=$(this).parent().attr("v");       
	var province=$("#s_province").val();
	var city=$("#s_city").val();
	var detail=$("#detail1").val();
	var code=$("#code1").val();
	var name=$("#name1").val();
	var phone=$("#phone1").val();
		  
	$(".province_"+index, window.parent.document).text(province);
	$(".name_"+index, window.parent.document).text(name);
    $(".detail_"+index, window.parent.document).text(detail);
    $(".phone_"+index, window.parent.document).text(phone);   
    $(".code_"+index, window.parent.document).text(code);
	$(window.parent.$("#ii_"+index).css("display","none")); 
	$(window.parent.$(".msglist").css("display","block"));

});
	
   

</script>


