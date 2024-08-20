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
        background-color: lightcyan; 
        margin: 0;
        padding: 0;
    }
    h1,h2 {
        text-align: center;
        margin-top: 20px;
    }
    img {
        display: block;
        max-width: 100%;
        height: auto;
        margin: 0 auto; /* 가운데 정렬 */
        border-radius: 8px; 
        box-shadow: 0 0 20px yellow; /* 그림자 효과 */
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
        border: 1px solid black;
        margin-bottom: 15px;
    }
    textarea {
        resize: vertical; /* 세로 크기 조절 가능 */
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid black;
        margin-bottom: 15px;
    }
    button {
        background-color: GreenYellow;
        color: black;
        border: none;
        font-weight: bold;
        padding: 10px 20px;
        text-align: center;
        display: inline-block;
        font-size: 16px;
        margin-top: 10px;
        border-radius: 5px; 
        cursor: pointer; /* 커서 포인터 추가 */
    }
    button:hover {
        background-color: #45a049; 
    }
	.btn{
		text-align: center;
	}
</style>
</head>
<body>
	<div class="top">
		<a href="main.jsp">
         	<img src="img/home.png" alt="홈 버튼" style="width: 40px; height: 40px">
         </a>
    </div>
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
			
			<label>감상평</label>
			<textarea name="review" id="review" cols="50" rows="5" placeholder="1000자 이내" required></textarea><br>
			
			<div class="btn">
				<button type="submit">등록하기</button>
			</div>
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