<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/includes/taglibs.jsp" %>

<title>我的众筹 - 我的账户 - 中租宝</title>
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
            <div class="pro_con_title" style="margin-top:5px;"><strong>我的众筹</strong></div>

            <table  bgcolor="#ccc" border="0" cellpadding="0" cellspacing="1" class="quan_tab">
                <tr>                                                                                                                                                              
                    <td bgcolor="#ededed">项目名称</td>
                    <td bgcolor="#ededed">购买数量</td>
                    <td bgcolor="#ededed">购买日期</td>
                    <td bgcolor="#ededed">交易金额 ( 元)</td>
                    <td bgcolor="#ededed">操作</td>
                </tr>
                 	<c:forEach var="s" items="${payments.list}" varStatus="i">
                <tr>
                    <td bgcolor="#FFFFFF"><a href="/hero/get-by-id?id=${s.id}" target="_blank">${s.name }</a></td>
                    <td bgcolor="#FFFFFF">1</td>
                    <td bgcolor="#FFFFFF">${s.created_at }</td>
                    <td bgcolor="#FFFFFF">${s.amount + s.user_fee_amount }</td>
                    <td bgcolor="#FFFFFF"><a href="/hero/payment-by-id?id=${s.id}">查看详情</a></td>
                </tr>
           	</c:forEach>
            </table>

            		<div class="clear"></div>
			<div class='next_list ${payments.pagecount >1?"":"hide" }'>
				<a href="/hero/my">首页</a>
				<c:if test=""></c:if>
				<c:if test="${payments.page > 1}">
					<a href="/hero/my?pageNo=${payments.page-1}">上一页</a>
				</c:if>
				<div class="pageNum">
					<c:forEach var="i" begin="1" end="${payments.pagecount }">
						<a href="/hero/my?status=${status}&pageNo=${i }"
							class='pager ${i== payments.page?"pageNumCur":""}'>${i }</a>
					</c:forEach>

				</div>
				<c:if test="${heros.page < heros.pagecount}">
					<a href="/hero/all?pageNo=${payments.page+1}">下一页</a>
				</c:if>
				<a href="/hero/my?pageNo=${payments.pagecount}">末页</a>
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



<script type="text/javascript" src=/js/jquery-1.7.2.min.js"></script> 
<script>	head_index = 2;</script>
<script type="text/javascript" src="/static/js/zhongzubao.js?va=4"></script>

<script>
    var indexs=2;
    $(function(){
        $(".u_left_sec:eq(2) li:eq(4)").children("a").css("color","#fc652e");
    })


</script>




