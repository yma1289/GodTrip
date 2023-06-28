<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../pheader.jsp" %>
<style>
.wrap {
  width: 100%;
  height: 80vh;
  display: flex;
  background: rgba(0, 0, 0, 0);
}
</style>
<div class="wrap">
<div class="col-sm-12">
<div class="container" >
	<form name="hoteldetailForm" id="hoteldetailForm" method="post" action="detailinsert" enctype="multipart/form-data">
	     <table border="3" style=" width: 100%;border-collapse: collapse; margin-bottom: 20px;">
	    <h4>객실정보</h4>
	   
	    <tr>
	        <td>객실명</td>
	        <td> <input type="text" name="room_Name" required> </td>
	    </tr>
	   
	    <tr>
	        <td>객실 가격</td>
	        <td> <input type="number" name="room_price" required> </td>
	    </tr>
	    <tr>
	        <td>객실 설명</td>
	        <td> 
	            <textarea rows="5" cols="60" name="room_info" required></textarea>     
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
	            <input type="submit" value="상품등록" class="btn btn-primary"> 
	            <input type="reset" value="취소" class="btn btn-primary" onclick="history.back();"/>
	        </td>
	    </tr>    
	    </table>  
	</form>
	</div>
	</div>
	</div>

<%@ include file="../footer.jsp" %>