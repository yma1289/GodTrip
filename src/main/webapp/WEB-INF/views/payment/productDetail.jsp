<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
     <c:forEach var="transList" items="${transList}">
        <tr>          
            <td>${transList.departure_Date} 
            <td>${transList.departure_Time}</td>
            <td>${transList.arrival_Time}</td>
			<td> <input type="hidden" class="transpro_code" value="${transList.transpro_code}"></td>
            
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
            <td>${transList.Price}&#8361; <input type="hidden" class="totalpay1" value="${transList.Price}"></td>
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
            <td>${roomreservation.totalpay}&#8361; <input type="hidden" class="totalpay" value="${roomreservation.totalpay}"></td>
            <td>${roomreservation.room_rsvdate} </td>
			<td><input type="hidden" class="room_code" value="${roomreservation.room_code}"></td></td>
        </tr>
    </tbody>
    
<c:if test="${vs.count mod 1==0}">
		              	 	</tr> <tr>
		           		</c:if>   
      </c:forEach>
</table>

<div class="d-flex justify-content-center my-4">
	<input type="button" value="결제하기" onclick="confirmPayment('${roomreservation.room_no}', '${transreservation.transrs_no}')"> 
</div>

</div>
<script>
	function confirmPayment(room_no, transrs_no) {
	  if (
		confirm(
		  "결제를 진행하시겠습니까? (장바구니에 담은 상품은 삭제됩니다)"
		)
	  ) {
		let totalpayElements1 =
		  document.getElementsByClassName("totalpay1");
		let totalpayElements =
		  document.getElementsByClassName("totalpay");
	
		let totalSum = 0;
		let totalSum1 = 0;
	
		for (var i = 0; i < totalpayElements.length; i++) {
		  totalSum += Number(totalpayElements[i].value);
		}
		for (var i = 0; i < totalpayElements1.length; i++) {
		  totalSum1 += Number(totalpayElements1[i].value);
		}
	
		let room_code = document.getElementsByClassName("room_code");
		let transpro_code =
		  document.getElementsByClassName("transpro_code");
	
		requestPay(
		  room_no,
		  transrs_no,
		  totalSum,
		  totalSum1,
		  room_code[0].value,
		  transpro_code[0].value
		);
	  }
	}
	
	function getPayInfo() {
	  $.ajax({
		type: "GET",
		url: "/payment/productDetail",
		success: function (data) {
		  Email = data.buyer_email;
		  Name = data.buyer_name;
		  Tel = data.buyer_tel;
		  Addr = data.buyer_addr;
		  Postcode = data.buyer_postcode;
		},
		error: function (request, status, error) {
		  console.log("Error: " + error);
		},
	  });
	}
	
	$(document).ready(function () {
	  getPayInfo();
	});
	
	function createOrderNum() {
	  const date = new Date();
	  const year = date.getFullYear();
	  const month = String(date.getMonth() + 1).padStart(2, "0");
	  const day = String(date.getDate()).padStart(2, "0");
	
	  var orderNum = year + month + day;
	  for (let i = 0; i < 10; i++) {
		orderNum += Math.floor(Math.random() * 8);
	  }
	  return orderNum;
	}
	
	var departureDate = "${departure_Date}";
	var arrivalDate = "${arrival_Date}";
	
	<c:set var="s_id" value="${requestScope.s_id}" />
	var s_id = '${s_id}';
	// 초기화 1회꼭하기
	var IMP = window.IMP;
	IMP.init("imp30544481"); // 가맹점식별코드
	
	function requestPay(
		s_id,
	  room_no,
	  transrs_no,
	  totalSum,
	  totalSum1,
	  room_code,
	  transpro_code
	) {
	  let productAmount = totalSum + totalSum1;
	  var orderNum = createOrderNum();
	  var Email = '<c:out value="${buyer_email}" />';
	  var Name = '<c:out value="${buyer_name}" />';
	  var Tel = '<c:out value="${buyer_tel}" />';
	  var Addr = '<c:out value="${buyer_addr}" />';
	  var Postcode = '<c:out value="${buyer_postcode}" />';
	
	  IMP.request_pay(
		{
		  pg: "kcp",
		  pay_method: "card",
		  merchant_uid: orderNum,
		  name: "Godtrip 여행상품",
		  amount: productAmount,
		  buyer_email: Email,
		  buyer_name: Name,
		  buyer_tel: Tel,
		  buyer_addr: Addr,
		  buyer_postcode: Postcode,
		},
		function (rsp) {
		  if (rsp.success) {
			fetch("/payment/payfetch", {
			  method: "POST",
			  headers: {
				"Content-Type": "application/json",
			  },
			  body: JSON.stringify({
				id: s_id,
				merchantUid: rsp.merchant_uid,
				pg: "kcp",
				payMethod: "card",
				productName: "Godtrip 여행상품",
				amount: productAmount,
				orderdate: new Date()
				  .toISOString()
				  .substring(0, 10),
				totalpay1: totalSum1,
				totalpay: totalSum,
				room_code: room_code,
				transpro_code: transpro_code,
				departureDate: departureDate,
				arrivalDate: arrivalDate,
			  }),
			})
			  .then((response) => response.json())
			  .then((data) => {
				if (data.result === "success") {
				  alert("결제가 완료되었습니다.");
				} else {
				  alert("결제 처리 중 오류가 발생하였습니다.");
				}
			  })
			  .catch((error) => {
				console.error(":", error);
				alert("결제 처리 중 오류가 발생하였습니다.");
			  });
		  }
		}
	  );
	}
	</script>

<%@ include file="../footer.jsp" %>