<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../pheader.jsp" %>

<!-- 본문시작 -->
<div class="col-sm-12">
	<c:choose>
	    <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'A1' }">
      <div style="text-align: center; padding-top: 30px; margin-top: 10px;">
        <h4>숙박상품 판매현황</h4>
     	<div class="container" style="align:center; padding-top: 30px">
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
      <div style="text-align: center; padding-top: 30px; margin-top: 10px;">
        <h4>기차상품 판매현황</h4>
        <hr>
        
        

        
      </div>
    </c:when>

    <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'C1' }">
      <div style="text-align: center; padding-top: 30px; margin-top: 10px;">
        <h4>비행상품 판매현황</h4>
        <hr>
        
      </div>
    </c:when>
  </c:choose>
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