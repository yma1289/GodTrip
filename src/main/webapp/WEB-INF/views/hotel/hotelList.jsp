<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- Sidebar/menu -->
 <div class="container">
<div class='row'>

 <div class='col-sm-3'  style="background-color: rgb(200, 200, 200);">
  <div class="w3-container w3-display-container w3-padding-16">
  <hr>
	<h3>숙소종류</h3>
    <hr>
    <form action="search2">
      <label><input type="radio" name="hotel_Type" value="호텔">호텔</label>
      <br>
      <label><input type="radio" name="hotel_Type" value="팬션">팬션</label>
      <br>
      <label><input type="radio" name="hotel_Type" value="풀빌라">풀빌라</label>
      <p><input type="submit" value="검색"> <input type="reset" value="다시하기"></p>  
      <hr>
     </form>
   
   <form action="search" onsubmit="searchPlaces();">  
       <h3>숙소검색</h3>
       	 숙소명<input type="text" name="hotel_Name" id="keyword"   placeholder="검색어를 입력해주세요" class="Autosuggest__TextEditor form-control">
       	<br>
      <p><button class="w3-button w3-block w3-green w3-left-align" type="submit"><i class="fa fa-search w3-margin-right"></i>&nbsp;&nbsp;&nbsp; 검색하기</button></p>
   </form> 
</div>
</div>
    	






<!-- !PAGE CONTENT! -->
	<div class='col-sm-6' style="overflow:scroll;  height:1000px;">
	<div class="d-flex justify-content-evenly"><p><a href="hotelForm">[호텔 입력]</a></p></div>
	<table border="1">
    <tr>
    

     상품갯수 : ${fn:length(list)}
     <br>
     지역명 : ${area_name}
     
            <c:forEach var="hotel" items="${list}">
    		
    		<td>
    			<c:choose>
    				<c:when test="${hotel_filename != '-'}">
    					<img src="/storage/${hotel.hotel_filename}" width="100%" height="200px">
    				</c:when>
    				<c:otherwise>
                        등록된 사진 없음!!<br>
                    </c:otherwise>
    			</c:choose>
    			
                   <a href="detail/${hotel.hotel_code}">${hotel.hotel_Name}</a>
                            <br>
                           ${hotel.hotel_address} 
                            <br>
                            ${hotel.hotel_tel}
                            <br>
    			상품설명 : ${hotel.hotel_Content}
    			<br>
                최저가 : <fmt:formatNumber value="${hotel.hotel_Prices}" />&#8361;
                
                <div align="right"><a href="">[예약하기]</a></div>
    		</td>  
    		<!-- 테이블 한줄에 5칸씩 -->
    		<c:if test="${vs.count mod 5==0}">
                </tr> <tr>
            </c:if>
    		  	
    	</c:forEach>
    	
    </tr>
    </table>
	
	
	
    	</div>
    	

<div class='col-sm-3'><div id="map" style="width:100%;height:800px;"></div>
  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:80px"></div>

  <!-- Slideshow Header -->
  </div>
  </div>
  
  
<script>



var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

//마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

//키워드로 장소를 검색합니다
searchPlaces();

function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
    	
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}




// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}


</script>
  



<%@ include file="../footer.jsp" %>