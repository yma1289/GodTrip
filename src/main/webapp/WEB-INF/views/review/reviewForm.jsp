<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript">

function reviewCheck(){
let title=document.getElementById("title").value; 
if(title.length<2){
    alert("제목 2글자 이상 입력해 주세요");
    document.getElementById("title").focus();
    return false;
 }
 return true;
}
</script>

<style>
.wrap {
  width: 100%;
  height: 80vh;
  display: flex;
  background: rgba(0, 0, 0, 0);
}
</style>

<div class="wrap">
<div class="container mt-5">
 <div class="container">

 <form name="reviewfrm" id="reviewfrm" method="post" action="reviewcreate" onsubmit="return reviewCheck()">	
  <table class="table custom-table">
	<tr>
	   <th>제목</th>
	   <td><input type="text" name="title" id="title" class="form-control" maxlength="100" required></td>
	</tr>
	<tr>
		<th>지역 선택</th>
		<td style="text-align: left;">	
			<select name="area_name">
			<option value="제주">제주</option>
			<option value="서울">서울</option>
			<option value="인천">인천</option>
			<option value="수원">수원</option>
			<option value="가평">가평</option>
			<option value="강릉">강릉</option>
			<option value="춘천">춘천</option>
			<option value="제천">제천</option>
			<option value="대전">대전</option>			
			<option value="군산">군산</option>
			<option value="영월">영월</option>
			<option value="부산">부산</option>
			<option value="경주">경주</option>
			<option value="포항">포항</option>
			<option value="통영거제">통영거제</option>
			<option value="목포">목포</option>
			<option value="여수">여수</option>
			<option value="전주">전주</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
	  		<textarea id="summernote" name="content" required></textarea>
	  	</td>
	</tr>
    <tr>
		<td colspan="2">
			<input type="submit" value="등록" class="btn btn-primary" />
			<input type="reset" value="취소" class="btn btn-primary" onclick="history.back();"/>
		</td>
	</tr>
  </table>
 </form>
</div>
</div>
</div>

<script type="text/javascript">




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
		url : "uploadSummernoteImageFile",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		//컨트롤러에서 파일저장후 에디터에 저장된 파일을 찾아서 사용자 커서에 이미지 삽입
		success : function(data) {
			$(el).summernote('editor.insertImage', data.url);
		}
	});
}


</script>
<%@ include file="../footer.jsp" %>