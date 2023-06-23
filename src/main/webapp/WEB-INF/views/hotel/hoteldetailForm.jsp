<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<form name="hoteldetailForm" id="hoteldetailForm" method="post" action="detailinsert" enctype="multipart/form-data">
	    <table border="1">
	    <h4>객실정보</h4>
	   
	    <tr>
	        <td>객실명</td>
	        <td> <input type="text" name="room_Name"> </td>
	    </tr>
	   
	    <tr>
	        <td>객실 가격</td>
	        <td> <input type="number" name="room_price"> </td>
	    </tr>
	    <tr>
	        <td>객실 설명</td>
	        <td> 
	            <textarea rows="5" cols="60" name="room_info"></textarea>     
	         </td>
	    </tr>
	    <tr>
	    	<td>객실 최대인원</td>
	    	<td> <select name="room_maxperson">
				   <option value="1">1인</option>
				   <option value="2">2인</option>
				   <option value="3">3인</option>
				   <option value="4">4인</option>
				   <option value="5">5인</option>
				   <option value="6">6인</option>
				   <option value="7">7인</option>
				   <option value="8">8인</option>
				   <option value="9">9인</option>
				   <option value="10">10인</option>
				 </select>
			</td>
	    </tr>
	    
	    <tr>
	        <td>객실메인사진</td>
	        <td> <input type="file" name="img"> </td>
	    </tr>
	    
	     
	    <input type="hidden" name="hotel_code" value="${hotel_code}">
	    
	    
	    <tr>
	        <td colspan="2" align="center">
	            <input type="submit" value="상품등록"> 
	        </td>
	    </tr>    
	    </table>  
	</form>

<%@ include file="../footer.jsp" %>