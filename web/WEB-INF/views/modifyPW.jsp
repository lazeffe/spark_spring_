<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${ dto }" var="data"/>

<c:set value="${ sessionScope.email }" var="email"/>

<html>
<head>
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1"/>
  
  <title>Spark - Account</title>
  
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,700" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modifyPW.css">
  
  <style>
  
  </style>

</head>

<body>

<div class="inputWrapper">
  <div class="inputContents">
    <form action="#" method="post" name="modifyPWForm">
      <div class="pwTitle old-title"><label for="old_pw">현재 비밀번호</label></div>
      <input type="password" name="old_pw" class="old_pw" id="old_pw" autofocus>
      <div class="inputCmt" id="oldPw-Cmt"></div>
      <div class="pwTitle new-title"><label for="new_pw">새 비밀번호</label></div>
      <input type="password" name="new_pw" class="new_pw" id="new_pw">
      <div class="inputCmt" id="newPw-Cmt"></div>
      <div class="pwTitle newRe-title"><label for="new_pw_re">새 비밀번호 확인</label></div>
      <input type="password" name="new_pw_re" class="new_pw_re" id="new_pw_re">
      <div class="inputCmt" id="newPw_re-Cmt"></div>
      <input type="button" value="비밀번호 변경" id="modifyPWBtn" onclick="modifyPW()">
    </form>
  </div>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../resources/js/modifyPW.js"></script>

<script>
  
  enterModifyPW('modifyPWBtn');

  /* id check with AJAX */
  function modifyPW_AJAX(old_pw, new_pw) {
    var _email = '${ email }';
    var _old_pw = old_pw.value;
    var _new_pw = new_pw.value;

    $.ajax({
      url: "/ModifyPW.aj",
      type: 'POST',
      data: {email_data: _email, old_pw_data: _old_pw, new_pw_data: _new_pw},
      success: function (data) {
        if (data === 'success') {
          alert('비밀번호 변경 성공');
          window.close();
        } else if (data === 'fail') {
          alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요');
        }
      }
    })
  }


</script>

</body>
</html>
