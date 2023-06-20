<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!-- 본문시작 -->
<div class="col-sm-4">
	<c:choose>
		<c:when
			test="${ not empty p_id  || not empty p_passwd || p_level != 'E1' || p_level != 'F1' }">
			<div style="text-align: center;">
				<div style="text-align: center; padding-top: 30px; margin-top: 10px; ">
				<strong>${p_name}</strong> 님<h3>환영합니다!</h3>
				<img src="../image/loggedin.png" style="width:40%; height=50%;">
				<br>
				<a href="partnerlogout.do">[로그아웃]</a>
				<br><a href="partnerModify">[회원정보 수정]</a> 
				<a href="partnerWithdraw">[회원 탈퇴]</a>
			</div>
			</div>
		</c:when>
	</c:choose>
</div>

<div class="col-sm-8">
  <c:choose>
    <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'A1' }">
      <div style="text-align: center; padding-top: 30px; margin-top: 10px;">
        <h4>숙박상품 관리하기</h4>
        <button type="button" onclick="location.href=''" class="btn btn-primary">상품 등록</button>

        <!-- 수정하기 버튼 -->
        <button type="button" onclick="location.href=''" class="btn btn-danger">수정하기</button>
      </div>
    </c:when>

    <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'B1' }">
      <div style="text-align: center; padding-top: 30px; margin-top: 10px;">
        <h4>기차상품 관리하기</h4>
        <button type="button" onclick="location.href=''" class="btn btn-primary">상품 등록</button>

        <!-- 수정하기 버튼 -->
        <button type="button" onclick="location.href=''" class="btn btn-danger">수정하기</button>
      </div>
    </c:when>

    <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'C1' }">
      <div style="text-align: center; padding-top: 30px; margin-top: 10px;">
        <h4>비행상품 관리하기</h4>
        <button type="button" onclick="location.href=''" class="btn btn-primary">상품 등록</button>

        <!-- 수정하기 버튼 -->
        <button type="button" onclick="location.href=''" class="btn btn-danger">수정하기</button>
      </div>
    </c:when>
  </c:choose>
</div>
<!-- 본문끝 -->
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>