<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${ sessionScope.email }" var="email"/>
<c:set value="${ parking_name }" var="parking_name"/>
<c:set value="${ bmkList }" var="list"/>

<html>
<head>
    <meta charset="utf-8">
    <title>Spark Maps</title>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/format/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/format/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">

    <style>

        body a {
            text-decoration: none;
        }

        body a:hover {
            cursor: pointer;
        }

        #map {
            position: absolute;
            top: 10vh;
            bottom: 10vh;
            left: 18%;
            width: 64%;
            /*height: 800px;*/
            margin: 0 auto;
        }

        .wrap {
            position: absolute;
            left: 0;
            bottom: 40px;
            width: 288px;
            height: 132px;
            margin-left: -144px;
            text-align: left;
            overflow: hidden;
            font-size: 12px;
            font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
            line-height: 1.5;
        }

        .wrap * {
            padding: 0;
            margin: 0;
        }

        .wrap .info {
            width: 286px;
            height: 120px;
            border-radius: 5px;
            border-bottom: 2px solid #ccc;
            border-right: 1px solid #ccc;
            overflow: hidden;
            background: #fff;
        }

        .wrap .info:nth-child(1) {
            border: 0;
            box-shadow: 0px 1px 2px #888;
        }

        .info .title {
            padding: 5px 0 0 10px;
            height: 30px;
            background: #eee;
            border-bottom: 1px solid #ddd;
            font-size: 15px;
            font-weight: bold;
        }

        .info .close {
            position: absolute;
            top: 10px;
            right: 10px;
            color: #888;
            width: 17px;
            height: 17px;
            background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
        }

        .info .close:hover {
            cursor: pointer;
        }

        .info .body {
            position: relative;
            overflow: hidden;
            font-size: 15px;
        }

        /* .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;} */
        .info .ellipsis {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            margin: 4px;
        }

        .info .jibun {
            font-size: 11px;
            color: #555;
            margin: 4px;
        }

        .info .img {
            position: absolute;
            top: 6px;
            left: 5px;
            width: 73px;
            height: 71px;
            border: 1px solid #ddd;
            color: #888;
            overflow: hidden;
        }

        .info:after {
            content: '';
            position: absolute;
            margin-left: -12px;
            left: 50%;
            bottom: 0;
            width: 22px;
            height: 12px;
            background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
        }

        .info .link {
            bottom: 0;
            font-size: 12px;
            color: #000;
            margin: 10px;
            float: right;
        }

        .info .link:hover {
            color: #5085BB;
        }

        #bar_control {
            overflow: hidden;
            position: absolute;
            bottom: 3px;
            right: 5px;
            width: 180px;
            height: 28px;
            background: url(//search1.daumcdn.net/search/cdn/simage/search_all/2011/image/map_underbar.png) repeat-x left top;
            z-index: 20;
        }

        #tip {
            overflow: hidden;
            float: left;
            padding: 9px 0 0 9px;
        }

        #g_stit {
            margin-right: 8px;
            margin-left: 2px;
            float: left;
            color: #dadbe0;
            letter-spacing: -1px;
            font-size: 11px;
            font-family: '돋움', dotum, sans-serif;
        }

        #bar {
            float: left;
            width: 94px;
            height: 7px;
            margin: 3px 3px 0;
            background: url(//search1.daumcdn.net/search/cdn/simage/search_all/2011/image/img_traffic_20110803.gif) no-repeat;
        }

        #g_stit2 {
            margin-left: 8px;
            margin-right: 2px;
            float: left;
            color: #dadbe0;
            letter-spacing: -1px;
            font-size: 11px;
            font-family: '돋움', dotum, sans-serif;
        }


    </style>

</head>
<body>

<jsp:include page="format/header.jsp"/>

