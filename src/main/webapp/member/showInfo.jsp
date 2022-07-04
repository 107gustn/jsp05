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
<body>
	
	<%
		MemberDAO dao = new MemberDAO();
		String id = (String)session.getAttribute("login");
		MemberDTO d = dao.getInfo(id);
	%>
	
	<table>
		<tr>
			<th>아이디 : </th><td><%= d.getId() %></td>
		</tr>
		<tr>
			<th>비밀번호 : </th><td><%= d.getPwd() %></td>
		</tr>
		<tr>
			<th>이름 : </th><td><%= d.getName() %></td>
		</tr>
		<tr>
			<th> 주소 : </th><td><%= d.getAddr() %></td>
		</tr>
		<tr>
			<th>전화번호 : </th><td><%= d.getTel() %></td>
		</tr>
	</table>
	
</body>
</html>