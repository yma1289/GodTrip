<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
<div class="col-sm-12">
	<h3>관광지소개수정</h3>
	
	
	
	
	<form name="attraction" id="attraction" method="post" action="attractionUpdate" enctype="multipart/form-data" >
	<!-- 수정폼에서 수정완료후 수정버튼누르면 수정되지 않고, 바로 목록페이지로 이동했던이유=> hidden속성으로 pk를 넘겨주지 않았기 때문, 항상 hidden으로 그 페이지에대한 값 넘겨줘야한다.  -->
	<input type="hidden" name="tour_code" value="${attraction.tour_code}">
	<table class="table table-hover">
	<tr>
		<td>지역</td>
		<td>
			<select name="area_code"  id="area_code"class="form-control">
			            <option value="G0001" ${attraction.area_code == 'G0001' ? 'selected' : ''}>제주</option>
	                    <option value="G0002" ${attraction.area_code == 'G0002' ? 'selected' : ''}>서울</option>
	                    <option value="G0003" ${attraction.area_code == 'G0003' ? 'selected' : ''}>인천</option>
	                    <option value="G0004" ${attraction.area_code == 'G0004' ? 'selected' : ''}>수원</option>
	                    <option value="G0005" ${attraction.area_code == 'G0005' ? 'selected' : ''}>가평</option>
	                    <option value="G0006" ${attraction.area_code == 'G0006' ? 'selected' : ''}>강릉</option>
	                    <option value="G0007" ${attraction.area_code == 'G0007' ? 'selected' : ''}>춘천</option>
	                    <option value="G0008" ${attraction.area_code == 'G0008' ? 'selected' : ''}>제천</option>
	                    <option value="G0009" ${attraction.area_code == 'G0009' ? 'selected' : ''}>대전</option>	                    
	                    <option value="G0010" ${attraction.area_code == 'G0010' ? 'selected' : ''}>군산</option>
	                    <option value="G0011" ${attraction.area_code == 'G0011' ? 'selected' : ''}>영월</option>
	                    <option value="G0012" ${attraction.area_code == 'G0012' ? 'selected' : ''}>부산</option>
	                    <option value="G0013" ${attraction.area_code == 'G0013' ? 'selected' : ''}>경주</option>
	                    <option value="G0014" ${attraction.area_code == 'G0014' ? 'selected' : ''}>포항</option>
	                    <option value="G0015" ${attraction.area_code == 'G0015' ? 'selected' : ''}>통영거제</option>
	                    <option value="G0016" ${attraction.area_code == 'G0016' ? 'selected' : ''}>목포</option>
	                    <option value="G0017" ${attraction.area_code == 'G0017' ? 'selected' : ''}>여수</option>
	                    <option value="G0018" ${attraction.area_code == 'G0018' ? 'selected' : ''}>전주</option>
			</select>
	</tr>
	<tr>
		<td>관광지명</td>
		<td><input type="text" name="tour_name"  id="tour_name" class="form-control"  value="${attraction.tour_name}"></td>
	</tr>
	<tr>
	    <td>키워드</td>
	    <td>
	        <select name="keyword" id="keyword"  class="form-control">
	            <c:choose>
	                <c:when test="${attraction.keyword == '1'}">
	                    <option value="1" selected>역사</option>
	                </c:when>
	                <c:otherwise>
	                    <option value="1">역사</option>
	                </c:otherwise>
	            </c:choose>
	            <c:choose>
	                <c:when test="${attraction.keyword == '2'}">
	                    <option value="2" selected>액티비티</option>
	                </c:when>
	                <c:otherwise>
	                    <option value="2">액티비티</option>
	                </c:otherwise>
	            </c:choose>
	            <c:choose>
	                <c:when test="${attraction.keyword == '3'}">
	                    <option value="3" selected>트래킹</option>
	                </c:when>
	                <c:otherwise>
	                    <option value="3">트래킹</option>
	                </c:otherwise>
	            </c:choose>
	            <c:choose>
	                <c:when test="${attraction.keyword == '4'}">
	                    <option value="4" selected>관광</option>
	                </c:when>
	                <c:otherwise>
	                    <option value="4">관광</option>
	                </c:otherwise>
	            </c:choose>
	            <c:choose>
	                <c:when test="${attraction.keyword == '5'}">
	                    <option value="5" selected>휴식</option>
	                </c:when>
	                <c:otherwise>
	                    <option value="5">휴식</option>
	                </c:otherwise>
	            </c:choose>
	            <c:choose>
	                <c:when test="${attraction.keyword == '6'}">
	                    <option value="6" selected>바다</option>
	                </c:when>
	                <c:otherwise>
	                    <option value="6">바다</option>
	                </c:otherwise>
	            </c:choose>
	            <c:choose>
	                <c:when test="${attraction.keyword == '7'}">
	                    <option value="7" selected>자연</option>
	                </c:when>
	                <c:otherwise>
	                    <option value="7">자연</option>
	                </c:otherwise>
	            </c:choose>
	        </select>
	    </td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content"  id="content" rows="10" cols="20" class="form-control">${attraction.content}</textarea></td>	
	</tr>
	<tr>
		<td>관광지사진</td>
		<td>
	        <c:if test="${attraction.filename != '-'}">
	              <img src="/storage/${attraction.filename}" width="100px"><br>
	        </c:if>
			<input type="file" name="img" id="img" >
		</td>
	</tr>
	<tr>
		<td colsapn="2" align="center">
			<input type="button" value="취소" onclick="location.href='/attraction/attractionList'">
			<input type="submit" value="수정" onclick="return validate()" >
		</td>
	</tr>
	
	
	</table>
	</form>
	<!-- action취해짐-> attractionUpdate라는 명령어 들어오면 update함수 호출 -->

	
	<script>
function validate() {
	var tour_name = document.getElementById("tour_name").value;
	if (tour_name === "") {
		alert("관광지명을 입력해주세요.");
		return false;
	}
	
	var content = document.getElementById("content").value;
	if (content === "") {
		alert("내용을 입력해주세요.");
		return false;
	}
	
	// 유효성 검사 통과
	return true;
}
</script>
	

</div><!-- col-sm-12 끝 -->
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>