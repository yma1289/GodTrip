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
						<img src="/storage/${roompartner.room_filename}" width="100px">						
					</c:when>
					<c:otherwise>
						등록된 사진 없음! <br>
					</c:otherwise>
				</c:choose>
			</td>
			<td>${roompartner.room_info}</td>
			<td>${roompartner.room_maxperson}</td>
			<td>${roompartner.room_state}</td>
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
</script>
<%@ include file="../footer.jsp" %>