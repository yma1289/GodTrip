<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- authi.jsp 공통 코드를 포함하는 페이지
  로그인 상태 정보 확인 -->

<c:choose>
  <c:when test="${empty sessionScope.s_id || empty sessionScope.s_passwd || empty sessionScope.s_mlevel}">
    <!-- 하나라도 만족을 못하면 로그인 실패 처리 -->
    <c:set var="s_id" scope="session" value="guest" />
    <c:set var="s_passwd" scope="session" value="guest" />
    <c:set var="s_mlevel" scope="session" value="E1" />
  </c:when>
  <c:otherwise>
    <!-- 로그인 성공 했다면 세션 변수값 가져오기 -->
    <c:set var="s_id" scope="session" value="${sessionScope.s_id}" />
    <c:set var="s_passwd" scope="session" value="${sessionScope.s_passwd}" />
    <c:set var="s_mlevel" scope="session" value="${sessionScope.s_mlevel}" />
  </c:otherwise>
</c:choose>