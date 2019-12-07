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
	<style type="text/css">
	
    </style>
	
	<title>客户管理</title>
</head>
<body>
	<div class="layui-form clientTable" lay-filter="clientSearch" style="height: 40px; margin-top: 2px;">
		<div class="layui-inline" style="margin-top: 5px;">
			<div class="layui-input-inline" style="width: 200px;">
		      <input type="text" id="clientName" required lay-verify="required" placeholder="客户名" autocomplete="off" class="layui-input">
		    </div>
			<div class="layui-input-inline" style="width: 200px;">
		      <select id="clientType" lay-verify="">
		      	<option value="">客户类型</option>
		      	<option value="1">企业客户</option>
		      	<option value="2">个人客户</option>
		      </select> 
		    </div>
			<div class="layui-btn" data-type="reload" style="margin-left: 58px;">搜索</div>
		  	<div class="layui-btn" id="cleanSearch" style="">清空</div>
		</div>
		<div class="">
			<table lay-filter="client_table" id="client_table"></table>  
		</div>
	</div>
	<script type="text/html" id="toolbar">
	<div class="layui-btn-group">
	  <button class="layui-btn" lay-event="add">增加</button>
	  <button class="layui-btn" lay-event="edit">编辑</button>
	  <button class="layui-btn" lay-event="delete">删除</button>
	  <button class="layui-btn" id="import">导入</button>
	  <a class="layui-btn" id="export" href="<%=contextPath%>/contract/client/export/" >导出</a>
	</div>
	</script>
</body>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-3.3.1.min.js?v=20190305"></script>
<script type="text/javascript" src="<%=contextPath%>/js/layui/layui.js?v=20190305"></script>
<script>
layui.use(['form','table','laypage','laydate','upload'], function(){
    var path = '<%=contextPath%>';
	var table = layui.table
	,laypage = layui.laypage
	,form = layui.form
	,laydate = layui.laydate
	,upload = layui.upload;
	//第一个实例
	table.render({
		elem: '#client_table'
		,url: path+'/contract/client/list' // 数据接口
		,height: 484
		,page: false
		,limit: 10
		//,limits:[10,100]
		//,toolbar: "#toolbar"
		//,defaultToolbar:['filter']
        ,response:{
            statusName:'code'
            ,statusCode:200
            ,msgName:'msg'
            ,countName:'count'
            ,dataName:'data'
        }
		,cols: [[ //表头
		     {type: 'checkbox', fixed: 'left'}
			,{type: 'numbers', title: '序号' }
			,{field: 'clientId', hide: true}
			,{field: 'clientName', title: '客户名', width:120 }
			,{field: 'clientNum', title: '客户编号', width:100 }
			,{field: 'clientType', title: '客户类型', width:100 }
			,{field: 'cardNum', title: '证件号码', width:150 }
			,{field: 'site', title: '地址', width:200 }
			,{field: 'createDate', title: '创建时间', width:170 }
			,{field: 'updateDate', title: '修改时间', width:170 }
		]]
		,id:"reload"
	});
	
	upload.render({
		elem: '#import'
		,url: './client/import'
		,accept: 'file' //普通文件
		,done: function(res){
		console.log(res)
		}
	});

	//头工具栏事件
	table.on('toolbar(client_table)', function(obj){
	    var checkStatus = table.checkStatus(obj.config.id);
	    switch(obj.event){
	      case 'add':
	    	  layer.open({
				  type: 2,
				  title: '新增',
				  shadeClose: false,
				  shade: 0.8,
				  area: ['50%', '350px'],
				  content: './client/toAdd'
				});
	    	  break;
	      case 'edit':
	    	  var data = checkStatus.data;
	    	  if(data.length==1){
		    	  layer.open({
					  type: 2,
					  title: '修改',
					  shadeClose: false,
					  shade: 0.8,
					  area: ['50%', '350px'],
					  content: './client/toEdit?clientId='+data[0].clientId
					});
	    	  } else if (data.length==0) {
	    		  layer.msg("请选择一条");
	    	  } else {
	    		  layer.msg("只能选择一条");
	    	  }
	    	  break;
	      case 'delete':
	    	  var data = checkStatus.data;
	    	  if(data.length==0){
	    		  layer.msg("请选择一条");
	    	  }else {
	    		  layer.msg('确定删除？', {
	    			  time: 0 //不自动关闭
	    			  ,btn: ['确认', '取消']
	    			  ,yes: function(index){
	    			    layer.close(index);
		    			  var ids = "";  
			    		  for (var i = 0; i<data.length; i++) {
			    			  ids += data[i].clientId + ",";
			    		  }
			    		  ids=ids.substring(0,ids.length-1);
		    			  $.ajax({
		    				  url:"./client/remove"
		    				  ,type:"GET"
		    				  ,dataType:"JSON"
		    				  ,data:{ clientIds : ids}
		    				  ,success: function(data){
		    					  location.reload(); 
		    				  }
		    			  })
	    			  }
	    		  });
	    		  
	    	  }
	    	  break;
	    };
	});
	//搜索按钮
	var $ = layui.$, active = {
	        reload: function(){
	            table.reload('reload', {
	                page: {
	                    curr: 1 //重新从第 1 页开始
	                  }
	                ,where: {
	                	clientName: $("#clientName").val()
	                	,clientType: $("#clientType").val()
	                }
	            });
	        }
	    };
	//搜索按钮点击事件
	$('.clientTable .layui-btn').on('click', function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	  });
	//搜索条件清空
	$("#cleanSearch").click( function () { 
		$("#clientName").val("");
		$("#clientType").val("");
		form.render();
	})
});

</script>
</html>