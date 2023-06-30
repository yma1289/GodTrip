<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>

.wrap {
  width: 100%;
  height: 100%;
  display: flex;
  background: rgba(0, 0, 0, 0);
}

</style>

<div class="wrap">
<!-- 본문시작 -->

<c:choose>
	<c:when test="${!(empty s_id || empty s_passwd || s_mlevel == 'E1' || s_mlevel == 'F1')}">

<!-- 좌측 시작 -->
	<div class="container-fluid">
		<div class="row">
			<!-- 개인정보창 -->
			<div class="container-fluid col-12 col-md-4 col-lg-3">			
				<table class="table custom-table">
					
					<tr align="center">
						<td style="padding-top: 150px; padding-bottom: 20px; padding-left: 10px;">
							<img src="/images/loggedin.png" alt="userPhoto" width="150vh">							
						</td>						
					</tr>
					
					<tr align="center">
						<td valign="middle" style="line-height: 180%;">
							<p style="font-weight: bold; text-align: center; margin: 0px;">
								${mname}님
							</p>
							<span style="line-height: 1em; margin: 0px; padding: 0px;">
								환영합니다
							</span>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="button" class="btn btn-primary" value="회원정보수정" onclick="location.href='memberModify'"/>
							<input type="button" class="btn btn-danger" value="회원탈퇴" onclick="location.href='memberWithdraw'"/>					
						</td>						
					</tr>
<!-- 					
					<tr align="center">
						<td colspan>
							최근예약내역					
						</td>						
					</tr>
 -->														
				</table>		
			</div>
<!-- 좌측 끝 -->			

