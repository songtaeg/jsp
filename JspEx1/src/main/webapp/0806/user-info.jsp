<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, th, tr, td{
		 border : 1px solid black ;
		 border-collapse: collapse;
		 padding: 10px;
	}
</style>	
</head>
<body>
	<%@include file="db.jsp"%>
	<%
		ResultSet rs = null;
		Statement stmt = null;
		
		String id= request.getParameter("userId");
		try{
			stmt = conn.createStatement();
			String querytext = 
				"SELECT * FROM tbl_user where userid='"+id+"'";
			rs = stmt.executeQuery(querytext);
		%>
		<table>
			<tr>
				<th> 아이디 </th>
				<th> 이름 </th>
				<th> 사용자 권한 </th>
			</tr>			
		<%
		while (rs.next()) {
		%>
			<tr>
				<td> <%= rs.getString("userid") %></td>
				<td> <%= rs.getString("pwd") %></td>
				<td> <%= rs.getString("status") %></td>
			</tr>
		<%
		}
		%>
		</table>
		<%
		} 
		catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>