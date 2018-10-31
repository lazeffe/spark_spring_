<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${ boarddata }" var="data"/>

<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1"/>
  <title>Spark - Detail</title>
  
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/format/header.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/format/footer.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail_ppt.css">
 
  
  <style>
    
    /* .text-type {
      font-size:14px
    } */
  
  </style>
</head>
<body>
<jsp:include page="format/header.jsp"/>

<main class="detailmain">
  <div class="detailcover">
    <div class="detailWrapper">
      <div class="leftSide">
        <div class="mapWrapper">
          <div id="map"></div>
          <script type="text/javascript"
                  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=65ef4303482c34481a1e7944b80a4dc0&libraries=clusterer"></script>
          <script>

            var mapTypes = daum.maps.MapTypeId.TRAFFIC;

            var container = document.getElementById('map');
            var options = {
              center: new daum.maps.LatLng('${data.lat}', '${data.lng}'),
              level: 3
            };

            var map = new daum.maps.Map(container, options);

            // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
            var mapTypeControl = new daum.maps.MapTypeControl();
            
            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new daum.maps.ZoomControl();
            map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

            map.addOverlayMapTypeId(mapTypes);

            var marker = new daum.maps.Marker({
              // 지도 중심좌표에 마커를 생성합니다
              position: map.getCenter()
            });
            // 지도에 마커를 표시합니다
            marker.setMap(map);
          
          
          </script>
        </div>
      </div>
      <div class="rightSide">
        <div class="infoWrapper">
          <div class="row">
            <div class="col-sm-12">
              <!-- <div class="text-white-50">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span>상세 보기</span>
                </h4>
              </div> -->
              <ul class="list-group mb-3">
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                    <h6 class="my-0">주차장명</h6>
                  </div>
                  <span class="text-muted">${data.parking_name}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                    <h6 class="my-0">위치</h6>
                  </div>
                  <span class="text-muted">${data.addr}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                    <h6 class="my-0">종류</h6>
                  </div>
                  <span
                      class="text-muted-parkingtype">${data.parking_type_nm} / ${data.operation_rule_nm} / ${data.night_free_open_nm}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                    <h6 class="my-0">전화번호</h6>
                  </div>
                  <span class="text-muted">${data.tel}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                    <h6 class="my-0">주차용량</h6>
                  </div>
                  <span class="text-muted">${data.capacity}칸</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                    <h6 class="my-0">유/무료</h6>
                  </div>
                  <span class="text-muted <!-- freeOrDie -->">평일 : ${data.pay_nm} / 토요일 : ${data.saturday_pay_nm} / 공휴일 : ${data.holiday_pay_nm}</span>
                </li>
                
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                    <h6 class="my-0-time">주차 가능시간</h6>
                    <small class="text-muted">평일</small>
                  </div>
                  <span class="text-muted">평일 : ${data.weekday_begin_time} ~ ${data.weekday_end_time}</span>
                </li>
                
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                    <h6 class="my-0-time">주차 가능시간</h6>
                    <small class="text-muted">주말 및 공휴일</small>
                  </div>
                  <span
                      class="text-muted">주말 : ${data.weekend_begin_time} ~ ${data.weekend_end_time} / 공휴일 : ${data.holiday_begin_time} ~ ${data.holiday_end_time}</span>
                </li>
                
                
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                    <h6 class="my-0">${data.time_rate}분당 요금</h6>
                  
                  </div>
                  <span class="text-muted">${data.rates}원
								<small class="text-muted">(추가 요금 : ${data.add_time_rate}분당 ${data.add_rates}원)</small>
								</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                    <h6 class="my-0">정액제</h6>
                    <small class="text-muted">1일</small>
                  </div>
                  <span class="text-muted">${data.day_maximum}원</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                    <h6 class="my-0">정액제</h6>
                    <small class="text-muted">30일</small>
                  </div>
                  <span class="text-muted">${data.fulltime_monthly}원</span>
                </li>
                <%--<li class="list-group-item d-flex justify-content-between lh-condensed">
                  
                  <span class="text-muted"></span>
                  <div class="favorite">
                    <button type="button" class="btn btn-1g btn-block btn-primary">자주 가는 주차장에 등록</button>
                  
                  </div>
                </li>--%>
              </ul>
            
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<jsp:include page="format/footer.jsp"/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bs/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript" src="resources/bs/js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="./resources/js/home.js"></script>

</body>
</html>