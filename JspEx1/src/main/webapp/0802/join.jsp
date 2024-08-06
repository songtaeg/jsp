<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="join_result.jsp" method="get" name="Login">
		<div>아이디: <input type="text" name="userid"></div>
		<div>비밀번호: <input type="password" name="pwd"></div>
		<div>이름: <input type="text" name="username"></div>
		<div>
			<label><input type="radio" value="M" name="gender">남자</label>
			<label><input type="radio" value="F" name="gender">여자</label>
		</div>
		<div>
			<label><input type="checkbox" value="coding" name="hobby">코딩 </label>
			<label><input type="checkbox" value="game" name="hobby">게임 </label>
			<label><input type="checkbox" value="soccer" name="hobby">축구 </label>
		</div>
		<!-- <button onclick="fnJoin()">회원가입</button>-->
		<input type="button" value="회원가입" onclick="fnJoin()">
	</form>
</body>
</html>
<script>
	function fnJoin() {
		 var form=document.Login;
		 console.log(form.userid);
		 if(form.userid.value =="" || form.userid.value ==undefined){
			alert("아이디 입력");
			form.userid.focus();
			return;
		 }
		 form.submit();
	}
</script>