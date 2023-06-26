<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../pheader.jsp" %>
<!-- 본문시작 -->

<div class="col-sm-12">
	<div class="container" style="padding-top: 30px">
	<br>
	<h3><strong>항공/기차정보 목록</strong></h3>
	<br>
	<p>
		<button type="button" class="btn btn-primary" onclick="location.href='transproList'">항공/기차상품 목록</button>
		<button type="button" class="btn btn-success" onclick="location.href='transinfoForm'">항공/기차정보 등록</button>
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
	<c:forEach var="transinfo" items="${transinfoList}">
		<tr class="text-center">
			<td>
				<c:choose>
					<c:when test="${transinfo.FT_code == 'F'}">비행기</c:when>
					<c:when test="${transinfo.FT_code == 'T'}">기차</c:when>
					<c:otherwise>${transinfo.FT_code}</c:otherwise>
				</c:choose>
			</td>
			<td>${transinfo.trans_code}</td>
			<td>${transinfo.trans_name}</td>			
			<td>
				<c:choose>
					<c:when test="${transinfo.filename != '-'}">
						<img src="/storage/${transinfo.filename}" width="100px">						
					</c:when>
					<c:otherwise>
						등록된 사진 없음! <br>
					</c:otherwise>
				</c:choose>
			</td>
			<td>				
				<input type="button" class="btn btn-success" value="상품등록" onclick="location.href='/product/transproForm?trans_code=${transinfo.trans_code}&FT_code=${transinfo.FT_code}&p_id=${p_id}'">
			</td>
			<td>				
				<input type="button" class="btn btn-danger" value="삭제" onclick="confirmDelete('${transinfo.trans_code}')">
			</td>
		  </tr>
		</c:forEach>			
	</tbody>
	</table>			
	</div>
</div>

<script>
	function confirmDelete(trans_code){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href='transinfoDelete?trans_code='+trans_code;
		}//if end
	}//confirmDelete() end
</script>

<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>