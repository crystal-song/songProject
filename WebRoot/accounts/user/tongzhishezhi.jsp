<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
<title>提现 - 我的账户 - 中租宝</title>
</head>

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
               <div class="zichan_con">        
                <div class="pro_con_title" style="margin-top:5px;"><strong>通知设置</strong>
                </div>

                <div class="con_list_life">
                <form action="<%=path %>/transnotice/add" method="post">

                  <ul class="tong">
                     <li style="background:#f3f3f3"><span></span><span>系统消息通知</span><span>邮件通知</span><!-- <span>短信通知</span> --></li>
                     <li><span>充值操作</span><span><input type="checkbox" name="noticeType1" value="系统消息通知"></input></span><span><input type="checkbox" checked="checked" name="noticeType1" value="邮件通知"></input></span><!-- <span><input type="radio" name="rechargeNoticeType" value="短信通知"></input></span> --></li>
                     <li><span>提现操作</span><span><input type="checkbox" name="noticeType2" value="系统消息通知"></input></span><span><input type="checkbox" name="noticeType2" checked="checked" value="邮件通知"></input></span><!-- <span><input type="radio" name="drawNoticeType" value="短信通知"></input></span> --></li>
                    <!--  <li><span>奖励兑付</span><span><input type="radio" name="jiangliNoticeType" value="系统消息通知"></input></span><span><input type="radio" name="jiangliNoticeType" checked="checked" value="邮件通知"></input></span><span><input type="radio" name="jiangliNoticeType" value="短信通知"></input></span></li> -->
                 </ul> 

                  <input type="submit" id="sub" value="确定"/>
                 </form>

                </div>
              </div>       
      </div>
  
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>

<script type="text/javascript">   
    $(document).ready(function(){
    	$(".u_left_sec:first li:eq(2)").children("a").css("color","#fc652e");
        $(".anquan_right").click(function(){
            $(this).parent().siblings(".anquan_hide").slideToggle();
            //alert($(this).text());
            if($(this).text()=="认证"){

               $(this).text("取消认证");

            }else if($(this).text()=="取消认证"){
              $(this).text("认证");
            }
         }); 
         $(".u_left_mian").click(function(){
              $(this).siblings().slideToggle("slow");
            }); 
      
});

 $(function(){
		$("#sub").click(function(){
			
	                    	 alert("设置成功!");
	                  
	            });
		
	});       
</script>
