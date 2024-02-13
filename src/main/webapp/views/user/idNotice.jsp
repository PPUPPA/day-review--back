<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/inc/header.jsp" %>

    <main id="main" class="main">
      <div class="auth">
        <h1 class="logo"><span class="logo__img"><span class="blind">하루사용기</span></span></h1>

        <article class="auth__content">
          <h2 class="auth__title">이메일 찾기 완료</h2>

          <div class="auth__notice">
            <p class="auth__notice-text">
              안녕하세요! 회원님이 가입 시 사용한 이메일은 <br>
              <span class="point">${requestScope.user_id}</span> 입니다!
            </p>
          </div>
          <div class="auth__btn-wrap">
            <a href="login.do" class="c-button auth__btn-login default large" >로그인하기</a>
            <div class="auth__init">
              <span class="auth__init-text">비밀번호가 기억나지 않나요?</span>
              <a href="pwInquiry_view.do" class="auth__init-link">임시 비밀번호 발급</a>
            </div>
          </div>
        </article>
      </div>
    </main>
    
<%@ include file="/inc/footer.jsp" %>