<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="authi.jsp" %>  
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>

<script type="text/javascript">
        <c:if test="${not empty deleteMessage}">
            window.onload = function() {
                alert('${deleteMessage}');
                location.href = '/member/memberlogin';
            }
        </c:if>
    </script>



<!-- 본문 시작 -->
<h3 style="text-align:center; color:red;font-size:30pt;"> *회원탈퇴* </h3>
<p style="text-align:center; color:blue;">※탈퇴하려면 비밀번호를 입력해 주세요</p>
<form method="post" action="delete.do" onsubmit="return pwCheck()">
<input type="hidden">
<table class="table">

<tr>
<th class="info">아이디</th>
<td><input type="text" name="id" id="id"  value="${s_id}"required readonly>
</td>
</tr>

<tr>
<th class="info">비밀번호</th>
<td><input type="password" name="passwd" id="passwd" required>
</td>
</tr>

<tr>
<td colspan="2">
<input type="submit" value="삭제" class="btn btn-danger" >
</td>
</tr>


</table>




</form>







<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>
</body>
</html>