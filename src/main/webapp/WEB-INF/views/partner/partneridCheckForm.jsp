<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 ID 중복 확인</title>
</head>
<body>
	<div style="text-align: center">
		<h3> 판매자 아이디 중복 확인</h3>
		<form action="partneridCheckProc" onsubmit="return blankCheck()">
			아이디: <input type="text" name="p_id" id="p_id" maxlength="10" autofocus>
			<input type="submit" value="중복확인">
		</form>
	</div>

<script>

	function blankCheck() {
		let p_id = document.getElementById("p_id").value;
		p_id = p_id.trim();
		if (p_id.length < 5) {
			alert("판매자 아이디는 5~10글자 이내로 입력해주세요");
			return false;
		}
		return true;
	}
</script>

</body>
</html>