<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
<div class="col-sm-12">
<div class="container mt-5">
	<div class="container">

<h3 class="display-6 text-center mb-5" style="color: #19b3eb; font-weight: bold;">관광지소개 작성</h3>



<form name="attraction" id="attraction" method="post" action="attractioninsert">
 <table class="table">
<tr>
	<td>지역</td>
	<td>
		<select name="area_code" id="area_code"  class="form-control">
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
</tr>
<tr>
	<td>관광지명</td>
	<td><input type="text" name="tour_name" id="tour_name" class="form-control"></td>
</tr>
<tr>
	<td>키워드</td>
	<td>
		<select name="keyword" id="keyword" class="form-control">
			<option value="1">역사</option>
			<option value="2">액티비티</option>
			<option value="3">트래킹</option>
			<option value="4">관광</option>
			<option value="5">휴식</option>
			<option value="6">바다</option>
			<option value="7">자연</option>
		</select>
</tr>
<tr>
<td colspan="2">
 <textarea id="summernote" name="content" required></textarea>
</td>
</tr>
<tr>
	<td colspan="2" style="text-align: center;">
		<input type="submit" value="등록" onclick="return validate()">
		<input type="button" value="취소" onclick="location.href='/attraction/attractionList'">		
	</td>
</tr>


</table>
</form>
</div>
</div>

<script>

$('#summernote').summernote({	
	height: 300,                 // 에디터 높이
	minHeight: null,             // 최소 높이
	maxHeight: null,             // 최대 높이
	focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	lang: "ko-KR",					// 한글 설정
	placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
	 callbacks : { 
     	onImageUpload : function(files, editor, welEditable) {
     // 파일 업로드(다중업로드를 위해 반복문 사용)
     		for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],this);
            		}
     	}
     }
  });



/**
* 이미지 파일 업로드
*/
function uploadSummernoteImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "/uploadSummernoteImageFile2",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		//컨트롤러에서 파일저장후 에디터에 저장된 파일을 찾아서 사용자 커서에 이미지 삽입
		success : function(data) {
			$(el).summernote('editor.insertImage', data.url);
		}
	});
}

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
  


<!-- action취해짐->"attractioninsert"라는 명령어 들어오면 "attractioninsert"함수 호출 -->
</div><!-- col-sm-12 끝 -->
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>
