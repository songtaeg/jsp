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
 	String title =request.getParameter("title");
 	String content =request.getParameter("content");
 	String userID=(String) session.getAttribute("userID");
 	
 	ResultSet rs = null;
	Statement stmt = null;
	try{
		stmt = conn.createStatement();
		String querytext = "insert into tbl_board values"
				+"("+"Null,'"+title+"','"+content+"',0,'"+userID+ "','number',now(),now()"
				+")";
		stmt.executeUpdate(querytext);
		System.out.println("완료");
		response.sendRedirect("table2.jsp");
		//out.println("확인");
		
	}catch(SQLException e){
		out.println("SQLException : " + e.getMessage());
	}
 %>
</body>
</html>