<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!-- 본문시작 -->
<div class="col-sm-4">
	<c:choose>
		<c:when test="${!(empty s_id || empty s_passwd || s_mlevel == 'E1')}">
			<div style="text-align: center; padding-top: 30px; margin-top: 10px; ">
				<img src="../image/loggedin.png" style="width:40%; height=50%;">
				<br>
				<strong>${mname}</strong> 님 
				<a href="logout.do">[로그아웃]</a> <br>
				<br> <a href="memberModify">[회원정보 수정]</a> 
				<a href="memberWithdraw">[회원 탈퇴]</a>
			</div>
		</c:when>
	</c:choose>




</div>

<div class="col-sm-4">
<c:choose>
		<c:when test="${!(empty s_id || empty s_passwd || s_mlevel == 'E1')}">
			<div style="text-align: center; padding-top: 30px; margin-top: 10px; ">
<table style="text-align: center; width: 427px; height: 409px;" border="0"
cellpadding="2" cellspacing="2">
<tbody>
<tr>
<td style="vertical-align: top;"><img src="../image/loggedin.png" style="width:48%; height=50%;"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;"><a href="logout.do">
    <img src="../image/logout.png" alt="로그아웃" style="width:20%; height=50%;">
  </a>
</tr>
<tr>
<td style="vertical-align: top;"><a href="logout.do">
    <img src="../image/logout.png" alt="로그아웃" style="width:20%; height=50%;">
  </a>
</td>
</tr>

<tr>
<td style="vertical-align: top;">
  <a href="logout.do">
    <img src="../image/logout.png" alt="로그아웃" style="width:20%; height=50%;">
  </a>
  <br>
</td>
</tr>
</tbody>
</table>
</div>
	</div>
		</c:when>
	</c:choose>

<div class="col-sm-4">
<c:choose>
<c:when test="${!(empty s_id || empty s_passwd) &&(s_mlevel == 'A1')}">
<div style="text-align: center; padding-top: 30px; margin-top: 10px; ">
				<img src="../image/" style="width:40%; height=50%;">
				<br>
				<strong>${mname}</strong> 님 
				<a href="logout.do">[로그아웃]</a> <br>
				<br> <a href="memberModify">[회원정보 수정]</a> 
				<a href="memberWithdraw">[회원 탈퇴]</a>
			</div>
</c:when>
</c:choose>

</div>

<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>
