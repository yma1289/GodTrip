<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>                                                                                                                                                                                                                                                                                                                                                                                                                          
<%@ include file="../header.jsp" %>  
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
</style>


<div class="col-sm-12">
	<div class="container" style="padding-top: 30px">
	 <br>
	 <h3><strong>항공/기차상품 선택</strong></h3>
	</div>		
	
	<div class="container" style="align:center; padding-top: 10px">
	<form name="depCodeFrm" id="depCodeFrm" method="get" action="depCodeSelect">
	<input type="hidden" id="arrival_code" name="arrival_code" value="${arrival_code}">
	<input type="hidden" id="arrival_Date" name="arrival_Date" value="${arrival_Date}">
	<table>
	  <tr>
		<th style="text-align: center">출발일</th>		
		<td>
			<input type="text" name="departure_Date" id="departure_Date" size="10" maxlength="10" value="${departure_Date}" readonly>
		</td>
	  </tr>
	  <tr>
		<th style="text-align: center">출발지</th>
		<td>
			<select name="departure_code" id="departure_code">
				<option value="0">선택</option>
				<option value="G0001">제주</option>
				<option value="G0002">서울</option>
				<option value="G0003">인천</option>
				<option value="G0004">수원</option>
				<option value="G0005">가평</option>
				<option value="G0006">강릉</option>
				<option value="G0007">춘천</option>
				<option value="G0008">제천</option>
				<option value="G0009">대전</option>
				<option value="G0010">군산</option>
				<option value="G0011">영월</option>
				<option value="G0012">부산</option>
				<option value="G0013">경주</option>
				<option value="G0014">포항</option>
				<option value="G0015">통영거제</option>
				<option value="G0016">목포</option>
				<option value="G0017">여수</option>
				<option value="G0018">전주</option>
			</select>
		</td>
		<th style="text-align: center">도착지</th>		
		<td>
			<c:choose>
				<c:when test="${arrival_code == 'G0001'}">
					제주
				</c:when>
				<c:when test="${arrival_code == 'G0002'}">
					서울
				</c:when>
				<c:when test="${arrival_code == 'G0003'}">
					인천
				</c:when>	
				<c:when test="${arrival_code == 'G0004'}">
					수원
				</c:when>	
				<c:when test="${arrival_code == 'G0005'}">
					가평
				</c:when>	
				<c:when test="${arrival_code == 'G0006'}">
					강릉
				</c:when>	
				<c:when test="${arrival_code == 'G0007'}">
					춘천
				</c:when>	
				<c:when test="${arrival_code == 'G0008'}">
					제천
				</c:when>
				<c:when test="${arrival_code == 'G0009'}">
					대전
				</c:when>
				<c:when test="${arrival_code == 'G0010'}">
					군산
				</c:when>
				<c:when test="${arrival_code == 'G0011'}">
					영월
				</c:when>
				<c:when test="${arrival_code == 'G0012'}">
					부산
				</c:when>
				<c:when test="${arrival_code == 'G0013'}">
					경주
				</c:when>
				<c:when test="${arrival_code == 'G0014'}">
					포항
				</c:when>
				<c:when test="${arrival_code == 'G0015'}">
					통영거제
				</c:when>
				<c:when test="${arrival_code == 'G0016'}">
					목포
				</c:when>
				<c:when test="${arrival_code == 'G0017'}">
					여수
				</c:when>
				<c:when test="${arrival_code == 'G0018'}">
					전주
				</c:when>
				<c:otherwise>
					${arrival_code}
				</c:otherwise>	
			</c:choose>
			<!--<input type="text" name="arrival_code" id="arrival_code" size="10" maxlength="10" value="${city}">-->
		</td>
		<th style="text-align: center">
			<input type="submit" class="btn btn-primary" value="검색">
		</th>
	  </tr>	
	 </table>	
	</form>
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
		<th class="text-center">상품선택</th>		
	   </tr>
	  </thead>
	  
	  <tbody>
	   <c:forEach var="transpro" items="${transproList}">
	   <c:if test="${transpro.seat>0}"> <!-- seat이 0인 경우 상품이 뜨지 않도록 함 -->
	   <tr class="text-center">		
		<td>${transpro.trans_code}</td>
		<td>${transpro.trans_name}</td>
		<td>${transpro.departure_Date}</td>
		
		<td>
			<c:choose>
				<c:when test="${transpro.departure_code == 'G0001'}">
					제주
				</c:when>
				<c:when test="${transpro.departure_code == 'G0002'}">
					서울
				</c:when>
				<c:when test="${transpro.departure_code == 'G0003'}">
					인천
				</c:when>	
				<c:when test="${transpro.departure_code == 'G0004'}">
					수원
				</c:when>	
				<c:when test="${transpro.departure_code == 'G0005'}">
					가평
				</c:when>	
				<c:when test="${transpro.departure_code == 'G0006'}">
					강릉
				</c:when>	
				<c:when test="${transpro.departure_code == 'G0007'}">
					춘천
				</c:when>	
				<c:when test="${transpro.departure_code == 'G0008'}">
					제천
				</c:when>
				<c:when test="${transpro.departure_code == 'G0009'}">
					대전
				</c:when>				
				<c:when test="${transpro.departure_code == 'G0010'}">
					군산
				</c:when>
				<c:when test="${transpro.departure_code == 'G0011'}">
					영월
				</c:when>
				<c:when test="${transpro.departure_code == 'G0012'}">
					부산
				</c:when>
				<c:when test="${transpro.departure_code == 'G0013'}">
					경주
				</c:when>
				<c:when test="${transpro.departure_code == 'G0014'}">
					포항
				</c:when>
				<c:when test="${transpro.departure_code == 'G0015'}">
					통영거제
				</c:when>
				<c:when test="${transpro.departure_code == 'G0016'}">
					목포
				</c:when>
				<c:when test="${transpro.departure_code == 'G0017'}">
					여수
				</c:when>
				<c:when test="${transpro.departure_code == 'G0018'}">
					전주
				</c:when>
				<c:otherwise>
					${transpro.departure_code}
				</c:otherwise>
			</c:choose>
		</td>		
		<td>
			<c:choose>
				<c:when test="${transpro.arrival_code == 'G0001'}">
					제주
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0002'}">
					서울
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0003'}">
					인천
				</c:when>	
				<c:when test="${transpro.arrival_code == 'G0004'}">
					수원
				</c:when>	
				<c:when test="${transpro.arrival_code == 'G0005'}">
					가평
				</c:when>	
				<c:when test="${transpro.arrival_code == 'G0006'}">
					강릉
				</c:when>	
				<c:when test="${transpro.arrival_code == 'G0007'}">
					춘천
				</c:when>	
				<c:when test="${transpro.arrival_code == 'G0008'}">
					제천
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0009'}">
					대전
				</c:when>				
				<c:when test="${transpro.arrival_code == 'G0010'}">
					군산
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0011'}">
					영월
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0012'}">
					부산
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0013'}">
					경주
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0014'}">
					포항
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0015'}">
					통영거제
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0016'}">
					목포
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0017'}">
					여수
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0018'}">
					전주
				</c:when>
				<c:otherwise>
					${transpro.arrival_code}
				</c:otherwise>
			</c:choose>		
		</td>		
		<td>${transpro.departure_Time}</td>
		<td>${transpro.arrival_Time}</td>
		<td>${transpro.Price}</td>
		<td>${transpro.seat}</td>
		<td>
			<input type="button" class="btn btn-warning" value="선택" onclick="location.href='transRsvInsert?transpro_code=${transpro.transpro_code}&departure_Date=${departure_Date}&arrival_Date=${arrival_Date}&arrival_code=${arrival_code}'">
			<!--<input type="button" class="btn btn-warning" value="선택" onclick="transSelect('${transpro.transpro_code}','${departure_Date}','${arrival_code}','${arrival_Date}')">-->
		</td>				
	   </tr>
	   </c:if>
	   </c:forEach>
	  </tbody> 	
	 </table>	 	
	</div>		
</div>


<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>