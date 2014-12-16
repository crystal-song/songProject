<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ include file="/includes/taglibs.jsp" %> 

<title>提现 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  


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
          <div class="pro_con_title" style="margin-top:5px;"><strong>债权转让</strong>
          </div>
               <div class="con_list">
                  <ul class="list_label">
                    <li>
                      <ul class="label_sec">
                        <li class="label_bak">全部</li>
                        <li>最近七天</li>
                        <li>一个月</li>
                        <li>三个月</li>
                      </ul>
                    </li>
                    <li>
                      <ul class="label_sec">
                        <li class="label_bak">可转让债权</li>
                        <li>充值</li>
                        <li>提现</li>
                        <li>投资</li>
                        <li>收益</li>
                        <li>回收本金</li>
                      </ul>
                    </li>
                    <li>
                     <ul class="label_third">
                        <li>全部</li>
                        <li>时间</li>
                        <li>交易类型</li>
                        <li>交易详情</li>
                        <li>金额</li>
                        <li id="bord_right">余额</li>
                      </ul>
                      <ul>
                        <li>
                          <ul>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                         </ul>
                        </li>
                        <li>
                      <ul>
                          <li></li>
                          <li></li>
                          <li></li>
                          <li></li>
                          <li></li>
                          <li></li>
                      </ul>
                        </li>
                        <li>
                          <ul>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                      </ul>
                        </li>
                        <li>
                          <ul>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                      </ul>
                        </li>
                        <li>
                          <ul>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                      </ul>
                        </li>
                        <li>
                          <ul>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                      </ul>
                        </li>
                      </ul>
                    </li>
                  </ul>
                  <div class="clear"></div>
                  <div class="charge">
                    <p>暂无交易记录</p>
                  </div>
               </div>              
        <div class="next_list">
           <a href="#" class="a1">首页</a>
           <a href="#" class="a2"></a>
           <a href="#">1</a>
           <a href="#">2</a>
           <a href="#">3</a>
           <a href="#">4</a>
           <a href="#">5</a>
           <a href="#">...</a>
           <a href="#">20</a>
           <a href="#" class="a3"></a>
           <a href="#" class="a4">尾页</a>
           <span>跳到</span>
           <span><input type="text" /></span>
           <span>页</span>
           <span><input type="submit" class="btn_sub" value="确定"/></span>
        </div>      
      </div>  
    </div>
  
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
<script type="text/javascript">
    var navIndex=3;    
    $(document).ready(function(){
    	$(".label_sec li").click(function(){
            $(this).addClass('label_bak').siblings().removeClass('label_bak');
       });
        $(".u_left_mian").click(function(){
              $(this).siblings().slideToggle("slow");
            });
});
        
</script>
</html>