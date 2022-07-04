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

	<!-- post방식으로 값을 넘길때 한글 처리를 위한 인코딩처리 -->
	<% request.setCharacterEncoding("utf-8"); %>
	
	<%
		String id = request.getParameter("id"); //사용자가 입력한 값을 받음
		String pwd = request.getParameter("pwd"); //사용자가 입력한 값을 받음
		System.out.println("11 check.jsp 실행");
		MemberDAO dao = new MemberDAO(); //DB 접근을 위한 객체
		System.out.println("22 dao 종료");
		int result = dao.userChk(id, pwd); //사용자 id, pwd를 담아서 넘겨줌
		if( result == 1) { //로그인 성공
			session.setAttribute("login", id); //세션 생성
			out.print("<script>alert('" + id + "님 환영합니다');location.href='main.jsp'</script>");
			//response.sendRedirect("main.jsp");
		}else if( result == 0 ) { //비밀번호 틀림
	%>
			<script type="text/javascript">
				alert('비밀번호 틀림')
				location.href='login.jsp' //클라이언트에서 번역해서 서버로 요청해서 보내줌
			</script>
	<%	}else { //아이디 없음
	%>
		<script type="text/javascript">
			alert('존재하지 않는 아이디 입니다')
			location.href='login.jsp'
		</script>
	<%	} %>
	
</body>
</html>