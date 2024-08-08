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
		ResultSet rs = null;
		Statement stmt = null;
	
		String id= request.getParameter("userId");
		
		stmt = conn.createStatement();
		String query="select count(*) as cnt from tbl_user where userid='"+id+"' ";
		rs = stmt.executeQuery(query);
		
		while(rs.next()){
			if(rs.getInt("cnt")==1){
				out.println("<script>alert('중복된 아이디입니다.')</script>");
			}else{
				out.println("사용가능한 아이디입니다");
			}
		}
	%>
</body>
</html>