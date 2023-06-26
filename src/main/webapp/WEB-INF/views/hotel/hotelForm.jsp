<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../pheader.jsp" %>
<script>
    function validateForm() {
        var hotelName = document.getElementById("hotel_Name").value;
        var hotelPrices = document.getElementById("hotel_Prices").value;

        if (hotelName.trim()<2) {
            alert("숙박명을 3글자 이상 입력해주세요");
            return false;
        }

        if (hotelPrices.trim() === "" || isNaN(hotelPrices)) {
            alert("올바른 숙박최저가를 입력해주세요.");
            return false;
        }

        return true;
    }
</script>
<div class="col-sm-12">
<div class="container" >
	<form name="hotelfrm" id="hotelfrm" method="post" action="hotelinsert" enctype="multipart/form-data" onsubmit="return validateForm();">
	    <table border="1">
	    <h4>숙박정보</h4>
	    <tr>
	        <td>숙박명</td>
	        <td> <input type="text" name="hotel_Name" id="hotel_Name" required> </td>
	    </tr>
	    <tr>
	        <td>숙박종류</td>
	        <td>
	        <select name="hotel_Type" id="hotel_Type" required>
				<option value="호텔">호텔</option>
				<option value="펜션">펜션</option>
				<option value="풀빌라">풀빌라</option>
			</select>
			</td>
	    </tr>
	    <tr>
	        <td>지역</td>
	        <td>
	        <select name="arrival_code" id="arrival_code"  required>
				<option value="G0001">제주</option>
				<option value="G0002">서울</option>
			</select>
			</td>
	    </tr>
	    <tr>
	        <td>숙박최저가</td>
	        <td> <input type="number" name="hotel_Prices" id="hotel_Prices" required> </td>
	    </tr>
	    <tr>
	        <td>숙박간단설명</td>
	        <td> 
	            <textarea rows="10" cols="95" name="hotel_Content" required>
	            🙋‍️ 어떤 내용이 들어가면 좋을까요?
				●숙소 소개 숙소의 특장점 (위치, 객실, 서비스 등)을 소개해 주세요.
				●숙소 구성을 알려주세요!
				●안내사항 (바베큐 시설 이용, 제공서비스, 구비시설 등)을 기재해 주세요.
				●숙소 주변 관광지 숙소 주변 관광지와 도보, 차량 등으로 걸리는 거리를 안내해 주세요.
				</textarea>     
	         </td>
	    </tr>
	    
	     <tr>
	        <td>숙박연락처</td>
	        	<td> <input type="text" name="hotel_tel" required> </td>
	    </tr>
	    
	     <tr>
	        <td>숙박주소</td>
	        	<td> <input type="text" name="hotel_address" required> </td>
	    </tr>
	    
	    <tr>
	        <td>숙박메인사진</td>
	        <td> <input type="file" name="img" required> </td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	           <button type="submit" class="btn btn-primary btn-block">상품등록하기</button>
	        </td>
	    </tr>    
	    </table>  
	</form>
	</div>
	</div>
	
	
	

<%@ include file="../footer.jsp" %>