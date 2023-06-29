<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="col-sm-12">
	<div class="container">
<c:forEach var="reviewdetail" items="${list}"> 
 <h3>제목:${reviewdetail.title}</h3>
 <h6 style="text-align: right;">작성자:${reviewdetail.id}</h6>
 ${reviewdetail.content}
  </tr>
  <c:if test="${vs.count mod 5==0}">
  </tr> <tr>
  </c:if> 
  <c:if test="${s_id == reviewdetail.id}">
   <input type="button" value="삭제하기" onclick="confirmDelete('${reviewdetail.reviewno}')"> 
   </c:if> 	
	</c:forEach>
	</div>
	</div> 
	
<script type="text/javascript">
function confirmDelete(reviewNo) {
	  if (confirm("정말로 삭제 하시겠습니까?")) {
	    location.href = 'reviewdelete?reviewno=' + reviewNo;
	  }
	}
</script>
<%@ include file="../footer.jsp" %>