<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<style>
    form {
        width: 100%;
        max-width: 600px;
        padding: 15px;
        margin: auto;
    }
    form div {
        margin-bottom: 15px;
        display: flex;
        align-items: center;
    }
    label {
        width: 70px;
        font-weight: bold;
    }
    input[type="text"], textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    textarea {
        resize: vertical;
    }
    select {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
</style>

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

<%@ include file="../footer.jsp" %>
