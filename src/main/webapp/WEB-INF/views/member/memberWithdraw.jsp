<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
<div class="col-sm-12">


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
<p style="text-align:center; color:blue;">※탈퇴하려면 비밀번호를 입력해 주세요.<br>
탈퇴시 동일 아이디로 재가입은 불가능 합니다.</p>

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
<input type="submit" value="회원탈퇴" class="btn btn-danger" >
</td>
</tr>

</table>
</form>

</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>