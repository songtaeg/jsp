<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movies List</title>
<style>
body {
    background-color: #f4f4f4;
    display: flex;
    flex-direction: column; /* 세로 방향 레이아웃 설정 */
    align-items: center;  /* 가로 방향 가운데 정렬 */
    height: 100vh;  /* 전체 높이 */
    margin: 0;
    padding:20px;
}
table{
 	border: 1px solid black;
 	border-collapse: collapse;
 	padding: 10px; 
 	background-color: white;
}
th,td{
	border: 1px solid black;
	padding: 10px; 
 	text-align:center;
}
h1{
	margin-bottom: 20px;
	text-align: center;
}
img{
	width:150px;
	height:150px;
	border: 1px solid gray;
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
				<%
					String id=(String)session.getAttribute("id");
					boolean islogin=(id!=null); //id가 null이 아닌지 확인(id가 null이 아니면 true)
				%>
				<th>리뷰</th>
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
                <td>
                	<% if(islogin){ %>
                		<a href="review.jsp?movieId=<%=movieId%>"><button>리뷰</button></a>
                	<% } %>	
                </td>
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