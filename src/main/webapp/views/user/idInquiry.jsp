<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/inc/header.jsp" %>

    <main id="main" class="main">
      <div class="auth">
        <h1 class="logo"><span class="logo__img"><span class="blind">하루사용기</span></span></h1>

        <article class="auth__content">
          <h2 class="auth__title">이메일 찾기</h2>

          <form class="auth__form" name="findId" action="idInquiry.do" method="post">
            <div class="auth__login">
              <div class="auth__login-item">
                <label class="auth__login-title required" for="loginPhone">연락처</label>
                <div class="c-input">
                  <div class="input-wrap large">
	                  <input class="input" type="tel" placeholder="회원가입 시 입력한 연락처를 입력해주세요." pattern="0(10|11|16|17|18|19|70)[0-9]{8}" title="연락처 형식으로 입력해주세요. (예: 01012345678)" id="loginPhone" name="user_phone" required>
                  </div>
                </div>
              </div>
            </div>

            <div class="auth__btn-wrap">
              <button type="submit" class="c-button auth__btn-login default large" disabled>가입한 이메일 찾기</button>
              <div class="auth__init">
                <button type="button" onclick="history.go(-1); return false;" class="auth__init-link">이전 화면으로 돌아가기</button>
              </div>
            </div>
          </form>
        </article>
      </div>
      
		<script>
		  $(function () {
		    // input event
		    $('form[name="findId"] input').on('input', function () {
		      // 입력된 값이 있는지 확인
		      var allInputsFilled = true;
		      $('form[name="findId"] input').each(function () {
		        if ($(this).val().trim() === '') {
		          allInputsFilled = false;
		          return false; // 하나라도 값이 비어있으면 반복문 종료
		        }
		      });
		
		      // 모든 입력 요소가 값으로 채워져 있으면 로그인하기 버튼의 disabled 속성 제거
		      $('.auth__btn-login').prop('disabled', !allInputsFilled);
		    });
		  });
		</script>
    </main>
    
<%@ include file="/inc/footer.jsp" %>