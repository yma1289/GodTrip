<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>

<style>
#reservation-header {
  color: dodgerblue;
  font-size: 30px;
  text-align: center;
  margin-top: 30px;
  font-weight: bold; 
}

.wrap {
  width: 100%;
  height: 80vh;
  display: flex;
  background: rgba(0, 0, 0, 0);
}
</style>
</head>
<body>

<div class="wrap">
<div class="container" style="padding: 80px;">
<div id="reservation-header">예약이 완료되었습니다</div>

<div style="padding-top: 10px;"><h5>자세한 예약내역은 마이페이지에서 확인하세요</h5></div>


<div class="form-group d-flex justify-content-center" style="padding-top: 70px;">
  <input type="button" value="홈으로" class="btn btn-info" onclick="location.href='/home'">
  <input type="button" value="마이페이지" class="btn btn-warning" onclick="location.href='/member/memeberpage'">
</div>
</div>
</div>

</body>
</html>

<%@ include file="../footer.jsp" %>
