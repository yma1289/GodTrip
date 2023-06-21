<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
<div class="col-sm-12">

<script type="text/javascript">
        <c:if test="${not empty updateMessage}">
            window.onload = function() {
                alert('${updateMessage}');
                location.href = '/partner/partnerpage';
            }
        </c:if>
    </script>

<h3> 회원정보 수정 </h3>

<!-- 아이디의 경우 한번 지정하면 수정이 불가 read only 속성으로 가져오기만 한다 -->
<span style="color:red; font-weight: bold"> * 필수입력</span>
<form name="partnerfrm" id="partnerfrm" method="post" action="update.do" onsubmit="return partnerCheck()">
<table class="table">
<tr>
<th>*아이디</th>
<td style="text-align: left">
<input type="text" name="p_id" id="p_id" size="10" maxlength="10" readonly value="${partner.p_id}">
</td>
</tr>

<tr>
<th>*비밀번호</th>
<td style="text-align: left">
<input type="password" name="p_passwd" id="p_passwd" size="10" maxlength="10" required value="${partner.p_passwd}">
</td>
</tr>

<tr>
<th>*비밀번호 확인</th>
<td style="text-align: left">
<input type="password" name="p_passwd1" id="p_passwd1" size="10" maxlength="10" required value="${partner.p_passwd}">
</td>
</tr>

<tr>
<th>*이름</th>
<td style="text-align: left">
<input type="text" name="p_name" id="p_name" size="20" maxlength="20" required value="${partner.p_name}">


</td>
</tr>

<tr>
<th>*이메일</th>
<td style="text-align: left">
<input type="email" name="p_email" id="p_email" size="15" maxlength="50" readonly value="${partner.p_email}">
<input type="button" value="Email중복확인" onclick="emailCheck()">
</td>
</tr>

<tr>
<th>전화번호</th>
<td style="text-align: left">
<input type="text" name="p_tel" id="p_tel" size="14" maxlength="15" value="${partner.p_tel}">
</td>
</tr>


<tr>
<th>사업자 번호</th>
<td style="text-align: left">
<input type="text" name="p_info" id="p_info" size="14" value="${partner.p_info}" maxlength="20" placeholder="-없이 입력">
</td>
</tr>

<tr>
<td colspan="2">
<input type="submit" value="회원정보 수정완료" class="btn btn-primary">
<input type="button" value="취소" class="btn btn-light" onclick="location.href='/partner/partnerpage'">
</td>
</tr>
</table>
</form>

<!-- 우편번호 -->



</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>