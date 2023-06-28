<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!-- 본문시작 -->
<style>
.wrap {
  width: 100%;
  height: 80vh;
  display: flex;
  background: rgba(0, 0, 0, 0);
}
</style>


<link rel="stylesheet" href="/css/style.css">

<div class="wrap">
<div class="container mt-5">
	<div class="container">
		
	<h3 class="display-6 text-center mb-5" style="color: #19b3eb; font-weight: bold;">관광지소개</h3>
	  
	<br>
	<!-- 검색창 : 검색부분 action이 serch로 따로 빼주는게 아니라, 검색된 결과에 따라 페이징도 달라지기 때문에 action이 acttractionList 하나로 묶여야 한다. -->	
	<!-- 실수한부분)value="${tour_name}"-> name속성이 서버로 전송될 검색어의 데이터의 이름과 일치해야된다.-->
	<div class="input-group">
		<form method="post" action="attractionList" class="input-group">
        	<input type="text" name="tour_name" value="${tour_name}"  class="form-control" placeholder="Search">
        	<span class="input-group-btn">
        	<input type="submit" class="btn btn-default" value="검색"> 
            <span class="glyphicon glyphicon-search"></span> 
        	</span>
        </form>
     </div>
     <br>
	<!-- 검색창끝-->		

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
		
		 <c:forEach var="attraction" items="${list}" > 
			<tr>
				<td>
					<!-- <a href="<c:url value='/attraction/attractionDetail/${dto.tour_code}' />">${dto.tour_name}</a> 이렇게 작성하면 controller에서 @PathVariable 로 사용할 수 있지만 통일성을 위해 아래코드로 사용한다. -->
					<!-- <a href="<c:url value='/attraction/attractionDetail?tour_code=${attraction.tour_code}' />">${attraction.tour_name}</a>-->
					<a href="/attraction/attractionDetail?tour_code=${attraction.tour_code}">${attraction.tour_name}</a>				
				
				</td>
				<td>
					<c:choose>
						<c:when test="${attraction.area_code=='G0001'}">
							제주
						</c:when>
						<c:when test="${attraction.area_code=='G0002'}">
							서울
						</c:when>
						<c:when test="${attraction.area_code=='G0003'}">
							인천
						</c:when>
						<c:when test="${attraction.area_code=='G0004'}">
							수원
						</c:when>
						<c:when test="${attraction.area_code=='G0005'}">
							가평
						</c:when>
						<c:when test="${attraction.area_code=='G0006'}">
							강릉
						</c:when>
						<c:when test="${attraction.area_code=='G0007'}">
							춘천
						</c:when>
						<c:when test="${attraction.area_code=='G0008'}">
							제천
						</c:when>
						<c:when test="${attraction.area_code=='G0009'}">
							대전
						</c:when>						
						<c:when test="${attraction.area_code=='G0010'}">
							군산
						</c:when>
						<c:when test="${attraction.area_code=='G0011'}">
							영월
						</c:when>
						<c:when test="${attraction.area_code=='G0012'}">
							부산
						</c:when>
						<c:when test="${attraction.area_code=='G0013'}">
							경주
						</c:when>
						<c:when test="${attraction.area_code=='G0014'}">
							포항
						</c:when>
						<c:when test="${attraction.area_code=='G0015'}">
							통영거제
						</c:when>
						<c:when test="${attraction.area_code=='G0016'}">
							목포
						</c:when>
						<c:when test="${attraction.area_code=='G0017'}">
							여수
						</c:when>
						<c:when test="${attraction.area_code=='G0018'}">
							전주
						</c:when>
						<c:otherwise>
							${attraction.area_code}
						</c:otherwise>						
					</c:choose>
				</td>
				<td>${attraction.regdate}</td>
				<td>${attraction.view_count}</td>
				
				<td>
					<c:choose>
						<c:when test="${attraction.keyword==1}">
							역사
						</c:when>
						<c:when test="${attraction.keyword==2}">
							액티비티
						</c:when>
						<c:when test="${attraction.keyword==3}">
							트래킹
						</c:when>
						<c:when test="${attraction.keyword==4}">
							관광
						</c:when>
						<c:when test="${attraction.keyword==5}">
							휴식
						</c:when>
						<c:when test="${attraction.keyword==6}">
							바다
						</c:when>
						<c:when test="${attraction.keyword==7}">
							자연
						</c:when>
					
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		</table>
	</div><!-- container -->
<!--  
<div class="container">
	<p>
		<button type="button" class="btn btn-outline-info" onclick="location.href='attractionForm'">등록</button>
	</p>
</div>
-->

<!--  
<div class="container">
	<p>
		<c:if test="${partner.p_id}">
			<button type="button" class="btn btn-outline-info" onclick="location.href='attractionForm'">등록</button>
		</c:if>
		<c:if test="${not partner.p_id}">
			<button type="button" class="btn btn-outline-info" onclick="alert('판매자만 등록할 수 있습니다.'); location.href='/partner/partnerlogin'">등록</button>
		</c:if>
	</p>
</div>
-->
<!-- 판매자한테만 등록버튼 보임 
<div class="container">
    <p>
        <c:if test="${not empty p_id}">
            <button type="button" class="btn btn-outline-info" onclick="location.href='attractionForm'">등록</button>
        </c:if>
        <c:if test="${empty p_id}">
            <button type="button" class="btn btn-outline-info" onclick="alert('판매자만 등록할 수 있습니다.'); location.href='/partner/partnerlogin'">등록</button>
        </c:if>
    </p>
-->

<!-- mlevel이 A1인사람만 등록버튼보임 -->
<div class="container">
    <p>
        <c:if test="${not empty s_id and s_mlevel == 'A1'}">
            <button type="button" class="btn btn-outline-info" onclick="location.href='attractionForm'">등록</button>
        </c:if>
        <c:if test="${empty s_id or s_mlevel != 'A1'}">
            <button type="button" class="btn btn-outline-info" style="display: none">등록</button>
        </c:if>
    </p>
</div>







	
	
	 <!-- 패이징 리스트 -->
			   <c:if test="${requestScope.count>0 }">
				   <c:set var="pageCount" value="${requestScope.totalPage}"/>
				   <c:set var="startPage" value="${requestScope.startPage}"/>
				   <c:set var="endPage"   value="${requestScope.endPage}"/>
				
				   <div class="content">
					   <c:if test="${endPage>pageCount}">
						  <c:set var="endPage" value="${pageCount+1}"/>
					   </c:if>
					
					  <c:if test="${startPage>0}">
					   	  <a href="hotelList?pageNum=${startPage}">[이전]</a>	
					  </c:if>
					   <c:forEach var="i" begin="${startPage+1}" end="${endPage-1}">
					   	  <c:choose>
					   	      <c:when test="${pageNum==i}"><span style="font-weight: bold">${i}</span></c:when>
					   	      <c:when test="${pageNum!=i}"><a href="attractionList?pageNum=${i}">[${i}]</a></c:when>
					   	  </c:choose>	      
					   </c:forEach>
						<c:if test="${endPage<pageCount}">
					   	   <a href="attractionList?pageNum=${startPage+6}">[다음]</a>
					   	</c:if>
					</div> 
				</c:if>	
		
	
	
	
	
	
	
	
	
</div><!-- col-sm-12 끝 -->
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>