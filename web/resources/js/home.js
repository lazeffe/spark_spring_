
/* click mobile menu*/
function clickMobileBtn(mobileBtn, mobileMenu) {
  var _mobileBtn = document.querySelector(mobileBtn);
  var _mobileMenu = document.querySelector(mobileMenu);

  $(_mobileBtn).click(function () {
    $(_mobileMenu).slideToggle("slow");
  });
}

/* click searchbar */
function clickSearchbar(searchbar, hideItems, offset) {
  var _searchbar = document.querySelector(searchbar);
  var _hideItems = document.querySelector(hideItems);
  var _offset = document.querySelector(offset);

  $(_searchbar).click(function () {
    $(_hideItems).hide("slow", function () {
      var offset = $(_offset).offset();
      $("html body").animate({scrollTop: offset.top}, 2000);
    });
  });
}

/* chk validation of searching */
function chkSearching(searchBtn, searchBar, valCmt) {
  var _searchBtn = document.querySelector(searchBtn);
  var _searchBar = document.querySelector(searchBar);
  var _valCmt = document.getElementById(valCmt);

  $(_searchBtn).click(function () {

    if ($(_searchBar).val().length === 0) {
      _valCmt.innerHTML = "검색창에 주차장을 입력해주세요";
      return false;
    } else if ($('#tags').val().length < 3) {
      _valCmt.innerHTML = "세 글자 이상 입력해주세요";
      return false;
    } else {
      return true;
    }
  });
}
