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
<div class="wrap">
<div class="col-sm-12">
      <div style="text-align: center; padding-top: 30px; margin-top: 10px;">
        <h4>객실상품 판매현황</h4>
     	<div class="container" style="align:center; padding-top: 30px">
	<table class="table">
	<thead>
	<tr>		
		<th class="text-center">객실명</th> 
		<th class="text-center">가격</th>		
		<th class="text-center">객실메인사진</th>
		<th class="text-center">객실 설명</th>
		<th class="text-center">최대인원</th>
		<th class="text-center">예약상태</th>
		<th class="text-center">삭제</th>
	</tr>
	</thead>

	<tbody>
	<c:forEach var="roompartner" items="${list}">
		<tr class="text-center">
			<td>${roompartner.room_Name}</td>
			<td>${roompartner.room_price}</td>		
			<td>
				<c:choose>
					<c:when test="${roompartner.room_filename != '-'}">
						<img src="/storagedetail/${roompartner.room_filename}" width="100px">						
					</c:when>
					<c:otherwise>
						등록된 사진 없음! <br>
					</c:otherwise>
				</c:choose>
			</td>
			<td>${roompartner.room_info}</td>
			<td>${roompartner.room_maxperson}</td>	
			<td>
  			<input type="button" class="btn btn" value="예약정보보기" onclick="roomcheck('${roompartner.room_code}')">
			</td>
			<td>															
				<!--  <input type="button" class="btn btn-danger" value="삭제하기" onclick="location.href='/partner/roomdelete?room_code=${roompartner.room_code}'">	-->		
			<input type="button" class="btn btn-danger" value="삭제하기" onclick="roomDelete('${roompartner.room_code}')">			
			</td>
		  </tr>
		</c:forEach>			
	</tbody>	
	</table>	
		</div>
	</div>                        
 </div>
 </div>
<script type="text/javascript">
function roomDelete(room_code) {
    if (confirm("정말로 삭제 하시겠습니까?")) {
      location.href = '/partner/roomdelete?room_code=' + room_code;
    }
  }
  
  
function roomcheck(roomCode) {
    // 팝업 창을 띄우는 로직을 구현합니다.
    // 예를 들어, window.open() 함수를 사용하여 새 창을 열거나
    // 모달 팝업을 구현할 수 있는 라이브러리를 활용할 수도 있습니다.
    // 아래는 window.open() 함수를 사용한 예시입니다.
    
    // 팝업 창의 URL을 설정합니다.
    var popupUrl = '/partner/roomcheck?room_code=' + roomCode;
    
    // 팝업 창의 속성을 설정합니다.
    var popupWindow = window.open(popupUrl, 'popup', 'width=800,height=600');
    
    // 팝업 창의 크기 및 위치를 조정할 수도 있습니다.
    // popupWindow.resizeTo(500, 400);
    // popupWindow.moveTo(x, y);
  }
</script>
<%@ include file="../footer.jsp" %>