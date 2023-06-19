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
	
<script>
	$(function(){
		/*input타입 중 checkbox에서 name값을 기준으로 찾음(name 대신 id도 가능)*/
		$('input:checkbox[name="checkboxName"]').click(function(){
			
			if($('input:checkbox[name="checkboxName"]').is(':checked')){
				console.log("체크");
				clickEvent(event);
			}else{
				console.log("체크 해제")
			}//if end		
		})	
	});
	
	function clickEvent(event){
		//이벤트를 체크박스에 달았기 때문에 여기에서 타겟은 체크박스를 가리킴
		console.log('target :: ', $(event.target));
		
		//$(event.target)에서 가장 가까운 tr 태그 찾기
		var row = $(event.target).closest('tr');
		
		//그중에서도 td 태그 찾기
		var columns = row.find('td');
		
		//콘솔에 어떻게 찍히는지 확인하기
		console.log('row :: ', row);
		console.log('columns :: ', columns);
		
		//columns.addClass('row-highlight');
		var values = "";
		
		//jQuery를 이용한 반복문. idx값과 item을 이용해서 필요한 용도에 맞게 사용하기
		$.each(columns, function(idx, item){
			values = values + 'td' + (idx + 1) + ':' + item.innerHTML + '<br/>';
			alert(values);
		});
		
		console.log('최종 :: ', values);
		
	}//clickEvent() end	
</script>


<div class="col-sm-12">
	<div class="container" style="padding-top: 30px">
	 <br>
	 <h3><strong>항공/기차상품 선택</strong></h3>
	</div>
	
	<div class="container" style="padding-top: 20px">
		<input type="button" class="btn btn-success" value="상품등록" onclick="location.href='/product/transinfoList'">
	</div>
	
	<div class="container" style="align:center; padding-top: 10px"> 
	 <table>
	  <tr>
		<th style="text-align: center">출발일</th>		
		<td>
			<input type="text" name="departure_Date" id="departure_Date" size="10" maxlength="10" value="${departure_Date}">
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
				<option value="G0010">남원</option>
				<option value="G0011">군산</option>
				<option value="G0012">영월</option>
				<option value="G0013">부산</option>
				<option value="G0014">경주</option>
				<option value="G0015">포항</option>
				<option value="G0016">통영거제</option>
				<option value="G0017">목포</option>
				<option value="G0018">여수</option>
				<option value="G0019">전주</option>
			</select>
		</td>
		<th style="text-align: center">도착지</th>
		<td>
			<input type="text" name="arrival_code" id="arrival_code" size="10" maxlength="10" value="${arrival_code}">
		</td>
	  </tr>	
	 </table>
	</div>
	
	<div class="container" style="padding-top: 20px">
	 <table class="table">
	  <thead>
	   <tr>
		<th><input type="checkbox" id="checkAll" name="checkAll"></th>
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
	   <c:forEach var="transpro" items="${transproList}">
	   <tr class="text-center">
		<td><input type="checkbox" id="checkboxName" name="checkboxName"></td>
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
					남원
				</c:when>
				<c:when test="${transpro.departure_code == 'G0011'}">
					군산
				</c:when>
				<c:when test="${transpro.departure_code == 'G0012'}">
					영월
				</c:when>
				<c:when test="${transpro.departure_code == 'G0013'}">
					부산
				</c:when>
				<c:when test="${transpro.departure_code == 'G0014'}">
					경주
				</c:when>
				<c:when test="${transpro.departure_code == 'G0015'}">
					포항
				</c:when>
				<c:when test="${transpro.departure_code == 'G0016'}">
					통영거제
				</c:when>
				<c:when test="${transpro.departure_code == 'G0017'}">
					목포
				</c:when>
				<c:when test="${transpro.departure_code == 'G0018'}">
					여수
				</c:when>
				<c:when test="${transpro.departure_code == 'G0019'}">
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
					남원
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0011'}">
					군산
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0012'}">
					영월
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0013'}">
					부산
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0014'}">
					경주
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0015'}">
					포항
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0016'}">
					통영거제
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0017'}">
					목포
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0018'}">
					여수
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0019'}">
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
			<!-- 삭제버튼은 판매자에게만 노출될 수 있게 해야함! -->
			<input type="button" class="btn btn-danger" value="삭제" onclick="location.href='transproDelete?transpro_code=${transpro.transpro_code}'">
		</td>		
	   </tr>
	   </c:forEach>
	  </tbody> 	
	 </table>	
	</div>		
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>