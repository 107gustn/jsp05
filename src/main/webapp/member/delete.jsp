<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>delete.jsp<br>
	<%= session.getAttribute("login") %><br> <!-- 세션으로 id값 가져옴 -->
	<%= request.getParameter("abcd") %> <!-- get방식으로 경로를 통해 id값 얻어옴 -->
	<%
		MemberDAO dao = new MemberDAO();
		dao.delete( request.getParameter("abcd") );
		response.sendRedirect("logout.jsp");
	%>
</body>
</html>