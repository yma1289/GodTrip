<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
 <div class="container">

 <form name="reviewfrm" id="reviewfrm" method="post" action="reviewinsert" enctype="multipart/form-data">

 <br>
<br>
 <tr>
   <th class="success">제목</th>
   <td><input type="text" name="title" id="title" class="form-control" maxlength="100" required></td>
</tr>
<br>
  <textarea id="summernote" name="content"></textarea>
  <br>
  <br>
  <div align="right">
  <tr>
<td colspan="2">
	<input type="submit" value="등록" class="btn btn-primary" />
	<input type="reset" value="취소" class="btn btn-primary"/>
</td>
</tr>
</div>
 </form>
</div>

<script type="text/javascript">
$('#summernote').summernote({
	height: 300,                 // 에디터 높이
	minHeight: null,             // 최소 높이
	maxHeight: null,             // 최대 높이
	focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	lang: "ko-KR",					// 한글 설정
	placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
	callbacks: {	//여기 부분이 이미지를 첨부하는 부분
		onImageUpload : function(files) {
			uploadSummernoteImageFile(files[0],this);
		},
	}
});


function uploadSummernoteImageFile(file, editor) {
	  var data = new FormData();
	  data.append("file", file);
	  
	  $.ajax({
	    url: "/uploadImage", // 파일 업로드를 처리하는 서버의 URL
	    type: "POST",
	    data: data,
	    processData: false,
	    contentType: false,
	    success: function(response) {
	      // 파일 업로드 성공 시 이미지 URL을 에디터에 삽입
	      var imageUrl = response.imageUrl;
	      $(editor).summernote("insertImage", imageUrl);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	      console.error("Error uploading image: " + textStatus);
	    }
	  });
	}

</script>
<%@ include file="../footer.jsp" %>