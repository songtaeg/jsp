<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile</title>
<style>
    body {
        background-color: Gainsboro;
        margin: 0;
        padding: 20px;
    }
    .home {
        text-align: right;
        margin-bottom: 20px;
    }
    fieldset {
        border: 1px solid black;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 20px;
        background-color: white;
    }
    legend {
        font-weight: bold;
        color: MediumPurple;
    }
    ul {
        list-style-type: none;
        padding: 0;
    }
    li {
        background: #e9ecef;
        margin-bottom: 10px;
        padding: 10px;
        border-radius: 5px;
    }
    strong {
        color: DarkGreen;
    }
    p {
        margin: 10px 0;
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
		String id=(String)session.getAttribute("id");
		if(id==null){
			out.println("로그인 바람!");
			return;
		}
		
		ResultSet rs = null;
		Statement stmt = null;
		
		ResultSet rs2 = null;
		Statement stmt2 = null;
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					"SELECT name,email FROM users where user_id='"+id+"'";
			rs = stmt.executeQuery(querytext);
			
			if(rs.next()){
				String name=rs.getString("name");
				String email=rs.getString("email");
	%>
	<h1><%=id %>님 프로필</h1>
	<fieldset>
		<legend><h2>정보</h2></legend>
		<p><strong>이름: <%=name %></strong></p>
		<p><strong>이메일: <%=email %></strong></p>
	</fieldset>
	<%
			}else{
				out.println("사용자 정보가 없습니다.");
			}
			//작성한 리뷰
			stmt2 = conn.createStatement();
			String querytext2 = 
					"SELECT m.title, r.review_text, r.rating FROM reviews r "+
					"inner join movies m on r.movie_id=m.id "+
					"where r.user_id='"+id+"'"+
					"ORDER BY r.review_id DESC";
			rs2 = stmt2.executeQuery(querytext2);
	%>
	<fieldset>
		<legend><h2>작성한 리뷰</h2></legend>
		<ul>	
			<%
			while(rs2.next()){
				String title = rs2.getString("m.title");
				String review = rs2.getString("r.review_text");
				double rating = rs2.getDouble("r.rating");
			%>
			<li>
				<%=title %>: <%=review %>&nbsp;<strong><%=rating %></strong>
		   	</li>
		   	<% 
				}
		   	%>
		</ul>
	</fieldset>
	<%
		}catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	
	%>
</body>
</html>