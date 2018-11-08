/* go to detail page */
function goContentPage(name) {
  window.location.href = '/parkDetail.pa?PARKING_NAME=' + name;
}

/* Modal start */

// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn1 = document.getElementById("myBtn1");
var btn2 = document.getElementById("myBtn2");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
btn1.onclick = function () {
  modal.style.display = "block";
};

btn2.onclick = function () {
  modal.style.display = "block";
};

// When the user clicks on <span> (x), close the modal
span.onclick = function () {
  modal.style.display = "none";
};

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
  if (event.target === modal) {
    modal.style.display = "none";
  }
};

/* Modal end */

/* bmk delete action */
function deleteBmk(email, bmkName, cnt) {
  var _email = email;
  var _bmkName = bmkName;
  var _cnt = document.getElementById(cnt);
  console.log(_email);

  var r = confirm("이 주차장을 즐겨찾기에서 삭제하시겠습니까?");

  if (r === true) {

    $.ajax({
      url: "/deleteBmk.bo",
      type: 'GET',
      data: {
        email: _email,
        bmkName: _bmkName
      },

      success: function (data) {
        if (data === 'success') {
          alert('삭제 성공');
          _cnt.style.display = 'none';

        } else if (data === 'fail') {

        }
      }
    })
  } else {

  }
}
