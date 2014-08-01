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
<title>中投汇</title>

<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  

<script type="text/javascript" >


/*  $(document).ready(function(){ 
	alert("ccccccccccc");
 
	
    
            $.ajax({
                type: 'POST',
                url: '<c:url value="/product/recommend?type=1"/>', */
              /*   data: 'type=1', */
              /*   dataType: 'text', */
               /*  success: function() {
                	alert("dd"+data+'"success"');
                   
                } */
  /*           });
      
	
	
	
});   */



   
                
           

</script>

</head>

<body>
<div class="top">
	<div class="top_fra">
    	<div class="top_left">
        	<div class="kefu"><img src="<%=path%>/images/sy_04.jpg"></div>
            <div class="phone">010-84243099</div>
        </div>
    	<div class="top_right">
        	<img src="<%=path%>/images/sy_09.jpg">&nbsp;&nbsp;<img src="<%=path%>/images/sy_11.jpg">
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="zth">
	<div class="logo"><a href="<%=path%>/index.jsp"><img src="<%=path%>/images/sy_17.jpg"></a></div>
    <div class="nav">
    	<ul>
    	
        	<li id="dangqian">首页</li>
            <li><a href="<%=path%>/product/allProduct">我要投资</a></li>
            <li><a href="<%=path%>/zhanghu.jsp">我的账户</a></li>
            <li><a href="<%=path%>/baozhang.jsp">安全保障</a></li>
         <!--    <li><a href="help.jsp">帮助中心</a></li> -->
            <li><a href="<%=path%>/reg.jsp">帮助中心</a></li>
            
        </ul>
    </div>
</div>
<div class="clear"></div>
<div class="banner_bg">
	<div class="banner_fra"><img src="<%=path%>/images/sy_23.jpg"></div>
</div>

<div class="top_01">
			<span id="datespan"></span> 欢迎 <span style="color: #F00">${name}</span>
			使用后台管理系统，本系统由:<span ID="HyperLink1" runat="server" Target="_blank"
				style="color: #F00">中投汇融</span>独立开发
		</div>
<div class="clear"></div>
<div class="one">
	<div class="one_fra">
    	<div class="one_list">已撮合融资<span class="red_weight">1,703,240,000</span>元</div>
        <div class="one_list">为客户赚取收益<span class="red_weight">171,282,505</span>元</div>
        <div class="one_list">已按时还款<span class="red_weight">355,700,000</span>元</div>
        <div class="one_list">已支付收益<span class="red_weight">50,923,085</span>元</div>
    </div>
</div>
<div class="clear"></div>
<div class="two">
	<div class="two_cont">
    	<div class="two_list">
        	<div class="two_tit">事无巨细</div>
            <div class="two_nr">细节都关乎生死。对每一个项目我们都进行<span class="hong">360度全方位尽职调查</span>及<span class="hong">超严格风险控制</span>。您只需安心投资。</div>
        </div>
        <div class="two_list1">
        	<div class="two_tit">极致之美</div>
            <div class="two_nr">对于极致的追求是中投汇融一直以来秉承的信念，<span class="hong">极致透明安全、极致体验</span>。在这里我们为您准备好一切。</div>
        </div>
        <div class="two_list2">
        	<div class="two_tit">理财随心</div>
            <div class="two_nr">在中投汇融，我们提供了高质量的不同期限、不同利率、不同用途的借款项目，随心选择。</div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="two_pic"><img src="<%=path%>/images/sy_41.jpg"></div>
