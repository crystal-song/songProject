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
<meta content="中租宝，是北京中投汇融投资管理有限公司旗下的众筹网络平台，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>绑定银行卡 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;    
    var indexs=1;
    $(document).ready(function(){
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    	$(".u_left_mian").click(function(){
            $(this).siblings().slideToggle("slow");
          });
});
    
    function onSubmit(host) {
    	  document.getElementById("host").value = host;
    	  var form = document.getElementById("form");
    	  form.submit();
    	}
        
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
          <div class="pro_con_title" style="margin-top:5px;"><strong>提现</strong></div>
           
            <div class="add_postcar" style="display:none; height:330px;">
              <p>银行卡信息</p>
              <ul class="postcar_msg">
                <li><span>开户行名称：</span><div>工商银行</div></li>
                <li><span>银行卡账号：</span><div>12345678</div></li>
                <li><span>银行卡状态：</span><div>绑定中..</div>
                </li>             
                
              </ul>
               <div class="postcar_btn">
                  <a href="#" class="postcar_btn_red" >添加银行卡</a>
                  <!-- <a href="#" style="background:#ff6a00; color:#fff" onclick="onSubmit('https://member.yeepay.com/member')" >解除绑定</a> -->
              </div>                       
            </div>
                 <!-- 
             <div class="add_postcar" >
              <p>绑定银行卡</p>
            
              <ul>
                <li><span>可提现金金额：</span><div><strong>0.00</strong>元（面提现手续费额度：0.00元）</div></li>
                <li>
                  <span>提现金额：</span>
                  <div><input type="text" class="jin_right"></input>元 <i style="display:none">请填写现金金额</i></div>
                </li>
                <li>
                  <span>手续费：</span>
                  <div>
                     <strong>0.00</strong>元（面提现手续费额度：0.00元）
                  </div>
                </li>
                <li><span>支付密码：</span><div> <input type="text"></input></div></li>
                <li><span>验证码：</span><div><input type="text"></input></div></li>
                <li><span></span><div> <input type="submit" class="sub" value="点击获取验证码"><a class="yzm" href="#">验证码</a></div></li>
              </ul>
              <div class="postcar_btn" >
                  <a href="#" class="postcar_btn_red">添加</a>
                  <a href="#">取消</a>
              </div>
              <div class="postcar_btn" >
                  <a href="#" class="postcar_btn_org">绑卡</a>
                  <a href="#">取消</a>
              </div>
                 -->
                 <div class="clear_height" style="height:40px;"></div>
               <form id="form" role="form" action="<%=path%>/gate/dobinding" method="post" target="_blank">
		          <input type="hidden" id="host" name="host">
		          <div class="form-group">
		         <!--   <label for="platformNo">platformNo</label><input type="text"
		              class="form-control" id="platformNo" name="platformNo" value="10040011137" />  -->
		               <input type="text"class="form-control" id="platformNo" 
		                   name="platformNo" value="10012415118" />  
		          </div>
		          <div class="form-group">
		            <label for="requestNo">requestNo</label><input type="text"
		              class="form-control" id="requestNo" name="requestNo" value="${now}" />
		          </div>
		          <div class="form-group">
		            <label for="platformUserNo">platformUserNo</label><input
		              type="text" class="form-control" id="platformUserNo"
		              name="platformUserNo"  value="${name}"  />
		          </div>
		          <div class="form-group">
		            <label for="notifyUrl">notifyUrl</label><input type="text"
		              class="form-control" id="notifyUrl" name="notifyUrl" value="http://192.168.1.207:8080/spring3/gate/bindingNotify" />
		          </div>
		          <div class="form-group">
		            <label for="callbackUrl">callbackUrl</label><input
		              type="text" class="form-control" id="callbackUrl"
		              name="callbackUrl" value="http://192.168.1.207:8080/spring3/gate/bindingSucceed" />
		          </div>
		      
		
		          <button onclick="onSubmit('http://qa.yeepay.com/member')" class="btn btn-default">QA</button>
		          <button onclick="onSubmit('https://member.yeepay.com/member')" class="btn btn-default">ç”Ÿäº§</button>
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