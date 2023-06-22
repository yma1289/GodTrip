<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!-- 본문시작 -->
<div class="col-sm-4">
	<c:choose>
		<c:when
			test="${!(empty s_id || empty s_passwd || s_mlevel == 'E1' || s_mlevel == 'F1')}">
			<div style="text-align: center;">
				<div
					style="text-align: center; padding-top: 20px; margin-top: 10px;">
					<strong>${mname}</strong> 님
					<h3>환영합니다!</h3>
					<table style="text-align: center; width: 475px; height: 418px;"
						border="0" cellpadding="2" cellspacing="2">
						<tbody>
							<tr align="center">
								<td style="vertical-align: top;"><img
									src="../image/loggedin.png" style="width: 30%;"><br>
								</td>
							</tr>
							<tr align="center">
								<td style="vertical-align: top;"><a href="partnerlogout.do">[로그아웃]</a><br>
								</td>
							</tr>
							<tr align="center">
								<td style="vertical-align: top;"><a href="partnerModify">[회원정보
										수정]</a><br></td>
							</tr>
							<tr align="center">
								<td style="vertical-align: top;"><a href="partnerWithdraw">[회원
										탈퇴]</a><br></td>
							</tr>
							<tr align="center">
								<td style="vertical-align: top;">[최근 예약내역]<br>
								</td>
							</tr>
							<tr align="center">
								<td style="vertical-align: top;">[문의하기]<br>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
	</c:choose>




</div>

<div class="col-sm-8">
	<c:choose>
		<c:when test="${!(empty s_id || empty s_passwd || s_mlevel == 'E1' || s_mlevel == 'F1')}">
			<div style="text-align: center; padding-top: 30px; margin-top: 10px; ">
				<h3>회원 마이페이지</h3>
				<hr>
				<h3>회원 예약 내역</h3>
				<br>
				<table border="1" cellpadding="2" cellspacing="2" width="300px" align="center">
<tbody>
<tr>
<td style="vertical-align: top;">예약일<br>
</td>
<td style="vertical-align: top;">예약번호<br>
</td>
<td style="vertical-align: top;">예약내용<br>
</td>
<td style="vertical-align: top;">예약상황<br>
</td>
</tr>
<tr>
<td style="vertical-align: top;"><br>
</td>
<td style="vertical-align: top;"><br>
</td>
<td style="vertical-align: top;"><br>
</td>
<td style="vertical-align: top;"><br>
</td>
</tr>
</tbody>
</table>
				
				
			</div>
		</c:when>
	</c:choose>


</div>



<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>
