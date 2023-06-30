<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="container">
    		<!-- Modal -->
<div class="w3-padding-64">
  <div class="w3-row-padding">
    <div class="w3-col l4 m6">
	<img src="/storage/${not empty list ? list[0].hotel_filename : ''}" width="100%" height="100%">    </div>
    <div class="w3-col l8 m6">
    	<!--list가 비어 있지 않을 때 첫 번째 항목의 hotel_Name을 출력합니다. 리스트가 비어있을 경우 출력되는 부분은 없습니다.-->
      <h3>${not empty list ? list[0].hotel_Name : ''}</h3>      
      <h5 style="border-bottom: 1px solid;">${not empty list ? list[0].hotel_address : ''}</h5>
      <br>
      	${not empty list ? list[0].hotel_Content : ''}
    </div>
  </div>
    		<br>
    		<br>
			<br>
            <c:forEach var="hotel" items="${list}">
            
            <div>
    			<c:choose>
    				<c:when test="${room_filename != '-'}">
    					<img src="/storagedetail/${hotel.room_filename}" width="100%" height="400px">
    				</c:when>
    				<c:otherwise>
                        등록된 사진 없음!!<br>
                    </c:otherwise>
    			</c:choose>
    			
                 <h3>${hotel.room_Name}</h3>
                      <h6 style="text-align: right;">최대 ${hotel.room_maxperson} 인</h6>
                  
    			 ${hotel.room_info}
    			<br>
               1박기준 가격 : <fmt:formatNumber value="${hotel.room_price}" />&#8361;
                <div style="text-align: right;">
                <!-- AJAX는 서버로 갔다가 다시 자기 자신의 페이지(hoteldetail.jsp)로 돌아오는 방식임  -->
                <!-- <button type="button" onclick="selectRoom('${hotel.room_code}')">선택하기</button> -->
               <c:if test="${hotel.r2 == null}"> 
                <button type="button" onclick="location.href='/roomreservationinsert?room_code=${hotel.r1}&departure_Date=${departure_Date}&arrival_Date=${arrival_Date}&room_price=${hotel.room_price}'">선택하기</button>
                </c:if>
               <c:if test="${hotel.r2 == hotel.r1}">
                <button type="button" class="btn btn-primary" disabled>예약불가</button>
                </c:if>
                </div>
                	<br>		
    		  	</div>
    	</c:forEach>
    	</div>
    	<script type="text/javascript">
    	
    	</script>
   
  
  



<%@ include file="../footer.jsp" %>