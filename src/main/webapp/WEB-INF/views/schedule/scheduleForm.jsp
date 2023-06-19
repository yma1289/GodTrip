<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
footer, .title {
  margin-top: 30px;	
}
.footer {
  display: flex;
  justify-content: center;
  align-items: center;
  
}
.datepicker-wrapper {
  display: flex;
  justify-content: space-between;
  margin-left: 60px;
}
.datepicker-input {
  width: 49%;
  margin-right: 5px;
}


</style>

<div class="container">
<div class="row">
  <div class="col-md-9">
    <h3 class="text-center title">어떤 일정으로 여행하고 싶으신가요?</h3>
    <div class="row mt-4 datepicker-wrapper">
      <div class="datepicker-input">
        <input id="datetimepickerStart" type='text' class="form-control" placeholder="Start date" readonly style="opacity: 0;">
      </div>
      <div class="datepicker-input">
        <input id="datetimepickerEnd" type='text' class="form-control" placeholder="End date" readonly style="opacity: 0;">
      </div>
    </div>
  </div>
  <div class="col-md-3 bg-light text-dark" style="height: 80vh;">
    <h5 class="mt-3">내가 만드는 여행 패키지</h5>
    <p>어떤 지역으로 여행하고 싶으신가요?</p>
    <p id="selectedAreaSidebar"><i class="fa fa-arrow-right"></i> <span id="selectedAreaValue"></span></p>
    <p>어떤 일정으로 여행하고 싶으신가요?</p>
    <p id="selectedDate"><i class="fa fa-arrow-right"></i> <span id="dateRange"></span></p>
    <!-- Next 버튼 -->
    <div style="margin-top: 20%; margin-left: 5%;">
      
      <input type="button" value="Next" onclick="location.href='/product/transproList'" class="btn btn-info" id="nextButton">
    </div>
  </div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
  var startDatePicker = flatpickr('#datetimepickerStart', {
    dateFormat: 'Y-m-d',
    inline: true,
    minDate: 'today', 
    locale: {
      rangeSeparator: ' ~ ' 
    },
    onChange: function(selectedDates, dateStr, instance) {
      endDatePicker.clear(); 
      endDatePicker.set('minDate', dateStr);
    }
  });

  var endDatePicker = flatpickr('#datetimepickerEnd', {
    dateFormat: 'Y-m-d',
    inline: true,
    minDate: 'today',
    locale: {
      rangeSeparator: ' ~ '
    },
    onClose: function(selectedDates, dateStr, instance) {
      var startDate = startDatePicker.selectedDates[0];
      var endDate = new Date(dateStr);
      if (!startDate || !endDate) {
        alert('출발일과 도착일을 모두 선택해주세요.');
        return;
      }

      var numNights = Math.floor((endDate - startDate) / (1000 * 60 * 60 * 24));

      var startDateFormat = startDate.getFullYear() + '. ' + (startDate.getMonth() + 1) + '. ' + startDate.getDate() + '.';
      var endDateFormat = endDate.getFullYear() + '. ' + (endDate.getMonth() + 1) + '. ' + endDate.getDate() + '.';

      document.getElementById('selectedDate').innerHTML = '<i class="fa fa-arrow-right"></i> ' + startDateFormat + ' ~ ' + endDateFormat + ' (' + numNights + '박 ' + (numNights + 1) + '일)';
      document.getElementById('dateRange').textContent = startDateFormat + ' ~ ' + endDateFormat + ' (' + numNights + '박 ' + (numNights + 1) + '일)';
    }
  });

  var selectedArea = localStorage.getItem('selectedArea');
  if (selectedArea) {
    var { altValue, areaCode } = JSON.parse(selectedArea);
    document.getElementById('selectedAreaSidebar').innerHTML = '<i class="fa fa-arrow-right"></i> ' + altValue;
    document.getElementById('selectedAreaValue').textContent = areaCode;

    //area_code, alt값
    console.log(areaCode);
    console.log(altValue);
  }
});

//area_code값이 제대로 넘어왔는지 확인
window.onload = function() {
  var selectedArea = JSON.parse(localStorage.getItem('selectedArea'));
  console.log(selectedArea);  
}
</script>

<%@ include file="../footer.jsp" %>
