<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->

<style>
.wrap {
  width: 100%;
  height: 100%;
  display: flex;
  background: rgba(0, 0, 0, 0);
}




.container label {
  text-align: left;
  width: 100%;
}

#commentInsertBtn {
  float: right;
}


</style>


<div class="col-sm-12">
<div class="wrap">
<div class="container mt-5">

<div class="container" style="padding-top: 50px;">
<table class="table table-condensed">
<tr>
<th>지역</th>
    <td>
		<c:choose>
			<c:when test="${attraction.area_code=='G0001'}">
				제주
			</c:when>
			<c:when test="${attraction.area_code=='G0002'}">
				서울
			</c:when>
			<c:when test="${attraction.area_code=='G0003'}">
				인천
			</c:when>
			<c:when test="${attraction.area_code=='G0004'}">
				수원
			</c:when>
			<c:when test="${attraction.area_code=='G0005'}">
				가평
			</c:when>
			<c:when test="${attraction.area_code=='G0006'}">
				강릉
			</c:when>
			<c:when test="${attraction.area_code=='G0007'}">
				춘천
			</c:when>
			<c:when test="${attraction.area_code=='G0008'}">
				제천
			</c:when>
			<c:when test="${attraction.area_code=='G0009'}">
				대전
			</c:when>			
			<c:when test="${attraction.area_code=='G0010'}">
				군산
			</c:when>
			<c:when test="${attraction.area_code=='G0011'}">
				영월
			</c:when>
			<c:when test="${attraction.area_code=='G0012'}">
				부산
			</c:when>
			<c:when test="${attraction.area_code=='G0013'}">
				경주
			</c:when>
			<c:when test="${attraction.area_code=='G0014'}">
				포항
			</c:when>
			<c:when test="${attraction.area_code=='G0015'}">
				통영거제
			</c:when>
			<c:when test="${attraction.area_code=='G0016'}">
				목포
			</c:when>
			<c:when test="${attraction.area_code=='G0017'}">
				여수
			</c:when>
			<c:when test="${attraction.area_code=='G0018'}">
				전주
			</c:when>
			<c:otherwise>
				${attraction.area_code}
			</c:otherwise>						
		</c:choose>
	</td>
	</tr>			
    <tr>
        <th>관광지명</th>
        <td>${attraction.tour_name}</td>
    </tr>
    <tr>
        <th>키워드</th>
			<td>
			<c:choose>
				<c:when test="${attraction.keyword==1}">
					역사
				</c:when>
				<c:when test="${attraction.keyword==2}">
					액티비티
				</c:when>
				<c:when test="${attraction.keyword==3}">
					트래킹
				</c:when>
				<c:when test="${attraction.keyword==4}">
					관광
				</c:when>
				<c:when test="${attraction.keyword==5}">
					휴식
				</c:when>
				<c:when test="${attraction.keyword==6}">
					바다
				</c:when>
				<c:when test="${attraction.keyword==7}">
					자연
				</c:when>
			
			</c:choose>
		</td>
	</tr>
    <tr>
        <th>내용</th>
        <td>${attraction.content}</td>
    </tr>
 
    </table>
    



<c:if test="${not empty s_id and s_mlevel == 'A1'}">
    <a href="/attraction/attractionDelete?tour_code=${attraction.tour_code}" role="button" class="btn btn-outline-info" onclick="return confirmDelete()">삭제</a>
</c:if>
</div>

<br><br>


<script>
function confirmDelete() {
    return confirm("영구히 삭제됩니다. 삭제하겠습니까?");
}
</script>
	




