<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/inc/header.jsp" %>

    <main id="main" class="main">
      <div class="auth">
        <h1 class="logo"><span class="logo__img"><span class="blind">하루사용기</span></span></h1>

        <article class="auth__content">
          <h2 class="auth__title">회원가입 완료</h2>

          <div class="auth__notice">
            <p class="auth__notice-text">
              안녕하세요! <span class="point">${param.user_id}</span>님! <br>
              회원가입을 진심으로 축하합니다! <br>
              하루사용기와 함께 가계기록을 쉽고 간편하게 관리해보세요.
            </p>
          </div>
          <div class="auth__btn-wrap">
            <a href="login.do" class="c-button auth__btn-login default large" >로그인하기</a>
          </div>
        </article>
      </div>
    </main>
    
<%@ include file="/inc/footer.jsp" %>