<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


	<form name="hotelfrm" id="hotelfrm" method="post" action="insert" enctype="multipart/form-data">
	    <table border="1">
	    <tr>
	        <td>숙박명</td>
	        <td> <input type="text" name="hotel_Name"> </td>
	    </tr>
	    <tr>
	        <td>숙박종류</td>
	        <td>
	        <select name="hotel_Type">
				<option value="호텔">호텔</option>
				<option value="펜션">펜션</option>
				<option value="풀빌라">풀빌라</option>
			</select>
			</td>
	    </tr>
	    <tr>
	        <td>지역</td>
	        <td>
	        <select name="arrival_code">
				<option value="G0001">제주</option>
				<option value="G0007">서울</option>
			</select>
			</td>
	    </tr>
	    <tr>
	        <td>숙박최저가</td>
	        <td> <input type="number" name="hotel_Prices"> </td>
	    </tr>
	    <tr>
	        <td>숙박간단설명</td>
	        <td> 
	            <textarea rows="5" cols="60" name="hotel_Content"></textarea>     
	         </td>
	    </tr>
	    
	     <tr>
	        <td>숙박연락처</td>
	        	<td> <input type="text" name="hotel_tel"> </td>
	    </tr>
	    
	     <tr>
	        <td>숙박주소</td>
	        	<td> <input type="text" name="hotel_address"> </td>
	    </tr>
	    
	    <tr>
	        <td>숙박메인사진</td>
	        <td> <input type="file" name="img"> </td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	            <input type="submit" value="상품등록"> 
	        </td>
	    </tr>    
	    </table>  
	</form>

<%@ include file="../footer.jsp" %>