<main class="main">
    <div class="mainImg-cover">

        <!-- The Modal -->
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <div class="modal-header">
                    <span class="close">&times;</span>
                    <div class="modal-header-title">즐겨찾기</div>
                </div>
                <c:forEach items="${ list }" var="list" varStatus="status">
                <c:set value="${ list.BOOKMARK_NAME }" var="bmkName"/>
                <c:set value="${ status.count }" var="cnt"/>
                <c:set value="${ status.first }" var="first"/>
                <c:set value="${ status.last }" var="last"/>
                <div class="modal-body-Wrapper">
                    <c:choose>
                    <c:when test="${ last ne true }">
                    <div class="modal-body" id="${ cnt }">
                        </c:when>
                        <c:when test="${ last eq true }">
                        <div class="modal-body modal-body-borderless" id="${ cnt }">
                            </c:when>
                            </c:choose>
                            <div class="modal-body-left" onclick="goContentPage('${ list.BOOKMARK_NAME }')">
                                <div class="modal-body-title">${ list.BOOKMARK_NAME }</div>
                                <div class="modal-body-addr">${ list.BOOKMARK_ADDR }</div>
                                <div class="modal-body-tel">${ list.BOOKMARK_TEL }</div>
                            </div>
                            <div class="modal-body-right">
                                <div class="modal-body-icon">
                                    <button
                                            onclick="deleteBmk('${ bmkName }', '${ cnt }', '${ first }', '${ last }')">
                                        <i class="material-icons">bookmark</i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="modal-footer">
                        <div>Presented by BOH</div>
                    </div>
                </div>
            </div>
        </div>

    </div>


</main>

<jsp:include page="format/footer.jsp"/>


<div id="map">
    <div id="bar_control">
  		<span id="tip">
  			<span id="g_stit"></span>
  			<span id="bar"></span>
  			<span id="g_stit2"></span>
  		</span>
    </div>
