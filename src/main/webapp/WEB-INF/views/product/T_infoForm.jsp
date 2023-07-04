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
	<h3><strong>기차정보 등록</strong></h3>
	<br>
	<p>
		<button type="button" class="btn btn-danger" onclick="location.href='/partner/T_infoList'">취소</button>
	</p>
	<br>
	<form name="T_infoFrm" id="T_infoFrm" method="post" action="/partner/T_infoInsert" enctype="multipart/form-data">
		<table class="table">
		  <tr>
			<td>구분</td>
			<td>
				<select name="FT_code" id="FT_code">
					<option value="T">기차</option>
				</select>
			</td>
		  </tr>
		  <tr>
			<td>기차 편명</td>
			<td><input type="text" name="trans_code"></td>
		  </tr>
		  <tr>
			<td>기차 이름</td>
			<td><input type="text" name="trans_name"></td>
		  </tr>
		  <tr>
			<td>기차 로고</td>
			<td><input type="file" name="img"></td>
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