</div>
<div class="clear"></div>
<div class="content">
	<div class="content_fra">
    	<div class="cont_left">
    	
    	
    	<%--  <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
        	<div class="ckxq">
            	<div class="ckxq_bg">推荐项目:<span class="ckxq_red"><a href="<%=path%>/index.jsp">${s.projectName}</a></span></div>
                <div class="xq_tab">
                	<div class="xq_left"><img src="<%=path%>/images/sy_63.jpg"></div>
                    <div class="xq_right">
                    	<div class="xq_table">
                        	<div class="xq01">
                            	<div class="xq01_tit">年化收益</div>
                                <div class="xq01_nr hong">14.50%</div>
                            </div>
                            <div class="xq02">
                            	<div class="xq01_tit">融资金额</div>
                                <div class="xq01_nr">1000万</div>
                            </div>
                            <div class="xq03">
                            	<div class="xq01_tit">还款日期</div>
                                <div class="xq01_nr">2015-06-04</div>
                            </div>
                            <div class="xq04">
                            	<div class="xq01_tit">企业等级</div>
                                <div class="xq04_nr"><img src="<%=path%>/images/sy_66.jpg"></div>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="jindu">
                        	<div class="jindu_font">融资进度：<span class="hong">73%</span></div>
                            <div class="jindu_pic"><img src="<%=path%>/images/sy_71.jpg"></div>
                        <div class="clear"></div>
                        <div class="jd_font">
                        	<div class="jindu_font">已投金额：<span class="hong">730万元</span></div>
                            <div class="jd_right">还款方式：<span class="qucu">到期还本</span></div>
                        </div>
                        <div class="clear"></div>
                        <div class="jd_font">
                        	<div class="jindu_font">还需金额：<span class="hong">270万元</span></div>
                            <div class="jd_right">担保机构：<span class="qucu">很暗诺亚投资担保有限公司</span></div>
                        </div>
                    </div>
                </div>
            </div>
			</div>
			 </c:forEach>
      
	 
        </c:if>
			 --%>
			 
			
			 
			 
		 
	   <c:if test="${ not empty list}">
        <c:forEach var="s" items="${list}" varStatus="i">
	  
			<div class="clear_height"></div>
            <div class="ind_list">
            	<div class="xq_left"><img src="<%=path%>/images/sy_63.jpg"></div>
                <div class="ind_right">
                	<div class="tuijian">
                    	<div class="tj_left">推荐项目:<span class="hong">${s.projectName}</span></div>
                        <div class="tj_right">
                        	<div class="tj_jd">融资进度：${s.financingProgress}%</div>
                            <div class="tj_jd_pic"><img src="<%=path%>/images/sy_76.jpg"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="xq_table">
                    .
                        <div class="xq01">
                            <div class="xq01_tit">年化收益</div>
                            <div class="xq01_nr hong">${s.yearIncome}</div>
                        </div>
                        <div class="xq02">
                            <div class="xq01_tit">融资金额</div>
                            <div class="xq01_nr">${s.financingMoney}万</div>
                        </div>
                        <div class="xq03">
                            <div class="xq01_tit">还款日期</div>
                            <div class="xq01_nr">${s.repaymentTime}</div>
                        </div>
                        <div class="xq04">
                            <div class="xq01_tit">企业等级</div>
                            <div class="xq04_nr"><img src="<%=path%>/images/sy_66.jpg"></div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
      
	 
        </c:if>
             
            
            
       <div class="clear_height"></div>
            <div class="ind_list">
            	<div class="xq_left"><img src="<%=path%>/images/sy_63.jpg"></div>
                <div class="ind_right">
                	<div class="tuijian">
                    	<div class="tj_left">推荐项目:<span class="hong">建筑工程企业建筑材料采购</span></div>
                        <div class="tj_right">
                        	<div class="tj_jd">融资进度：80%</div>
                            <div class="tj_jd_pic"><img src="<%=path%>/images/sy_76.jpg"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="xq_table">
                        <div class="xq01">
                            <div class="xq01_tit">年化收益</div>
                            <div class="xq01_nr hong">14.50%</div>
                        </div>
                        <div class="xq02">
                            <div class="xq01_tit">融资金额</div>
                            <div class="xq01_nr">1000万</div>
                        </div>
                        <div class="xq03">
                            <div class="xq01_tit">还款日期</div>
                            <div class="xq01_nr">2015-06-04</div>
                        </div>
                        <div class="xq04">
                            <div class="xq01_tit">企业等级</div>
                            <div class="xq04_nr"><img src="<%=path%>/images/sy_66.jpg"></div>
                        </div>
                    </div>
                </div>
            </div>  
           <%--  <div class="clear_height"></div>
            <div class="ind_list">
            	<div class="xq_left"><img src="<%=path%>/images/sy_63.jpg"></div>
                <div class="ind_right">
                	<div class="tuijian">
                    	<div class="tj_left">推荐项目:<span class="hong">建筑工程企业建筑材料采购</span></div>
                        <div class="tj_right">
                        	<div class="tj_jd">融资进度：80%</div>
                            <div class="tj_jd_pic"><img src="<%=path%>/images/sy_76.jpg"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="xq_table">
                        <div class="xq01">
                            <div class="xq01_tit">年化收益</div>
                            <div class="xq01_nr hong">14.50%</div>
                        </div>
                        <div class="xq02">
                            <div class="xq01_tit">融资金额</div>
                            <div class="xq01_nr">1000万</div>
                        </div>
                        <div class="xq03">
                            <div class="xq01_tit">还款日期</div>
                            <div class="xq01_nr">2015-06-04</div>
                        </div>
                        <div class="xq04">
                            <div class="xq01_tit">企业等级</div>
                            <div class="xq04_nr"><img src="<%=path%>/images/sy_66.jpg"></div>
                        </div>
                    </div>
                </div>
            </div> --%>
		</div> 
		<div class="cont_right">
        	<div class="cr_bg">
            	<div class="cr_tit">
                	<div class="cr_font">网站公告</div>
                    <div class="cr_more"><img src="<%=path%>/images/sy_50.jpg"></div>
                </div>
                <div class="cr_nr">
                	<ul>
                    	<li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    </ul>
                </div>
            </div>
            <div class="clear_height"></div>
            <div class="cr_bg">
            	<div class="cr_tit">
                	<div class="cr_font">项目到期公告</div>
                    <div class="cr_more"><img src="<%=path%>/images/sy_50.jpg"></div>
                </div>
                <div class="cr_nr">
                	<ul>
                    	<li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    </ul>
                </div>
            </div>
            <div class="clear_height"></div>
            <div class="cr_bg">
            	<div class="cr_tit">
                	<div class="cr_font">项目还款公告</div>
                    <div class="cr_more"><img src="<%=path%>/images/sy_50.jpg"></div>
                </div>
                <div class="cr_nr">
                	<ul>
                    	<li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    </ul>
                </div>
            </div>
            <div class="clear_height"></div>
            <div class="cr_bg">
            	<div class="cr_tit">
                	<div class="cr_font">媒体报道</div>
                    <div class="cr_more"><img src="<%=path%>/images/sy_50.jpg"></div>
                </div>
                <div class="cr_nr">
                	<ul>
                    	<li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                        <li>和讯：积木盒子十个月破十亿 P2P黑马……</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clear_height"></div>
