<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>회원 가입</h2>
	<form id="fo" action="save.jsp" method="post">
		<input type="text" name="id" id="id" placeholder="아이디"><br> <!-- id: 현재페이지 구분 용도 -->
		
		<input type="text" name="pwd" id="pwd1" placeholder="비밀번호"><br>
		<input type="text" id="pwd2" onchange="pwdChk()" placeholder="비밀번호 확인"> <!-- onchange: 커서가 다른위치로 이동하게 되면 함수 호출 -->
			<label id="label">비밀번호 확인</label><br>
			
		<input type="text" name="name" placeholder="이름"><br> <!-- name: 다음페이지 값 전달 용도 -->
		<input type="text" name="addr" placeholder="주소"><br>
		<input type="text" name="tel" placeholder="전화번호"><br>
		<input type="button" onclick="chk()" value="회원가입">
	</form>
	
	<script type="text/javascript"> /* 코드가 위에서부터 순차적으로 진행 */
		let pwd1 = document.getElementById("pwd1") /* id를 가져옴 */
		let pwd2 = document.getElementById("pwd2")
		
		function pwdChk(){
		let label = document.getElementById("label")
		if(pwd1.value == pwd2.value){
			label.innerHTML = "<b>일치합니다</b>"
		}else{
			label.innerHTML = "<b style='color:red;'>불 일치합니다</b>"
			pwd1.value=""
			pwd2.value=""
			pwd1.focus()
		}
	}
	
		function chk() {
			//alert("chk호출")
			let id = document.getElementById("id")
			//let pwd1 = document.getElementById("pwd1")
			//let pwd2 = document.getElementById("pwd2")
			
			if(id.value == "") {
				alert("아이디는 필수 항목 입니다")
				id.focus()
				return;
			} else if(pwd1.value == "") {
				alert("비밀번호는 필수 항목 입니다")
				pwd1.focus()
			} else if(pwd2.value == "") {
				alert("비밀번호 확인은 필수 항목 입니다")
				pwd2.focus()
			} else {
				fo.submit() // 값이 다 입력이 되면 넘겨줌
			}
		}
	</script>
	
</body>
</html>