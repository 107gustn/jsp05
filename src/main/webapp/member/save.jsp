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
		MemberDAO dao = new MemberDAO();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		int result = dao.saveMember(id, pwd, name, addr, tel);
		if( result == 1) {
			out.print("<script>alert('회원 저장 성공!!');location.href='login.jsp'</script>");
			
		}else {
			out.print("<script>alert('회원 저장 실패!!');location.href='login.jsp'</script>");
		}
	%>
</body>
</html>