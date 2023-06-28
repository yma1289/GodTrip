<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../pheader.jsp" %>

<div class="col-sm-12">
<div class="container" >
	<form name="hotelfrm" id="hotelfrm" method="post" action="hotelinsert" enctype="multipart/form-data" onsubmit="return validateForm();">
	    <table border="3" style=" width: 100%;border-collapse: collapse; margin-bottom: 20px;">
	    <tr>
	        <td>숙박명</td>
	        <td> <input type="text" name="hotel_Name" id="hotel_Name" required> </td>
	    </tr>
	    <tr>
	        <td>숙박종류</td>
	        <td>
	        <select name="hotel_Type" id="hotel_Type" required>
				<option value="호텔">호텔</option>
				<option value="펜션">펜션</option>
				<option value="풀빌라">풀빌라</option>
			</select>
			</td>
	    </tr>
	    <tr>
	        <td>지역</td>
	        <td>
	        <select name="arrival_code" id="arrival_code"  required>
				<option value="G0001">제주</option>
				<option value="G0002">서울</option>
				<option value="G0003">인천</option>
				<option value="G0004">수원</option>
				<option value="G0005">가평</option>
				<option value="G0006">강릉</option>
				<option value="G0007">춘천</option>
				<option value="G0008">제천</option>
				<option value="G0009">대전</option>				
				<option value="G0010">군산</option>
				<option value="G0011">영월</option>
				<option value="G0012">부산</option>
				<option value="G0013">경주</option>
				<option value="G0014">포항</option>
				<option value="G0015">통영거제</option>
				<option value="G0016">목포</option>
				<option value="G0017">여수</option>
				<option value="G0018">전주</option>				
			</select>
			</td>
	    </tr>
	    <tr>
	        <td>숙박최저가</td>
	        <td> <input type="number" name="hotel_Prices" id="hotel_Prices" required> </td>
	    </tr>
	    <tr>
	        <td>숙박간단설명</td>
	        <td> 
	            <textarea rows="10" cols="95" name="hotel_Content" required>
	            🙋‍️ 어떤 내용이 들어가면 좋을까요?
				●숙소 소개 숙소의 특장점 (위치, 객실, 서비스 등)을 소개해 주세요.
				●숙소 구성을 알려주세요!
				●안내사항 (바베큐 시설 이용, 제공서비스, 구비시설 등)을 기재해 주세요.
				●숙소 주변 관광지 숙소 주변 관광지와 도보, 차량 등으로 걸리는 거리를 안내해 주세요.
				</textarea>     
	         </td>
	    </tr>
	    
	     <tr>
	        <td>숙박연락처</td>
	        	<td> <input type="text" name="hotel_tel" required> </td>
	    </tr>
	     
	    <tr>
	<th>우편번호</th>
	<td style="text-align: left">
	<input type="text" name="zipcode" id="zipcode" size="7" readonly required>
	<input type="button" value="주소찾기" onclick="DaumPostcode()">
	</td>
	</tr>
	
	<tr>
	<th>주소</th>
	<td style="text-align: left">
	<input type="text" name="hotel_address" id="address1" size="45" readonly required>   ※사용자에게 보여질 주소입니다
	</td>
	</tr>
	<tr>
	<th>나머지주소</th>
	<td style="text-align: left">
	<input type="text" name="address2" id="address2" size="45">
	</td>
	</tr>
	    
	    
	    <tr>
	        <td>숙박메인사진</td>
	        <td> <input type="file" name="img" id="img" > </td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	           <button type="submit" class="btn btn-primary btn-block">상품등록하기</button>
	        </td>
	    </tr>    
	    </table>  
	</form>
	</div>
	</div>
	
	
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
   <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
function validateForm() {
    var hotel_Name = document.getElementById("hotel_Name").value;
    var hotel_Prices = document.getElementById("hotel_Prices").value;
    var img=document.getElementById("img").value; //예)sky.png
    
    if (hotel_Name.length <2) {
        alert("숙박명을 3글자 이상 입력해주세요");
        return false;
    }

    if (hotelPrices.length === "" || isNaN(hotelPrices)) {
        alert("올바른 숙박최저가를 입력해주세요.");
        return false;
    }
    
    //->파일의 확장명이 이미지 파일 (png, jpg, gif) 인지 확인하시오
    if(img.length == 0){
        alert("첨부 파일 선택하세요~");
        return false;
    }else{
        var dot=img.lastIndexOf(".");//filename 변수값에서 마지막 .의 순서값       
        var ext=img.substr(dot+1);   //확장명 : 마지막 . 이후 문자열 자르기    
        ext=ext.toLowerCase();            //확장명을 전부 소문자 치환
        alert(ext);
        if(ext=="png" || ext=="jpg" || ext=="gif"){
        	alert(ext);
        	return true;
        }else{
            alert("이미지 파일만 업로드 가능합니다~")
            return false;
        }//if end
    }//if end
}//function end


    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address2").value = extraAddr;
                
                } else {
                    document.getElementById("address2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
	

<%@ include file="../footer.jsp" %>