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
<title>提现 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
 <%@ include file="/includes/taglibs.jsp" %> 
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;    
    $(document).ready(function(){
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
          <div class="pro_con_title" style="margin-top:5px;"><strong>已投项目</strong></div>
           <div class="pro_list">
               <div class="con_list">
                  <ul>
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
        <div class="next_list">
           <!--  <a href="#" class="a1">首页</a>
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
           -->
           
                     
           <div class="num">        															 
		     <a href="javascript:jumpPage(1)">首页</a> 								 
				<c:if test=""></c:if>								 
					<c:if test="${page.pageNo > 1}"><a href="javascript:jumpPage(${page.pageNo-1})">上一页</a>  
					</c:if> 
					<div class="pageNum"></div>								 
					<c:if test="${page.pageNo < page.totalPage}">  <a href="javascript:jumpPage(${page.pageNo+1})">下一页</a> 
				    </c:if>  								
					<a href="javascript:jumpPage(${page.totalPage})">末页</a> 
		  </div>
        </div>

          </div>
        </div>
        <div class="zichan_con"> 
          <div class="pro_con_title" style="margin-top:5px;"><strong>推荐项目</strong></div>
          <div class="pro_list">
               <div class="con_list">
                  <ul>
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