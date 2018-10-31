<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1"/>

  <title>Spark - Account</title>

  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,700" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/account.css">

  <style>

  </style>

</head>

<body>

<main>
  <div class="panelWrapper">
    <div class="leftPanel">
      <div class="leftPanel-cover">
        <div class="infoWrapper">
          <div class="infoContents">
            <div class="info-title">
              프로필
            </div>
            <div class="info-subTitle">
              당신의 프로필을 확인하고 비밀번호를 변경할 수 있습니다. <br>삭제만은 제발...
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="rightPanel">
      <div class="inputWrapper">
        <div class="inputContents">
          <div class="inputInfo">
            <div class="input-icon"><i class="material-icons">local_parking</i></div>
            <div class="inputSubtitle" id="inputSubtitle">
              주차장을 찾으시나요? <a href="/home.ho">홈으로</a>
            </div>
          </div>
          <div class="cardWrapper">
            <div class="cardContents">
              <div class="card-item card-email">
                <div class="email-title">이메일</div>
                <div class="email-content">${ userInfo.email }</div>
              </div>
              <div class="card-item card-username">
                <div class="username-title">닉네임</div>
                <div class="username-content">${ userInfo.name }</div>
              </div>
              <div class="card-item card-age">
                <div class="age-title">나이</div>
                <div class="age-content">${ userInfo.age }</div>
              </div>
              <div class="card-item card-gender">
                <div class="gender-title">성별</div>
                <div class="gender-content">${ userInfo.gender }</div>
              </div>
              <div class="card-item card-modifyPW" onclick="window.open('resources/jsp/modifyPW.jsp', '_blank', 'width=600 height=500')">
                <div class="modifyPW-title">비밀번호 변경</div>
                <div class="modifyPW-content"><i class="material-icons">keyboard_arrow_right</i></div>
              </div>
              <div class="card-item card-deleteAcc"
                   onclick="window.open('resources/jsp/deleteAccount.jsp', '_blank', 'width=500 height=300')">
                <div class="deleteAcc-title">계정 삭제</div>
                <div class="deleteAcc-content"><i class="material-icons">keyboard_arrow_right</i></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../resources/js/signUp.js"></script>

<script>


</script>

</body>
</html>

