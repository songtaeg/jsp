<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		String id= request.getParameter("userID");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("userName");
		String phone=request.getParameter("phone");
		String gender=request.getParameter("gender.value");
	%>
</body>
</html>