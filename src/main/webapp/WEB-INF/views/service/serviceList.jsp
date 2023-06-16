<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>

<style>
.container h3 {
    font-size: 2rem;
    color: #19b3eb;
    padding: 20px;
}

.table {
    box-shadow: 0 2px 4px rgb(114, 114, 114);
}

.table th,
.table td {
    vertical-align: middle;
}

.mt-4 button,
.mt-4 input[type="button"] {
    margin: 0.25em;
    border: none;
    background-color: #19b3eb;
    color: white;
    padding: 0.5em 1em;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.mt-4 button, .mt-4 input[type="button"] {
    margin: 0.25em;
    border: none;
    background-color: #19b3eb;
    color: white;
    padding: 0.5em 1em;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.mt-4 button:hover, .mt-4 input[type="button"]:hover {
    background-color: #19b3eb;
}
</style>

<div class="container mt-5">
    <h3 class="display-4 text-center mb-5" style="color: #19b3eb; font-weight: bold;">고객센터</h3>
    <table class="table table-hover table-responsive-md">
        <thead class="thead-light">
            <tr>
                <th>번호</th>
                <th>분류</th>
                <th>제목</th>
                <th>등록일</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${list}" var="service">
            <tr>
                <td>${service.cno}</td>
                <td>
                    <c:choose>
                        <c:when test="${service.c_code == '0'}">
                            공지사항
                        </c:when>
                        <c:when test="${service.c_code == '1'}">
                            자주묻는질문
                        </c:when>
                        <c:otherwise>
                            ${service.c_code}
                        </c:otherwise>
                    </c:choose>
                </td>
                <td><a href="<c:url value='/service/serviceDetail/${service.cno}' />" style="color: #028abb;">${service.title}</a></td>
                <td><fmt:formatDate value="${service.regdate}" pattern="yyyy년 MM월 dd일" /></td>
            </tr>
            </c:forEach>
            
            <tr>
                <td colspan='4'>${service.content}</td>
            </tr>
        </tbody>
    </table>
    <div class="text-center mt-4" style="padding: 30px;">
        <%-- 관리자만 수정,삭제버튼보임/전체코딩후수정예정 <c:if test="${sessionScope.member.mlevel == 'A1'}"></c:if> --%>
        <button onclick="location.href='/service/serviceUpdate/${service.cno}'" class="btn btn-info">수정</button>
        <button onclick="location.href='/service/serviceDelete/${service.cno}'" class="btn btn-info">삭제</button>
        <input type="button" value="목록" onclick="location.href='/service/serviceList'" class="btn btn-info">
    </div>
</div>

<%@ include file="../footer.jsp" %>
