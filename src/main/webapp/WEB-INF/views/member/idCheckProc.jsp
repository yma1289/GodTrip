<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
</head>
<body>
<script>
function apply(id){
   opener.document.getElementById('memfrm').elements.id.value=id;
   opener.focus(); // 다시 부모 창으로 이동
   window.close(); // 자식 창 닫기
}
</script>  
<h2 style="text-align: center;">아이디 중복 검사 결과</h2>
<c:choose>
   <c:when test="${cnt == 0}">
      <p style="text-align: center; color: blue">사용 가능한 아이디입니다.
      <p style="text-align: center;">검사한 아이디: ${id}</p>
         <p style="text-align: center;"><a  href="javascript:apply('${id}')">적용</a>
      </p>
   </c:when>
   <c:otherwise>
      <p style="text-align: center; color: red">이미 등록된 아이디입니다.</p>
      <hr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <a href="javascript:history.back()">다시검색</a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a style="text-align: center" href="javascript:window.close()">창닫기</a>
      
   </c:otherwise>
</c:choose>
</body>
</html>