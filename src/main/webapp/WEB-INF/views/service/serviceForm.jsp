<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>

<style>
    .form-container {
        margin: 50px auto;
        width: 50%;
        padding: 20px;
        background-color: #f8f9fa;
        border-radius: 5px;
    }

    .form-container label {
        font-weight: bold;
    }

    .form-container input[type="text"],
    .form-container textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 5px;
        border: 1px solid #ced4da;
        white-space: pre-wrap; /* 줄바꿈 */
    }

    .form-container button {
        padding: 10px 20px;
        background-color: #007bff;
        border: none;
        color: white;
        cursor: pointer;
    }
</style>

<div class="container mt-5">
    <h3 class="display-6 text-center mb-5" style="color: #19b3eb; font-weight: bold;">고객센터</h3>
    <div class="row justify-content-center">
        <div class="col-md-6">
        <form name="servicefrm" id="servicefrm" method="post" action="${pageContext.request.contextPath}/service/serviceInsert">
                <div class="form-group">
                    <label for="c_code">분류</label>
                    <select class="form-control" id="c_code" name="c_code" required>
                        <option value="0">공지사항</option>
                        <option value="1">자주묻는질문</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                </div>
                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
                </div>
                
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-info">등록</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
