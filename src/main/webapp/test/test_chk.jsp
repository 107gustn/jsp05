<%@page import="test.TestDAO"%>
<%@page import="test.TestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>test_chk.jsp<br>	
	<%--
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		TestDTO dto = new TestDTO();
		dto.setId(id); dto.setPwd(pwd);
		
		TestDAO dao = new TestDAO();
		dao.test(dto);
	--%>
	<jsp:useBean id="dao" class="test.TestDAO"/> <!-- JSP태그(Bean: 객체): 객체 생성 - id(변수이름) class(class가 있는 정보) --> <!-- TestDAO dao = new TestDAO(); -->
	<jsp:useBean id="dto" class="test.TestDTO"/> <!-- TestDTO dto = new TestDTO(); -->
	
	
	<jsp:setProperty property="*" name="dto"/> <!-- 넘어오는 모든 값을 dto에 저장해줌 -->
	
<%--
	<jsp:setProperty property="id" name="dto"/> <!-- property: setter 정보 --> <!-- dto에 대한 id값을 채워줌 -->
	<jsp:setProperty property="pwd" name="dto"/> <!-- dto가 갖고있는 변수이름이 같으면 dto 값에 자동으로 주입해줌 -->
--%>

	<%= dto.getId() %><br>
	<%= dto.getPwd() %><br>
	<%= dto.getName() %><br>
	<%= dto.getAddr() %><br>
	<%= dto.getTel() %>
</body>
</html>