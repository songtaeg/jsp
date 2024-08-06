<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		margin-top: 5px;
	}
</style>
</head>
<script>
	function fnCheck(){
		var form=document.board;
		if(form.title.value==""){
			alert("제목 입력");
			form.title.focus();
			return;
		}
		if(form.content.value==""){
			alert("내용 입력");
			form.content.focus();
			return;
		}
		alert("저장 완료");
		form.submit();
	}
</script>
<body>
	<form action="insert-result.jsp" name="board">
		<div>
			<label>제목:<input type="text" name="title"> </label> 
		</div>
		<div>
			<label>내용:<textarea cols="30" rows="10" name="content"></textarea></label> 
		</div>
		<div>
			<button type="button" onclick="fnCheck()">저장</button>
		</div>
	</form>
</body>
</html>
