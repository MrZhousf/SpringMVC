<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>访问出错</title>
<%@include file="head.jsp" %>
</head>
<body>
<h2 style="margin-left: 20px">抱歉，访问出错！</h2>
<h3 style="margin-left: 20px">错误信息：${ex.message}</h3>
</body>
</html>
