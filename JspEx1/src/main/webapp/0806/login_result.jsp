<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="db.jsp"%>	
	<% 
		ResultSet rs = null;
		Statement stmt = null;
		
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					"SELECT * FROM TBL_USER where userID='"+id+"'"+"AND pwd='"+pwd+"'";
			rs = stmt.executeQuery(querytext);
			
			if(rs.next()){ // 아이디 o, 패스워드 o
				if(rs.getInt("cnt")>=5){// 5번 이상 실패
					out.println("5번 이상 틀렸습니다. 관리자에게 문의");
				}
				else{ //로그인 성공
					out.println("로그인 성공");
					session.setAttribute("userID", rs.getString("userId"));
					session.setAttribute("status", rs.getString("status"));
					if(rs.getString("status").equals("A")){
						response.sendRedirect("user-list.jsp");
					}
					else{
					response.sendRedirect("table2.jsp");
					}
					
					querytext="update tbl_user set cnt=0 where userID='"+id+"'";
					stmt.executeUpdate(querytext);
				}	
			}
			else{// 아이디나 패스워드가 다를 경우
				querytext="select * from tbl_user where userID='"+id+"'";
				rs=stmt.executeQuery(querytext);
				if(rs.next()){// 아이디 o, 비밀번호 x일 경우
					if(rs.getInt("cnt")>=5){
						out.println("5번 이상 틀렸습니다. 관리자에게 문의");
					}
					else{ // 없는 아이디로 로그인 시도
						out.println("비밀번호 다시 확인");
						querytext="update tbl_user set cnt=cnt+1 where userID='"+id+"'";
						stmt.executeUpdate(querytext);
					}
				}
				else{
					out.println("아이디 확인");
				}	
			}
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
	<div>
		<button onclick="location.href='login.jsp'">로그인 버튼</button>
	</div>
</body>
</html>