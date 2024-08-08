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
		String boardNo=request.getParameter("boardNo");
		String title=request.getParameter("title");
		String contents=request.getParameter("contents");
		try{
			stmt = conn.createStatement();
			String querytext = 
				"UPDATE TBL_BOARD SET title='"+title+"',contents='"+contents+"' where boardNo='"+boardNo+"'";
			stmt.executeUpdate(querytext);
			//System.out.println("수정 완료");
			response.sendRedirect("table2.jsp");
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
<script>
	alert("수정 완료");
	location.href="table2.jsp";
</script>