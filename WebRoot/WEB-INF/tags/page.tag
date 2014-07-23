<%@ tag pageEncoding="UTF-8"%>
<%@ attribute name="page" type="com.mftour.spring.util.Page" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
int current =  page.getPageNo();
int begin = 1;
int end = page.getTotalPage();

request.setAttribute("current", current);
request.setAttribute("begin", begin);
request.setAttribute("end", end);
request.setAttribute("pList", page.getPageNoDisp());

%>
<script type="text/javascript">
  var paras = '<%=page.getParaJson()%>';
  var paraJson = eval('(' + paras + ')');

  //将提交参数转换为JSON
  var paraLists = '<%=page.getParaListJson()%>';
  var paraListJson = eval('(' + paraLists + ')');
  function pageClick( pNo ){
    paraJson["pageNo"] = pNo;
    paraJson["pageSize"] = "<%=page.getPageSize()%>";
    
    var jsPost = function(action, values, valueLists) {
      var id = Math.random();
      document.write('<form id="post' + id + '" name="post'+ id +'" action="' + action + '" method="post">');
      for (var key in values) {
        document.write('<input type="hidden" name="' + key + '" value="' + values[key] + '" />');
      }
      for (var key2 in valueLists) {
        for (var index in valueLists[key2]) {
          document.write('<input type="hidden" name="' + key2 + '" value="' + valueLists[key2][index] + '" />');
        }
      }
      document.write('</form>');    
      document.getElementById('post' + id).submit();
    }
    
    //发送POST
    jsPost("<%=page.getSearchUrl()%>", paraJson, paraListJson);
  }
</script>
<div class="c-page">
  <% if (current!=1 && end!=0){%>
      <a href="#" onclick="pageClick(1)" class="org">首页</a>
      <a href="#" onclick="pageClick(${current-1})" class="org">上一页</a>
  <%}else{%>
        <a href="#" class="page-border" >首页</a>
      <a href="#">上一页</a>
  <%} %>
  <c:forTokens items="${pList}" delims="|" var="pNo">
    <c:choose>
      <c:when test="${pNo == 0}">
      <!--   <label style="font-size: 10px; width: 20px; text-align: center;">•••</label> -->…
      </c:when>
      <c:when test="${pNo != current}">
        <a href="#" class="org" onclick="pageClick(${pNo})">${pNo}</a>
      </c:when>
      <c:otherwise>
           <a href="#"  style="font-weight:bold;">${pNo}</a>
      </c:otherwise>
    </c:choose>
  </c:forTokens>
  <% if (current<end && end!=0){%>
    <a href="#" class="org" onclick="pageClick(${current+1})">下一页</a>
    <a href="#" class="org" onclick="pageClick(${end})">末页</a>
  <%}else{%>
    <a href="#" >下一页</a>
    <a href="#" class="page-border" >末页</a>
  <%} %>
</div>
