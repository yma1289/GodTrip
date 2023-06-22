<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
   <title>카카오페이 결제 테스트</title>
</head>     
<h1> kakaoPay api 이용하기 </h1>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<button id="btn-kakaopay" class="btn btn-primary">카카오페이</button>
<script>
let index = {
		init:function(){
	        $("#btn-kakaopay").on("click", ()=>{ // function(){}를 사용안하고 , ()=>{}를 사용하는 이유는 this를 바인딩하기 위해서
				this.kakaopay();
			});
		},

	  // 카카오페이 결제
		kakaopay:function(){
			
			$.ajax({
				url:"/kakaoPay/payment",
				dataType:"json",
				 type: "POST"
			}).done(function(resp){
				if(resp.status === 500){
					alert("카카오페이결제를 실패하였습니다.")
				} else{
					 // alert(resp.tid); //결제 고유 번호
					var box = resp.next_redirect_pc_url;
					//window.open(box); // 새창 열기
					location.href = box;
				}
			
			}).fail(function(error){
				alert(JSON.stringify(error));
			}); 
			
		},
	}

	index.init();


</script>
</body>
</html>