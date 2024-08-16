<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
	header{
	background-color: Lavender;
	}
	.title{
		font-family: 'Nanum Pen script',serif;
		color:brown;
		font-size:40px;
		font-weight: 400;
	}
	body{
		background-color:lightyellow; 
	}
</style>
</head>
<body>
<%@include file="db.jsp"%>	
	<header>
        <h1 class="title">방구석 리뷰어</h1>
        <img src="img/logo4.png" alt="로고">
        <nav>
            <ul>
                <li><a href="movies.jsp">영화 목록</a></li>
                <li><a href="review-list.jsp">리뷰 모음</a></li>
                <% 
                	String id=(String)session.getAttribute("id");
                	if(id!=null){ //사용자가 로그인한 상태
                %>
                	<li><a href="logout.jsp">로그아웃</a></li>
                	<li><span><%=id %>님</span></li>
                <% 
                	}else{
                %>	
                <li><a href="login.jsp">로그인</a></li>
                <li><a href="register.jsp">회원가입</a></li>
                <%
                	} 
                %>
            </ul>
        </nav>
	</header>

    <main>
        <h2>환영합니다!</h2>
        <p>영화에 대한 여러분의 소중한 리뷰를 남겨주세요!</p>

        <section>
		    <h2>리뷰 작성</h2>
		    <form action="movies.jsp">
		        <button type="submit">작성(로그인 필요)</button>
		    </form>
        </section>
        
        <section>
        	<h2>최신 리뷰</h2>
       	
        	<ul>
        		<%
        		ResultSet rs = null;
        		Statement stmt = null;
        		
        		try{
    				stmt = conn.createStatement();
    				String querytext = "SELECT m.title, r.review_text, r.rating FROM reviews r "+
    						"INNER JOIN movies m ON r.movie_id = m.id "+
    						"ORDER BY r.review_id DESC "+
    						"LIMIT 3";
    				rs = stmt.executeQuery(querytext);
    				
    				while(rs.next()){
    					String title = rs.getString("m.title");
    					String review = rs.getString("review_text");
    					double rating = rs.getDouble("rating");
    					
        		%>
        			<li><%=title %>: <%=review %> &nbsp;<strong><%=rating %></strong></li>
        		<%
	    				}
				}catch(SQLException ex) {
					out.println("SQLException : " + ex.getMessage());
				}
				%>	
        	</ul>
        	
        </section>
    </main>

    <footer>
        <p>&copy; 2024 영화 리뷰 웹사이트. 모든 권리 보유.</p>
        <p>연락처: support@example.com | 전화: 010-1234-1234</p>
    </footer>
</body>
</html>