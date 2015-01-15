<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>投资确认 - 中租宝</title>
<%--  <jsp:include page="/payment/head.jsp"></jsp:include>   --%>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
 <%@ include file="/includes/taglibs.jsp" %> 
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;          

</script>

</head>

<body>
<div class="black_bac"></div>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<div class="msg_con">
  <div class="queren_con" style="height:auto; overflow:hidden">
   <div class="con_title"><strong>投资信息确认</strong></div>
   <form id="form" role="form" action="<%=path%>/gate/doTransfer" method="post" target="_blank">
   <ul> 
         <input type="hidden" id="host" name="host">

          <li>
          <div class="form-group" style="display:none">
            <label for="transferAmount">标的金额</label><input type="text"
              class="form-control jin_font" id="transferAmount" name="transferAmount" value="${product.financingMoney*10000}" />
          </div>
          </li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="targetPlatformUserNo">借款人会员编号</label><input type="text"
              class="form-control" id="targetPlatformUserNo" name="targetPlatformUserNo" value="${targetPlatformUserNo}" />
          </div>
          </li>
          <li>
          <div class="form-group" >
            <label for="projectName">项目名称：</label><span id="protext">${product.projectName}</span>
            <div style="display:none"><input type="text" readonly="readonly" class="form-control" id="projectName" name="projectName" value="${product.projectName}" /></div>
          </div>
          </li>
          <li>
          <div class="form-group" >
          <%-- //${buyAmount} --%>
            <label for="paymentAmount">投资金额：</label><input type="text"
              class="form-control" id="paymentAmount" name="paymentAmount" value="${buyAmount}" />
          </div>
          </li>
          <li>
          <div class="form-group" >
            <label for="#">预期收益率：</label><input type="text"
              class="form-control pre_bac" id="preview_rate" name="preview_rate" value="" />
            <span class="lilv_table">查看收益利率表</span>
          </div>
          
          </li>
          <li style="height:auto;">
            <table width="50%"  bgcolor="#dedede" align="center" cellspacing="1" cellpadding="2" border="0" class="new_table">
                 <tr>
                  <td bgcolor="#fff" align="center"><b>阶段起点金额</b></td>
                  <td bgcolor="#fff" align="center"><b>起始利率</b></td>
                  <td bgcolor="#fff" align="center"><b>投资增幅</b></td>
                  <td bgcolor="#fff" align="center"><b>利率增幅</b></td>
                  <td bgcolor="#fff" align="center"><b>阶段上限金额</b></td>
                 </tr>                                 
			        <c:forEach var="s" items="${li}" varStatus="i">
				        <tr>
				        <td bgcolor="#fff" align="center"><span class="lev_start">${s.startMoney}</span></td>
				        <td bgcolor="#fff" align="center"><span class="lev_rate">${s.startInterestRate}</span></td>
				        <td bgcolor="#fff" align="center"><span class="lev_mi">${s.moneyIncrease}</span></td>
				       	<td bgcolor="#fff" align="center"><span class="lev_ri">${s.interestRateIncrease}</span></td> 
				        <td bgcolor="#fff" align="center"><span class="lev_max">${s.highestMoney}</span></td>
				        </tr>
				     
			         </c:forEach>	
        </table>         
          </li>
          <li>
            <div class="form-group" >
            <%-- //${product.financingPeriod*30} --%>
            <label for="#">投资周期：</label> <input type="text"
              class="form-control pre_bac" id="preview_Period" name="preview_Period" value="${product.financingPeriod*30}" /> 
                         

          </div>
          </li>
          <li>
            <div class="form-group" >
            <label for="#">预期收益：</label><input type="text"
              class="form-control pre_bac" id="preview_income" name="preview_income" value="" />
            
           </div>
          </li>
          <li>
           <div class="form-group liquan_hide" style="${reward.userId==null?"display:none":""}">
               <label for="paymentAmount">使用50元礼卷&nbsp;</label><input type="checkbox"
                                             class="form-control" id="reward" name="rewardCheck"  />
                <input type="hidden" value="${reward.userId}" class="liquan_check"/>                                                            
           </div>
       </li>
       <li class="fukuan">
           <div class="form-group" >
               <label>您实际付款金额为：</label><input type="text"  class="form-control border_none"  value=""/>
           </div>
       </li>
          <li>
             <div class="form-group">
                <span class="liquan_check"><strong style="color:#ff6862">*</strong> 投资满3000元可使用礼券</span>
             </div>            
          </li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="expired">投标过期时间</label><input type="text"
              class="form-control" id="expired" name="expired" value="2016-12-01 22:22:31" />
          </div>
          </li>
          
           <li>
          <div class="form-group"  style="display:none;height:0px;" >
            <label for="enterpriseNumber">项目编号</label><input type="text"
              class="form-control" id="enterpriseNumber" name="enterpriseNumber" value="${product.enterpriseNumber}" />
          </div>
          </li>
                             
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="notifyUrl">notifyUrl</label><input type="text"
              class="form-control" id="notifyUrl" name="notifyUrl" value="${f.notifyUrl}/gate/transferNotify" />
          </div>
          </li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="callbackUrl">callbackUrl</label><input
              type="text" class="form-control" id="callbackUrl"
               name="callbackUrl" value="${f.callbackUrl}/gate/transferSucceed" />
             <!--  name="callbackUrl" value="http://www.ptobchina.com/spring3/gate/transferSucceed" /> -->
          </div>
          </li>
          <li>

          <div class="que_btn"><a src="javascript:;" onclick="onSubmit('${f.onSubmit}')" id="mysubmit_btn">确定</a></div>

          </li>
          </ul>
          
        </form>
        <div id="dialog01"  style="display:none; height:210px;">
	         <div class="dialog_title">
               <strong>温馨提示</strong>
	           <div class="right_cha"></div>
	         </div>
	         <div class="touzi_text">
	           <p style="background:url('../img/images-2014-11/renzheng01.png') 26px 7px no-repeat">如果您成功投资：<a href="<%=path%>/gate/userProject">查看我的项目</a></p>          
	         </div>
	         <div class="touzi_text">
	           <p style="background:url('../img/images-2014-11/renzheng02.png') 26px 7px no-repeat">如果您投资失败：<a href="<%=path%>/product/allProduct">重新投资</a> | <a  href="<%=path%>/contact.jsp">联系客服</a></p>          
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
function onSubmit(host) {


	var a=document.getElementById("paymentAmount").value;
	if(a!=parseInt(a)){alert("投资金额必须为整数！");return false;}


    if(parseInt(a) < 200){
        alert("投资金额必须大于200");
        return false;
    }
	
      	

    $.ajax({url: "/gate/checkPay?id=${product.enterpriseNumber}&amount="+a,
            success: function(resp){
                if(resp === "success"){

                    document.getElementById("paymentAmount").value=parseInt(a);
                    document.getElementById("host").value = host;
                    document.getElementById("mysubmit_btn").disabled=true;
                    document.getElementById("mysubmit_btn").innerHTML="正在提交...";
                    var form = document.getElementById("form");
                    $("#dialog01").css("display","block");
                    $(".black_bac").css("display","block");
                    $(".right_cha").click(function(){
                        $("#dialog01").css("display","none");
                        $(".black_bac").css("display","none");
                    });
                    
                    
                    
                    form.submit();
                    document.getElementById("que_btn_ok").disabled()

                }else{
                    alert(resp);
                }
            }});



}
$(document).ready(function(e) { 
	   $("#reward").click(function(){
		  $(".fukuan").css("display","block");
		  var real_fukuan=$("#paymentAmount").val()
		  $(".border_none").val(real_fukuan-50)
	   });
	
	   $(".right_cha").click(function(){
		   window.location.reload(true);
	   });
	   
	   $("#paymentAmount").keyup(function(){
		   
		   if($(this).val()<3000){			   
		     	$(".liquan_hide").css("display","none")
		     	
		 	  }  else{
		 		 $(".liquan_hide").css("display","block")
		 	  }
	   });
	   
	   if($("#paymentAmount").val()<3000 || $(".liquan_check").val()==""){
 	       	$(".liquan_hide").css("display","none"); 	       
     	}

	   
	   /*shouyilv*/
	   
	   var rate_lv=$(".lev_start").length;
		calc();
		$("#paymentAmount").change(function(e) {
			if($(this).val()<parseInt($(".lev_start").eq(0).html())){
				$(this).val(parseInt($(".lev_start").eq(0).html()));
				}
			if($(this).val()>parseInt($(".lev_max").eq(rate_lv-1).html())){
				$(this).val(parseInt($(".lev_max").eq(rate_lv-1).html()));
				}
	        calc();
	        
	    });
		function calc(){
			//console.log("-------calc-------");
			var t=parseInt($("#paymentAmount").val());
			var r=0;
			var p=parseInt($("#preview_Period").val());
			if(t%100!=0){alert("投资金额必须为100的整数倍！");return false;}
			for(i=0;i<rate_lv;i++){
				if(t>=parseInt($(".lev_start").eq(i).html())&&t<=parseInt($(".lev_max").eq(i).html())){
					if(parseInt($(".lev_mi").eq(i).html())>0){
					r=parseFloat($(".lev_rate").eq(i).html())+parseFloat($(".lev_ri").eq(i).html())*parseInt((t-parseInt($(".lev_start").eq(i).html()))/parseInt($(".lev_mi").eq(i).html()));
				    
					}else{
						r=parseFloat($(".lev_rate").eq(i).html());
						}
					r=r/100;
					//console.log("-lv:"+i+"-m:"+t+"-r:"+r+"--");
					}
				}
			$("#preview_rate").val(parseFloat(parseInt(r*10000)/100)+"%");	
			
			$("#preview_income").val(parseFloat(parseInt(t*r/365*p*100+0.5)/100)+"元");
			
			}
		$(".lilv_table").click(function(){
			$(".new_table").slideToggle()
			
		});
		
		  
	  
}); 
</script>
</html>