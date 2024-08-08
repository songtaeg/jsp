<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- id,pwd,이름 저장 -->
	<form action="join-insert.jsp" name="user">
		<div> 
			아이디: <input type="text" name="userId">
			<button type="button" onclick="fnCheck()">중복체크</button>
		</div> 
		<div> 
			패스워드: <input type="password" name="pwd">
		</div> 
		<div> 
			이름: <input type="text" name="userName">
		</div>
		<div> 
			전화번호: <input type="text" name="phone">
		</div>  
		<div> 
			<label><input type="radio" value="M" name="gender">남자</label>
			<label><input type="radio" value="F" name="gender">여자</label>
		</div> 
		<button >form action 저장</button>
		<button type="button" onclick="fnSave()"> 함수 이용 저장(db에 저장)</button>
		<button type="button" onclick="fnSubmit()">action 수정 후 submit</button>
		<button type="button" onclick="fnSubmit2()">복습</button>
	</form>
</body>
</html>
<script>
	function fnSave() {
		var f=document.user;
		//console.log(f.userID);
		//location.href="join-insert.jsp?userId='"+f.userId+'"'
		var param="userId="+f.userId.value
					+"&pwd="+f.pwd.value
					+"&userName="+f.userName.value;
		location.href="join-insert.jsp?"+param;
	}
	function fnSubmit() {
		var f=document.user;
		f.action="join-insert2.jsp";
		f.submit();
	}
	function fnSubmit2() {
		var f=document.user;
		f.action="user-insert.jsp";
		f.submit();
	}
	function fnCheck(){
		var f=document.user;
		f.action="id-check.jsp";
		f.submit();
	}
</script>