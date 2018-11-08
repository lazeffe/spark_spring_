<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${ sessionScope.email }" var="email"/>
<c:set value="${ sessionScope.name }" var="username"/>
<%--@elvariable id="bookmarkList" type="java.util.List"--%>
<c:set value="${ bookmarkList }" var="list"/>

<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1"/>

  <title>Spark</title>

  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/format/normalize.css">
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
          <form action="/parkSearch.pa">
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

    <jsp:include page="format/modal_bmk.jsp"/>

  </div>
</main>

<jsp:include page="format/footer.jsp"/>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/home.js"></script>

<c:choose>
  <c:when test="${ username ne null }">
    <script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
  </c:when>
</c:choose>

<script>
  /* autocomplete with JQuery */
  $(function () {
    $.getJSON(
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

        $("#tags").autocomplete({
          source: tags_all
        });
      });
  });

  clickMobileBtn('#navMenu-mobile-btn1', '.navMenu-mobile');

  clickMobileBtn('#navMenu-mobile-btn2', '.navMenu-mobile');

  clickSearchbar('#tags', '#hide-items', '#contentItem-title');

  chkSearching('#search-btn', '#tags', 'searchVal-comment');

</script>

</body>
</html>