<div class="hezuo">
	<div class="hz_fra">
    	<div class="hz_left"><img src="<%=path%>/images/sy_79.jpg"></div>
        <div class="hz_right">
        	<div class="bot_left"><img src="<%=path%>/images/sy_101.jpg"></div>
            <div class="bot_center">
            	<img src="<%=path%>/images/sy_82.jpg">
                <img src="<%=path%>/images/sy_84.jpg">
                <img src="<%=path%>/images/sy_87.jpg">
                <img src="<%=path%>/images/sy_89.jpg">
                <img src="<%=path%>/images/sy_91.jpg">
                <img src="<%=path%>/images/sy_93.jpg">
                <img src="<%=path%>/images/sy_95.jpg">
                <img src="<%=path%>/images/sy_96.jpg">
                <img src="<%=path%>/images/sy_98.jpg">
            </div>
            <div class="bot_right"><img src="<%=path%>/images/sy_101.jpg"></div>
        </div>
    </div>
</div>
<div class="clear_height"></div>
<div class="links">
	<div class="links_fra">
    	<div class="links_left">友情链接</div>
        <div class="links_right">
        	<ul>
            	<li>网贷指南</li>
                <li>web网财</li>
                <li>P2P网贷导航</li>
                <li>银讯网</li>
                <li>网贷天眼</li>
                <li>和讯互联网金融</li>
                <li>中国安全应急产业网</li>
                <li>存折网</li>
                <li>网贷帮手</li>
                <li>网e家园</li>
                <li>网贷无忧</li>
                <li>网贷黑名单</li>
                <li>网贷导航</li>
            </ul>
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="menu">
	<div class="menu_fra">
    	<ul>
        	<li>关于我们</li>
            <li>常见问题</li>
            <li>理财问答</li>
            <li>法律声明</li>
            <li>联系我们</li>
            <li>友情链接</li>
            <li>我要融资</li>
            <li>收益计算器</li>
        </ul>
    </div>
</div>
<div class="clear"></div>
<div class="copyright">
	<div class="copy_fra">
    	<div class="copy_left"><img src="<%=path%>/images/sy02_03.jpg"></div>
        <div class="copy_center">
        	页面版权所有：中投汇融财富管理中心&nbsp;&nbsp;&nbsp;&nbsp;京ICP备13011445号<br>
地址：******************************************&nbsp;&nbsp;&nbsp;&nbsp;客服电话：010-84243099
        </div>
        <div class="copy_right"><img src="<%=path%>/images/sy01_03.png"></div>
    </div>
</div>
</body>
</html>
