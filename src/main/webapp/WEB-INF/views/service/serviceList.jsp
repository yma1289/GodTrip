<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>

<style>
.pagination-container {
    display: flex;
    justify-content: center;
    padding: 20px;
}

.pagination-container a {
    color: #19b3eb;
    margin: 0 10px;
    text-decoration: none;
    padding: 5px 10px;
    border: 1px solid #19b3eb;
    border-radius: 5px;
}

.pagination-container a:hover {
    background-color: #19b3eb;
    color: white;
    text-decoration: none;
}

.pagination-container strong {
    color: #19b3eb;
    margin: 0 10px;
    padding: 5px 10px;
    background-color: #19b3eb;
    border-radius: 5px;
    color: white;
}

.pagination-container .page-edges {
    background-color: #19b3eb;
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
}

.pagination-container .page-edges:hover {
    background-color: #026185;
    text-decoration: none;
}

.wrap {
  width: 100%;
  height: 80vh;
  display: flex;
  background: rgba(0, 0, 0, 0);
}

</style> 


<div class="wrap">
<div class="container mt-5">
    <h3 class="display-6 text-center mb-5" style="color: #19b3eb; font-weight: bold;">고객센터</h3>
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
        </tbody>
    </table>
    <div class="text-center mt-4" style="padding: 30px;">
    	<button class="btn btn-info" onclick="location.href='/service/serviceForm'">글쓰기</button>
    </div>
    <div class="pagination-container">
    <c:if test="${totalPages > 1}">
        <c:set var="currentPage" value="${currentPage}" />
        <c:set var="prevPage" value="${currentPage - 1}" />
        <c:set var="nextPage" value="${currentPage + 1}" />
        <c:set var="lastPage" value="${totalPages}" />

        <c:choose>
            <c:when test="${currentPage > 1}">
                <a class="page-edges" href="<c:url value='/service/serviceList/1' />"><<</a>
                <a href="<c:url value='/service/serviceList/${prevPage}' />"><</a>
            </c:when>
            <c:otherwise>
                <span class="page-edges"><<</span>
                <span><</span>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="1" end="${totalPages}" step="1" varStatus="loop">
            <c:choose>
                <c:when test="${loop.index == currentPage}">
                    <strong>${loop.index}</strong>
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/service/serviceList/${loop.index}' />">${loop.index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${currentPage < totalPages}">
                <a href="<c:url value='/service/serviceList/${nextPage}' />">></a>
                <a class="page-edges" href="<c:url value='/service/serviceList/${lastPage}' />">>></a>
            </c:when>
            <c:otherwise>
                <span>></span>
                <span class="page-edges">>></span>
            </c:otherwise>
        </c:choose>
    </c:if>
</div>
</div>
</div>

<%@ include file="../footer.jsp" %>
