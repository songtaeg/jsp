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
form{
	margin:10px;
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
		<a href="main.jsp">
         	<img src="img/home.png" alt="홈 버튼" style="width: 40px; height: 40px">
         </a>
	<h1>Review List</h1>
	
	<form method="get" action="">
        <label>정렬 기준:</label>
        <select name="sort" id="sort" onchange="this.form.submit()"> <!--드롭다운 메뉴의 선택이 변경되면 현재 폼을 자동으로 제출  -->
        	<option value="normal" <%= "normal".equals(request.getParameter("sort")) ? "selected" : "" %>>----</option>
            <option value="asc" <%= "asc".equals(request.getParameter("sort")) ? "selected" : "" %> >평점 낮은순</option>
            <option value="desc" <%= "desc".equals(request.getParameter("sort")) ? "selected" : "" %> >평점 높은순</option>
        </select>
    </form>
	
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>영화</th>
				<th>이름</th>
				<th>감상평</th>
				<th>평점</th>
			</tr>
		</thead>
		<tbody>
		<% 
				ResultSet rs = null;
				Statement stmt = null;
				
				String sortOrder=request.getParameter("sort");
				if(sortOrder==null || sortOrder.isEmpty()){
					sortOrder="normal"; //기본 정렬 순서
 				}
				
				try{
					stmt = conn.createStatement();
					String querytext;
					if("normal".equals(sortOrder)){
						querytext="SELECT review_id, m.title, u.name, review_text, rating FROM reviews r "+
								"INNER JOIN movies m ON r.movie_id=m.id "+
								"join users u ON r.user_id=u.user_id "+
								"order by review_id desc";
					}else{
						querytext="SELECT review_id, m.title, u.name, review_text, rating FROM reviews r "+
								"INNER JOIN movies m ON r.movie_id=m.id "+
								"join users u ON r.user_id=u.user_id "+
								"order by rating "+(sortOrder.equals("asc")? "asc":"desc")+ ",review_id desc";
					}
					rs = stmt.executeQuery(querytext);
					
					while(rs.next()){
						int id=rs.getInt("review_id");
						String title = rs.getString("m.title");
						String name = rs.getString("u.name");
						String review = rs.getString("review_text");
						double rating = rs.getDouble("rating");
			%>
					<tr>
						<td><%= id %></td>
		                <td><%= title %></td>
		                <td><%= name %> </td>
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