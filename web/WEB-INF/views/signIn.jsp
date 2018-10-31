<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1"/>

  <title>Sign In</title>


  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,700" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signIn.css">

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
                이거 실화?!
              </div>
              <div class="info-subTitle">
                로그인시 이용자별 주차장 이용, 통계, 분석, 예측하는 기능을 제공합니다
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="rightPanel">
        <div class="inputWrapper">
          <div class="inputContents">
            <div class="input-icon"><i class="material-icons">local_parking</i></div>
            <div class="inputSubtitle">
              주차장을 찾으시나요? <a href="/home.ho">홈으로</a>
            </div>
            <form action="/memberLoginAction.lo" name="signInForm" method="post">
              <div class="input-email">
                <div><label for="email">이메일</label><span class="chkValCmt">(영어 또는 숫자로 이루어진 이메일)</span></div>
                <div><input type="text" name="email" id="email" placeholder="" autofocus></div>
                <div class="inputCmt" id="emailCmt"></div>
              </div>
              <div class="input-pw">
                <div><label for="pw">비밀번호</label><span class="chkValCmt">(4 ~ 12 글자 사이의 영문 또는 숫자)</span></div>
                <div><input type="password" name="pw" id="pw" placeholder=""></div>
                <div class="inputCmt" id="pwCmt"></div>
              </div>
              <%--<input type="submit" name="submit" id="submitBtn" value="로그인">--%>
              <input type="button" value="로그인" id="signInBtn" onclick="chkSignIn()">
            </form>
          </div>
        </div>
      </div>
    </div>
  </main>

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="../resources/js/signIn.js"></script>

  <script>
    enterSignIn('signInBtn');
  </script>

</body>
</html>

