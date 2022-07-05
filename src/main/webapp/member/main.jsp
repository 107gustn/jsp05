<%@page import="member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원들만의 페이지.</h2>
	<%
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list = dao.getMember();
	%>
	
	<table border="1">
		<tr>
			<th>아이디</th><th>비밀번호</th><th>이름</th><th>주소</th><th>전화번호</th>
		</tr>
		<%
			for(MemberDTO m : list) {
		%>
		<tr>
			<td><%= m.getId() %></td>
			<td><%= m.getPwd() %></td>
			<td><a href="user_delete.jsp?id=<%= m.getId() %>"><%= m.getName() %></a></td>
			<td><%= m.getAddr() %></td>
			<td><%= m.getTel() %></td>
		</tr>
		<%
			}
		%>
	</table>
	<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
	<input type="button" value="계정정보" onclick="location.href='showInfo.jsp'">
</body>
</html>