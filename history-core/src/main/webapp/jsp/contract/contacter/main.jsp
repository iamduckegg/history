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
	<link rel="stylesheet" href="<%=contextPath%>/js/layui/css/layui.css?v=20190305">
	<title>联系人</title>
</head>
<body class="layui-layout-body">
	<span>待完善</span>
</body>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-3.3.1.min.js?v=20190305"></script>
<script type="text/javascript" src="<%=contextPath%>/js/layui/layui.js?v=20190305"></script>

<script>
var path = '<%=contextPath%>';
layui.use('element', function(){
	var element = layui.element;
	
});
</script>
</html>