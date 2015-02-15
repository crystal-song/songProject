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
            <div class="next_list">
                <a href="/account/liquan?page=1&catlog=0">首页</a>
                <c:if test="${page.page > 1}"><a href="/account/liquan?page=${page.page-1}&catlog=${catlog}">上一页</a>  </c:if>
                <div class="pageNum"></div>
                <c:if test="${page.page < page.pagecount}">  <a href="/account/liquan?page=${page.page+1}&catlog=${catlog}">下一页</a>  </c:if>
                <a href="/account/liquan?page=${page.pagecount}&catlog=${catlog}">末页</a>
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
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script> 
<script>
    var navIndex=3;
    var indexs=2;
    $(function(){
        $(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
        $(".u_left_sec:eq(2) li:eq(5)").children("a").css("color","#fc652e");
        
        $(".nav_big a").eq(2).children("p").addClass("headwd_color");
    })


</script>


<script>
    function jumpPage(pag){
        /* alert("ccccccccccc"+pag); */
        $('#pageNo').val(pag);
        $("#form" ).submit();
    }

    function pagerInit(a,b){//${page.pagecount},${page.page}
        var totalPages=a;
        var curPage=b;
        if(curPage>totalPages)return false;
        var endPage=curPage+5>totalPages-1?totalPages-1:curPage+5;
        var startPage=endPage-7>2?endPage-7:2;
        endPage=startPage+7>totalPages?totalPages:startPage+7;
        console.log(startPage+"/"+endPage+"/"+curPage);
        var str='';


        var spl='<span>...</span>';
        $(".pageNum").html('<a href="javascript:jumpPage(1)" class="pager">1</a>');
        if(startPage>2){$(".pageNum").html($(".pageNum").html()+spl);}
        for(i=startPage;i<endPage;i++){
            str='<a href="javascript:jumpPage('+i+')" class="pager">'+i+'</a>';
            $(".pageNum").html($(".pageNum").html()+str);
        }
        if(endPage<totalPages-1){$(".pageNum").html($(".pageNum").html()+spl);}
        if(totalPages>1)$(".pageNum").html($(".pageNum").html()+'<a href="javascript:jumpPage('+totalPages+')" class="pager">'+totalPages+'</a>');
        $(".pager").eq(curPage-startPage+1).addClass("pageNumCur");
        $(".pageNumCur").attr("href","javascript:;");


    }

</script>

