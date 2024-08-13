<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="db.jsp"%>	

	<% 
		Statement stmt = null;
	
		String id= request.getParameter("userId");
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");

		stmt=conn.createStatement();
		String query = "INSERT INTO users VALUES('" + id + "', '" + name + "', '" + pwd+"','"+email+"')";  		
		stmt.executeUpdate(query);
	%>
</body>
</html>
<script>
	alert('가입 성공');
	location.href="login.jsp";
</script>