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
		String stuno=request.getParameter("stuno");
		ResultSet rs = null;
		Statement stmt = null;
		
		try{
			stmt = conn.createStatement();
			String querytext = "select * from student where stu_no='"+stuno+"'";
			rs = stmt.executeQuery(querytext);
	
			if (rs.next()) {
				out.println(rs.getString("stu_no") + "\t" + rs.getString("stu_name") + "\t"
						+rs.getString("stu_dept")+"\t"+ rs.getString("stu_gender")+"<br>"); 
			}else{
				out.println("해당 학생은 존재하지 않습니다");
			}
	
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
	
</body>
</html>