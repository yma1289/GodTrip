<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../header.jsp" %>  

	<div class="container">
	<br>
	<h3><strong>교통상품 선택</strong></h3>
	<br>
	<table>
	<tr>
		<th style="text-align: center">출발일</th>		
		<td>
			<input type="text" name="departure_Date" id="departure_Date" size="10" maxlength="10">
		</td>
	</tr>
	<tr>
		<th style="text-align: center">출발지</th>
		<td>
			<select name="departure_code" id="departure_code">
				<option>
				
			</select>
		</td>
	</tr>
		
	</table>
	
	<hr>
	
	<table class="table table-bordered">
	<tr>
		<th class="text-center">교통편</th>		
		<th class="text-center">출발일</th>
		<th class="text-center">출발지</th>
		<th class="text-center">도착지</th>
		<th class="text-center">출발시간</th>
		<th class="text-center">도착시간</th>		
		<th class="text-center">가격</th>
		<th class="text-center">잔여좌석</th>
	</tr>
	
	<tr>
		<td class="text-center"></td>
	</tr>	
	</table>	
	</div>		


<%@ include file="../footer.jsp" %>