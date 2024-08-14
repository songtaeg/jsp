<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<header>
        <h1>영화 리뷰 웹사이트</h1>
        <img src="img/logo3.jpg" alt="영화 로고">
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
        <p>영화 리뷰 웹사이트에 오신 것을 환영합니다!!</p>

        <section>
		    <h2>리뷰 작성</h2>
		    <form action="movies.jsp">
		        <button type="submit">작성(로그인 필요)</button>
		    </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 영화 리뷰 웹사이트. 모든 권리 보유.</p>
    </footer>
</body>
</html>