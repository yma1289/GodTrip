<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="container mt-5">

<h3 class="display-6 text-center mb-5" style="color: #19b3eb; font-weight: bold;">나의 여행기</h3> 

<div class="w3-row-padding w3-margin-top">
<div class="w3-third">
<div class="w3-card">
<a href='/review/reviewdetail?reviewno=5'><img src="/summernote_image/d4ba6169-1aaf-406a-a785-3ec84fd3e8da.png" style="width:100%"></a>
<hr>
<div class="w3-container">
<h5><strong>강릉 아르떼 뮤지엄 1박 2일</strong></h5>
</div>
</div>
</div>

<div class="w3-third">
<div class="w3-card">
<a href='/review/reviewdetail?reviewno=6'><img src="/summernote_image/841cb39a-caf4-43e8-944d-81c0d9fd39fe.png" style="width:100%"></a>
<hr>
<div class="w3-container">
<h5><strong>경주 여행기</strong></h5>
</div>
</div>
</div>

<div class="w3-third">
<div class="w3-card">
<a href='/review/reviewdetail?reviewno=7'><img src="/summernote_image/a6aca6d9-c968-4e64-9aad-e35e207c0b27.png" style="width:100%"></a>
<hr>
<div class="w3-container">
<h5><strong>홍천&춘천 여행을 위한 애견 동반 리조트</strong></h5>
</div>
</div>
</div>
</div>
<br>
<br>
	
	<div align="center">
	<tr>
			<td colspan="4" style="text-align:center height:50px;">
				<form method="post" action="reviewList"><!-- myscript.js함수 작성함 -->
					
					<select name="area_name">
						<option value="all">지역전체</option>
						<option value="제주">제주</option>
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="수원">수원</option>
						<option value="가평">가평</option>
						<option value="강릉">강릉</option>
						<option value="춘천">춘천</option>
						<option value="제천">제천</option>
						<option value="대전">대전</option>						
						<option value="군산">군산</option>
						<option value="영월">영월</option>
						<option value="부산">부산</option>
						<option value="경주">경주</option>
						<option value="포항">포항</option>
						<option value="통영거제">통영거제</option>
						<option value="목포">목포</option>
						<option value="여수">여수</option>
						<option value="전주">전주</option>
					</select>
					&nbsp;&nbsp;
					
					<select name="col">
						<option value="title_content">제목+내용</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="id">작성자</option>
					</select>
					&nbsp;&nbsp;
					
					<input type="text" name="word" id="word" placeholder="검색어를 입력해주세요" style="width:300px;height:40px;font-size:15px;">
					<button type="submit" class="btn btn-primary btn-lg">검색</button>
				</form>
			</td>
		</tr>	
		</div>
		<br>
			<br>
			<p>
		<c:if test="${not empty s_id}">
            <button type="button" class="btn btn-outline-info"  onclick="location.href='reviewForm'">나의여행기 작성하기</button>
        </c:if>
        <c:if test="${empty s_id}">
            <button type="button" class="btn btn-outline-info" onclick="alert('로그인 후 이용해주세요.'); location.href='/member/memberlogin'">나의여행기 작성하기</button>
        </c:if>
    </p>		
<table border="1" class="table table-hover">
<thead>
  <tr>
  	<th class="warning">번호</th>
  	<th class="warning">지역</th>
    <th class="warning">제목</th>
    <th class="warning">작성자</th>
    <th class="warning">등록일</th>
    <th class="warning">조회수</th>
  </tr>
  </thead>  
   <tr>
  <c:forEach var="review" items="${list}"> 
  <th>${review.reviewno}</th>
  <th>${review.area_name}</th>
  <th><a href="reviewdetail?reviewno=${review.reviewno}">${review.title}</a></th>
  <th>${review.id}</th>
  <th>${review.regdate}</th>
  <th>${review.viewcount}</th>
  </tr>
  <c:if test="${vs.count mod 5==0}">
  </tr> <tr>
  </c:if>    		  	
	</c:forEach>
</table>
    			   <c:if test="${requestScope.count>0 }">
				   <c:set var="pageCount" value="${requestScope.totalPage}"/>
				   <c:set var="startPage" value="${requestScope.startPage}"/>
				   <c:set var="endPage"   value="${requestScope.endPage}"/>
				
				   <div class="content">
					   <c:if test="${endPage>pageCount}">
						  <c:set var="endPage" value="${pageCount+1}"/>
					   </c:if>
					
					  <c:if test="${startPage>0}">
					   	  <a href="reviewList?pageNum=${startPage}">[이전]</a>	
					  </c:if>
					   <c:forEach var="i" begin="${startPage+1}" end="${endPage-1}">
					   	  <c:choose>
					   	      <c:when test="${pageNum==i}"><span style="font-weight: bold">${i}</span></c:when>
					   	      <c:when test="${pageNum!=i}"><a href="reviewList?pageNum=${i}">[${i}]</a></c:when>
					   	  </c:choose>	      
					   </c:forEach>
						<c:if test="${endPage<pageCount}">
					   	   <a href="reviewList?pageNum=${startPage+6}">[다음]</a>
					   	</c:if>
					</div> 
				</c:if>	
    </div>
<%@ include file="../footer.jsp" %>