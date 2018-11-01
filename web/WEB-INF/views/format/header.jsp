<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${ sessionScope.name }" var="name"/>
<c:set value="${ sessionScope.email }" var="email"/>

<nav class="nav">
  <div class="navWrapper">
    <div class="navContents">
      <div class="navItem-brand">
        <span><a class="navItem-brand-icon" href="/home.ho">Spark</a></span>
      </div>
      <div class="navItem-account">
        <c:choose>
          <c:when test="${ name eq null }">
            <div class="dropdown" style="float:right;">
              <div class="dropBtn"><i class="material-icons icon-account">account_circle</i></div>
              <div class="dropdown-content">
                <a href="/signIn.me">로그인</a>
                <a href="/signUp.me">회원 가입</a>
              </div>
            </div>
          </c:when>
          <c:when test="${ name ne null }">
            <div class="dropdown" style="float:right;">
              <div class="dropBtn"><span>${ name }</span><i class="material-icons" id="arrow">arrow_drop_down</i></div>
              <div class="dropdown-content">
                <a id="myBtn1">즐겨찾기</a>
                <a href="/memberViewAction.me?email=${ email }">계 정</a>
                <a href="/memberLogoutAction.me">로그 아웃</a>
              </div>
            </div>
          </c:when>
        </c:choose>
      </div>
      <c:choose>
        <c:when test="${ name eq null}">
          <div class="navItem-btn"><i class="material-icons" id="navMenu-mobile-btn1">view_headline</i></div>
        </c:when>
        <c:when test="${ name ne null}">
          <div class="navItem-btn"><div id="navMenu-mobile-btn2"><span>${ name }</span><i class="material-icons" >arrow_drop_down</i></div></div>
        </c:when>
      </c:choose>
    </div>
  </div>
  <c:choose>
    <c:when test="${ name eq null}">
      <div class="navMenu-mobile-Wrapper">
        <div class="navMenu-mobile" id="navMenu-mobile1">
          <div class="navItem-mobile-li"><a href="/Signin.me">로그인</a></div>
          <div class="navItem-mobile-li"><a href="/Signup.me">회원 가입</a></div>
        </div>
      </div>
    </c:when>
    <c:when test="${ name ne null}">
      <div class="navMenu-mobile-Wrapper">
        <div class="navMenu-mobile" id="navMenu-mobile2">
          <div class="navItem-mobile-li"><a id="myBtn2">즐겨찾기</a></div>
          <div class="navItem-mobile-li"><a href="/MemberViewAction.me?email=${ email }">계 정</a></div>
          <div class="navItem-mobile-li"><a href="/MemberLogoutAction.me">로그 아웃</a></div>
        </div>
      </div>
    </c:when>
  </c:choose>
</nav>