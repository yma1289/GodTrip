<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="col-sm-12">
<h3 class="my-4">교통</h3>
<table class="table table-bordered">
    <thead class="thead-light">
        <tr>
            <th>출발일</th>
            <th>출발시간</th>
            <th>도착시간</th>
            <th>출발지</th>
            <th>도착지</th>
            <th>항공사/기차</th>
            <th>좌석번호</th>
            <th>가격</th>
            <th>예약일자</th>
        </tr>
    </thead>
    <tbody>
      <c:forEach var="transList" items="${transList}">
        <tr>          
            <td>${transList.departure_Date}</td>
            <td>${transList.departure_Time}</td>
            <td>${transList.arrival_Time}</td>
            
            <td>
              <c:choose>
				<c:when test="${transList.departure_code == 'G0001'}">
					제주
				</c:when>
				<c:when test="${transList.departure_code == 'G0002'}">
					서울
				</c:when>
				<c:when test="${transList.departure_code == 'G0003'}">
					인천
				</c:when>	
				<c:when test="${transList.departure_code == 'G0004'}">
					수원
				</c:when>	
				<c:when test="${transList.departure_code == 'G0005'}">
					가평
				</c:when>	
				<c:when test="${transList.departure_code == 'G0006'}">
					강릉
				</c:when>	
				<c:when test="${transList.departure_code == 'G0007'}">
					춘천
				</c:when>	
				<c:when test="${transList.departure_code == 'G0008'}">
					제천
				</c:when>
				<c:when test="${transList.departure_code == 'G0009'}">
					대전
				</c:when>
				<c:when test="${transList.departure_code == 'G0010'}">
					남원
				</c:when>
				<c:when test="${transList.departure_code == 'G0011'}">
					군산
				</c:when>
				<c:when test="${transList.departure_code == 'G0012'}">
					영월
				</c:when>
				<c:when test="${transList.departure_code == 'G0013'}">
					부산
				</c:when>
				<c:when test="${transList.departure_code == 'G0014'}">
					경주
				</c:when>
				<c:when test="${transList.departure_code == 'G0015'}">
					포항
				</c:when>
				<c:when test="${transList.departure_code == 'G0016'}">
					통영거제
				</c:when>
				<c:when test="${transList.departure_code == 'G0017'}">
					목포
				</c:when>
				<c:when test="${transList.departure_code == 'G0018'}">
					여수
				</c:when>
				<c:when test="${transList.departure_code == 'G0019'}">
					전주
				</c:when>
				<c:otherwise>
					${transList.departure_code}
				</c:otherwise>
			  </c:choose>
            </td>
            
            <td>
              <c:choose>
				<c:when test="${transList.arrival_code == 'G0001'}">
					제주
				</c:when>
				<c:when test="${transList.arrival_code == 'G0002'}">
					서울
				</c:when>
				<c:when test="${transList.arrival_code == 'G0003'}">
					인천
				</c:when>	
				<c:when test="${transList.arrival_code == 'G0004'}">
					수원
				</c:when>	
				<c:when test="${transList.arrival_code == 'G0005'}">
					가평
				</c:when>	
				<c:when test="${transList.arrival_code == 'G0006'}">
					강릉
				</c:when>	
				<c:when test="${transList.arrival_code == 'G0007'}">
					춘천
				</c:when>	
				<c:when test="${transList.arrival_code == 'G0008'}">
					제천
				</c:when>
				<c:when test="${transList.arrival_code == 'G0009'}">
					대전
				</c:when>
				<c:when test="${transList.arrival_code == 'G0010'}">
					남원
				</c:when>
				<c:when test="${transList.arrival_code == 'G0011'}">
					군산
				</c:when>
				<c:when test="${transList.arrival_code == 'G0012'}">
					영월
				</c:when>
				<c:when test="${transList.arrival_code == 'G0013'}">
					부산
				</c:when>
				<c:when test="${transList.arrival_code == 'G0014'}">
					경주
				</c:when>
				<c:when test="${transList.arrival_code == 'G0015'}">
					포항
				</c:when>
				<c:when test="${transList.arrival_code == 'G0016'}">
					통영거제
				</c:when>
				<c:when test="${transList.arrival_code == 'G0017'}">
					목포
				</c:when>
				<c:when test="${transList.arrival_code == 'G0018'}">
					여수
				</c:when>
				<c:when test="${transList.arrival_code == 'G0019'}">
					전주
				</c:when>
				<c:otherwise>
					${transList.arrival_code}
				</c:otherwise>
			  </c:choose>
            </td>
            
            <td>${transList.trans_name}</td>
            <td>${transList.transrs_seatno}</td>
            <td>${transList.Price}&#8361;</td>
            <td>${transList.rsvdate}</td>          
        </tr>
      </c:forEach>
    </tbody>
</table>

<h3 class="my-4">숙박</h3>
<table class="table table-bordered">
    <thead class="thead-light">
        <tr>
            <th>체크인</th>
            <th>숙박정보</th>
            <th>객실상품</th>
            <th>총가격</th>
            <th>예약일자</th>
        </tr>
    </thead>
        
  
	<tbody>
        <tr>
         <c:forEach var="roomreservation" items="${list}">
            <td>${departure_Date}</td>
            <td>${roomreservation.hotel_Name}</td>
            <td>${roomreservation.room_Name}</td>
            <td>${roomreservation.totalpay}&#8361;</td>
            <td>${roomreservation.room_rsvdate}</td>
        </tr>
	</tbody>

<c:if test="${vs.count mod 1==0}">
		              	 	</tr> <tr>
						</c:if>   
      </c:forEach>    
</table>

<div class="d-flex justify-content-center my-4">
	<input type="button" value="결제하기" onclick="confirmPayment()">
</div>

</div>

<script type="text/javascript">
function confirmPayment(room_no,transpro_code, id) {
    if (confirm("결제를 진행하시겠습니까? (장바구니에 담은 상품은 삭제됩니다)")) {
    	window.location.href = "/payment/paymentForm";
  }
}
</script>

<%@ include file="../footer.jsp" %>