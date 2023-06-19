<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->

<div class="container" style="padding-top: 30px">
	<br>
	<h3><strong>항공/기차정보 등록</strong></h3>
	<br>
	<p>
		<button type="button" class="btn btn-danger" onclick="location.href='transinfoList'">취소</button>
	</p>
	<br>
	<form name="transinfoFrm" id="transinfoFrm" method="post" action="transinfoInsert" enctype="multipart/form-data">
		<table class="table">
		  <tr>
			<td>항공/기차선택</td>
			<td>
				<select name="FT_code" id="FT_code">
					<option value="F">비행기</option>
					<option value="T">기차</option>
				</select>
			</td>
		  </tr>
		  <tr>
			<td>항공/기차편명</td>
			<td><input type="text" name="trans_code"></td>
		  </tr>
		  <tr>
			<td>항공사/기차이름</td>
			<td><input type="text" name="trans_name"></td>
		  </tr>
		  <tr>
			<td>항공사/기차로고</td>
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

<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>