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
<body>
	save.jsp<br>
	<%
		request.setCharacterEncoding("utf-8");
	
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		dto.setId( request.getParameter("id") ); //사용자가 입력한 값 저장
		dto.setPwd( request.getParameter("pwd") );
		dto.setName( request.getParameter("name") );
		dto.setAddr( request.getParameter("addr") );
		dto.setTel( request.getParameter("tel") );
		
		int result = dao.insert(dto);
		if(result == 1) { %>
			<script>
				alert('회원가입 성공');
				location.href='login.jsp';
			</script>
	<%	}else { %>
			<script>
				alert('회원가입 실패');
				history.back(); /* 한단계 전으로 이동(이전 값이 유지됨) */
			</script>			
	<%	} %>
	
	<!-- 넘어온값 확인 -->
	<%= request.getParameter("id") %>
	<%= request.getParameter("pwd") %>
	<%= request.getParameter("name") %>
	<%= request.getParameter("addr") %>
	<%= request.getParameter("tel") %>
	
</body>
</html>