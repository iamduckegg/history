<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String contextPath=request.getContextPath();
%>
<!DOCTYPE html>
<head>
    <title>首页</title>
</head>
<body>
    这是首页
    
    <a href="./system/manage">管理页面</a>
    
    
    <a href="./login/doLogout">登出</a>
</body>
</html>
