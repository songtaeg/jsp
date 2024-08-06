<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		int i=0;
		String name="hong";
	%>
	<!-- html 주석 --> 
	<%-- jsp 주석 --%>	
	<% 
		for(i=1; i<=10; i++){
		/* System.out.println(i); */
		out.println("<h2>"+i+"</h2>");
		}
	%>

	<h1><%= name %></h1>
</body>
</html>