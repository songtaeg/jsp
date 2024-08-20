<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
	body{
		background-color: LightBlue;
	}
	.top{
		position: absolute;
		top:10px;
		right: 10px;
	}
</style>
</head>
<body>
	<div class="top">
	    <a href="main.jsp">
         	<img src="img/home.png" alt="홈 버튼" style="width: 40px; height: 40px">
         </a>
    </div>    
	<div class="container">
	    <h1>로그인</h1>

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