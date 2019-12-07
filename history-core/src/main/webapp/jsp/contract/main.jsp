<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath=request.getContextPath();
%>
<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Pragma" content="no-cache">
	<link rel="stylesheet" href="<%=contextPath%>/js/layui/css/layui.css?v=20190305">
	<title>后台管理</title>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-layout layui-layout-admin">
		  <div class="layui-header">
		    <div class="layui-logo">后台管理</div>
		  </div>
		  
		  <div class="layui-side layui-bg-black">
		    <div class="layui-side-scroll">
		      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
		      <ul class="layui-nav layui-nav-tree"  lay-filter="menu" lay-shrink="all">
		        <li class="layui-nav-item layui-nav-itemed">
		          <a class="" href="javascript:;">功能列表</a>
		          <dl class="layui-nav-child">
		            <dd><a href="javascript:;" onclick="clickMenu('car')">车辆列表</a></dd>
		            <dd><a href="javascript:;" onclick="clickMenu('contract')" >合同列表</a></dd>
		            <dd><a href="javascript:;" onclick="clickMenu('client')" >客户列表</a></dd>
		            <dd><a href="javascript:;" onclick="clickMenu('contacter')" >联系人列表</a></dd>
		            <dd><a href="javascript:;" onclick="clickMenu('inventoryHis')" >出入库记录</a></dd>
		          </dl>
		        </li>
		        <li class="layui-nav-item">
		          <a class="" href="javascript:;">台账统计</a>
		          <dl class="layui-nav-child">
		            <dd><a href="javascript:;">合同台账</a></dd>
		            <dd><a href="javascript:;">库存台账</a></dd>
		          </dl>
		        </li>
		      </ul>
		    </div>
		  </div>
		  
		  <div class="layui-body" style="height: 100%" >
		    <!-- 内容主体区域 -->
		    <div style="padding: 15px; height: 95%">
			    <iframe id="iframe" src="" frameborder="0" id="" style="width: 100%; height: 100%;"></iframe>
			</div>
		  </div>
		  
		  <div class="layui-footer">

		  </div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-3.3.1.min.js?v=20190305"></script>
<script type="text/javascript" src="<%=contextPath%>/js/layui/layui.js?v=20190305"></script>

<script>

var path = '<%=contextPath%>';
layui.use('element', function(){
	var element = layui.element;
	
});
function clickMenu(menu){
	if(menu=="car"){
		$("#iframe").attr("src",path+"/contract/car")
	}
	if(menu=="client"){
		$("#iframe").attr("src",path+"/contract/client")
	}
	if(menu=="contacter"){
		$("#iframe").attr("src",path+"/contract/contacter")
	}
	if(menu=="contract"){
		$("#iframe").attr("src",path+"/contract/contract")
	}
	if(menu=="inventoryHis"){
		$("#iframe").attr("src",path+"/contract/inventoryHis")
	}
}
</script>
</html>