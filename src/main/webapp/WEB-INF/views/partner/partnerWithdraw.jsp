<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
<div class="col-sm-12">


<script type="text/javascript">
        <c:if test="${not empty deleteMessage}">
            window.onload = function() {
                alert('${deleteMessage}');
                location.href = '/partner/partnerlogin';
            }
        </c:if>
    </script>



<!-- 본문 시작 -->
<h3 style="text-align:center; color:red;font-size:30pt;"> *회원탈퇴* </h3>
<p style="text-align:center; color:blue;">※탈퇴하려면 비밀번호를 입력해 주세요</p>
<form method="post" action="delete.do" onsubmit="return ppwCheck()">
<input type="hidden">
<table class="table">

<tr>
<th class="info">아이디</th>
<td><input type="text" name="p_id" id="p_id"  value="${p_id}"required readonly>
</td>
</tr>

<tr>
<th class="info">비밀번호</th>
<td><input type="password" name="p_passwd" id="p_passwd" required>
</td>
</tr>

<tr>
<td colspan="2">
<input type="submit" value="판매자탈퇴" class="btn btn-danger" >
</td>
</tr>

</table>
</form>

</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>