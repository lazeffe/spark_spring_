<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${ dto }" var="data"/>

<c:set value="${ sessionScope.email }" var="email"/>

<html>
<head>
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1"/>
  
  <title>Spark - Delete</title>
  
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,700" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/deleteAccount.css">
  
  <style>
    .test1 {
      display: none;
    }
  </style>
  
</head>

<body>

<div class="inputWrapper">
  <div class="inputContents">
    <form action="#" method="post" name="deleteAccForm">
      <div class="deleteTitle">계정을 삭제하기 위해서는 비밀번호가 필요합니다.</div>
      <div class="pwTitle"><label for="pw">비밀번호</label></div>
      <input type="password" name="pw" id="pw" autofocus>
      <input type="text" style="display: none">
      <div class="inputCmt" id="deleteCmt"></div>
      <input onclick="deleteAcc()" type="button" value="계정 삭제" id="deleteAccBtn">
    </form>
  </div>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/deleteAccount.js"></script>

<script>

  enterDeleteAcc('deleteAccBtn');

  function deleteAcc_AJAX(pw) {
    var _email = '${ email }';
    var _pw = pw.value;

    $.ajax({
      url: "/memberDeleteAction.me",
      type: 'POST',
      data: { email : _email, pw : _pw},
      success: function (data) {
        if (data === 'success') {
          alert('계정 삭제 성공');
          window.close();
          opener.location.href = '/home.ho';
        } else if (data === 'fail') {
          alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요');
        }
      }
    })
  }
  
</script>

</body>
</html>
