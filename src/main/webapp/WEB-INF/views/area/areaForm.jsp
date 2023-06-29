<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style>
footer {
	margin-top: 30px;	
}
.footer {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 30px;
}
.title {
  padding: 5%;
  
}
.img-fluid {
    max-width: 80%;
    height: auto;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
 }
</style>

<div class="row">
  <div class="col-md-9">
    <h3 class="text-center title">어떤 지역으로 여행하고 싶으신가요?</h3>

    <div class="row mt-4" style="margin-left: 20px; margin-right: 20px;">
      <div class="col-md-4">
      <img src="../images/JEJUDO.png" area_code="G0001" class="img-fluid" alt="제주" onclick="handleClickEvent(this)">
      </div>
      <div class="col-md-4">
      <img src="../images/GANGNEUNGSI.png" area_code="G0006" class="img-fluid" alt="강릉" onclick="handleClickEvent(this)">
      </div>
      <div class="col-md-4">
      <img src="../images/BUSANSI.png" area_code="G0012" class="img-fluid" alt="부산" onclick="handleClickEvent(this)">
      </div>
    </div>
    <div class="row mt-4" style="margin-left: 20px; margin-right: 20px;">
    <div class="col-md-4">
    	<img src="../images/GYEONGJU.png" area_code="G0013" class="img-fluid" alt="경주" onclick="handleClickEvent(this)">
    </div>
    <div class="col-md-4">
      <img src="../images/GAPYEONG.png" area_code="G0005" class="img-fluid" alt="가평	" onclick="handleClickEvent(this)">
    </div>
    <div class="col-md-4">
    <img src="../images/YEOSU.png" area_code="G0017" class="img-fluid" alt="여수" onclick="handleClickEvent(this)">
    </div>
  </div>
  <div class="row mt-4" style="margin-left: 20px; margin-right: 20px;">
  <div class="col-md-4">
  	<img src="../images/JEONJU.png" area_code="G0018" class="img-fluid" alt="전주" onclick="handleClickEvent(this)">
  </div>
  <div class="col-md-4">
  	<img src="../images/CHUNCHEON.png" area_code="G0007" class="img-fluid" alt="춘천" onclick="handleClickEvent(this)">
  </div>
  <div class="col-md-4">
  	<img src="../images/GEOJE.png" area_code="G0015" class="img-fluid" alt="통영거제" onclick="handleClickEvent(this)">
  </div>
</div>
<div class="row mt-4" style="margin-left: 20px; margin-right: 20px;">
<div class="col-md-4">
	<img src="../images/POHANG.png" area_code="G0014" class="img-fluid" alt="포항" onclick="handleClickEvent(this)">
</div>
<div class="col-md-4">
	<img src="../images/DAEJEON.png" area_code="G0009" class="img-fluid" alt="대전" onclick="handleClickEvent(this)">
</div>
<div class="col-md-4">
	<img src="../images/JECHEON.png" area_code="G0008" class="img-fluid" alt="제천" onclick="handleClickEvent(this)">
</div>
</div>
<div class="row mt-4" style="margin-left: 20px; margin-right: 20px;">
<div class="col-md-4">
	<img src="../images/MOKPO.png" area_code="G0016" class="img-fluid" alt="목포" onclick="handleClickEvent(this)">
</div>
<div class="col-md-4">
	<img src="../images/YEONGWOL.png" area_code="G0011" class="img-fluid" alt="영월" onclick="handleClickEvent(this)">
</div>
<div class="col-md-4">
	<img src="../images/GUNSAN.png" area_code="G0010" class="img-fluid" alt="군산" onclick="handleClickEvent(this)">
</div>
</div>
<div class="row mt-4" style="margin-left: 20px; margin-right: 20px;">
<div class="col-md-4">
	<img src="../images/SEOUL.png" area_code="G0002" class="img-fluid" alt="서울" onclick="handleClickEvent(this)">
</div>
<div class="col-md-4">
	<img src="../images/INCHEON.png" area_code="G0003" class="img-fluid" alt="인천" onclick="handleClickEvent(this)">
</div>
<div class="col-md-4">
	<img src="../images/SUWON.png" area_code="G0004" class="img-fluid" alt="수원" onclick="handleClickEvent(this)">
</div>
</div> 
  </div>

  <div class="col-md-3 bg-light text-dark" style="height: 100%;">
    <h5 class="mt-3" style="margin-top: 20px;">내가 만드는 여행 패키지</h5>
    <p>어떤 지역으로 여행하고 싶으신가요?</p>
    <p id="selectedArea"><i class="fa fa-arrow-right"></i> </p>

    <div style="margin-top: 20%; margin-left: 5%;">
      <button class="btn btn-info" id="nextButton" style="width: 40%">Next</button>
    </div>
  </div>
</div>

<script>
function handleClickEvent(event) {
    var altValue = event.alt;
    var areaCode = event.getAttribute('area_code');
    // Save the selected area information into local storage
    localStorage.setItem('selectedArea', JSON.stringify({altValue, areaCode}));
    
    // Update the selected area display
    document.getElementById('selectedArea').innerHTML = '<i class="fa fa-arrow-right"></i> ' + altValue;

    document.getElementById('nextButton').addEventListener('click', function() {
        window.location.href = "../schedule/scheduleForm";
    });
}

</script>

<%@ include file="../footer.jsp" %>
