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
<div class="container" style="padding-top: 30px">
	<br>
	<h3><strong>항공 상품등록</strong></h3>
	<br>
	<p>
		<button type="button" class="btn btn-info" onclick="location.href='/partner/F_infoList'">취소</button>		
	</p>
	<br>
	<form name="F_proFrm" id="F_proFrm" method="post" action="/partner/F_proInsert">
	<input type="hidden" name="FT_code" id="FT_code" value="${FT_code}">
	<input type="hidden" name="p_id" id="p_id" value="${p_id}">
		<table class="table">
		  <tr>
			<th>교통편</th>
			<td><input type="text" name="trans_code" value="${trans_code}"></td>
		  </tr>
		  <tr>
			<th>출발일<br>(0000-00-00 형식으로 입력)</th>
			<td><input type="text" name="departure_Date"></td>
		  </tr>
		  <tr>
			<th>출발지</th>
			<td>
				<select name="departure_code" id="departure_code">
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
		  </tr>
		  <tr>
			<th>도착지</th>
			<td>
				<select name="arrival_code" id="arrival_code">
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
		  </tr>
		  <tr>
			<th>출발시간<br>(00:00 형식으로 입력)</th>
			<td><input type="text" name="departure_Time"></td>
		  </tr>
		  <tr>
			<th>도착시간<br>(00:00 형식으로 입력)</th>
			<td><input type="text" name="arrival_Time"></td>
		  </tr>
		  <tr>
			<th>가격</th>
			<td><input type="text" name="Price"></td>
		  </tr>
		  <tr>
			<th>잔여좌석<br>(최대 10까지 가능)</th>
			<td><input type="text" name="seat"></td>
		  </tr>
		  <tr>
			<td colspan="2" align="center">
				<input type="submit" value="등록">
			</td>		  
		  </tr>		  		
		</table>
	</form>	
</div>
</div>

<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>