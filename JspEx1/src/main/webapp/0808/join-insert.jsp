<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
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
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("userName");
		
		stmt=conn.createStatement();
		String query = "INSERT INTO tbl_user VALUES('" + id + "', '" + pwd + "', '" + name+"',0,''N,'C')";  		
		stmt.executeUpdate(query);
		
	%>
	
</body>
</html>