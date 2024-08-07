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
 		String boardNo =request.getParameter("boardNo");
 		String comment =request.getParameter("comment");
 		String userID=(String) session.getAttribute("userID");
	
		ResultSet rs = null;
		Statement stmt = null;
		
		try{
			stmt = conn.createStatement();
			String querytext = "insert into tbl_comment values("
					+"Null,'"+boardNo+"','"+userID+"','"+comment+"','0',now(),now()"
					+")";
					
			stmt.executeUpdate(querytext);
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
<script>
 	alert("저장되었습니다.");
	window.close();
	window.opener.fnReload();
</script>