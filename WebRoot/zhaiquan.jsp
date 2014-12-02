<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%@ include file="/includes/taglibs.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>提现 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
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
</html>