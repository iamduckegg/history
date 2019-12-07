<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String contextPath=request.getContextPath();
%>
<!DOCTYPE html>
<head>
    <title>登录页面</title>
</head>
<body>
    <form action="./login/doLogin" method="get" >
        username: <input name="username" id="username" type="text">
        password: <input name="password" id="password" type="text">
        <input type="submit" value="提交">
    </form>


</body>
</html>
