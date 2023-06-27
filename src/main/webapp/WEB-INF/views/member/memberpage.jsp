<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!-- 본문시작 -->

<c:choose>
	<c:when test="${!(empty s_id || empty s_passwd || s_mlevel == 'E1' || s_mlevel == 'F1')}">

<!-- 좌측 시작 -->
	<div class="container-fluid" style="padding:0px;">
		<div class="row">
			<!-- 개인정보창 -->
			<div class="container-fluid col-12 col-md-4 col-lg-3">			
				<table class="table custom-table">
					
					<tr align="center">
						<td style="padding-top: 40px; padding-bottom: 20px; padding-left: 10px;">
							<img src="/images/loggedin.png" alt="userPhoto" width="150vh">							
						</td>						
					</tr>
					
					<tr align="center">
						<td valign="middle" style="line-height: 180%;">
							<p style="font-weight: bold; text-align: center; margin: 0px;">
								${mname}님
							</p>
							<span style="line-height: 1em; margin: 0px; padding: 0px;">
								환영합니다
							</span>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="button" class="btn btn-primary" value="회원정보수정" onclick="location.href='memberModify'"/>
							<input type="button" class="btn btn-danger" value="회원탈퇴" onclick="location.href='memberWithdraw'"/>					
						</td>						
					</tr>
<!-- 					
					<tr align="center">
						<td colspan>
							최근예약내역					
						</td>						
					</tr>
 -->														
				</table>		
			</div>
<!-- 좌측 끝 -->			

<!-- 우측 시작 -->
			<div class="col-12 col-md-8 col-lg-9"  style="padding-bottom: 80px;">
				<table class="table custom-table" style="display: table; table-layout: fixed;" >
					<tr align="center">
						<td colspan="5" class="text-center lib-text" style="padding-top: 40px">
							<h2><strong>마이페이지</strong></h2>					
						</td>
					</tr>
					<tr></tr>
					<tr>
						<td colspan="5" class="text-center lib-text" style="padding: 20px">
							<h4>최근 예약내역</h4>
						</td>
					</tr>									
				</table>
				<div class="container">
					<table align="center" class="table table-bordered">
						<tr>
							<th>예약일</th>
							<th>예약번호</th>
							<th>예약내용</th>
							<th>예약상황</th>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>										
					</table>
				</div>
			</div>
		</div>	
	</div>
<!-- 우측 끝 -->
	
	</c:when>
</c:choose>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>
