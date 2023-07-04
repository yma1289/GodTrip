<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>                                                                                                                                                                                                                                                                                                                                                                                                                          
<%@ include file="../pheader.jsp" %>  
<!-- 본문시작 -->

<style>
	table {
		border-collapse: separate;
		border-spacing: 0 1rem;
	}
	
	th, td {
		padding-top: 10px;
		padding-right: 20px;
	}
	
	.wrap {
		  width: 100%;
		  height: 100%;
		  display: flex;
		  background: rgba(0, 0, 0, 0);	
</style>

<div class="wrap">
<div class="col-sm-12">
	<div class="container" style="padding-top: 30px">
	 <br>
	 <h3><strong>항공상품 판매현황</strong></h3>
	</div>
		
	
	<div class="container" style="padding-top: 20px">	
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
					군산
				</c:when>
				<c:when test="${F_pro.departure_code == 'G0011'}">
					영월
				</c:when>
				<c:when test="${F_pro.departure_code == 'G0012'}">
					부산
				</c:when>
				<c:when test="${F_pro.departure_code == 'G0013'}">
					경주
				</c:when>
				<c:when test="${F_pro.departure_code == 'G0014'}">
					포항
				</c:when>
				<c:when test="${F_pro.departure_code == 'G0015'}">
					통영거제
				</c:when>
				<c:when test="${F_pro.departure_code == 'G0016'}">
					목포
				</c:when>
				<c:when test="${F_pro.departure_code == 'G0017'}">
					여수
				</c:when>
				<c:when test="${F_pro.departure_code == 'G0018'}">
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
					군산
				</c:when>
				<c:when test="${F_pro.arrival_code == 'G0011'}">
					영월
				</c:when>
				<c:when test="${F_pro.arrival_code == 'G0012'}">
					부산
				</c:when>
				<c:when test="${F_pro.arrival_code == 'G0013'}">
					경주
				</c:when>
				<c:when test="${F_pro.arrival_code == 'G0014'}">
					포항
				</c:when>
				<c:when test="${F_pro.arrival_code == 'G0015'}">
					통영거제
				</c:when>
				<c:when test="${F_pro.arrival_code == 'G0016'}">
					목포
				</c:when>
				<c:when test="${F_pro.arrival_code == 'G0017'}">
					여수
				</c:when>
				<c:when test="${F_pro.arrival_code == 'G0018'}">
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
			<!-- 삭제버튼은 판매자에게만 노출될 수 있게 해야함! -->
			<input type="button" class="btn btn-danger" value="삭제" onclick="confirmDelete('${F_pro.transpro_code}')">
		</td>		
	   </tr>	   
	   </c:forEach>
	  </tbody> 	
	 </table>	 	
	</div>		
</div>
</div>

<script>
	function confirmDelete(transpro_code){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href='/partner/F_proDelete?transpro_code='+transpro_code;
		}//if end
	}//confirmDelete() end
</script>

<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>