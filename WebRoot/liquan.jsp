<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>

<title>我的礼券 - 我的账户 - 中租宝</title>
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
            <div class="pro_con_title" style="margin-top:5px;"><strong>我的礼券</strong></div>
            <div class="quan_label">
                <div class="${catlog eq "0"?"quan_red":""}"><a href="/account/liquan?page=1&catlog=0">可用礼券</a></div>
                <div class="${catlog eq "1"?"quan_red":""}"><a href="/account/liquan?page=1&catlog=1">已用礼券</a></div>
                <div class="${catlog eq "2"?"quan_red":""}"><a href="/account/liquan?page=1&catlog=2">过期礼券</a></div>
            </div>
            <table  bgcolor="#eee" border="0" cellpadding="0" cellspacing="1" class="quan_tab">
                <tr>
                    <td bgcolor="#FFFFFF">礼券名称</td>
                    <td bgcolor="#FFFFFF">礼券状态</td>
                    <td bgcolor="#FFFFFF">礼券类型</td>
                    <td bgcolor="#FFFFFF">获得时间</td>
                    <td bgcolor="#FFFFFF">过期时间</td>
                </tr>

                <c:if test="${ not empty list}">
                    <c:forEach var="t" items="${list}">
                        <tr>
                            <td bgcolor="#FFFFFF">${t.remark}</td>
                        <td bgcolor="#FFFFFF">${t.use?"已使用":"未使用"}</td>
                        <td bgcolor="#FFFFFF">${t.amount}元</td>
                        <td bgcolor="#FFFFFF">${t.giveTime}</td>
                        <td bgcolor="#FFFFFF">${t.expireTime}</td>
                        </tr>
                    </c:forEach>
                </c:if>

            </table>
            <c:if test="${empty list}">
                <li >
                    暂无记录
                </li>
            </c:if>

            <div class="clear"></div>
            <div class="next_list">
                <a href="<%=path %>/account/liquan?page=1&catlog=0">首页</a>
                <c:if test="${page.page > 1}"><a href="<%=path %>/account/liquan?page=${page.page-1}&catlog=${catlog}">上一页</a>  </c:if>
                <div class="pageNum"></div>
                <c:if test="${page.page < page.pagecount}">  <a href="<%=path %>/account/liquan?page=${page.page+1}&catlog=${catlog}">下一页</a>  </c:if>
                <a href="<%=path %>/account/liquan?page=${page.pagecount}&catlog=${catlog}">末页</a>
            </div>
        </div>
    </div>
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
<script>
    var navIndex=3;
    var indexs=1;
    $(function(){
        $(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");
        $(".u_left_sec:eq(1) li:eq(4)").children("a").css("color","#fc652e");
        $(".zichan_con .tui_li li span:odd").css("text-align","left");
        $(".nav_big a").eq(2).children("p").addClass("headwd_color");
    })


</script>
<script type="text/javascript">

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
</html>
