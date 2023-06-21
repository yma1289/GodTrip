<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


 
<form method="post">
	<button id="btn-kakaopay" class="btn btn-primary">카카오페이</button>
</form>
<script>
$(function(){
	$('#apibtn').click(function(){
		$.ajax({
			url:'kakaopay',
			dataType:'json',
			success:function(data){
				 // alert(resp.tid); //결제 고유 번호
				var box = resp.next_redirect_pc_url;
				//window.open(box); // 새창 열기
				location.href = box;
			},
			error:function(error){
				alert(error);
			}
		});
	});
});
$(function(){
    $('#btn-kakaopay').click(function(event){
        event.preventDefault(); // Prevent form submission

        $.ajax({
            url: 'paymentForm',
            type: 'POST',
            dataType: 'json',
            success: function(response){
                var box = response.next_redirect_pc_url;
                location.href = box;
            },
            error: function(error){
                alert(error);
            }
        });
    });
});
</script> 
 
</body>
</html>
