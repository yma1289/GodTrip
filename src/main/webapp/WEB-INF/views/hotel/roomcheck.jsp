<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
 <h4 style="text-align: center;">객실예약 현황</h4>
<div class="wrap">
<div class="col-sm-12">
      <div style="text-align: center; padding-top: 30px; margin-top: 10px;">
     	<div class="container" style="align:center; padding-top: 30px">
     	<c:if test="${empty list}">
    	<h3>예약자 정보 없음</h3>
		</c:if>
     	<c:if test="${not empty list}">
	<table class="table">
	<thead>
	<tr>		
		<th class="text-center">예약번호</th> 
		<th class="text-center">예약자id</th>
		<th class="text-center">체크인</th>
		<th class="text-center">체크아웃</th>
		<th class="text-center">결제금액</th>
	</tr>
	</thead>

	<tbody>
	<c:forEach var="roomcheck" items="${list}">
		<tr class="text-center">
			<td>${roomcheck.merchant_uid}</td>
			<td>${roomcheck.id}</td>		
			<td>${roomcheck.departureDate}</td>
			<td>${roomcheck.arrivalDate}</td>
			<td>${roomcheck.Total}&#8361;</td>																	
		</c:forEach>			
	</tbody>	
	</table>	
	</c:if>
		</div>
	</div>                        
 </div>
 </div>


</body>

