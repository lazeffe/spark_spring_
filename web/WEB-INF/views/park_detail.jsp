<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${ sessionScope.email }" var="email"/>
<c:set value="${ sessionScope.name }" var="username"/>

<%--@elvariable id="parkInfo" type="java.lang.String"--%>
<c:set value="${ parkInfo }" var="data"/>
<%--@elvariable id="bookmarkList" type="java.util.List"--%>
<c:set value="${ bookmarkList }" var="list"/>

<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1"/>
  <title>Spark - Detail</title>

  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/format/normalize.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/format/header.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/format/footer.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/park_detail.css">

  <style>

  </style>

</head>

<body>

<jsp:include page="format/header.jsp"/>

<main class="main">
  <div class="mainImg-cover">

    <div class="detailWrapper">
      <div class="detailContent">
        <div class="leftPanel">
          <div id="map">
          </div>
        </div>
        <div class="rightPanel">
          <div class="cardWrapper">
            <div class="cardContents">
              <div class="card-item card-name">
                <div class="name-title">이메일</div>
                <div class="name-content">${ data.parking_name }</div>
              </div>
              <div class="card-item card-addr">
                <div class="addr-title">위치</div>
                <div class="addr-content">${ data.addr }</div>
              </div>
              <div class="card-item card-type">
                <div class="type-title">종류</div>
                <div class="type-content">${data.parking_type_nm}/${data.operation_rule_nm}/${data.night_free_open_nm} </div>
              </div>
              <div class="card-item card-tel">
                <div class="tel-title">전화번호</div>
                <div class="tel-content">${data.tel} </div>
              </div>
              <div class="card-item card-capacity">
                <div class="capacity-title">주차용량</div>
                <div class="capacity-content">${data.capacity}칸</div>
              </div>
              <div class="card-item card-free">
                <div class="free-title">유/무료</div>
                <div class="free-content">평일 - ${data.pay_nm} / 토요일:${data.saturday_pay_nm} / 공휴일:${data.holiday_pay_nm}</div>
              </div>
              <div class="card-item card-available-weekday">
                <div class="card-available-weekday-title">주차 가능시간</div>
                <div class="card-available-weekday-content">평일 - ${data.weekday_begin_time} ~ ${data.weekday_end_time}</div>
              </div>
              <div class="card-item card-available-weekend">
                <div class="card-available-weekend-title"></div>
                <div class="card-available-weekend-content">주말 - ${data.weekend_begin_time} ~ ${data.weekend_end_time} / 공휴일 - ${data.holiday_begin_time} ~ ${data.holiday_end_time}</div>
              </div>
              <div class="card-item card-payPerMinute">
                <div class="card-payPerMinute-title">분당 요금</div>
                <div class="card-payPerMinute-content">${data.rates}원 <span>(추가 요금 : ${data.add_time_rate}분당 ${data.add_rates}원)</span></div>
              </div>
              <div class="card-item card-flatSum">
                <div class="card-flatSum-title">정액제</div>
                <div class="card-flatSum-content">${data.day_maximum}원</div>
              </div>
              <div class="card-item card-payPerMonth">
                <div class="card-payPerMonth-title">30일</div>
                <div class="card-payPerMonth-content">${data.fulltime_monthly}원</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="format/modal_bmk.jsp"/>

  </div>
</main>

<jsp:include page="format/footer.jsp"/>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1c5f2663d2c1817bab341abc2cb94da&libraries=clusterer"></script>
<script src="${pageContext.request.contextPath}/resources/js/home.js"></script>

<c:choose>
  <c:when test="${ username ne null }">
    <script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
  </c:when>
</c:choose>

<script>

  /* map start */
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
  /* map end */


  clickMobileBtn('#navMenu-mobile-btn1', '.navMenu-mobile');

  clickMobileBtn('#navMenu-mobile-btn2', '.navMenu-mobile');

  /*$(window).load(function () {
    var _first_modal = document.getElementById('1');

    _first_modal.style.margin = '1px';
  })*/

</script>

</body>
</html>