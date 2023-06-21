<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
<div class="col-sm-12">
<h3 style="padding-top: 10px;"> 회원가입 </h3>

<span style="color:red; font-weight: bold"> *필수입력</span><br>
<span style="color:red; font-weight: bold"> ※아이디는 추후 수정이 불가능합니다.</span>
<form name="partnerfrm" id="partnerfrm" method="post" action="pRegister" onsubmit="return partnerCheck()">
<table class="table">
<tr>
<th>*아이디</th>
<td style="text-align: left">
<input type="text" name="p_id" id="p_id" size="10" maxlength="10" readonly>
<input type="button" value="ID중복확인" onclick="partneridCheck()">
</td>
</tr>

<tr>
<th>*비밀번호</th>
<td style="text-align: left">
<input type="password" name="p_passwd" id="p_passwd" size="10" maxlength="10" required>
</td>
</tr>

<tr>
<th>*비밀번호 확인</th>
<td style="text-align: left">
<input type="password" name="p_passwd1" id="p_passwd1" size="10" maxlength="10" required>
</td>
</tr>

<tr>
<th>*이름</th>
<td style="text-align: left">
<input type="text" name="p_name" id="p_name" size="20" maxlength="20" required>
</td>
</tr>

<tr>
<th>*이메일</th>
<td style="text-align: left">
<input type="email" name="p_email" id="p_email" size="10" maxlength="50" readonly>
<input type="button" value="Email중복확인" onclick="partneremailCheck()">
</td>
</tr>


<tr>
<th>전화번호</th>
<td style="text-align: left">
<input type="text" name="p_tel" id="p_tel" size="14" maxlength="15" placeholder="-없이 입력">
</td>
</tr>

<tr>
<th>판매 품목구분</th>
<td style="text-align: left">
<select name="p_level" id="p_level">
    <option value="none">=== 선택 ===</option>
    <option value="A1">숙박</option>
    <option value="B1">기차</option>
    <option value="C1">항공</option>
  </select>
</td>
</tr>

<tr>
<th>사업자 번호</th>
<td style="text-align: left">
<input type="text" name="p_info" id="p_info" size="14" maxlength="20" placeholder="-없이 입력">
</td>
</tr>

<tr>
<td colspan="2">
<input type="submit" value="회원가입" class="btn btn-primary">
<input type="reset" value="취소" class="btn btn-light">
</td>
</tr>
</table>
</form>



</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>