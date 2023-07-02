<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<style>
.wrap {
	  width: 100%;
	  height: 100%;
	  display: flex;
	  background: rgba(0, 0, 0, 0);
	}

.container {
    padding: 20px;
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
pre {
    text-align: left; 
}
</style>

<div class="col-sm-12">
<div class="wrap">
<div class="container mt-5">
    <h3>고객센터 상세</h3>
    <table class="table">
        <thead class="thead">
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
            <td colspan="4"><pre>${service.content}</pre></td>
        </tr>
    </tbody>
    </table>
    <div class="text-center mt-4" style="padding: 30px;">
        <c:if test="${not empty s_id and s_id == 'webmaster'}">
            <button onclick="editService()" class="btn btn-outline-warning">수정</button>
            <button onclick="confirmDelete()" class="btn btn-outline-danger">삭제</button>
        </c:if>
        <input type="button" value="목록" class="btn btn-outline-info" onclick="location.href='/service/serviceList'" />
    </div>
</div>

<form id="editForm" style="display: none;">
    <input type="hidden" name="cno" value="${service.cno}" />
    <div>
        <label>분류: </label>
        <select name="c_code">
            <option value="0" ${service.c_code == '0' ? 'selected' : ''}>공지사항</option>
            <option value="1" ${service.c_code == '1' ? 'selected' : ''}>자주묻는질문</option>
        </select>
    </div>
    <div>
        <label>제목: </label>
        <input type="text" name="title" value="${service.title}" required />
    </div>
    <div>
        <label>내용: </label>
        <textarea name="content" required>${service.content}</textarea>
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

    function cancelEdit() {
        document.getElementById('editForm').style.display = 'none';
    }

    function saveService() {
        var form = document.getElementById('editForm');
        var formData = new FormData(form);
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/service/serviceUpdate', true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    //alert(xhr.responseText);
                    alert('게시글이 수정되었습니다.');
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
        xhr.onreadystatechange = function () {
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
</div>
</div>
</div><!-- col-sm-12 끝 -->
<%@ include file="../footer.jsp" %>
