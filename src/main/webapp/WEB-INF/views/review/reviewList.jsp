<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

 <div class="container">
 
<h1>나의여행기</h1>


<div class="w3-row-padding w3-margin-top">
<div class="w3-third">
<div class="w3-card">
<img src="../images/k7.png" style="width:100%">
<hr>
<div class="w3-container">
<h5>제목</h5>
</div>
</div>
</div>

<div class="w3-third">
<div class="w3-card">
<img src="../images/k7.png" style="width:100%">
<hr>
<div class="w3-container">
<h5>제목</h5>
</div>
</div>
</div>

<div class="w3-third">
<div class="w3-card">
<img src="../images/k7.png" style="width:100%">
<hr>
<div class="w3-container">
<h5>제목</h5>
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
					
					<select name="area_code">
						<option value="all">지역전체</option>
						<option value="G0007">서울</option>
						<option value="G0001">제주</option>
					</select>
					&nbsp;&nbsp;
					
					<select name="col">
						<option value="title_content">제목+내용</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="id">작성자</option>
					</select>
					
					<input type="text" name="word" id="word" placeholder="검색어를 입력해주세요" style="width:300px;height:40px;font-size:15px;">
					<button type="submit" class="btn btn-primary btn-lg">검색</button>
				</form>
			</td>
		</tr>	
		</div>
		<br>
			<br>
			<div class="d-flex justify-content-evenly"><p><a href="reviewForm">[나의여행기 작성하기]</a></p></div>
			
		
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
  <th>${review.list}</th>
  <th>서울</th>
  <th>안녕</th>
  <th>우와</th>
  <th>202302054</th>
  <th>0</th>
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