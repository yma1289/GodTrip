<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!-- 본문시작 -->
<div class="col-sm-12">
	<c:choose>
		<c:when test="${!(empty s_id || empty s_passwd || s_mlevel == 'E1')}">
			<div style="text-align: center;">
				<strong>${mname}</strong> 님 <a href="logout.do">[로그아웃]</a> <br>
				<br> <a href="memberModify">[회원정보 수정]</a> 
				<a href="memberWithdraw">[회원 탈퇴]</a>
			</div>
		</c:when>
	</c:choose>


</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>
