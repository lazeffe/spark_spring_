/* chk sign up */

function chkSignUp() {
  var form = document.signUpForm;
  var email = document.signUpForm.email;
  var _emailCmt = document.getElementById('emailCmt');
  var re_en = /^[\x00-\x7F]+$/i;
  var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
  var pw = document.signUpForm.pw;
  var _pwCmt = document.getElementById('pwCmt');
  var pw_re = document.signUpForm.pw_re;
  var _pw_re_Cmt = document.getElementById('pw_reCmt');
  var name = document.signUpForm.name;
  var nameCmt = document.getElementById('nameCmt');
  var age = document.signUpForm.age;
  var _ageCmt = document.getElementById('ageCmt');
  var gender = document.signUpForm.gender;
  var _genderCmt = document.getElementById('genderCmt');

  _emailCmt.innerHTML = '';
  _pwCmt.innerHTML = '';
  _pw_re_Cmt.innerHTML = '';
  nameCmt.innerHTML = '';
  _ageCmt.innerHTML = '';
  _genderCmt.innerHTML = '';

  if (email.value === "") {
    _emailCmt.innerHTML = "이메일을 입력해주세요";
    email.focus();
    return false;

  } else if (email.value.indexOf(" ") >= 0) {
    _emailCmt.innerHTML = "빈 칸을 채워주세요";
    email.focus();
    return false;

  } else if (!re_en.test(email.value)) {
    _emailCmt.innerHTML = "영어 또는 숫자를 입력해주세요";
    email.focus();
    return false;

  } else if (!re.test(email.value)) {
    _emailCmt.innerHTML = "올바른 이메일 주소를 입력해 주세요";
    email.focus();
    return false;

  } else if (email.value.length < 3) {
    _emailCmt.innerHTML = "3글자 이상 입력해주세요";
    email.focus();
    return false;

  } else if (pw.value === "") {
    _pwCmt.innerHTML = "비밀번호를 입력해주세요";
    pw.focus();
    return false;

  } else if (pw.value.indexOf(" ") >= 0) {
    _pwCmt.innerHTML = "빈 칸을 채워주세요";
    pw.focus();
    return false;

  } else if (pw.value.length < 4 || pw.value.length > 12) {
    _pwCmt.innerHTML = "4글자에서 12글자 사이를 입력해주세요";
    pw.focus();
    return false;

  } else if (pw_re.value === "") {
    _pw_re_Cmt.innerHTML = "비밀번호를 입력해주세요";
    pw_re.focus();
    return false;

  } else if (pw_re.value.indexOf(" ") >= 0) {
    _pw_re_Cmt.innerHTML = "빈 칸을 채워주세요";
    pw_re.focus();
    return false;

  } else if (pw_re.value.length < 4 || pw_re.value.length > 12) {
    _pw_re_Cmt.innerHTML = "4글자에서 12글자 사이로 입력해주세요";
    pw_re.focus();
    return false;

  } else if (pw.value !== pw_re.value) {
    _pw_re_Cmt.innerHTML = "비밀 번호를 일치시켜 주세요";
    pw_re.focus();
    return false;

  } else if (name.value === "") {
    nameCmt.innerHTML = "닉네임을를 입력해주세요";
    name.focus();
    return false;

  } else if (name.value.indexOf(" ") >= 0) {
    nameCmt.innerHTML = "빈 칸을 채워주세요";
    name.focus();
    return false;

  } else if (name.value.length < 4 || name.value.length > 12) {
    nameCmt.innerHTML = "4글자에서 12글자 사이로 입력해주세요";
    name.focus();
    return false;

  } else if (age.value === "") {
    _ageCmt.innerHTML = "나이를 입력해주세요";
    age.focus();
    return false;

  } else if (parseInt(age.value) < 0 || parseInt(age.value) > 150) {
    _ageCmt.innerHTML = "0부터 150 사이의 값을 입력해주세요";
    age.focus();
    return false;

  } else if (gender.value === "") {
    _genderCmt.innerHTML = "성별을 입력해주세요";
    age.focus();
    return false;

  } else {
    form.submit();

  }

}

/* id check with AJAX */
function idChk() {
  var _email = $('#email').val();

  $.ajax({
    url: "IdChk.aj?email=" + _email,
    success: function (data) {
      if (data == 'success') {
        alert('사용가능한 이메일입니다.');
      } else if (data == 'fail') {
        alert('중복된 이메일입니다. 다른 이메일을 입력해주세요');
      }
    }
  })
}

/* trigger btn when press enter */
function enterSignUp(btn) {
  var _email = document.signUpForm.email;
  var _pw = document.signUpForm.pw;
  var _pw_re = document.signUpForm.pw_re;
  var _name = document.signUpForm.name;
  var _age = document.signUpForm.age;

  var _btn = document.getElementById(btn);

  _email.addEventListener('keyup', function (event) {
    if (event.keyCode === 13) {
      _btn.click();
    }
  });

  _pw.addEventListener('keyup', function () {
    if (event.keyCode === 13) {
      _btn.click();
    }
  });

  _pw_re.addEventListener('keyup', function () {
    if (event.keyCode === 13) {
      _btn.click();
    }
  });

  _name.addEventListener('keyup', function () {
    if (event.keyCode === 13) {
      _btn.click();
    }
  });

  _age.addEventListener('keyup', function () {
    if (event.keyCode === 13) {
      _btn.click();
    }
  });

}