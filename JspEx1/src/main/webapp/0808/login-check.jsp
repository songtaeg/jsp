<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="db2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sql:query var="result" dataSource="${dataSource}">
		SELECT * FROM TBL_USER where userID=? AND password=?
	<sql:param value="${param.userID}" />
	<sql:param value="${param.password}" />
	</sql:query>
	
	<c:choose>
		<c:when test="${not empty result.rows}">
			<div>로그인 성공</div>
		</c:when>
		<c:otherwise>
			<div>로그인 실패</div>
		</c:otherwise>
	</c:choose>
</body>
</html>