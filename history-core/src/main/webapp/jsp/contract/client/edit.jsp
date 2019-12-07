<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<link rel="stylesheet" href="<%=contextPath%>/static/layui/css/layui.css?v=20190305">

<title>新增客户</title>
</head>
<body class="">
	<div style="padding: 10px 10px 0px 10px;">
		<form lay-filter="clientForm" class="layui-form layui-form-pane" action="<%=contextPath%>/contract/client/modify" >
			<!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
			<input type="hidden" name="clientId" />
			<!-- 表单开始 -->
			<div class="layui-form-item">
				<label class="layui-form-label">客户姓名</label>
				<div class="layui-input-block">
					<input type="text" name="clientName" maxlength="50" placeholder="请输入" lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">证件号码</label>
				<div class="layui-input-block">
					<input type="text" name="cardNum" maxlength="20" placeholder="请输入" lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">客户类型</label>
				<div class="layui-input-block">
					<select name="clientType" lay-filter="aihao" lay-verify="required">
						<option value="">请选择</option>
						<option value="1">企业客户</option>
						<option value="2">个人客户</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">地址</label>
				<div class="layui-input-block">
					<input type="text" name="site" maxlength="200" placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
			<!-- 表单结束 -->
			<div class="layui-form-item" style="text-align: center;">
				<div class="layui-btn-container">
					<button class="layui-btn" lay-submit="" lay-filter="save" id="save">保存</button>
					<div class="layui-btn layui-btn-primary" lay-filter="close" id="close">取消</div>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="<%=contextPath%>/static/js/jquery-3.3.1.min.js?v=20190305"></script>
<script type="text/javascript" src="<%=contextPath%>/static/layui/layui.js?v=20190305"></script>
<script>
layui.use([ 'form', 'layedit', 'laydate' ], function() {
	var form = layui.form  
	  ,layer = layui.layer
	  ,laydate = layui.laydate;
	var client = eval('(' + '${client }' + ')');
	form.val("clientForm", {
		  "clientId": client.clientId
		  ,"clientName": client.clientName
		  ,"cardNum": client.cardNum
		  ,"clientType": client.clientType
		  ,"site": client.site
	})
	
	//parent 是 JS 自带的全局对象，可用于操作父页面
	 var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	 
	 //自定义验证规则
	 form.verify({
	   
	 });
	 //保存
	 $('#save').on('click', function(){
		  //监听提交
		  form.on('submit(save)',function(data){
			  parent.layer.close(index);
			  window.parent.location.reload();
		  });
	 })
			  
	  $('#close').on('click', function(){
		  parent.layer.close(index);
	  });
});
</script>
</html>