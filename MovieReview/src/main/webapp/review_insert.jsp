<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="db.jsp"%>
	<%
		String movieIdParam= request.getParameter("movieId");
		String userId= request.getParameter("userId");
	    String review= request.getParameter("review");
	    String ratingParam= request.getParameter("rating");
	    
	    if(movieIdParam==null || userId==null || review==null|| ratingParam==null ||
	       movieIdParam.isEmpty() || userId.isEmpty() || review.isEmpty() || ratingParam.isEmpty())
	    { 	
	    	out.println("채워 넣으시오");
	    	return;
	    }
	    
	    ResultSet rs = null;
		Statement stmt = null;
		
		
	%>
</body>
</html>