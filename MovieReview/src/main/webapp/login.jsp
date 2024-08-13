<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
	<div class="container">
	    <h1>Login</h1>
	    <form action="login_result.jsp" method="get">
	       <div>
	         <label>아이디:<input type="text" name="id" required></label>
	       </div>
	       <div>
				<label>패스워드:<input type="password" name="password" required></label>
			</div>
	        <input type="submit" value="로그인">
	    </form>
	    <p>계정이 없으세요? 
	    <a href="register.jsp" >
	    	 <button type="button">회원가입</button>
	    </a>
	    </p>
    </div>
</body>
</html>