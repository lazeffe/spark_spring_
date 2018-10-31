/* chk delete pw */

function deleteAcc() {
  var form = document.deleteAccForm;
  var _pw = form.pw;
  var _pwCmt = document.getElementById('deleteCmt');

  _pwCmt.innerHTML = '';

  if (_pw.value === "") {
    _pwCmt.innerHTML = "비밀번호를 입력해주세요";
    _pw.focus();
    return false;

  } else if (_pw.value.indexOf(" ") >= 0) {
    _pwCmt.innerHTML = "빈 칸을 채워주세요";
    _pw.focus();
    return false;

  } else if (_pw.value.length < 4 || _pw.value.length > 12) {
    _pwCmt.innerHTML = "4글자에서 12글자 사이를 입력해주세요";
    _pw.focus();
    return false;

  } else {
    deleteAcc_AJAX(_pw);

  }
}

/* trigger btn when press enter */
function enterDeleteAcc(btn) {
  var _pw = document.deleteAccForm.pw;
  var _btn = document.getElementById(btn);

  _pw.addEventListener('keyup', function (event) {
    if (event.keyCode === 13) {
      _btn.click();
    }
  });
}

