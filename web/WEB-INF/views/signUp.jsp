<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1"/>

  <title>Spark - Sign Up</title>

  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,700" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signUp.css">

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
                앗! 이런 쌈박한 회원가입!!
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
            <div class="inputInfo">
              <div class="input-icon"><i class="material-icons">local_parking</i></div>
              <div class="inputSubtitle" id="inputSubtitle">
                주차장을 찾으시나요? <a href="/home.ho">홈으로</a>
              </div>
              <div class="inputSubtitle inputSubtitle2">
                이미 가입하셨나요? <a href="/signIn.lo">로그인</a>
              </div>
            </div>

            <form action="/memberJoinAction.lo" method="post" name="signUpForm">
              <div class="input-email">
                <div><label for="email">이메일</label><span class="chkValCmt">(영어 또는 숫자로 이루어진 이메일)</span></div>
                <div class="emailWrapper">
                  <input type="text" name="email" id="email" placeholder="" autofocus>
                  <input type="button" id="emailChk" value="중복 체크" onclick="idChk()" >
                </div>
                <div class="inputCmt" id="emailCmt"></div>
              </div>
              <div class="input-pw">
                <div><label for="pw">비밀번호</label><span class="chkValCmt">(4 ~ 12 글자 사이의 영문 또는 숫자)</span></div>
                <div><input type="password" name="pw" id="pw" placeholder=""></div>
                <div class="inputCmt" id="pwCmt"></div>
              </div>
              <div class="input-pw">
                <div><label for="pw">비밀번호 재입력</label></div>
                <div><input type="password" name="pw_re" id="pw_re" placeholder=""></div>
                <div class="inputCmt" id="pw_reCmt"></div>
              </div>
              <div class="input-name">
                <div><label for="name">닉네임</label><span class="chkValCmt">(4 ~ 12 글자 사이의 영문 또는 숫자)</span></div>
                <div><input type="text" name="name" id="name" placeholder=""></div>
                <div class="inputCmt" id="nameCmt"></div>
              </div>
              <div class="input-group">
                <div class="input-age">
                  <div><label for="age">나이</label><span class="chkValCmt">(0 ~ 150 사이의 숫자)</span></div>
                  <div><input type="text" name="age" id="age" placeholder=""></div>
                  <div class="inputCmt" id="ageCmt"></div>
                </div>
                <div class="input-gender">
                  <label class="genderLabel">성별</label>
                  <div class="radWrapper">
                    <div>
                      <label class="container">남
                        <input type="radio" name="gender" value="man">
                        <span class="checkmark"></span>
                      </label>
                    </div>
                    <label class="container">여
                      <input type="radio" name="gender" value="woman">
                      <span class="checkmark"></span>
                    </label>
                  </div>
                  <div class="inputCmt" id="genderCmt"></div>
                </div>
              </div>
              <input type="button" value="회원가입" id="signUpBtn" onclick="chkSignUp()">
            </form>
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
    enterSignUp('signUpBtn');
  </script>

</body>
</html>

