<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie review</title>
<style>
    body {
        font-family: Arial, sans-serif; /* 기본 폰트 설정 */
        background-color: #f4f4f4; /* 배경색 설정 */
        margin: 0;
        padding: 0;
        color: #333; /* 기본 텍스트 색상 */
    }
    h1, h2 {
        color: #444; /* 제목 색상 */
    }
    h1 {
        text-align: center;
        margin-top: 20px;
    }
    h2 {
        margin-top: 20px;
        text-align: center;
    }
    img {
        display: block;
        max-width: 100%;
        height: auto;
        margin: 0 auto;
        border-radius: 8px; /* 둥근 모서리 */
        box-shadow: 0 0 10px yellow; /* 그림자 효과 */
    }
    form {
        max-width: 600px;
        margin: 20px auto;
    }
    label {
        display: block;
        margin: 10px 0 5px;
    }
    input[type="number"] {
        width: 10%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-bottom: 15px;
    }
    textarea {
        resize: vertical; /* 세로 크기 조절 가능 */
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-bottom: 15px;
    }
    button {
        background-color: Limegreen;
        color: black;
        border: none;
        font-weight: bold;
        padding: 10px 20px;
        text-align: center;
        display: inline-block;
        font-size: 16px;
        margin-top: 10px;
        border-radius: 5px; /* 버튼 모서리 둥글게 */
    }
    button:hover {
        background-color: #45a049; /* 버튼 호버 색상 */
    }
</style>
</head>
<body>
	<div>
		<a href="main.jsp">
         	<img src="img/home.png" alt="홈 버튼" style="width: 40px; height: 40px">
         </a>
    </>
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