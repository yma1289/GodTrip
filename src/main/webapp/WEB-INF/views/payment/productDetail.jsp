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
            <td>${transList.Price}</td>
            <td>${transList.rsvdate}</td>      
			<input type="hidden" class="Price" value="${transList.Price}">    
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
            <td>${roomreservation.totalpay}&#8361; </td>
            <td>${roomreservation.room_rsvdate} </td>
			<!-- room_code 값이 넘어오지 않음 -->
			<input type="hidden" class="totalpay" value="${roomreservation.totalpay}">
        </tr>
    </tbody>
    
<c:if test="${vs.count mod 1==0}">
		              	 	</tr> <tr>
		           		</c:if>   
      </c:forEach>
</table>

<div class="d-flex justify-content-center my-4">
	<input type="button" value="결제하기" onclick="confirmPayment('${room_code}', '${transpro_code}')"> 
</div>

</div>
<script>
	function confirmPayment(room_code, transpro_code) {
		
	  if (confirm("결제를 진행하시겠습니까? (장바구니에 담은 상품은 삭제됩니다)"	)) {
		  
			//가격을 구하기	  숙박->totalpay  교통->price 		  
			let PriceElements = document.getElementsByClassName("Price");
			  
			let totalpayElements = document.getElementsByClassName("totalpay");
		
			let totalSum = 0;
			let PriceSum = 0;
			
			for (var i = 0; i < totalpayElements.length; i++) {
			  totalSum += Number(totalpayElements[i].value);
			  alert(totalSum+"숙박 가격");
			}
			for (var i = 0; i < PriceElements.length; i++) {
				PriceSum += Number(PriceElements[i].value);
			  alert(PriceSum+"교통 가격");
			}
			alert(totalSum+PriceSum+"총 가격");
			
			let finalSum=0;
			finalSum=totalSum+PriceSum;
			//alert(finalSum);
			//alert(room_code); 
			//alert(transpro_code);
		
			var departureDate = "${departure_Date}";
			var arrivalDate = "${arrival_Date}";
		    //alert(departureDate+"출발일");
			//alert(arrivalDate+"도착일");
		
				requestPay(
							id,
						  totalSum,
						  PriceSum,
						  finalSum,
						  room_code,
						  transpro_code,
						  departureDate,
						  arrivalDate
				);
		  }//if end
	}//confirmPayment() end
	
	//회원 정보 가져오기
	let Email, Name, Tel, Addr, Postcode, id;
	function getPayInfo() {

		  $.ajax({
			type: "GET",
			url: "/payment/productDetail",
			success: function (data) {
				//console.log(data);
			  Email = data.email;
			  Name = data.mname;
			  Tel = data.tel;
			  Addr = data.address1;
			  Postcode = data.zipcode;
			  id=data.id;
			//   alert(Email);
			//   alert(Name);
			//   alert(Tel);
			//  alert("아이디 확인"+id);
	
			},
			error: function (request, status, error) {
			  console.log("Error: " + error);
			},
		  });
	}//getPayInfo() end
	
	
	$(document).ready(function () {
	  	getPayInfo();
	});
	
	///주문번호 새엇ㅇ
	function createOrderNum() {
	  const date = new Date();
	  const year = date.getFullYear();
	  const month = String(date.getMonth() + 1).padStart(2, "0");
	  const day = String(date.getDate()).padStart(2, "0");
	
	  let orderNum = year + month + day;
	  for (let i = 0; i < 10; i++) {
		orderNum += Math.floor(Math.random() * 8);
	  }
	  return orderNum;
	}//createOrderNum() end
	
	///////////////여기서 부터 결제
	// 초기화 1회꼭하기
	var IMP = window.IMP;
	IMP.init("imp21612430"); // 가맹점식별코드
	
	function requestPay(id, totalSum, PriceSum, finalSum, room_code, transpro_code, departureDate, arrivalDate) {
	  
		  var orderNum = createOrderNum();	  
		 
		  IMP.request_pay(
			{
			  pg: "kcp",
			  pay_method: "card",
			  merchant_uid: orderNum,
			  name: "Godtrip 여행상품",
			  amount: finalSum,
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
					id: id,
					merchantUid: rsp.merchant_uid,
					pg: "kcp",
					payMethod: "card",
					productName: "Godtrip 여행상품",
					amount: finalSum,
					orderdate: new Date().toISOString().substring(0, 10),
					Price: PriceSum,
					Total: totalSum,
					room_code: room_code,
					transpro_code: transpro_code,
					departureDate: departureDate,
					arrivalDate: arrivalDate
				  }),
				})
				  .then((response) => response.json())
				  .then((data) => {	
					  //alert(data);
					  //alert("#"+data.result+"#");
					  console.log(data);
					if (data.result === "success") {
					  	alert("결제가 완료되었습니다.");
					  	location.href="http://localhost:9095/payment/finalreserveForm";
					} else {
					  	alert("결제 처리 중 오류가 발생하였습니다.1");
					}
				  })
				  .catch((error) => {
					console.error(":", error);
					alert("결제 처리 중 오류가 발생하였습니다.2");
				  });
			  }
			}
		  );
	}//requestPay() end
</script> 

<%@ include file="../footer.jsp" %>