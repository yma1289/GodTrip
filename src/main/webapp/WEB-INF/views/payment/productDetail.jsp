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
        <tr>
            <td>2023-06-16</td>
            <td>08:40</td>
            <td>09:40</td>
            <td>서울</td>
            <td>제주</td>
            <td>제주항공</td>
            <td>A04</td>
            <td>67,600</td>
            <td>2023-06-01</td>
        </tr>
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
            <c:if test="${vs.count mod 1==0}">
		              	 	</tr> <tr>
		           		</c:if>   
      </c:forEach>
        </tr>
    </tbody>
    
</table>

<div class="d-flex justify-content-center my-4">
	<a href="/payment/paymentForm" class="btn btn-info">결제하기</a>
</div>

</div>

<%@ include file="../footer.jsp" %>