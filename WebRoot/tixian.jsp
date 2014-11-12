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
<title>提现 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;    
    $(document).ready(function(){
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
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
          <div class="pro_con_title" style="margin-top:5px;"><strong>提现</strong></div>
            <div class="add_postcar" style="display:none">
              <p>添加银行卡</p>
              <ul>
                <li><span>开户名：</span><div>....</div></li>
                <li>
                  <span>银行选择：</span>
                  <div>
                    <select>
                      <option>请选择</option>
                      <option>工商银行</option>
                      <option>建设银行</option>
                      <option>中国银行</option>
                    </select>
                  </div>
                </li>
                <li>
                  <span>开户行名称：</span>
                  <div>
                    <input type="text"></input>
                  </div>
                </li>
                <li><span>开户行所在地：</span><div> <input type="text"></input></div></li>
                <li><span>银行账号：</span><div> <input type="text"></input></div></li>
                <li><span>确认银行账号：</span><div> <input type="text"></input></div></li>
              </ul>
              <div class="postcar_btn">
                  <a href="#" class="postcar_btn_red">添加</a>
                  <a href="#">取消</a>
              </div>
            </div>
               
             <div class="add_postcar">
              <p>填写现金金额</p>
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
              <div class="postcar_btn">
                  <a href="#" class="postcar_btn_red">添加</a>
                  <a href="#">取消</a>
              </div>
              <div class="postcar_btn">
                  <a href="#" class="postcar_btn_org">绑卡</a>
                  <a href="#">取消</a>
              </div>
            </div>    

          <div class="tishi">
            <p><strong>温馨提示</strong></p>
            <ol>
              <li class="tishi_red">您充值的资金若未投资就提现，第三方支付公司会收取您提现金额的0.5%作为转账费用。</li>
              <li>您的账户资金将由第三方平台托管。</li>
              <li>为了您的资金安全，请您在充值前完成手机绑定，身份认证及支付密码设置。</li>
              <li>爱投资严禁信用卡充值、套现等行为，一经发现将予以处罚，包括但不限于：限制收款、冻结账户、永久停止服务， 并会影响银行征信记录。</li>
              <li>充值过程遇到问题，请联系客服，010-84243099/3199</li>
            </ol>
            
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