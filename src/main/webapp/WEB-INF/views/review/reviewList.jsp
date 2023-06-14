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
				<form action="" onsubmit="return searchCheck()"><!-- myscript.js함수 작성함 -->
					
					<select name="col">
						<option value="subject_content">지역전체</option>
						<option value="subject">지역</option>
						<option value="content">지역</option>
						<option value="wname">지역</option>
					</select>
					&nbsp;&nbsp;
					
					<select name="col">
						<option value="subject_content">제목+내용</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="wname">작성자</option>
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
  <th>1</th>
  <th>서울</th>
  <th>안녕</th>
  <th>우와</th>
  <th>202302054</th>
  <th>0</th>
  </tr>
   <tr>
  <th>1</th>
  <th>서울</th>
  <th>안녕</th>
  <th>우와</th>
  <th>202302054</th>
  <th>0</th>
  </tr>
   <tr>
  <th>1</th>
  <th>서울</th>
  <th>안녕</th>
  <th>우와</th>
  <th>202302054</th>
  <th>0</th>
  </tr>
   <tr>
  <th>1</th>
  <th>서울</th>
  <th>안녕</th>
  <th>우와</th>
  <th>202302054</th>
  <th>0</th>
  </tr>
   <tr>
  <th>1</th>
  <th>서울</th>
  <th>안녕</th>
  <th>우와</th>
  <th>202302054</th>
  <th>0</th>
  </tr>
   <tr>
  <th>1</th>
  <th>서울</th>
  <th>안녕</th>
  <th>우와</th>
  <th>202302054</th>
  <th>0</th>
  </tr>
   <tr>
  <th>1</th>
  <th>서울</th>
  <th>안녕</th>
  <th>우와</th>
  <th>202302054</th>
  <th>0</th>
  </tr>
  </table>
    </div>
<%@ include file="../footer.jsp" %>