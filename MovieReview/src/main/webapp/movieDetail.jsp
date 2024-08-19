<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
<style>
	.home{
		text-align: center;
	}
</style>
</head>
<body>
<%@include file="db.jsp"%>
	<div class="home">
		<a href="main.jsp">
         	<img src="img/home.png" alt="홈 버튼" style="width: 40px; height: 40px">
         </a>
    </div>
    <%
    	String movieId = request.getParameter("movieId");
    	if(movieId==null){
    		out.println("영화 id 필요!!");
    		return;
    	}
    	
    	int id =Integer.parseInt(movieId);
    	
		ResultSet rs = null;
		Statement stmt = null;
		
		try{
			stmt = conn.createStatement();
			String query="SELECT m.id, title, poster_url, genre, story, round(AVG(r.rating),1) AS avg_rating " 
					+ "FROM movies m" 
					+" left JOIN reviews r ON m.id = r.movie_id WHERE m.id ="+id;
			rs = stmt.executeQuery(query);
			
			if(rs.next()){
                String title = rs.getString("title");
                String posterUrl = rs.getString("poster_url");
                String genre = rs.getString("genre");
                String story =rs.getString("story");
                double avg_rate=rs.getDouble("avg_rating");
	%>
	<div class="movie-info">
		<h2><%= title %></h2>
		<img src="<%= posterUrl %>" alt="Poster">
		<p><%= genre %></p>
		<p><%=story %></p>
		<p>평균 평점: <%= avg_rate %> </p>
   	</div>
   	
   	<div class="reviews">
   		<h3>리뷰 목록</h3>
   		<%
   			stmt = conn.createStatement();
	   		query="SELECT review_text, rating, u.name FROM reviews r "+ 
	   			"INNER JOIN users u ON r.user_id = u.user_id"+ 
	   			" WHERE r.movie_id =" +id + 
	   			" ORDER BY r.review_id DESC";
	   		rs = stmt.executeQuery(query);
	   		
	   		while(rs.next()){
   				String review = rs.getString("review_text");
   				double rating = rs.getDouble("rating");
   				String name = rs.getString("name");
   		%>
   		<li>
   			<%=name %>: <%=review %> <strong><%=rating %></strong> <br>
   		</li>
   		<% 
	   		}
		}else{
			out.println("해당 영화는 존재하지 않습니다.");
		}
			
		}catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}	
   		%>
   	</div>
   			
</body>
</html>