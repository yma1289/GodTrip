<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복 확인</title>
</head>
<body>
<script>
 function apply(p_email){
    opener.document.getElementById('partnerfrm').elements.p_email.value=p_email;
    window.close();
}
</script>  

	<h2 style="text-align: center;">이메일 중복 검사 결과</h2>
	<p style="text-align: center;">검사한 이메일: ${p_email}</p>
	<c:choose>
		<c:when test="${cnt == 0}">
			<p style="text-align: center; color: blue">사용 가능한 이메일입니다.</p>
           <p style="text-align: center;"> <a href="javascript:apply('${p_email}')">적용</a></p>
        </c:when>
		<c:otherwise>
			<p style="text-align: center; color: red">이미 등록된 이메일입니다.</p>
			<hr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="javascript:history.back()">다시검색</a>
				&nbsp;&nbsp;
			<a style="text-align: center" href="javascript:window.close()">창닫기</a></p>
		</c:otherwise>
	</c:choose>
</body>
</html>
</body>
</html>