</div>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1c5f2663d2c1817bab341abc2cb94da&libraries=clusterer"></script>
<script>

    var login = null;

    <c:choose>
    <c:when test="${ email eq null}">
    login = null;
    </c:when>
    <c:when test="${ email ne null}">
    login = true;
    </c:when>
    </c:choose>

    var loginAddr = ' ';

    if (login) {
        var r =
            loginAddr = './BookmarkAdd.me';
    } else {
        loginAddr = './Signin.Lo';
    }
    var SearchAdd = '${ parking_name }';

    var Search2 = 0; // 위치에 맞는 오버레이 표시를 위한 변수
    var mapContainer;

    var mapTypes = daum.maps.MapTypeId.TRAFFIC;

    /* go to detail page */
    function goContentPage(name) {
        window.location.href = '/BoardSearchAction.bo?PARKING_NAME=' + name;
    }

    /* click mobile menu*/
    function clickMobileBtn(mobileBtn, mobileMenu) {
        var _mobileBtn = document.querySelector(mobileBtn);
        var _mobileMenu = document.querySelector(mobileMenu);

        $(_mobileBtn).click(function () {
            $(_mobileMenu).slideToggle("slow");
        });
    }

    /* click mobile btn */
    clickMobileBtn('#navMenu-mobile-btn1', '.navMenu-mobile');

    clickMobileBtn('#navMenu-mobile-btn2', '.navMenu-mobile');

    $(document).ready(function () {
        $.get("/resources/json/data2.json", function (data) {
            mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new daum.maps.LatLng(37.566828, 126.97864), // 지도의 중심좌표
                    level: 8 // 지도의 확대 레벨
                };
            var countA = data.positions.length; // 오버레이 비활성화를 위한 변수

            for (var i = 0; i < data.positions.length; i++) {
                if ((SearchAdd == data.positions[i].ADDR) || (SearchAdd == data.positions[i].PARKING_NAME)) {  //스트링으로 검색으로 바꿔서
                    mapContainer = document.getElementById('map'), // 지도를 표시할 div
                        mapOption = {
                            center: new daum.maps.LatLng(data.positions[i].LAT, data.positions[i].LNG), // 지도의 중심좌표
                            level: 3 // 지도의 확대 레벨
                        };
                    Search2 = i;

                } else { // 검색값을 찾을 수 없을 경우 오버레이 없음
                    countA = countA - 1;
                    if (countA == 0) {
                        Search2 = -1;
                    }
                }
            }

            var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
            var mapTypeControl = new daum.maps.MapTypeControl();

            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new daum.maps.ZoomControl();
            map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

            map.addOverlayMapTypeId(mapTypes);


            var bar_control = document.getElementById('bar_control');


            var tip = document.getElementById('tip');
            var g_stit = document.getElementById('g_stit');
            var g_text1 = document.createTextNode('원활');
            g_stit.appendChild(g_text1);
            var g_stit = document.getElementById('bar');
            var g_stit = document.getElementById('g_stit2');
            var g_text1 = document.createTextNode('복잡');
            g_stit.appendChild(g_text1);


            // 마커 클러스터러를 생성합니다
            var clusterer = new daum.maps.MarkerClusterer({
                map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
                averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
                minLevel: 4 // 클러스터 할 최소 지도 레벨
            });

            // 데이터 정보 불러오기
            var positions = [];
            for (var i = 0; i < data.positions.length; i++) {
                positions[i] = {
                    code: data.positions[i].PARKING_CODE,
                    name: data.positions[i].PARKING_NAME,
                    addr: data.positions[i].ADDR,
                    tel: data.positions[i].TEL,
                    latlng: new daum.maps.LatLng(data.positions[i].LAT, data.positions[i].LNG)
                }
            }

            // 마커와 커스텀 오버레이 배열 변수 선언
            var marker = [];
            var i = 0;

            positions.forEach(function (pos) {
                // 마커를 생성합니다
                marker[i] = new daum.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: positions[i].latlng, // 마커의 위치
                    clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
                });

                // 마커 좌표에 따른 오버레이 생성
                var customOverlay = new daum.maps.CustomOverlay({
                    position: marker[i].getPosition()
                });

                // 오버레이 정보

                var content = document.createElement('div');
                content.classList.add("wrap");
                var info = document.createElement('div');
                info.classList.add("info");
                var title = document.createElement('div');
                title.classList.add('title');
                title.innerHTML = positions[i].name;
                var close = document.createElement('div');
                close.classList.add("close");
                close.onclick = function () {
                    customOverlay.setMap(null);
                };
                var body = document.createElement('div');
                body.classList.add("body");
                var ellipsis = document.createElement('div');
                ellipsis.classList.add("ellipsis");
                ellipsis.innerHTML = '지번 : ' + positions[i].addr;
                var jibun = document.createElement('div');
                jibun.classList.add("jibun");
                if (positions[i].tel === "NA") {
                } else {
                    jibun.innerHTML = '전화 번호 : ' + positions[i].tel;
                }
                var linkdiv = document.createElement('div');
                var box1 = document.createElement('b');
                var link = document.createElement('a');
                var infoText = document.createTextNode('상세 보기');
                link.classList.add('link');
                link.setAttribute('href', '/BoardSearchAction.bo?PARKING_NAME=' + positions[i].name);
                var box2 = document.createElement('b');
                var link2 = document.createElement('a');
                var infoText2 = document.createTextNode('즐겨찾기 추가');
                link2.classList.add('link');
                link2.setAttribute('href', loginAddr + '?PARKING_CODE=' + positions[i].code + '&PARKING_NAME=' + positions[i].name);

                //밑으로 넣기

                content.appendChild(info);
                info.appendChild(title);
                title.appendChild(close);
                info.appendChild(body);
                body.appendChild(ellipsis);
                body.appendChild(jibun);
                body.appendChild(linkdiv);
                linkdiv.appendChild(box1);
                box1.appendChild(link);
                link.appendChild(infoText);
                linkdiv.appendChild(box2);
                box2.appendChild(link2);
                link2.appendChild(infoText2);

                // 클러스터러 생성
                clusterer.addMarkers(marker);

                // 정보에 따라 오버레이 생성
                customOverlay.setContent(content);
                if (Search2 == i) {
                    customOverlay.setMap(map);
                }

                // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
                daum.maps.event.addListener(marker[i], 'click', function () {
                    customOverlay.setMap(map);
                });

                i++;

            });
        });
    });

    /* Modal start */

    <c:choose>
    <c:when test="${ name ne null }">
    // Get the modal
    var modal = document.getElementById('myModal');

    // Get the button that opens the modal
    var btn1 = document.getElementById("myBtn1");
    var btn2 = document.getElementById("myBtn2");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

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
                data: {email: _email, bmkName: _bmkName},
                success: function (data) {
                    if (data === 'success') {
                        alert('삭제 성공');
                        _cnt.style.display = 'none';

                        if (_last === false) {
                            /*if(_first) { return };*/
                            alert('dd')
                            _cnt_near.style.border = 'none';
                        }

                    } else if (data === 'fail') {

                    }
                }
            })
        } else {

        }
    }

</script>
</body>
</html>