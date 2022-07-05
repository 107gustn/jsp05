<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>modify.jsp<br>

	<%
		request.setCharacterEncoding("utf-8");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		dto.setId( request.getParameter("id") );
		dto.setPwd( request.getParameter("pwd") );
		dto.setName( request.getParameter("name") );
		dto.setAddr( request.getParameter("addr") );
		dto.setTel( request.getParameter("tel") );
		
		dao.update(dto);
		response.sendRedirect("main.jsp");
	%>

</body>
</html>