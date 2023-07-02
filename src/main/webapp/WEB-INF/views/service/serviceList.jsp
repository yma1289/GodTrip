<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
.wrap {
  width: 100%;
  height: 80vh;
  display: flex;
  background: rgba(0, 0, 0, 0);
}
.title-cell {
  text-align: left;
}
</style>

<div class="wrap">
  <div class="container mt-5">
    <div class="container">
      <h3 class="display-6 text-center mb-5" style="color: #19b3eb; font-weight: bold;">고객센터</h3>

      <div class="input-group">
        <form method="post" action="serviceList" class="input-group">
          <select name="category" class="form-control">
            <option value="0">전체</option>
            <option value="1">공지사항</option>
            <option value="2">자주묻는질문</option>
          </select>
          <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="제목+내용으로 검색">
          <span class="input-group-btn">
            <input type="submit" class="btn btn-outline-info" value="검색">
            <span class="glyphicon glyphicon-search"></span>
          </span>
        </form>
      </div>
      <br>

      <table class="table table-hover table-responsive-md">
        <thead class="thead">
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
              <td class="title-cell"><a href="/service/serviceDetail/${service.cno}" style="color: #028abb;">${service.title}</a></td>
              <td><fmt:formatDate value="${service.regdate}" pattern="yyyy년 MM월 dd일" /></td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

      <c:if test="${not empty s_id}">
        <c:choose>
          <c:when test="${s_id == 'webmaster'}">
            <button type="button" class="btn btn-outline-info" onclick="location.href='serviceForm'">글쓰기</button>
          </c:when>
          <c:otherwise>
            <button type="button" class="btn btn-outline-info" onclick="alert('로그인 후 이용해주세요.'); location.href='/member/memberlogin'">글쓰기</button>
          </c:otherwise>
        </c:choose>
      </c:if>

      <div class="pagination-container">
        <c:if test="${totalPage > 1}">
          <c:set var="currentPage" value="${pageNum}" />
          <c:set var="prevPage" value="${currentPage - 1}" />
          <c:set var="nextPage" value="${currentPage + 1}" />
          <c:set var="lastPage" value="${totalPage}" />

          <c:choose>
            <c:when test="${currentPage > 1}">
              <a class="page-edges" href="<c:url value='/service/serviceList?pageNum=1' />"><<</a>
              <a href="<c:url value='/service/serviceList?pageNum=${prevPage}' />">  <  </a>
            </c:when>
            <c:otherwise>
              <span class="page-edges"><<</span>
              <span><</span>
            </c:otherwise>
          </c:choose>

          <c:forEach begin="1" end="${totalPage}" varStatus="loop">
            <c:choose>
              <c:when test="${loop.index == currentPage}">
                <strong>${loop.index}</strong>
              </c:when>
              <c:otherwise>
                <a href="<c:url value='/service/serviceList?pageNum=${loop.index}' />">${loop.index}</a>
              </c:otherwise>
            </c:choose>
          </c:forEach>

          <c:choose>
            <c:when test="${currentPage < totalPage}">
              <a href="<c:url value='/service/serviceList?pageNum=${nextPage}' />">  >  </a>
              <a class="page-edges" href="<c:url value='/service/serviceList?pageNum=${lastPage}' />">>></a>
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
</div>

<%@ include file="../footer.jsp" %>
