<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
<div class="col-sm-12">
<h3>관광지소개수정</h3>
<form name="attraction" id="attraction" method="post" action="attractionUpdate" enctype="multipart/form-data" >
 <table class="table table-hover">
<tr>
	<td>지역</td>
	<td>
		<select name="area_code" class="form-control">
			<option value="G0001" >제주</option>
			<option value="G0002" >서울</option>
			<option value="G0003" >인천</option>
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
</tr>
<tr>
	<td>관광지명</td>
	<td><input type="text" name="tour_name" class="form-control"  value="${attraction.tour_name}"></td>
</tr>
<tr>
	<td>키워드</td>
	<td>
		<select name="keyword" class="form-control">
			<option value="1">역사</option>
			<option value="2">액티비티</option>
			<option value="3">트래킹</option>
			<option value="4">관광</option>
			<option value="5">휴식</option>
			<option value="6">바다</option>
			<option value="7">자연</option>
		</select>
	</td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea name="content" rows="10" cols="20" class="form-control">${attraction.content}</textarea></td>	
</tr>
<tr>
	<td>관광지사진</td>
	<td><input type="file" name="img"></td>
</tr>
<tr>
	<td colsapn="2" align="center">
		<input type="button" value="취소" onclick="location.href='/attraction/attractionList'">
		<input type="submit" value="수정" >
	</td>
</tr>


</table>
</form>
<!-- action취해짐-> attractionUpdate라는 명령어 들어오면 update함수 호출 -->

</div><!-- col-sm-12 끝 -->
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>