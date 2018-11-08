<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${ sessionScope.name }" var="name"/>
<c:set value="${ sessionScope.email }" var="email"/>
<%--@elvariable id="bookmarkList" type="java.util.List"--%>
<c:set value="${ bookmarkList }" var="list"/>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <div class="modal-header-title">즐겨찾기</div>
    </div>
    <c:forEach items="${ bookmarkList }" var="list" varStatus="status">
      <c:set value="${ list.BOOKMARK_NAME }" var="bmkName"/>
      <c:set value="${ status.count }" var="cnt"/>
      <c:set value="${ status.first }" var="first"/>
      <c:set value="${ status.last }" var="last"/>
      <div class="modal-body-Wrapper">
        <div class="modal-body" id="${ cnt }">
          <div class="modal-body-left" onclick="goContentPage('${ list.BOOKMARK_NAME }')">
            <div class="modal-body-title">${ list.BOOKMARK_NAME }</div>
            <div class="modal-body-addr">${ list.BOOKMARK_ADDR }</div>
            <div class="modal-body-tel">${ list.BOOKMARK_TEL }</div>
          </div>
          <div class="modal-body-right">
            <div class="modal-body-icon">
              <button onclick="deleteBmk('${ email }', '${ bmkName }', '${ cnt }')">
                <i class="material-icons">bookmark</i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
    <div class="modal-footer">
      <div>Presented by BOH</div>
    </div>
  </div>
</div>