<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie review</title>
</head>
<body>
	<h1>Write Reviews</h1>
		<%
			String movieIdParam =request.getParameter("movieId");
		
			if(movieIdParam==null || movieIdParam.isEmpty()){
				out.println("유효하지 않는 영화 id입니다.");
				return;
			}
			
			int movieId=Integer.parseInt(movieIdParam);
			
			ResultSet rs = null;
			Statement stmt = null;
			try{
				stmt = conn.createStatement();
				String querytext ="SELECT * FROM movies where id="+movieId;
				rs = stmt.executeQuery(querytext);
			
				if(rs.next()){
					String title = rs.getString("title");
                    String posterUrl = rs.getString("poster_url");
		%>
		<h2>Review for <%= title %></h2>
		<img src="<%= posterUrl %>" alt="Poster">
		<form action="review_insert.jsp">
			<!--제출 시 데이터 전송   -->
			<input type="hidden" name="movieId" value="<%= movieId %>"> 
			<input type="hidden" name="userId" value="<%= session.getAttribute("id") %>">
			
			<label>평점(1 to 5)</label>
			<input type="number" id="rating" name="rating" min="1" max="5" step="0.1" required><br>
			
			<label>감상평</label><br>
			<textarea name="review" id="review" cols="50" rows="5" placeholder="1000자 이내" required></textarea><br>
			
			<button type="submit">등록하기</button>
		</form>
		<% 
				} else {
				    out.println("영화 정보를 찾을 수 없습니다.");
				}
			}catch(SQLException ex) {
				out.println("SQLException : " + ex.getMessage());
			}
		%>
</body>
</html>