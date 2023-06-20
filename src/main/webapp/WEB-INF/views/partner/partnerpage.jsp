<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!-- 본문시작 -->
<div class="col-sm-12">
	<c:choose>
		<c:when
			test="${ not empty p_id  || not empty p_passwd || p_level != 'E1' || p_level != 'F1' }">
			<div style="text-align: center;">
				<strong>${p_name}</strong> 님 <a href="partnerlogout.do">[로그아웃]</a> <br>
				<br> <a href="partnerModify">[회원정보 수정]</a> <a
					href="partnerWithdraw">[회원 탈퇴]</a>
			</div>
		</c:when>
	</c:choose>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>