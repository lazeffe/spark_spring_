<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${ sessionScope.email }" var="email"/>
<c:set value="${ sessionScope.name }" var="username"/>
<c:set value="${ bmkList }" var="list"/>

<html>
<head>

  <meta name="viewport"
        content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1"/>

  <title>Spark</title>

  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/format/header.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/format/footer.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">

  <style>
  </style>

</head>

<body>

  <jsp:include page="format/header.jsp"/>

  <main class="main">
    <div class="mainImg-cover">
      <div class="contentWrapper">
        <div class="contentItem">
          <div class="contentItem-title" id="contentItem-title">서울시의
            주차장을 한 눈에!
          </div>
          <div id="hide-items">
            <div class="contentItem-info">
              <div class="contentItem-info-1">서울시 내의 공영주차장과 민영주차장의</div>
              <div class="contentItem-info-2">위치 및 요금을 간편하게 찾아보세요</div>
            </div>
          </div>
          <div class="searchBar">
            <form action="/BoardSearch.bo">
              <div class="searchBar-items" id="searchBar-items">
                <button class="searchBar-icon" type="submit" id="search-btn">
                  <i class="material-icons">search</i>
                </button>
                <input class="searchBar-content" name="PARKING_NAME" type="text"
                       placeholder="주소 또는 주차장 이름 입력" aria-label="Search" id="tags">
              </div>
              <div class="searchBar-comment">
                <p id="searchVal-comment"></p>
              </div>
            </form>
          </div>
        </div>
      </div>

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
  </main>

  <jsp:include page="format/footer.jsp"/>

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
  <script>
    /* autocomplete with JQuery */
    $(function () {
      $
          .getJSON(
              '${pageContext.request.contextPath}/resources/json/addr.json',
              function (items) {
                var tags_name = [];
                var tags_addr = [];
                var tags_all = [];
                $.each(items, function (i, item) {
                  tags_name[i] = item.PARKING_NAME;
                  tags_addr[i] = item.ADDR;
                });

                tags_all = tags_name.concat(tags_addr);
                /*console.log(tags_name);
                console.log(tags_addr);
                console.log(tags_all);*/

                $("#tags").autocomplete({
                  source: tags_all
                });
              });
    });

    clickMobileBtn('#navMenu-mobile-btn1', '.navMenu-mobile');

    clickMobileBtn('#navMenu-mobile-btn2', '.navMenu-mobile');

    clickSearchbar('#tags', '#hide-items', '#contentItem-title');

    chkSearching('#search-btn', '#tags', 'searchVal-comment');

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
  </script>

</body>
</html>
