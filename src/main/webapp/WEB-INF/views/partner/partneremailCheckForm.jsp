<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email 중복 확인</title>
</head>
<body>
	<div style="text-align: center">
		<h3>이메일 중복 확인</h3>
		<form action="duplicateemail" onsubmit="return doubleCheck()" method="post">
			아이디: <input type="email" name="p_email" id="p_email" maxlength="50" autofocus>
			<input type="submit" value="중복확인">
		</form>
	</div>

<script>

	function doubleCheck() {
		let p_email = document.getElementById("p_email").value;
		p_email = p_email.trim();
		if (p_email.length< 5) {
			alert(" 이메일은 5글자 이상 입력해 주세요");
			return false;
		}
		return true;
	}
</script>

</body>
</html>