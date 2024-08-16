<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
	body{
		background-color: skyblue;
	}
	div a{
		position: absolute;
		top:10px;
		right: 10px;
	}
</style>
</head>

<body>
	<div>
		<a href="main.jsp">
         	<img src="img/home.png" alt="홈 버튼" style="width: 40px; height: 40px">
         </a>
   </div>     
   <div class="container">
       <h1>회원가입</h1>
        <form action="register_result.jsp" method="get" name="register" onsubmit="return validateForm()">
            <div>
            	아이디:<input type="text" name="userId" id="id" required>
            	<button type="button" onclick="fnCheck()">중복체크</button>
            </div>
            
            <div>
            	이름:<input type="text" name="name" required>
			</div>

            <div>
            	비밀번호:<input type="password" name="pwd" id="pwd" required>
            </div>

            <div>
            	비밀번호 확인:<input type="password" name="pwdcheck" id="pwdcheck" required>
            </div>

            <div>
            	이메일:<input type="email" name="email" required>
            </div>

            <input type="submit" value="회원가입">
        </form>
    </div>   
</body>
</html>
<script>
function fnCheck(){
    var userId = document.getElementById('id').value;
    if (userId) {
        // 중복 체크를 새 창에서 열기
        var url = "id-check.jsp?userId="+userId;
        window.open(url, "idcheck","width=600 height=200");
    }else {
        alert("아이디를 입력해 주세요.");
    }
}        
function validateForm() {
        var pwd = document.getElementById('pwd').value;
        var pwdConfirm = document.getElementById('pwdcheck').value;
       
        if (pwd !== pwdConfirm) {
            alert("비밀번호와 비밀번호 확인이 다릅니다.");
            return false; 
        }
        return true; 
    }
</script>