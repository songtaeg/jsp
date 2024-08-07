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
		String id=request.getParameter("userID");
		
		try{
			stmt = conn.createStatement();
			String querytext = "UPDATE TBL_USER SET CNT=0 where userid='"+id+"'";
			stmt.executeUpdate(querytext);	
			//response.sendRedirect("user-list.jsp");
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>
<script>
	alert("비밀번호 초기화");
	window.close();
	window.opener.fnReload();
</script>