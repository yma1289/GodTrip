<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>GODTRIP : 파트너페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/myscript.js"></script>
<style>
body, h1, h2, h3, h4, h5, h6 {
    font-family: 'Noto Sans KR', sans-serif;
}

html {
    scroll-behavior: smooth;
}

body, html {
    height: 100%;
    line-height: 1.8;
}

.w3-bar .w3-button {
    padding: 16px;
}

.navbar {
    background-color: #f8f9fa !important;
}

.navbar-brand {
    font-weight: bold;
    color: #1cc3ff;
}

.navbar-nav .nav-item .nav-link {
    color: #008bbe;
}

.card {
    border-radius: 0;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.card-header {
    background-color: #1cc2ff;
    color: white;
}

.card-img-top {
    height: 200px;
    object-fit: cover;
}

h3 {
    color: #19b3eb;
    font-weight: bold;
}

footer {
    background-color: #f8f9fa;
}

.navbar-logo {
    max-height: 45%;
    max-width: 45%;
    height: auto;
    width: auto;
    margin-top: 0;
    margin-bottom: 0;
}
</style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-md navbar-light">
        <div class="container">
            <a class="navbar-brand" href="/partner/partnerpage">
                <img src="/images/logo2.png" alt="Logo" class="navbar-logo">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#myNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <strong>${p_name}</strong> 님 환영합니다!
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="navbar-nav ml-auto">
                    <c:choose>
                        <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'A1' }">
                            <li class="nav-item">
                                <a class="nav-link" href="../partner/hotelForm">숙박 상품등록</a>
                            </li>
                        </c:when>
                        <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'B1' }">
                            <li class="nav-item">
                                <a class="nav-link" href="../partner/T_infoList">기차 상품등록</a>
                            </li>
                        </c:when>
                        <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'C1' }">
                            <li class="nav-item">
                                <a class="nav-link" href="../partner/F_infoList">항공 상품등록</a>
                            </li>
                        </c:when>
                    </c:choose>

                    <c:choose>
                        <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'B1' }">
                            <li class="nav-item">
                                <a class="nav-link" href="../partner/partnerpage">상품 판매현황</a>
                            </li>
                        </c:when>
                        <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'C1' }">
                            <li class="nav-item">
                                <a class="nav-link" href="../partner/partnerpage">상품 판매현황</a>
                            </li>
                        </c:when>
                    </c:choose>

                    <c:choose>
		          	  <c:when test="${(empty s_id || empty s_passwd ||  empty s_mlevel || s_mlevel == 'F1') && (empty p_id || empty p_passwd || empty p_level)}">
		            	<li class="nav-item dropdown nav-item">
		              	<li class="nav-item dropdown"><a
		                    class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
		                    role="button" data-toggle="dropdown">로그인</a>
		                      
		                  <div class="dropdown-menu dropdown-menu-right">
		                    <a class="dropdown-item" href="/member/memberlogin">회원로그인</a>                        
		                    <a class="dropdown-item" href="/partner/partnerlogin">파트너로그인</a>	                        
		                  </div>  
		          	  </c:when>
		          	  <c:otherwise>
		            	<li class="nav-item" style="white-space: nowrap;">
	                  	  <a href="/partner/partnerlogout.do" class="nav-link">로그아웃</a>
	                	</li>
		          	  </c:otherwise>
		        	</c:choose>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Header -->

	<div class="container-fluid bg-3 text-center">
		<div class="row">