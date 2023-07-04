<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../pheader.jsp" %>
<!-- 본문시작 -->
<style>
.wrap {
  width: 100%;
  height: 100%;
  display: flex;
  background: rgba(0, 0, 0, 0);
}
</style>

<div class="wrap">
<div class="col-sm-12">
	<div class="container" style="padding-top: 30px">
	<br>
	<h3><strong>항공정보 목록</strong></h3>
	<br>
	<p>		
		<button type="button" class="btn btn-success" onclick="location.href='/partner/F_infoForm'">항공정보 등록</button>
	</p>	
	</div>

	<div class="container" style="align:center; padding-top: 30px">
	<table class="table">
	<thead>
	<tr>		
		<th class="text-center">구분</th> 
		<th class="text-center">편명</th>		
		<th class="text-center">이름</th>
		<th class="text-center">로고</th>
		<th class="text-center">상품등록</th>
		<th class="text-center">삭제</th>
	</tr>
	</thead>
	
	<tbody>	
	  <c:forEach var="F_info" items="${F_infoList}">
	    <c:if test="${F_info.FT_code == 'F'}">
		  <tr class="text-center">
			<td>
				<c:choose>
					<c:when test="${F_info.FT_code == 'F'}">비행기</c:when>
					<c:when test="${F_info.FT_code == 'T'}">기차</c:when>
					<c:otherwise>${F_info.FT_code}</c:otherwise>
				</c:choose>
			</td>
			<td>${F_info.trans_code}</td>
			<td>${F_info.trans_name}</td>			
			<td>
				<c:choose>
					<c:when test="${F_info.filename != '-'}">
						<img src="/storage/${F_info.filename}" width="100px">						
					</c:when>
					<c:otherwise>
						등록된 사진 없음! <br>
					</c:otherwise>
				</c:choose>
			</td>
			<td>				
				<input type="button" class="btn btn-success" value="상품등록" onclick="location.href='/partner/F_proForm?trans_code=${F_info.trans_code}&FT_code=${F_info.FT_code}&p_id=${p_id}'">
			</td>
			<td>				
				<input type="button" class="btn btn-danger" value="삭제" onclick="confirmDelete('${F_info.trans_code}')">
			</td>
		  </tr>
	    </c:if>		
	  </c:forEach>					
	</tbody>
	</table>			
	</div>
</div>
</div>

<script>
	function confirmDelete(trans_code){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href='/partner/F_infoDelete?trans_code='+trans_code;
		}//if end
	}//confirmDelete() end
</script>

<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>