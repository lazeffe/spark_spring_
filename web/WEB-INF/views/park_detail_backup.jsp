<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${ parkInfo }" var="data"/>
<c:set value="${ bookmarkList }" var="list"/>

<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1"/>
  <title>Spark - Detail</title>
  
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/format/normalize.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/format/header.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/format/footer.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
  
  <style>
  
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
                  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1c5f2663d2c1817bab341abc2cb94da&libraries=clusterer"></script>
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
                      class="text-muted">${data.parking_type_nm} / ${data.operation_rule_nm} / ${data.night_free_open_nm}</span>
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
                    <h6 class="my-0">주차 가능시간</h6>
                    <small class="text-muted">평일</small>
                  </div>
                  <span class="text-muted">평일 : ${data.weekday_begin_time} ~ ${data.weekday_end_time}</span>
                </li>
                
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                    <h6 class="my-0">주차 가능시간</h6>
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

    <jsp:include page="format/modal_bmk.jsp"/>

  </div>
</main>

<jsp:include page="format/footer.jsp"/>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/home.js"></script>

<script>

  clickMobileBtn('#navMenu-mobile-btn1', '.navMenu-mobile');

  clickMobileBtn('#navMenu-mobile-btn2', '.navMenu-mobile');

  /* Modal start */

  <c:choose>
  <c:when test="${ name ne null }">
  // Get the modal
  var modal = document.getElementById('myModal');

  // Get the button that opens the modal
  var btn1 = document.getElementById("myBtn1");
  var btn2 = document.getElementById("myBtn2");

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close-custom")[0];

  // When the user clicks the button, open the modal
  btn1.onclick = function () {
    modal.style.display = "block";
  }

  btn2.onclick = function () {
    modal.style.display = "block";
  }

  // When the user clicks on <span> (x), close the modal
  span.onclick = function () {
    modal.style.display = "none";
  }

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
  </c:when>
  </c:choose>

  /* Modal end */

  /* bmk delete action */
  function deleteBmk(bmkName, cnt, first, last) {
    var _bmkName = bmkName;
    var _cnt = document.getElementById(cnt);
    var _first = first;
    var _last = last;

    var _cnt_near_num = parseInt(cnt) - 1;
    var _cnt_near = document.getElementById(_cnt_near_num);

    var r = confirm("이 주차장을 즐겨찾기에서 삭제하시겠습니까?");

    if (r == true) {
      var _email = '${ email }';

      $.ajax({
        url: "/DeleteBmk.aj",
        type: 'GET',
        data: {
          email: _email,
          bmkName: _bmkName
        },
        success: function (data) {
          if (data === 'success') {
            alert('삭제 성공');
            _cnt.style.display = 'none';

            if (_last === false) {
              _cnt_near.style.border = 'none';
            }

          } else if (data === 'fail') {

          }
        }
      })
    } else {

    }
  }
  
  $(window).load(function() {
    var _first_modal = document.getElementById('1');
    
    _first_modal.style.margin = '1px';
  })
  
</script>

</body>
</html>