<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	th { text-align: right; }
</style>
</head>
<body>showInfo.jsp<br>
	
	<%
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getU( (String)session.getAttribute("login") ); //현재 저장되어 있는 세션을 얻어옴
	%>
	<form action="modify.jsp" method="post">
		아이디<input type="text" name="id" readonly value="<%=dto.getId()%>"><br> <!-- readonly: 읽기 전용(수정불가) -->
		비밀번호<input type="text" name="pwd" value="<%=dto.getPwd()%>"><br>
		이름<input type="text" name="name" value="<%=dto.getName()%>"><br>
		주소<input type="text" name="addr" value="<%=dto.getAddr()%>"><br>
		전화번호<input type="text" name="tel" value="<%=dto.getTel()%>"><br>
		<input type="submit" value="수정">
		<input type="button" value="삭제" onclick="location.href='delete.jsp?abcd=<%=dto.getId()%>'"> <!-- id값을 직접 넘겨줌 -->
	</form>
	
	
</body>
</html>