<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mftour.spring.service.IUserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="/erp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的地址 - 我的账户 - 中租宝</title>
<link href="/css/style-2014-11.css?v=${sessionScope.version}" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/sms.js" ></script>
<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="user_con">
    <div class="user_left">
      <!-- user_left start -->
         <%@ include file="/includes/user_info_left.jsp" %>
      <!-- user_left end -->
    </div>
    <div class="user_right">
 
      <div class="zichan_con checkheight">     
         <div class="pro_con_title" style="margin-top: 5px; background:url(../img/images-2014-11/red_line_big.png) 104px 12px no-repeat;">
                <strong>收货地址管理</strong>
         </div>
         <a class="tianjiadizhi"></a>
         <div class="dizhi_msg">
           <a class="add_dizhi"></a>
           <p class="little_head" style="display:none">添加收货地址:</p>                
         </div>
         
         <div class="dizhi_input">
            <form action="#" name="d_form" >
                <ul>
                  <li>
                    <span>省/直辖市<strong>*</strong></span>
                    <select id="s_province" name="s_province"></select>
                    <span>城市<strong>*</strong></span>
                    <select id="s_city" name="s_city" ></select> 
                    <span>地区<strong>*</strong></span>
                    <select id="s_county" name="s_county" ></select>
                  </li>
                  <li class="di_hei"><span>详细地址<strong>*</strong></span><textarea></textarea></li>
                  <li><span>邮编<strong>*</strong></span><input type="text"/></li>
                  <li><span>收货人姓名<strong>*</strong></span><input type="text"/></li>
                  <li><span>手机号码<strong>*</strong></span><input type="text"/></li>
                </ul> 
                <div class="chose">     
                 <input type="submit" name="dizhibtn" class="subbtn" value="确认添加"/>
                 <input type="reset"  name="res" class="subbtn1" value="返回"/>
                </div> 
             </form>   
           </div> 
         <div class="clear"></div>
         <div class="dizhi_table">
           <ul>
             
             <li class="fi_li">
               <span>收件人</span>
               <span>所在地区</span>
               <span id="table_wid">详细地址</span>
               <span>邮编</span>
               <span>手机/电话</span>
               <span>操作</span>
               <span>默认地址</span>
             </li>
             <li style="height:auto">
               <span>XXX</span>
               <span>北京朝阳区</span>
               <span id="table_wid">XX小区XX号楼XX单元XX室</span>
               <span>10028</span>
               <span>18800001111</span>
               <span><a class="m_green modify_form">修改</a>|<a class="m_green">删除</a></span>
               <span><input type="checkbox" name="chbox" class="chbox"></input></span>                              
             </li>
             <li>
               <span>XXX</span>
               <span>北京朝阳区</span>
               <span id="table_wid">XX小区XX号楼XX单元XX室</span>
               <span>10028</span>
               <span>18800001111</span>
               <span><a class="m_green modify_form">修改</a>|<a class="m_green">删除</a></span>
               <span><input type="checkbox" name="chbox" class="chbox"></input></span>            
             </li>
             <li>
               <span>XXX</span>
               <span>北京朝阳区</span>
               <span id="table_wid">XX小区XX号楼XX单元XX室</span>
               <span>10028</span>
               <span>18800001111</span>
               <span><a class="m_green modify_form">修改</a>|<a class="m_green">删除</a></span>
               <span><input type="checkbox" name="chbox" class="chbox"></input></span>                              
             </li>
             <li>
               <span>XXX</span>
               <span>北京朝阳区</span>
               <span id="table_wid">XX小区XX号楼XX单元XX室</span>
                <span>10028</span>
               <span>18800001111</span>
               <span><a class="m_green modify_form">修改</a>|<a class="m_green">删除</a></span>
               <span><input type="checkbox" name="chbox" class="chbox"></input></span>
             </li>
             <li>
               <span>XXX</span>
               <span>北京朝阳区</span>
               <span id="table_wid">XX小区XX号楼XX单元XX室</span>
                <span>10028</span>
               <span>18800001111</span>
               <span><a class="m_green modify_form">修改</a>|<a class="m_green">删除</a></span>
               <span><input type="checkbox" name="chbox" class="chbox"></input></span>
             </li>
             <li>
               <span>XXX</span>
               <span>北京朝阳区</span>
               <span id="table_wid">XX小区XX号楼XX单元XX室</span>
                <span>10028</span>
               <span>18800001111</span>
               <span><a class="m_green">修改</a>|<a class="m_green">删除</a></span>
               <span><input type="checkbox" name="chbox" class="chbox"></input></span>
             </li>
             <li>
               <span>XXX</span>
               <span>北京朝阳区</span>
               <span id="table_wid">XX小区XX号楼XX单元XX室</span>
                <span>10028</span>
               <span>18800001111</span>
               <span><a class="m_green">修改</a>|<a class="m_green">删除</a></span>
               <span><input type="checkbox" name="chbox" class="chbox"></input></span>
             </li>
             <li>
               <span>XXX</span>
               <span>北京朝阳区</span>
               <span id="table_wid">XX小区XX号楼XX单元XX室</span>
                <span>10028</span>
               <span>18800001111</span>
               <span><a class="m_green">修改</a>|<a class="m_green">删除</a></span>
               <span><input type="checkbox" name="chbox" class="chbox"></input></span>
             </li>
             <li>
               <span>XXX</span>
               <span>北京朝阳区</span>
               <span id="table_wid">XX小区XX号楼XX单元XX室</span>
                <span>10028</span>
               <span>18800001111</span>
               <span><a class="m_green">修改</a>|<a class="m_green">删除</a></span>
               <span><input type="checkbox" name="chbox" class="chbox"></input></span>
             </li>
           </ul>
         
         </div>
      </div>
      <div id="dialog01" class="style_dialog" style="height:170px; display:none">
	          <div class="dialog_title">
               <strong>温馨提示</strong>
	           <div class="right_cha"></div>
	          </div>	         	          
	          <div class="touzi_text abs_tips">
	           <p><a class="t_green">添加成功!</a></p>   	          
	          </div>
	         <a class="diabtn">确定</a>                
       </div>
    </div>
    <!-- absolute_right start -->
	     <%@ include file="/includes/absolute.jsp" %>
	<!-- absolute_right end -->
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
<script class="resources library" src="/js/area.js" type="text/javascript"></script>   
<script type="text/javascript">_init_area();</script>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript">
    var navIndex=3;  
    var indexs=0;

    $(document).ready(function(){
    	$(".u_left_sec:first li:eq(1)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".nav_big a").eq(2).children("p").addClass("headwd_color");
    	
    	$(".add_dizhi").click(function(){
    		$(".dizhi_input").css("display","block")
    		$(this).hide();
    		$(".little_head").css("display","block");
    	})
    	$(".modify_form").click(function(){
    		var m_dizhi=$(this).parent().siblings(".m_dizhi");
    		m_dizhi.css("display","block").siblings().css("display","none")
    		
    	});
    });
   
</script>

<script type="text/javascript">
$(function(){
	
		var Gid  = document.getElementById ;
		var showArea = function(){
			Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" + 	
			Gid('s_city').value + " - 县/区" + 
			Gid('s_county').value + "</h3>"
									}
		Gid('s_county').setAttribute('onchange','showArea()');

	   
})

</script>
