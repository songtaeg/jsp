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
		ResultSet rs = null;
		Statement stmt = null;
		
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					"SELECT * FROM TBL_USER where userID='"+id+"'"+"AND pwd='"+pwd+"'";
			rs = stmt.executeQuery(querytext);
			
			if(rs.next()){
				out.println("로그인 성공");
				session.setAttribute("userID", rs.getString("userId"));
				response.sendRedirect("table.jsp");
			}else{
				out.println("로그인 실패");
			}
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>