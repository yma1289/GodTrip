<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../pheader.jsp" %>

<style>
.wrap {
  width: 100%;
  height: 80vh;
  display: flex;
  background: rgba(0, 0, 0, 0);
}
</style>

<!-- 본문시작 -->
<div class="wrap">
<div class="col-sm-12">
	<c:choose>
	  <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'A1' }">
      <div style="text-align: center; padding-top: 30px; margin-top: 10px;">
        <h3>숙박상품 판매현황</h3>
        <hr>
        <div class="container" style="align:center; padding-top: 30px">
        <div class="table-responsive">
			<table class="table">
			<thead>
			<tr>		
				<th class="text-center">숙박종류</th> 
				<th class="text-center">숙박명</th>		
				<th class="text-center">숙박메인사진</th>
				<th class="text-center">숙박최저가</th>
				<th class="text-center">객실정보</th>
				<th class="text-center">상품등록</th>
				<th class="text-center">삭제</th>
			</tr>
			</thead>

			<tbody>
			<c:forEach var="hotel" items="${list}">
				<tr class="text-center">
					<td>${hotel.hotel_Type}</td>
					<td>${hotel.hotel_Name}</td>			
					<td>
						<c:choose>
							<c:when test="${hotel.hotel_filename != '-'}">
								<img src="/storage/${hotel.hotel_filename}" width="100px">						
							</c:when>
							<c:otherwise>
								등록된 사진 없음! <br>
							</c:otherwise>
						</c:choose>
					</td>
					<td>${hotel.hotel_Prices}</td>
					<td><input type="button" class="btn btn-success" value="객실정보" onclick="location.href='/partner/roompartner?hotel_code=${hotel.hotel_code}'"></td>
					<td>				
						<input type="button" class="btn btn-success" value="객실등록" onclick="location.href='/partner/hoteldetailForm?hotel_code=${hotel.hotel_code}'">
					</td>
					<td>															
						<input type="button" class="btn btn-danger" value="삭제하기" onclick="hotelDelete('${hotel.hotel_code}')">
					</td>
				 </tr>
			</c:forEach>			
			</tbody>	
			</table>	
        </div>
        </div>
	</div>     
    </c:when>

    <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'B1' }">
      <div style="text-align: center; padding-top: 30px;">
        
        <div class="container" style="align:center; padding-top: 30px">	
        <h3>기차상품 판매현황</h3>
        </div>
        <br>
        
        <div class="container" style="align:center; padding-top: 20px">	
		 <table class="table">
		  <thead>
		   <tr>
			<th class="text-center">항공/기차편명</th>
			<th class="text-center">항공/기차이름</th>
			<th class="text-center">출발일</th>
			<th class="text-center">출발지</th>
			<th class="text-center">도착지</th>
			<th class="text-center">출발시간</th>
			<th class="text-center">도착시간</th>		
			<th class="text-center">가격</th>
			<th class="text-center">잔여좌석</th>			
			<th class="text-center">삭제</th>
		   </tr>
		  </thead>
	  
		  <tbody>
		   <c:forEach var="T_pro" items="${T_proList}">
		   <tr class="text-center">		
			<td>${T_pro.trans_code}</td>
			<td>${T_pro.trans_name}</td>
			<td>${T_pro.departure_Date}</td>
		
			<td>
				<c:choose>
					<c:when test="${T_pro.departure_code == 'G0001'}">
						제주
					</c:when>
					<c:when test="${T_pro.departure_code == 'G0002'}">
						서울
					</c:when>
					<c:when test="${T_pro.departure_code == 'G0003'}">
						인천
					</c:when>	
					<c:when test="${T_pro.departure_code == 'G0004'}">
						수원
					</c:when>	
					<c:when test="${T_pro.departure_code == 'G0005'}">
						가평
					</c:when>	
					<c:when test="${T_pro.departure_code == 'G0006'}">
						강릉
					</c:when>	
					<c:when test="${T_pro.departure_code == 'G0007'}">
						춘천
					</c:when>	
					<c:when test="${T_pro.departure_code == 'G0008'}">
						제천
					</c:when>
					<c:when test="${T_pro.departure_code == 'G0009'}">
						대전
					</c:when>
					<c:when test="${T_pro.departure_code == 'G0010'}">
						남원
					</c:when>
					<c:when test="${T_pro.departure_code == 'G0011'}">
						군산
					</c:when>
					<c:when test="${T_pro.departure_code == 'G0012'}">
						영월
					</c:when>
					<c:when test="${T_pro.departure_code == 'G0013'}">
						부산
					</c:when>
					<c:when test="${T_pro.departure_code == 'G0014'}">
						경주
					</c:when>
					<c:when test="${T_pro.departure_code == 'G0015'}">
						포항
					</c:when>
					<c:when test="${T_pro.departure_code == 'G0016'}">
						통영거제
					</c:when>
					<c:when test="${T_pro.departure_code == 'G0017'}">
						목포
					</c:when>
					<c:when test="${T_pro.departure_code == 'G0018'}">
						여수
					</c:when>
					<c:when test="${T_pro.departure_code == 'G0019'}">
						전주
					</c:when>
					<c:otherwise>
						${T_pro.departure_code}
					</c:otherwise>
				</c:choose>
			</td>		
			<td>
				<c:choose>
					<c:when test="${T_pro.arrival_code == 'G0001'}">
						제주
					</c:when>
					<c:when test="${T_pro.arrival_code == 'G0002'}">
						서울
					</c:when>
					<c:when test="${T_pro.arrival_code == 'G0003'}">
						인천
					</c:when>	
					<c:when test="${T_pro.arrival_code == 'G0004'}">
						수원
					</c:when>	
					<c:when test="${T_pro.arrival_code == 'G0005'}">
						가평
					</c:when>	
					<c:when test="${T_pro.arrival_code == 'G0006'}">
						강릉
					</c:when>	
					<c:when test="${T_pro.arrival_code == 'G0007'}">
						춘천
					</c:when>	
					<c:when test="${T_pro.arrival_code == 'G0008'}">
						제천
					</c:when>
					<c:when test="${T_pro.arrival_code == 'G0009'}">
						대전
					</c:when>
					<c:when test="${T_pro.arrival_code == 'G0010'}">
						남원
					</c:when>
					<c:when test="${T_pro.arrival_code == 'G0011'}">
						군산
					</c:when>
					<c:when test="${T_pro.arrival_code == 'G0012'}">
						영월
					</c:when>
					<c:when test="${T_pro.arrival_code == 'G0013'}">
						부산
					</c:when>
					<c:when test="${T_pro.arrival_code == 'G0014'}">
						경주
					</c:when>
					<c:when test="${T_pro.arrival_code == 'G0015'}">
						포항
					</c:when>
					<c:when test="${T_pro.arrival_code == 'G0016'}">
						통영거제
					</c:when>
					<c:when test="${T_pro.arrival_code == 'G0017'}">
						목포
					</c:when>
					<c:when test="${T_pro.arrival_code == 'G0018'}">
						여수
					</c:when>
					<c:when test="${T_pro.arrival_code == 'G0019'}">
						전주
					</c:when>
					<c:otherwise>
						${T_pro.arrival_code}
					</c:otherwise>
				</c:choose>		
			</td>		
			<td>${T_pro.departure_Time}</td>
			<td>${T_pro.arrival_Time}</td>
			<td>${T_pro.Price}</td>
			<td>${T_pro.seat}</td>		
			<td>				
				<input type="button" class="btn btn-danger" value="삭제" onclick="confirmDelete('${T_pro.transpro_code}')">
			</td>		
		   </tr>	   
		   </c:forEach>
		  </tbody> 	
		 </table>	 	
		</div>       
      </div>
    </c:when>

    <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'C1' }">
      <div style="text-align: center; padding-top: 30px;">
        
        <div class="container" style="align:center; padding-top: 30px">	
        <h3>항공상품 판매현황</h3>
        </div>
        <br>
        
        <div class="container" style="align:center; padding-top: 20px">	
		 <table class="table">
		  <thead>
		   <tr>
			<th class="text-center">항공/기차편명</th>
			<th class="text-center">항공/기차이름</th>
			<th class="text-center">출발일</th>
			<th class="text-center">출발지</th>
			<th class="text-center">도착지</th>
			<th class="text-center">출발시간</th>
			<th class="text-center">도착시간</th>		
			<th class="text-center">가격</th>
			<th class="text-center">잔여좌석</th>			
			<th class="text-center">삭제</th>
		   </tr>
		  </thead>
	  
		  <tbody>
		   <c:forEach var="F_pro" items="${F_proList}">
		   <tr class="text-center">		
			<td>${F_pro.trans_code}</td>
			<td>${F_pro.trans_name}</td>
			<td>${F_pro.departure_Date}</td>
		
			<td>
				<c:choose>
					<c:when test="${F_pro.departure_code == 'G0001'}">
						제주
					</c:when>
					<c:when test="${F_pro.departure_code == 'G0002'}">
						서울
					</c:when>
					<c:when test="${F_pro.departure_code == 'G0003'}">
						인천
					</c:when>	
					<c:when test="${F_pro.departure_code == 'G0004'}">
						수원
					</c:when>	
					<c:when test="${F_pro.departure_code == 'G0005'}">
						가평
					</c:when>	
					<c:when test="${F_pro.departure_code == 'G0006'}">
						강릉
					</c:when>	
					<c:when test="${F_pro.departure_code == 'G0007'}">
						춘천
					</c:when>	
					<c:when test="${F_pro.departure_code == 'G0008'}">
						제천
					</c:when>
					<c:when test="${F_pro.departure_code == 'G0009'}">
						대전
					</c:when>
					<c:when test="${F_pro.departure_code == 'G0010'}">
						남원
					</c:when>
					<c:when test="${F_pro.departure_code == 'G0011'}">
						군산
					</c:when>
					<c:when test="${F_pro.departure_code == 'G0012'}">
						영월
					</c:when>
					<c:when test="${F_pro.departure_code == 'G0013'}">
						부산
					</c:when>
					<c:when test="${F_pro.departure_code == 'G0014'}">
						경주
					</c:when>
					<c:when test="${F_pro.departure_code == 'G0015'}">
						포항
					</c:when>
					<c:when test="${F_pro.departure_code == 'G0016'}">
						통영거제
					</c:when>
					<c:when test="${F_pro.departure_code == 'G0017'}">
						목포
					</c:when>
					<c:when test="${F_pro.departure_code == 'G0018'}">
						여수
					</c:when>
					<c:when test="${F_pro.departure_code == 'G0019'}">
						전주
					</c:when>
					<c:otherwise>
						${F_pro.departure_code}
					</c:otherwise>
				</c:choose>
			</td>		
			<td>
				<c:choose>
					<c:when test="${F_pro.arrival_code == 'G0001'}">
						제주
					</c:when>
					<c:when test="${F_pro.arrival_code == 'G0002'}">
						서울
					</c:when>
					<c:when test="${F_pro.arrival_code == 'G0003'}">
						인천
					</c:when>	
					<c:when test="${F_pro.arrival_code == 'G0004'}">
						수원
					</c:when>	
					<c:when test="${F_pro.arrival_code == 'G0005'}">
						가평
					</c:when>	
					<c:when test="${F_pro.arrival_code == 'G0006'}">
						강릉
					</c:when>	
					<c:when test="${F_pro.arrival_code == 'G0007'}">
						춘천
					</c:when>	
					<c:when test="${F_pro.arrival_code == 'G0008'}">
						제천
					</c:when>
					<c:when test="${F_pro.arrival_code == 'G0009'}">
						대전
					</c:when>
					<c:when test="${F_pro.arrival_code == 'G0010'}">
						남원
					</c:when>
					<c:when test="${F_pro.arrival_code == 'G0011'}">
						군산
					</c:when>
					<c:when test="${F_pro.arrival_code == 'G0012'}">
						영월
					</c:when>
					<c:when test="${F_pro.arrival_code == 'G0013'}">
						부산
					</c:when>
					<c:when test="${F_pro.arrival_code == 'G0014'}">
						경주
					</c:when>
					<c:when test="${F_pro.arrival_code == 'G0015'}">
						포항
					</c:when>
					<c:when test="${F_pro.arrival_code == 'G0016'}">
						통영거제
					</c:when>
					<c:when test="${F_pro.arrival_code == 'G0017'}">
						목포
					</c:when>
					<c:when test="${F_pro.arrival_code == 'G0018'}">
						여수
					</c:when>
					<c:when test="${F_pro.arrival_code == 'G0019'}">
						전주
					</c:when>
					<c:otherwise>
						${F_pro.arrival_code}
					</c:otherwise>
				</c:choose>		
			</td>		
			<td>${F_pro.departure_Time}</td>
			<td>${F_pro.arrival_Time}</td>
			<td>${F_pro.Price}</td>
			<td>${F_pro.seat}</td>		
			<td>				
				<input type="button" class="btn btn-danger" value="삭제" onclick="confirmDelete('${F_pro.transpro_code}')">
			</td>		
		   </tr>	   
		   </c:forEach>
		  </tbody> 	
		 </table>	 	
		</div>	        
      </div>
    </c:when>
  </c:choose>
</div>
</div>
<!-- 본문끝 -->

<script type="text/javascript">
function hotelDelete(hotel_code) {
    if (confirm("정말로 삭제 하시겠습니까?(등록한 객실상품도 같이 삭제됩니다)")) {
      location.href = '/partner/hoteldelete?hotel_code=' + hotel_code;
    }
  }
</script>
                                                                                                      
<%@ include file="../footer.jsp" %>