<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!-- 본문시작 -->
<div class="col-sm-12">

	<c:if test="${not empty FindIdfailmessage}">
		<script>
			alert('${FindIdfailmessage}');
		</script>
	</c:if>
	
	<h3>*아이디/비밀번호 찾기*</h3>
	<h6>아이디/비밀번호는 메일로 전송됩니다</h6>
	
<form name="findIdfrm" id="findIdfrm" method="post" action="pfindidproc.do" onsubmit="return partnerfindCheck()">
<table class="table">
<tr class="success">
<td> <input type="text" name="p_name" id="p_name" placeholder="이름" maxlength="10" required>
</td>
</tr>
<tr class="success">
<td> <input type="email" name="p_email" id="p_email" placeholder="이메일" maxlength="50" required>				
</td>
</tr>

<tr>
<td colspan="2">
<input type="submit" value="아이디/비밀번호 찾기" class="btn btn-secondary">
<input type="reset" value="취소" class="btn btn-secondary">
</td>
</tr>
</table>
</form>

</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>
