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
		String queryText="";
		String errorMsg=null;

		String id=request.getParameter("id");
		String password=request.getParameter("password");
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					"SELECT * FROM users where user_id='"+id+"'"+"AND pwd='"+password+"'";
			rs = stmt.executeQuery(querytext);	

            if(rs.next()) { // 로그인 성공
	            session.setAttribute("id", id); // 세션에 로그인 정보 저장
	            response.sendRedirect("main.jsp"); // 메인 페이지로 리다이렉트
            } 
            else {
                errorMsg="아이디,비밀번호를 확인하세요";
            }
        } catch (SQLException ex) {
            out.println("SQLException : " + ex.getMessage());
        }
		if(errorMsg !=null){
			out.println("<script> alert('"+errorMsg+"'); window.location.href='login.jsp'; </script>");
		}
	%>
</body>
</html>