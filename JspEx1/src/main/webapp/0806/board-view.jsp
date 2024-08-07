<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table, th, tr, td{
	 border : 1px solid black ;
	 border-collapse: collapse;
	 padding: 10px;
	}
	
	.comm{
		width: 330px;
		height: 20px;
		padding: 5px;
		margin: 10px 0px;
	}

	
</style>

</head>
<body>
<form action="board-delete.jsp" name="board">
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String boardNo=request.getParameter("boardNo");
		
		try{
			stmt = conn.createStatement();
			String querytext = "SELECT * FROM TBL_BOARD where BOARDNO="+boardNo;
			rs = stmt.executeQuery(querytext);
			
			if(rs.next()){
	%>
			<input type="hidden" 
				value="<%=rs.getString("boardNo") %>"
				name="boardNo">
			<div>제목: <%=rs.getString("title") %> </div>	
			<div>내용: <%=rs.getString("contents") %> </div>
			<hr>
			<div>댓글: <input type="text" placeholder="댓글" name="comment" class="comm">
				<button type="button" onclick="fnComment()">등록</button>
			</div>	
			<hr>
		<% 		
			String sessionID=(String)session.getAttribute("userID");
			String sessionStatus=(String)session.getAttribute("status");
			
			if(rs.getString("userID").equals(sessionID) 
					|| sessionStatus.equals("A")){
		%>
			<button type="submit">삭제</button>
			<button type="button" onclick="fnUpdate()">수정</button>
		<% 
			}
		%>
		
			<%
				querytext = "SELECT * FROM TBL_COMMENT WHERE BOARDNO = " + boardNo;
				rs = stmt.executeQuery(querytext);
				while(rs.next()){
			%>
				<div> <%= rs.getString("userId") %> : <%= rs.getString("comment") %> </div>
			<%	
			} 
			%>			
	<% 
		
			}else{
				out.println("삭제된 게시물");
			}
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</form>
</body>
</html>
<script>
	function fnUpdate() {
		var form=document.board;
		form.action="board-update.jsp";
		form.submit();
	}
	
	function fnComment() {
		var form=document.board;
		form.action="comment-update.jsp"
		form.submit();
	}
</script>