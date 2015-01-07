<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13-12-3
  Time: 下午2:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>修改密码</title>
<script>
	function submitForm() {
		$("#btn-submit").linkbutton("disable");
		var r = $('#chpasswd').form('validate');
		if (!r) {
			$("#btn-submit").linkbutton("enable");
			return false;
		}

		$.post("user/changePasswd", $("#chpasswd").serializeArray(), function(
				data) {
			if (data.retcode == 0) {
				$.messager.alert('提示', data.msg, 'info', function() {
					window.location.href = "index.jsp";
				});
			} else {
				$.messager.alert('提示', data.msg, 'warning');
				$("#btn-submit").linkbutton("enable");
			}
		});
		return true;
	}

	function clearForm() {
		$("#password").val("");
		$("#confirmpassword").val("");
		$("#oldpassword").val("");
	}
</script>
<style type="text/css">
table {
	text-align: center;
	border-collapse: collapse;
	width: 409px;
}

input {
	border: 1px solid #999;
	text-align: left;
}
</style>
</head>
<body>
	<form id="chpasswd" method="POST">
	<div class="xgmm">
	<table align="center" style="background:url(img/xgmm.png); widht:409px; height:300px;">
		  <tr>
		    <td>&nbsp;</td>
	      </tr>
		  <tr>
		    <td valign="top"><table align="center" height="250px">
		      <tr>
		        <td colspan="2">&nbsp;</td>
	          </tr>
		      <tr>
		        <td width="172" align="right">原密码：</td>
		        <td width="225" align="left"><input id="oldpassword" name="oldpassword"class="easyui-validatebox" required type="password"validType="length[4,32]" /></td>
	          </tr>
		      <tr>
		        <td align="right">新密码：</td>
		        <td align="left"><input id="password" name="password"class="easyui-validatebox" required type="password"validType="length[4,32]" /></td>
	          </tr>
		      <tr>
		        <td align="right">重复密码：</td>
		        <td align="left"><input id="confirmpassword" name="confirmpassword"class="easyui-validatebox" required type="password"validType="equalTo['#password']" invalidMessage="两次输入密码不匹配" /></td>
	          </tr>
		      <tr>
		        <td align="right"><a href="#" id="btn-back" onClick="clearForm();"
					class="easyui-linkbutton" iconCls="icon-cancel">重置</a></td>
		        <td><a href="#" id="btn-submit" onClick="submitForm();"
					class="easyui-linkbutton" iconCls="icon-save">保存</a></td>
	          </tr>
	        </table></td>
	      </tr>
	  </table>
		</div>
	</form>
</body>
</html>