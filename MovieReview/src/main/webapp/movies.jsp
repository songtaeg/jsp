<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movies List</title>
<style>
body{
margin: 0;
padding:20px;
background-color: #f4f4f4;
}

table,th,tr,td{
 	border: 1px solid black;
 	border-collapse: collapse;
 	padding: 10px; 
 	text-align:center;
}
img{
	width:150px;
	height:150px;
	border: 2px soild #ddd;
	border-radius: 8px;
}
</style>
</head>
<body>
	<h1>movie list</h1>
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>title</th>
				<th>포스터</th>
				<th>감독</th>
				<th>개봉일</th>
				<th>장르</th>
			</tr>
		</thead>
		<tbody>
			<% 
				ResultSet rs = null;
				Statement stmt = null;
				
				try{
					stmt = conn.createStatement();
					String querytext ="SELECT * FROM movies";
					rs = stmt.executeQuery(querytext);
					
					while(rs.next()){
	                    int movieId = rs.getInt("id");
	                    String title = rs.getString("title");
	                    String posterUrl = rs.getString("poster_url");
	                    String director = rs.getString("director");
	                    int year = rs.getInt("year");
	                    String genre = rs.getString("genre");
			%>
			<tr>
                <td><%= movieId %></td>
                <td><%= title %></td>
                <td><img src="<%= posterUrl %>" alt="Poster"></td>
                <td><%= director %></td>
                <td><%= year %></td>
                <td><%= genre %></td>
            </tr>
			<%
					}
				}catch(SQLException ex) {
					out.println("SQLException : " + ex.getMessage());
				}
			%>

		</tbody>
	</table>
</body>
</html>