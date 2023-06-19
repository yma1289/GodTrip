<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>

<style>
.container {
    padding: 30px;
}

.container h3 {
    font-size: 2rem;
    color: #19b3eb;
    margin-bottom: 30px;
}

.table {
    box-shadow: 0 2px 4px rgb(114, 114, 114);
}

.table th,
.table td {
    vertical-align: middle;
}



#editForm label {
    font-weight: bold;
    margin-bottom: 10px;
    display: block;
}

#editForm input[type="text"],
#editForm textarea,
#editForm select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 15px;
    resize: vertical;
}

</style>

<div class="container">
    <h3>고객센터 상세</h3>
    <table class="table">
        <thead class="thead-light">
           <tr>
           <th>${service.cno}</th>
           <th>
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
            </th>
            <th>${service.title}</th>
            <th><fmt:formatDate value="${service.regdate}" pattern="yyyy년 MM월 dd일" /></th>
            </tr>
        </thead>
        <tbody>
        <tr>
           <td colspan='4'>${service.content}</td>
        </tr>
        </tbody>
    </table>
    <div class="text-center mt-4">
    <button class="btn btn-info" onclick="editService()">수정</button>
    <button class="btn btn-info" onclick="confirmDelete()">삭제</button>
    <input type="button" value="목록" class="btn btn-info" onclick="location.href='/service/serviceList'">
</div>
</div>

<form id="editForm" style="display: none;">
<div>
    <label for="c_code">분류:</label>
    <select id="c_code" name="c_code">
        <option value="0" ${service.c_code == '0' ? 'selected' : ''}>공지사항</option>
        <option value="1" ${service.c_code == '1' ? 'selected' : ''}>자주묻는질문</option>
    </select>
</div>
<div>
    <label for="title">제목:</label>
    <input type="text" id="title" name="title" value="${service.title}" required />
</div>
<div>
    <label for="content">내용:</label>
    <textarea id="content" name="content" required>${service.content}</textarea>
</div>
<div>
    <input type="button" value="저장" class="btn btn-info" onclick="saveService()" />
    <input type="button" value="취소" class="btn btn-info" onclick="cancelEdit()" />
</div>
</form>

<script>
function editService() {
document.getElementById('editForm').style.display = 'block';
}



function saveService() {
var form = document.getElementById('editForm');
var formData = new FormData(form);
var xhr = new XMLHttpRequest();
xhr.open('POST', '${updateUrl}', true);
xhr.onreadystatechange = function() {
    if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
            alert(xhr.responseText);
            location.reload();
        } else {
            alert('게시글 수정에 실패하였습니다.');
        }
    }
};
xhr.send(formData);
}

function confirmDelete() {
if (confirm('정말로 삭제하시겠습니까? 삭제 후 복구되지 않습니다.')) {
    deleteService();
}
}

function deleteService() {
var xhr = new XMLHttpRequest();
xhr.open('POST', '/service/serviceDelete/${service.cno}', true);
xhr.onreadystatechange = function() {
    if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
            alert(xhr.responseText);
            location.href = '/service/serviceList';
        } else {
            alert('게시글 삭제에 실패하였습니다.');
        }
    }
};
xhr.send();
}
</script>

<%@ include file="../footer.jsp" %>