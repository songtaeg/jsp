<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id=request.getParameter("userid");
		String[] hobby=request.getParameterValues("hobby");
		for(String h : hobby){
			out.println(h+"<br>");
		}
		out.println(id+"님 환영합니다!");
	%>
</body>
</html>