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
<title>用户中心 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
 <%@ include file="/includes/taglibs.jsp" %> 
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
$(document).ready(function(){
    $(".u_left_mian").click(function(){
        $(this).siblings().slideToggle("slow");
      });
      
    $(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
    $(".user_left li").mouseover(function(){
         var index=$(this).index();
         var min_label=$(this).children(".u_left_mian");

          if(index==1){
                min_label.children(".mian_pic01").css('background-image','url("<%=path%>/img/images-2014-11/tubiao011.png")');
                return true;
                }
          if(index==2){
                min_label.children(".mian_pic02").css('background-image','url("<%=path%>/img/images-2014-11/tubiao012.png")');
                return true;
                } 
          if(index==3){
                min_label.children(".mian_pic03").css('background-image','url("<%=path%>/img/images-2014-11/tubiao013.png")');
                return true;
                }
          if(index==4){
                min_label.children(".mian_pic04").css('background-image','url("<%=path%>/img/images-2014-11/tubiao014.png")');
                return true;
                }                 
                
       }).mouseout(function(){

          var index=$(this).index();
          var min_label=$(this).children(".u_left_mian");
          
         if(index==1){
           min_label.children(".mian_pic01").css('background-image','url("<%=path%>/img/images-2014-11/tubiao01.png")');
           return true;
         }
         if(index==2){
           min_label.children(".mian_pic02").css('background-image','url("<%=path%>/img/images-2014-11/tubiao02.png")');
           return true;
         }
         if(index==3){
           min_label.children(".mian_pic03").css('background-image','url("<%=path%>/img/images-2014-11/tubiao03.png")');
           return true;
         }
         if(index==4){
           min_label.children(".mian_pic04").css('background-image','url("<%=path%>/img/images-2014-11/tubiao04.png")');
           return true;
         }
       });

       $(".title_con_u li").mouseover(function(){
         var index = $(this).index();
         //alert(index);
          $(this).addClass('title_red').siblings().removeClass('title_red');
           $(this).parent().siblings(".pro_show").eq(index).css("display","block").siblings(".pro_show").css("display","none")
       });


       $(".jilu_nav li").mouseover(function(){
          var index = $(this).index();
          $(this).addClass('jilu_nav_red').siblings().removeClass('jilu_nav_red');
         
         
       });
       $(".jilu_nav li").click(function(){
          var index=$(this).index();
          $(".tableone").eq(index).css("display","block").siblings(".tableone").css("display","none");
       });

    $(".name_a1").mouseover(function(){
          //alert("aaa");
          $(".checkborder1").css("display","block"); 
 
          $(".checkborder1").mouseover(function(){
              $(this).show();
             
          }).mouseout(function(){
              $(this).hide();
          });

      }).mouseout(function(){
         $(".checkborder1").css("display","none");
         
    });
    $(".name_a2").mouseover(function(){
          //alert("aaa");
          $(".checkborder2").css("display","block"); 
       
          $(".checkborder2").mouseover(function(){
        	  
              $(this).show();
          }).mouseout(function(){
              $(this).hide();
          });

      }).mouseout(function(){
         $(".checkborder2").css("display","none");
    });  
    $(".name_a3").mouseover(function(){
          //alert("aaa");
          $(".checkborder3").css("display","block");
       
          $(".checkborder3").mouseover(function(){
              $(this).show();
          }).mouseout(function(){
              $(this).hide();
          });

      }).mouseout(function(){
         $(".checkborder3").css("display","none");
    });  

     $(".name_a4").mouseover(function(){
          //alert("aaa");
          $(".checkborder4").css("display","block");
     
          $(".checkborder4").mouseover(function(){
              $(this).show();
          }).mouseout(function(){
              $(this).hide();
          });

      }).mouseout(function(){
         $(".checkborder4").css("display","none");
    });
	});
</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<!--  
<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>
<div class="msg_con">
  <div class="msg_left">

	
	
  </div>     
 </div>
   <div class="msg_right">
       <div class="msg_main">
           <div class="msg_title">
             <h2>个人信息</h2>
             <a href="<%=path%>/user/getuserbyName?name=${user1.name}">修改个人信息</a>
           </div>
           <div class="user_con">
               <div class="photo">
                   <span></span>
               </div>
               <div class="center">
                   <ul class="user_con_name">
                     <li class="mg_right">用户名</li><li>${user1.name}</li>
                     <li class="mg_right">真实姓名</li><li>${user1.realName}</li>
                     <li class="mg_right">身份证号</li><li>${user1.identityCard}</li>
                     <li class="mg_right">手机号码</li><li>${user1.phone}</li>
                     <li class="mg_right">邮箱地址</li><li>${user1.email}</li>
                     <li class="mg_right">易宝账号</li><li>${registerYeePay1.platformUserNo}</li>
                   </ul>                  
               </div>               
               <div class="user_right">            
                   <ul class="user_check">
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">用户注册时填写的用户名，不可更改</div><span class="box_right"></span></div><p class="xiangqing">详情</p></li>
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未认证个人实名信息， <a href="<%=path%>/anquanshezhi.jsp">实名认证</a></div><span class="box_right"></span></div><p>未认证</p></li>                  
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未绑定身份证，实名认证即可成功绑定身份证， <a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div><span class="box_right"></span></div><p>未认证</p></li>
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未绑定手机号， <a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div><span class="box_right"></span></div><p>未认证</p></li>
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未绑定邮箱号， <a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div><span class="box_right"></span></div><p>未认证</p></li>
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未注册易宝账号， <a href="<%=path%>/gate/register" target="_blank">请注册</a></div><span class="box_right"></span></div><c:if test='${ empty registerYeePay1.code}'><p>未注册</p></c:if><c:if test='${registerYeePay1.code==1}'><p>已注册</p></c:if></li>            
                   </ul>
               </div>             
           </div>
           <div class="user_con_last">
                <div class="center_last">
                   <ul class="user_con_last_name">
                     <li>性别</li>
                     <li>出生日期</li>
                     <li>最高学历</li>
                     <li>毕业院校</li>
                     <li>婚姻状态</li>
                     <li>居住地址</li>
                     <li>公司行业</li>
                     <li>公司规模</li>
                     <li>所在职位</li>
                     <li>每月收入</li> 
                   </ul>
         
                   <ul class="user_con_last_mag">
                     <li>${user1.sex}</li>
                     <li>${ser1.dateOfBirth}</li>
                     <li>${user1.educationBackground}</li>
                     <li>${user1.schoolOfGraduation}</li>
                     <li>${user1.maritalStatus}</li>
                     <li>${user1.address}</li>
                     <li>${user1.companyIndustry}</li>
                     <li>${user1.companyScale}</li>
                     <li>${user1.position}</li>
                     <li>${user1.income}</li>
                   </ul>
               </div>
	         </div>	       
           <div class="user_bottom">
            <h3>温馨提示:</h3>
            <ol>
              <li>请您根据自身真实情况填写，中租宝会对用户的所有资料进行严格保密。</li>
              <li>使用过程遇到问题，请联系客服，010-84243099/3199。 </li>
            </ol>
           </div>
       </div>
  
   </div>    
</div>
<div class="clear_height"></div>
-->
   <div class="user_con">
      <div class="user_left">
         <!-- footer start -->
           <%@ include file="/includes/user_info_left.jsp" %>
         <!-- footer end -->
      </div>
      <div class="user_right">
          <div class="u_r_top">
            <div class="photo"></div>
            <dl class="per_name">
              <dt class="name_mar">singnna</dt>
              <dd>安全等级:<strong>高</strong></dd>
              <dd class="per_tishi">
               
                  <a href="#" class="name_a1"></a>
                  <a href="#" class="name_a2"></a>
                  <a href="#" class="name_a3"></a>
                  <a href="#" class="name_a4"></a>
                  <div class="checkborder1" >
                     <a id="tishi_top"></a>
                     <span class="border_left"></span>
                     <div class="border_cent">
                        <div>您未绑定身份证，实名认证即可成功绑定身份证，</div>
                        <a href="<%=path %>/anquanshezhi.jsp" id="blok">请绑定</a>
                     </div>
                     <span class="border_right"></span>
                  </div>
                   <div class="checkborder2">
                     <a id="tishi_top"></a>
                     <span class="border_left"></span>
                     <div class="border_cent"><div>您未绑定手机号，</div>
                     <a href="<%=path %>/anquanshezhi.jsp" id="blok">请绑定</a></div>
                     <span class="border_right"></span>
                  </div> 
                  <div class="checkborder3">
                      <a id="tishi_top"></a>
                      <span class="border_left"></span>
                      <div class="border_cent"><div>您未绑定邮箱号，</div>
                      <a href="<%=path %>/anquanshezhi.jsp" id="blok">请绑定</a>
                      </div>
                     <span class="border_right"></span>
                  </div>
                  <div class="checkborder4">
                      <a id="tishi_top"></a>
                      <span class="border_left"></span>
                      <div class="border_cent"><div>您未设置支付密码，</div>
                      <a href="<%=path %>/anquanshezhi.jsp" id="blok">请设置</a>
                      </div>
                      <span class="border_right"></span>
                  </div>
              </dd>
            </dl>
            <div class="chong_btn">
              <a class="chong_btn_org">充值</a><a>提现</a>
            </div>
            <dl class="per_chong">
              <dt><strong>可用现金</strong></dt>
              <dd class="wd_org"><strong>0</strong>.00元</dd>
            </dl>

          </div>
          <div class="u_r_sec">
             <div class="sec_num" style="background:none">
               <dt>资产统计</dt>
               <dd><strong>0</strong>.00&nbsp;&nbsp;元</dd>
             </div>
             <div class="sec_num">
               <dt>当月收益</dt>
               <dd><strong>0</strong>.00&nbsp;&nbsp;元</dd>
             </div>
             <div class="sec_num">
               <dt>已收收益</dt>
               <dd><strong>0</strong>.00&nbsp;&nbsp;元</dd>
             </div>
          </div>
          <div class="u_r_con">
           <div class="xiangmu_shou">
            <ul class="title_con_u">
              <li>已投项目</li>
              <li class="title_red">我的收藏</li>
            </ul>
            <ul class="pro_show">
            <c:if test="${ not empty list}">
             <c:forEach var="s" items="${list}" varStatus="i">
              <li>
                <div class="floor_num01">
                 <a class="floor_img01">${s.projectPicture}
                 <div class="hot"></div>
                 <div class="last_time01">剩余时间:<strong>&nbsp;&nbsp;28</strong>天</div>
                 </a>
                 <a class="shuoming01" href="product/getProductByid?id=${s.id}" title="${s.projectName}">${s.projectName}</a>
                 <div class="aim01">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><em>¥&nbsp;&nbsp;</em>${s.financingMoney}</span>
                   <a>融资中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b" style="width:<c:if test='${empty s.financingProgress}'>0</c:if><c:if test='${not empty s.financingProgress}'>${s.financingProgress*100<100?s.financingProgress==null?0:s.financingProgress*100:100}</c:if>%" title="融资进度：${s.financingProgress*100}%"></div>
                 </div>
                 <div class="floor_bottom01">
                   <span><a class="baifenbi01" style="float:left; text-align:left;"><c:if test='${empty s.financingProgress}'>0</c:if>${s.financingProgress*100}%</a>
                   <a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi01"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a>
                   </span>
                   <span><a class="baifenbi01" style="float:right; text-align:right;">${s.yearIncome}</a>
                   <a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
                 <div class="botm_btn01">
                  <a href="#" class="dongxiang">查看近期动向</a>         
                 </div>
                </div> 
              </li>
               </c:forEach>
               </c:if>
              
            </ul>
            <ul class="pro_show" style="display:none">
             
               <c:if test="${ not empty list}">
             <c:forEach var="s" items="${list}" varStatus="i">
              <li>
                <div class="floor_num01">
                 <a class="floor_img01">${s.projectPicture}
                 <div class="hot"></div>
                 <div class="last_time01">剩余时间:<strong>&nbsp;&nbsp;28</strong>天</div>
                 </a>
                 <a class="shuoming01" href="product/getProductByid?id=${s.id}" title="${s.projectName}">${s.projectName}</a>
                 <div class="aim01">
                   <span style="color:#a4a4a4;">目标:</span>
                   <span>60天</span>
                   <span><em>¥&nbsp;&nbsp;</em>${s.financingMoney}</span>
                   <a>融资中</a>
                 </div>
                 <div class="loding_bar">
                 <div class="l_b" style="width:<c:if test='${empty s.financingProgress}'>0</c:if><c:if test='${not empty s.financingProgress}'>${s.financingProgress<100?s.financingProgress==null?0:s.financingProgress:100}</c:if>%" title="融资进度：${s.financingProgress}%"></div>
                 </div>
                 <div class="floor_bottom01">
                   <span><a class="baifenbi01" style="float:left; text-align:left;"><c:if test='${empty s.financingProgress}'>0</c:if>${s.financingProgress}%</a>
                   <a style="float:left; color:#a4a4a4;">已达</a></span>
                   <span><a class="baifenbi01"><em>¥&nbsp;&nbsp;</em>30000</a><a style="color:#a4a4a4;">已筹资</a>
                   </span>
                   <span><a class="baifenbi01" style="float:right; text-align:right;">${s.yearIncome}</a>
                   <a style="float:right; color:#a4a4a4;">剩余时间</a></span>
                 </div>
                 <div class="botm_btn01">
                  <a href="#" class="dongxiang">查看近期动向</a>         
                 </div>
                </div> 
              </li>
               </c:forEach>
               </c:if>
             
            </ul>
          </div>
            <div class="pro_con_title"><strong>交易记录</strong></div>
            <div class="jilu">
              <ul class="jilu_nav">
                <li class="jilu_nav_red">全部</li>
                <li>充值</li>
                <li>投资</li>
                <li>收益</li>
                <li>回收本金</li>
              </ul>
              <div class="clear"></div>
              <ul class="table_title">
                <li>时间</li>
                <li>交易类型</li>
                <li>交易详情</li>
                <li>金额</li>
                <li style="border-right:none">余额</li>
              </ul>
              <div class="jilu_con">
                  <table class="tableone">
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <table class="tableone" style="display:none">
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr> 
                  </table>
                  <table class="tableone" style="display:none">
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>                
                  </table>
                  <table class="tableone" style="display:none">
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>                
                  </table>
                  <table class="tableone" style="display:none">
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>                
                  </table>    
              </div>
            </div>
            <div class="ji_foot">首页最近展示<strong>8</strong>条记录</div>
          </div>
      </div>
   </div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>