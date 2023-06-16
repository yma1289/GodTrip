<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
<div class="col-sm-12">
	<div class="container">
	
	  <p>검색창넣기</p>
	  
	  <h3>관광지소개</h3>
	    <table class="table table-hover">
		<thead>
		<tr>
			
			<th>관광지명</th>
			<th>지역</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>키워드</th>
		</tr>	
		</thead>
		
		<c:forEach var="dto" items="${attractionList}">
			<tr>
				<td><a href="<c:url value='/attraction/attractionDetail/${dto.tour_code}' />">${dto.tour_name}</a></td>

				<td>
					<c:choose>
						<c:when test="${dto.area_code=='G0001'}">
							제주
						</c:when>
						<c:when test="${dto.area_code=='G0002'}">
							서울
						</c:when>
						<c:when test="${dto.area_code=='G0003'}">
							인천
						</c:when>
						<c:when test="${dto.area_code=='G0004'}">
							수원
						</c:when>
						<c:when test="${dto.area_code=='G0005'}">
							가평
						</c:when>
						<c:when test="${dto.area_code=='G0006'}">
							강릉
						</c:when>
						<c:when test="${dto.area_code=='G0007'}">
							춘천
						</c:when>
						<c:when test="${dto.area_code=='G0008'}">
							제천
						</c:when>
						<c:when test="${dto.area_code=='G0009'}">
							대전
						</c:when>
						<c:when test="${dto.area_code=='G0010'}">
							남원
						</c:when>
						<c:when test="${dto.area_code=='G0011'}">
							군산
						</c:when>
						<c:when test="${dto.area_code=='G0012'}">
							영월
						</c:when>
						<c:when test="${dto.area_code=='G0013'}">
							부산
						</c:when>
						<c:when test="${dto.area_code=='G0014'}">
							경주
						</c:when>
						<c:when test="${dto.area_code=='G0015'}">
							포항
						</c:when>
						<c:when test="${dto.area_code=='G0016'}">
							통영거제
						</c:when>
						<c:when test="${dto.area_code=='G0017'}">
							목포
						</c:when>
						<c:when test="${dto.area_code=='G0018'}">
							여수
						</c:when>
						<c:when test="${dto.area_code=='G0019'}">
							전주
						</c:when>
						<c:otherwise>
							${dto.area_code}
						</c:otherwise>						
					</c:choose>
				</td>
				<td>${dto.regdate}</td>
				<td>${dto.view_count}</td>
				<td>
					<c:choose>
						<c:when test="${dto.keyword==1}">
							역사
						</c:when>
						<c:when test="${dto.keyword==2}">
							액티비티
						</c:when>
						<c:when test="${dto.keyword==3}">
							트래킹
						</c:when>
						<c:when test="${dto.keyword==4}">
							관광
						</c:when>
						<c:when test="${dto.keyword==5}">
							휴식
						</c:when>
						<c:when test="${dto.keyword==6}">
							바다
						</c:when>
						<c:when test="${dto.keyword==7}">
							자연
						</c:when>
					
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	
	<p>
		<button type="button" onclick="location.href='attractionForm'">등록</button>
	</p>
</div><!-- col-sm-12 끝 -->
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>