<!-- 우측 시작 -->
			<div class="col-12 col-md-8 col-lg-9"  style="padding-bottom: 40px;">
			
			<h3 class="display-6 text-center mb-5" style="color: #19b3eb; font-weight: bold; padding-top: 40px;">최근 예약내역</h3>	
				
				<c:forEach var="payment" items="${paymentList}">		
				<div class="container">
					<table class="table table-bordered" style="display: table; table-layout: fixed; border-width: thick;">
						<tr align="center">
							<th>예약번호</th>
							<td>${payment.merchant_uid}</td>
							<th>예약일</th>
							<td>${payment.orderDate}</td>
							<th>총 결제금액</th>
							<td>${payment.amount}</td>												
						</tr>
					</table>
					<h6 style="font-weight: bold; text-align: left; padding-top: 10px;">▶ 교통 예약내역</h6>
					<table class="table table-bordered">					
					<thead>
						<tr>							
							<th>출발일</th>
							<th>항공사/기차정보</th>								
							<th>출발지</th>
							<th>도착지</th>
							<th>출발시간</th>
							<th>도착시간</th>														
							<th>가격</th>
						</tr>
					</thead>
					<tbody>					
						<tr>							
							<td>${payment.departureDate}</td>
							<td>${payment.trans_name}</td>								
							<td>
								<c:choose>
								<c:when test="${payment.departure_code == 'G0001'}">
									제주
								</c:when>
								<c:when test="${payment.departure_code == 'G0002'}">
									서울
								</c:when>
								<c:when test="${payment.departure_code == 'G0003'}">
									인천
								</c:when>	
								<c:when test="${payment.departure_code == 'G0004'}">
									수원
								</c:when>	
								<c:when test="${payment.departure_code == 'G0005'}">
									가평
								</c:when>	
								<c:when test="${payment.departure_code == 'G0006'}">
									강릉
								</c:when>	
								<c:when test="${payment.departure_code == 'G0007'}">
									춘천
								</c:when>	
								<c:when test="${payment.departure_code == 'G0008'}">
									제천
								</c:when>
								<c:when test="${payment.departure_code == 'G0009'}">
									대전
								</c:when>
								<c:when test="${payment.departure_code == 'G0010'}">
									남원
								</c:when>
								<c:when test="${payment.departure_code == 'G0011'}">
									군산
								</c:when>
								<c:when test="${payment.departure_code == 'G0012'}">
									영월
								</c:when>
								<c:when test="${payment.departure_code == 'G0013'}">
									부산
								</c:when>
								<c:when test="${payment.departure_code == 'G0014'}">
									경주
								</c:when>
								<c:when test="${payment.departure_code == 'G0015'}">
									포항
								</c:when>
								<c:when test="${payment.departure_code == 'G0016'}">
									통영거제
								</c:when>
								<c:when test="${payment.departure_code == 'G0017'}">
									목포
								</c:when>
								<c:when test="${payment.departure_code == 'G0018'}">
									여수
								</c:when>
								<c:when test="${payment.departure_code == 'G0019'}">
									전주
								</c:when>
								<c:otherwise>
									${payment.departure_code}
								</c:otherwise>
							  </c:choose>
							</td>
							<td>
								<c:choose>
								<c:when test="${payment.arrival_code == 'G0001'}">
									제주
								</c:when>
								<c:when test="${payment.arrival_code == 'G0002'}">
									서울
								</c:when>
								<c:when test="${payment.arrival_code == 'G0003'}">
									인천
								</c:when>	
								<c:when test="${payment.arrival_code == 'G0004'}">
									수원
								</c:when>	
								<c:when test="${payment.arrival_code == 'G0005'}">
									가평
								</c:when>	
								<c:when test="${payment.arrival_code == 'G0006'}">
									강릉
								</c:when>	
								<c:when test="${payment.arrival_code == 'G0007'}">
									춘천
								</c:when>	
								<c:when test="${payment.arrival_code == 'G0008'}">
									제천
								</c:when>
								<c:when test="${payment.arrival_code == 'G0009'}">
									대전
								</c:when>
								<c:when test="${payment.arrival_code == 'G0010'}">
									남원
								</c:when>
								<c:when test="${payment.arrival_code == 'G0011'}">
									군산
								</c:when>
								<c:when test="${payment.arrival_code == 'G0012'}">
									영월
								</c:when>
								<c:when test="${payment.arrival_code == 'G0013'}">
									부산
								</c:when>
								<c:when test="${payment.arrival_code == 'G0014'}">
									경주
								</c:when>
								<c:when test="${payment.arrival_code == 'G0015'}">
									포항
								</c:when>
								<c:when test="${payment.arrival_code == 'G0016'}">
									통영거제
								</c:when>
								<c:when test="${payment.arrival_code == 'G0017'}">
									목포
								</c:when>
								<c:when test="${payment.arrival_code == 'G0018'}">
									여수
								</c:when>
								<c:when test="${payment.arrival_code == 'G0019'}">
									전주
								</c:when>
								<c:otherwise>
									${payment.arrival_code}
								</c:otherwise>
							  </c:choose>
							</td>
							<td>${payment.departure_Time}</td>
							<td>${payment.arrival_Time}</td>														
							<td>${payment.Price}</td>
						</tr>					
					</tbody>														
					</table>
					
					<h6 style="font-weight: bold; text-align: left; padding-top: 10px;">▶ 숙박 예약내역</h6>
					<table class="table table-bordered">					
					<thead>
						<tr>							
							<th>체크인날짜</th>							
							<th>숙박정보</th>
							<th>객실상품</th>
							<th>가격</th>														
						</tr>
					</thead>
					<tbody>					
						<tr>							
							<td>${payment.departureDate}</td>							
							<td>${payment.hotel_Name}</td>
							<td>${payment.room_Name}</td>							
							<td>${payment.Total}</td>							
						</tr>					
					</tbody>														
					</table>
					
					<br><hr><br>
				</div>																
				</c:forEach>														
				
			</div>
		</div>	
	</div>
<!-- 우측 끝 -->
	
	</c:when>
</c:choose>
<!-- 본문끝 -->

</div>
<%@ include file="../footer.jsp" %>
