<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
  
<title>推荐管理 - 我的账户 - 中租宝</title>
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
          <div class="pro_con_title" style="margin-top:5px;"><strong>推荐管理</strong></div>
            
               <ul class="tui_li">
                  <li><span>用户名：</span><span>${username}</span></li>
                  <li style="display:none"><span>我的推荐人：</span><span>${ref}</span></li>
                  <li><span>我的推广链接：</span><span style="margin:0; width:auto">${ref_link}</span></li>
                  <li style="width:700px"><span>我的分享：</span>
                      <span style="width:260px">
                          <div class="bdsharebuttonbox" data-tag="share_1">
							<a class="bds_mshare" data-cmd="mshare"></a>
							<a class="bds_qzone" data-cmd="qzone" href="#"></a>
							<a class="bds_tsina" data-cmd="tsina"></a>
							<a class="bds_baidu" data-cmd="baidu"></a>
							<a class="bds_renren" data-cmd="renren"></a>
							<a class="bds_tqq" data-cmd="tqq"></a>
							<a class="bds_more" data-cmd="more">更多</a>
							<a class="bds_count" data-cmd="count"></a>
                          </div>                                      
                      </span>
                      <a>
                      <button id="d_clip_button"  data-clipboard-target="fe_text" class="fuzhi"><b>复制</b></button>
                      </a> 
                  </li>    
               </ul>                            
               <div class="tui_pic">
				   <div class="tui_left"><img src="<%=path%>/img/images-2014-11/daijinquan01.jpg"></div>
                  <textarea class="tui_right" value="全新稳健性投资平台，中租宝诚邀体验，注册就送100元。" name="MSG" id="fe_text" cols=33 rows=4>全新稳健性投资平台，中租宝诚邀体验，注册就送100元。${ref_link}</textarea>
               </div>
               <p class="tui_num">我推荐的 </p>
               
				<table border="0" cellpadding="0" cellspacing="1" bgcolor="#ccc" class="tui_tab">
					  <tr>
					    <td bgcolor="#FFFFFF">用户名&nbsp;&nbsp;</td>
					    <td bgcolor="#FFFFFF">注册时间</td>
					  </tr>
					<c:if test="${ not empty list}">
						<c:forEach var="t" items="${list}">
							<tr>
								<td bgcolor="#FFFFFF">${t.name}</td>
								<td bgcolor="#FFFFFF">${t.regTime}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			<c:if test="${empty list}">
				<li >
					暂无推荐记录
				</li>
			</c:if>
            <div class="clear"></div>
			<div class="next_list" style="display:none">
				<a href="<%=path %>/account/tuijian">首页</a>
				<c:if test="${page.page > 1}"><a href="<%=path %>/account/tujian?page=${page.page-1}">上一页</a>  </c:if>
				<div class="pageNum"></div>
				<c:if test="${page.page < page.pagecount}">  <a href="<%=path %>/account/tuijian?page=${page.page+1}">下一页</a>  </c:if>
				<a href="<%=path %>/account/tuijian?page=${page.pagecount}">末页</a>
			</div>
      </div>   
    </div>
</div>

<br/>
<!-- <textarea id="fe_text" cols="50" rows="3">输入需要复制的内容</textarea>
<button id="d_clip_button" class="anquan_hide_btn" data-clipboard-target="fe_text"><b>复制到剪贴板</b></button> -->
<!-- absolute_right start -->
<%@ include file="/includes/absolute.jsp" %>
<!-- absolute_right end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>

<script type="text/javascript" src="<%=path%>/js/ZeroClipboard.js"></script>
<script type="text/javascript">
// 定义一个新的复制对象
var clip = new ZeroClipboard( document.getElementById("d_clip_button"), {
  moviePath: "<%=path%>/js/ZeroClipboard.swf"
} );

// 复制内容到剪贴板成功后的操作
clip.on( 'complete', function(client, args) {
	alert("复制成功");
} );


$(function(){
	$(".zichan_con .tui_li li span:odd").css("text-align","left");
})
  

</script>

<!-- 百度分享js代码 -->
 <script>
					window._bd_share_config = {
						common : {
							bdText : '理财生活两手抓！ 中租宝帮您发发发',	
							bdDesc : '理财生活两手抓！ 中租宝帮您发发发。',	
							bdUrl : '${ref_link}',
							bdPic : 'http://ptobchina.com/img/images-2014-11/fenxiang_pic.gif'
						},
						share : [{
							"bdSize" : 16
						}],
						slide : [{	   
							bdImg : 0,
							bdPos : "right",
							bdTop : 100
						}],
						image : [{
							viewType : 'list',
							viewPos : 'top',
							viewColor : 'black',
							viewSize : '16',
							viewList : ['qzone','tsina','huaban','tqq','renren']
						}],
						selectShare : [{
							"bdselectMiniList" : ['qzone','tqq','kaixin001','bdxc','tqf']
						}]
					}
					with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
				</script>
			
