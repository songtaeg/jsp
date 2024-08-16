<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    background-color: AliceBlue;
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
</style>
</head>
<body>
	<header>
		<a href="main.jsp">
         	<img src="img/home.png" alt="홈 버튼" style="width: 40px; height: 40px">
         </a>
    </header>
	<h1>Review List</h1>
	
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>영화</th>
				<th>아이디</th>
				<th>감상평</th>
				<th>평점</th>
			</tr>
		</thead>
		<tbody>
		<% 
				ResultSet rs = null;
				Statement stmt = null;
				
				try{
					stmt = conn.createStatement();
					String querytext ="SELECT review_id, m.title, user_id,review_text,rating FROM reviews r INNER JOIN movies m ON r.movie_id=m.id";
					rs = stmt.executeQuery(querytext);
					
					while(rs.next()){
						int id=rs.getInt("review_id");
						String title = rs.getString("m.title");
						String userId = rs.getString("user_id");
						String review = rs.getString("review_text");
						double rating = rs.getDouble("rating");
			%>
					<tr>
						<td><%= id %></td>
		                <td><%= title %></td>
		                <td><%= userId %> </td>
		                <td><%= review %></td>
		                <td><%= rating %></td>
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