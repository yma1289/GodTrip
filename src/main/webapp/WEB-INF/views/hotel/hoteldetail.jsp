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
                가격 : <fmt:formatNumber value="${hotel.room_price}" />&#8361;
                <div style="text-align: right;">
                <button type="button" onclick="selectRoom('${hotel.room_code}')">선택하기</button>
                </div>
                	<br>		
    		  	</div>
    	</c:forEach>
    	</div>
    	<script type="text/javascript">
    	function selectRoom(room_code) {
    		  // roomreservation 페이지로 데이터 전달
    		  // AJAX 요청을 사용하여 서버로 데이터 전송 가능
			$.ajax({
    			 url     :"/roomreservationinsert" //요청명령어
    			,type    :"get"        //get방식
    			,dataType:"text"       //응답메세지 타입
    			,data: {
    			     room_code: room_code // room_code 값을 파라미터로 전달
    			}
    			,error   :function(error){
    				alert("장바구니에 못담아요" + error);
    			}//error callback함수
    		    ,success :function(result){//result는 서버가 응답해준 메세지
    		    	alert(result);
    		    	//$("#panel").empty();
    		    	//$("#panel").text(result); //단순 문자열로 출력
    		    	//$("#panel").html(result); //HTML 구조로 출력
    		    }//success callback 함수
    		});//ajax() end
    		  // hotellist 페이지로 이동
    		  window.location.href = '/cartlist';
    		}
    	</script>
   
  
  



<%@ include file="../footer.jsp" %>