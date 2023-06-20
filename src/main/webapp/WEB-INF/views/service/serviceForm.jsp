<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<style>
/* 스타일 코드 생략 */
</style>
<div class="container">
    <h3>고객센터 글쓰기</h3>

    <c:choose>
        <c:when test="${mlevel eq 'A1'}">
            <form action="/service/serviceInsert" method="post">
                <div>
                    <label>분류: </label>
                    <select name="c_code">
                        <option value="0">공지사항</option>
                        <option value="1">자주묻는질문</option>
                    </select>
                </div>
                <div>
                    <label>제목: </label>
                    <input type="text" name="title" required />
                </div>
                <div>
                    <label>내용: </label>
                    <textarea name="content" required></textarea>
                </div>
                <div class="text-center mt-4" style="padding: 30px;">
                    <input type="submit" class="btn btn-info" value="등록" />
                </div>
            </form>
        </c:when>
        <c:otherwise>
            <p>관리자만 글쓰기가 가능합니다.</p>
        </c:otherwise>
    </c:choose>
</div>

<%@ include file="../footer.jsp" %>
