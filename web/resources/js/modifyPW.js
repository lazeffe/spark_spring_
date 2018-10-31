/* chk modify pw */

function modifyPW() {
  var _form = document.modifyPWForm;
  var _old_pw = _form.old_pw;
  var _old_pwCmt = document.getElementById('oldPw-Cmt');
  var _new_pw = _form.new_pw;
  var _new_pwCmt = document.getElementById('newPw-Cmt');
  var _new_pw_re = _form.new_pw_re;
  var _new_pw_reCmt = document.getElementById('newPw_re-Cmt');


  _old_pwCmt.innerHTML = '';
  _new_pwCmt.innerHTML = '';
  _new_pw_reCmt.innerHTML = '';

  if (_old_pw.value === "") {
    _old_pwCmt.innerHTML = "현재 비밀번호를 입력해주세요";
    _old_pw.focus();
    return false;

  } else if (_old_pw.value.indexOf(" ") >= 0) {
    _old_pwCmt.innerHTML = "빈 칸을 채워주세요";
    _old_pw.focus();
    return false;

  } else if (_old_pw.value.length < 4 || _old_pw.value.length > 12) {
    _old_pwCmt.innerHTML = "4글자에서 12글자 사이를 입력해주세요";
    _old_pw.focus();
    return false;

  } else if (_new_pw.value === "") {
    _new_pwCmt.innerHTML = "새 비밀번호를 입력해주세요";
    _new_pw.focus();
    return false;

  } else if (_new_pw.value.indexOf(" ") >= 0) {
    _new_pwCmt.innerHTML = "빈 칸을 채워주세요";
    _new_pw.focus();
    return false;

  } else if (_new_pw.value.length < 4 || _new_pw.value.length > 12) {
    _new_pwCmt.innerHTML = "4글자에서 12글자 사이를 입력해주세요";
    _new_pw.focus();
    return false;

  } else if (_new_pw.value !== _new_pw_re.value) {
    _new_pw_reCmt.innerHTML = "비밀 번호를 일치시켜 주세요";
    _new_pw_reCmt.focus();
    return false;

  } else if (_old_pw.value === _new_pw.value) {
    _new_pw_reCmt.innerHTML = "새로운 비밀번호가 현재 비밀번호와 동일합니다";
    _new_pw_reCmt.focus();
    return false;

  } else {
    modifyPW_AJAX(_old_pw, _new_pw);

  }
}


/* trigger btn when press enter */
function enterModifyPW(btn) {
  var _old_pw = document.modifyPWForm.old_pw;
  var _new_pw = document.modifyPWForm.new_pw;
  var _new_pw_re = document.modifyPWForm.new_pw_re;

  var _btn = document.getElementById(btn);

  _old_pw.addEventListener('keyup', function (event) {
    if (event.keyCode === 13) {
      // Trigger the button element with a click
      _btn.click();
    }
  });

  _new_pw.addEventListener('keyup', function () {
    if (event.keyCode === 13) {
      // Trigger the button element with a click
      _btn.click();
    }
  });

  _new_pw_re.addEventListener('keyup', function () {
    if (event.keyCode === 13) {
      // Trigger the button element with a click
      _btn.click();
    }
  });

}

