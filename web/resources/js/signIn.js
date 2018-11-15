
/* chk sign in */

  function chkSignIn() {

    var form = document.signInForm;
    var email = document.signInForm.email;
    var _emailCmt = document.getElementById('emailCmt');
    var re_en = /^[\x00-\x7F]+$/i;
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    var pw = document.signInForm.pw;
    var _pwCmt = document.getElementById('pwCmt');

    _emailCmt.innerHTML = '';
    _pwCmt.innerHTML = '';

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

    } else {
      form.submit();

    }
  }

/* trigger btn when press enter */
function enterSignIn(btn) {
  var _email = document.signInForm.email;
  var _pw = document.signInForm.pw;
  var _btn = document.getElementById(btn);

  _email.addEventListener('keyup', function (event) {
    if (event.keyCode === 13) {
      // Trigger the button element with a click
      _btn.click();
    }
  });

  _pw.addEventListener('keyup', function () {
    if (event.keyCode === 13) {
      // Trigger the button element with a click
      _btn.click();
    }
  });

}
