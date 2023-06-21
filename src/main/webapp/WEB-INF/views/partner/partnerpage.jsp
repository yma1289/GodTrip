<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../pheader.jsp" %>

<!-- 본문시작 -->
<div class="col-sm-12">
	<c:choose>
	    <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'A1' }">
      <div style="text-align: center; padding-top: 30px; margin-top: 10px;">
        <h4>숙박상품 판매현황</h4>
        <hr>
        
        
                        
      </div>
    </c:when>

    <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'B1' }">
      <div style="text-align: center; padding-top: 30px; margin-top: 10px;">
        <h4>기차상품 판매현황</h4>
        <hr>
        
        

        
      </div>
    </c:when>

    <c:when test="${ not empty p_id && not empty p_passwd && p_level == 'C1' }">
      <div style="text-align: center; padding-top: 30px; margin-top: 10px;">
        <h4>비행상품 판매현황</h4>
        <hr>
        
      </div>
    </c:when>
  </c:choose>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>