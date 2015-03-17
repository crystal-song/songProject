<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script type="text/javascript">
	jQuery(function($) {
		//下拉表格初始化
		$('#addDeptId').combobox({
			valueField : 'id', //值字段
			textField : 'name', //显示的字段
			url : 'dept/allList',
			panelHeight : 'auto',
			required : true,
			editable : false
		//不可编辑，只能选择
		});
	});

	function addOrUpdateUser() {
		var r = $('#userForm').form('validate');
		if (!r) {
			return false;
		}
		$("#btn-add").linkbutton("disable");
		$.post("user/addOrUpdate", $("#userForm").serializeArray(), function(
				data) {
			$('#MyPopWindow').window('close');
			$('#userTable').datagrid('reload');
			$.messager.alert('提示', data.mes, 'info');
		});
	}
</script>
</head>

<body>
	<!-- 验证还是jquery-validation好用，这里省事没用 -->
	<form id="userForm" method="post"
		style="margin: 10; text-align: center;">
		<input type="hidden" name="id" id="uuid"> 
		名字：<input name="name" style="width: 200; height:20px; border:1px #a4bed4 solid;" validType="length[2,30]"class="easyui-validatebox" required="true"><br>
		账号：<input name="account" style="width: 200; height:20px; border:1px #a4bed4 solid;" validType="length[3,30]"class="easyui-validatebox" required="true"><br> 
		密码：<input name="password" style="width: 200; height:20px; border:1px #a4bed4 solid;" type="password"validType="length[4,30]" class="easyui-validatebox" required="true"><br> 
		年龄：<input class="easyui-numberbox" name="age" min="1"max="120" increment="1" style="width: 200px; height:20px;"><br> 
		生日：<input name="birthday" style="width: 200; height:20px; border:1px #a4bed4 solid; margin-top:5px;" class="Wdate"onClick="WdatePicker()"><br>
		部门：<input id="addDeptId"name="deptId" style="width: 200; height:20px; border:1px #a4bed4 solid;"><br>
		<br>
		<a href="#" id="btn-back" onclick="closeWindow();"class="easyui-linkbutton" iconCls="icon-back">返回</a>
		<a href="#"id="btn-add" onclick="addOrUpdateUser();" class="easyui-linkbutton"iconCls="icon-save">保存</a>
	</form>
</body>
</html>
