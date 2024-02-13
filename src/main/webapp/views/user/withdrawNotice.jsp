<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/inc/header.jsp" %>

    <main id="main" class="main">
      <div class="auth">
        <h1 class="logo"><span class="logo__img"><span class="blind">하루사용기</span></span></h1>

        <article class="auth__content">
          <h2 class="auth__title">회원탈퇴 완료</h2>

          <div class="auth__notice">
            <p class="auth__notice-text">
              회원탈퇴가 완료되었습니다. <br>
              하루사용기를 이용해주시고 사랑해주셔서 감사합니다. <br>
              더욱더 노력하고 발전하는 하루사용기가 되겠습니다. <br>
            </p>
          </div>
          <div class="auth__btn-wrap">
            <a href="login.do" class="c-button auth__btn-login default large" >확인</a>
          </div>
        </article>
      </div>
    </main>
    
<%@ include file="/inc/footer.jsp" %>