<br><br>
<!-- 댓글 -->

	<div class="container">
		 <label for="content">댓글 :</label>
		<form name="commentInsertForm" id="commentInsertForm" >
			<div>
				<input type="hidden" name="tour_code" id="tour_code" value="${attraction.tour_code}">
				<textarea rows="5" cols="100" name="content" id="content" placeholder="로그인 후 댓글입력이 가능합니다" class="form-control"></textarea> 
				<br>
				<button type="button"  name="commentInsertBtn" id="commentInsertBtn"  class="btn btn-info">등록</button>
			</div>
		</form>
	</div>
	
	

	<br><br>
	<div class="container">
		<!-- 댓글목록 -->
		<div class="commentList"></div>
	</div>
	
	
	<!-- 댓글 관련 자바스크립트 -->
	<script>
	
		let tour_code = '${attraction.tour_code}'; //부모글 번호
	

		
		//댓글 등록버튼 클릭했을때(수정완료)
			$("#commentInsertBtn").click(function(){
			//alert($);
			//<form id="commentInsertForm"></form>의 내용을 전부 가져옴
			
			 let content = $("#content").val().trim();
		    if (content === '') {
		      alert('내용을 입력하세요.');
		      return;
		    }
			
			let insertData=$("#commentInsertForm").serialize();
			//alert(insertData);//tour_code=2&content=내용
			commentInsert(insertData);//댓글등록 함수 호출
		});//click() end

		
		
		
	
	//댓글 등록 함수(로그인안됐을때 알림창띄우기테스트)
	  function commentInsert(insertData) {
	    let id = '${sessionScope.s_id}'; // 현재 로그인된 사용자의 ID

	    if (id === null || id === '') {
	      // 로그인이 되어있지 않은 경우 알림창 띄우기
	      alert('로그인이 필요한 서비스입니다.');
	      return; // 함수 종료
	    }

	    $.ajax({
	      url: '/comment/insert',
	      type: 'post',
	      data: insertData,
	      error: function (error) {
	        alert(error);
	      },
	      success: function (data) {
	        if (data == 1) {
	          commentList();
	          $("#content").val('');
	          alert('댓글이 등록되었습니다.');
	        }
	      }
	    });
	  }

	function commentList() {
	    $.ajax({
	        url:'/comment/list',
	        type:'get',
	        data:{'tour_code' : tour_code},
	        success:function(data){
	            let a = ''; // 출력할 결과값
	            let id = '${sessionScope.s_id}'; // 현재 로그인된 사용자의 ID

	            $.each(data, function(key, value){
	                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
	                a += '     <div class="commentInfo' + value.commentno + '">';
	                a += '          댓글번호:' + value.commentno + ' / 작성자:' + value.id + " " + value.regdate;

	                // 자기가 작성한 댓글에 대해서만 수정, 삭제 버튼 표시
	                if (value.id === id) {
	                    a += '          <a href="javascript:commentUpdate(' + value.commentno + ',\'' + value.content + '\')">[수정]</a>';
	                    a += '          <a href="javascript:commentDelete(' + value.commentno + ')">[삭제]</a>';
	                }

	                a += '     </div>';
	                a += '     <div class="commentContent' + value.commentno + '">';
	                a += '          <p>내용:' + value.content + "</p>";
	                a += '     </div>';
	                a += '</div>';
	            });

	            $(".commentList").html(a);
	        }
	    });
	}
		
		
/*
function commentList() {
			//alert("댓글 목록 함수 호출");
			$.ajax({
				  url:'/comment/list'
				, type:'get'
				, data:{'tour_code' : tour_code } // data:{파라미터이름:담기는값} => 담기는 값은 
			    , success:function(data){
			    	//alert(data);
			    	let a=''; //출력할 결과값
			    	$.each(data, function(key, value){
			    		//alert(key);   //순서 0 1 2
			    		//alert(value); //[object Object]
			    		//alert(value.cno);
			    		//alert(value.content);
			    		//alert(value.wname);
			    		//alert(value.regdate);
			    		//alert(value.product_code);
			    		
			    		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">'
			    		a += '     <div class="commentInfo' + value.commentno + '">';
			    		a += '          댓글번호:' + value.commentno + ' / 작성자:' + value.id + " " + value.regdate;			    		
			    		a += '          <a href="javascript:commentUpdate(' + value.commentno + ',\'' + value.content + '\')">[수정]</a>';
			    		a += '          <a href="javascript:commentDelete(' + value.commentno + ')">[삭제]</a>';
			    		a += '     </div>';
			    		a += '     <div class="commentContent' + value.commentno + '">';			    		
			    		a += '          <p>내용:' + value.content + "</p>";
			    		a += '     </div>';			    		
			    		a += '</div>';

			    		
			    	});//each() end
			    	
			    	
			    	$(".commentList").html(a);		
			    	
			    }
			}); //ajax() end
			
		}//commentList() end
		*/
	
		
		//댓글수정 - 댓글 내용 출력을 input 폼으로 변경
		function commentUpdate(commentno, content) {
			//alert(commentno + content);
			let a='';
			a += '<div class="input-group">';
			a += '    <input type="text" value="' + content + '" id="content_' + commentno + '">';
			a += '    <button type="button" onclick="commentUpdateProc(' + commentno + ')"  >수정</button>';
			a += '</div>';
			//alert(a);
			$(".commentContent" + commentno).html(a);
		}//commentUpdate() end
		
		
		
		
		//댓글수정
		function commentUpdateProc(commentno) {
			
			//alert("댓글수정"+cno);
			let updateContent=$('#content_' + commentno).val();
			//alert(updateContent);
			
			$.ajax({
				  url:'/comment/update'
				, type:'post'
				, data:{'commentno':commentno, 'content':updateContent}
			    , success:function(data){
			    	if(data==1){
			    		commentList(); //댓글 수정후 목록 출력
			    		alert('댓글이 수정되었습니다.');
			    	}//if end
			    }//if end
			 });//ajax() end
			
		}//commentUpdateProc() end
		
		
		
		
		//댓글삭제
		function commentDelete(commentno) {
			//alert("댓글삭제" + commentno);
			$.ajax({
				  url:'/comment/delete/' + commentno
				, type:'post'
				, success:function(data){ //콜백함수
					//alert(data);
					if(data==1){
						alert("댓글이 삭제되었습니다");
						commentList(); //댓글 삭제후 목록 출력
					}//if end
				}//success end
			});//ajax() end
		}//commentDelete() end
		
		
		
		
        $(document).ready(function(){ //페이지 로딩시 댓글 목록 출력
            commentList(); 
        });//ready() end
		
		
	</script>

</div>
</div>
</div><!-- col-sm-12 끝 -->
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>