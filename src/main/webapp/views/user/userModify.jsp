<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/inc/header.jsp" %>

    <main id="main" class="main">
      <div class="auth">
        <h2 class="logo"><span class="logo__img"><span class="blind">하루사용기</span></span></h2>

        <article class="auth__content">
          <h2 class="auth__title">개인정보 변경</h2>

          <form class="auth__form" name="userModify" action="userModify.do" method="post">
            <div class="auth__login">
              <div class="auth__login-item">
                <label class="auth__login-title" for="loginId">이메일</label>
                <div class="c-input">
                  <div class="input-wrap large">
                     <input class="input" type="email" value="${sessionScope.user_id}" id="loginId" name="user_id" disabled readonly>
                  </div>
                </div>
              </div>
              <div class="auth__login-item">
                <label class="auth__login-title" for="loginPw">변경할 비밀번호</label>
                <div class="c-input">
                  <div class="input-wrap large">
                    <input class="input masking" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" title="영어와 숫자, 특수문자를 포함해 8~16자리 숫자로 입력해주세요." type="password" placeholder="변경할 비밀번호를 입력해 주세요." id="loginPw" name="user_pass">
                    <button type="button" class="input__masking">
                      <i class="ico ico--pw-hide"><svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 24 24" aria-hidden="true" style="opacity: 1;"><title lang="en"></title><path id="패스_767" data-name="패스 767" d="M0,0H24V24H0ZM0,0H24V24H0ZM0,0H24V24H0ZM0,0H24V24H0Z" fill="none"></path><path class="white" id="패스_768" data-name="패스 768" d="M12,6.5a4.938,4.938,0,0,1,4.76,6.46l3.06,3.06A11.8,11.8,0,0,0,23,11.49,11.838,11.838,0,0,0,8.36,4.57l2.17,2.17A5.14,5.14,0,0,1,12,6.5ZM2.71,3.16a1,1,0,0,0,0,1.41L4.68,6.54A11.892,11.892,0,0,0,1,11.5a11.8,11.8,0,0,0,15.31,6.68l2.72,2.72a1,1,0,1,0,1.41-1.41L4.13,3.16A1.008,1.008,0,0,0,2.71,3.16ZM12,16.5a5,5,0,0,1-5-5,4.911,4.911,0,0,1,.49-2.14l1.57,1.57A3.434,3.434,0,0,0,9,11.5a3,3,0,0,0,3,3,2.694,2.694,0,0,0,.57-.07L14.14,16A4.813,4.813,0,0,1,12,16.5Zm2.97-5.33a2.969,2.969,0,0,0-2.64-2.64Z"></path></svg></i>
                      <i class="ico ico--pw-show"><svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 24 24" aria-hidden="true" style="opacity: 1;"><title lang="en"></title><path id="패스_840" data-name="패스 840" d="M0,0H24V24H0Z" fill="none"></path><path class="white" id="패스_841" data-name="패스 841" d="M12,4A11.827,11.827,0,0,0,1,11.5a11.817,11.817,0,0,0,22,0A11.827,11.827,0,0,0,12,4Zm0,12.5a5,5,0,1,1,5-5A5,5,0,0,1,12,16.5Zm0-8a3,3,0,1,0,3,3A3,3,0,0,0,12,8.5Z"></path></svg></i>
                    </button>
                  </div>
                </div>
              </div>
              <div class="auth__login-item">
                <label class="auth__login-title" for="loginPhone">변경할 연락처</label>
                <div class="c-input">
                  <div class="input-wrap large">
                    <input class="input" type="tel" placeholder="변경할 연락처를 입력해주세요." pattern="0(10|11|16|17|18|19|70)[0-9]{8}" title="연락처 형식으로 입력해주세요. (예: 01012345678)" id="loginPhone" name="user_phone">
                  </div>
                </div>
              </div>

              <!-- <div class="auth__login-item auth__login-item--addr">
                <label class="auth__login-title" for="loginPostBtn">변경할 주소</label>
                <div class="auth__login-addr">
                  <div class="auth__login-post">
                    <div class="c-input">
                      <label class="input-wrap large">
                        <input class="input" pattern="" type="text" placeholder="우편번호를 검색해주세요" id="loginPost" readonly>
                      </label>
                    </div>
                    <button type="button" class="c-button auth__btn-post tertiary large" id="loginPostBtn">우편번호 검색</button>
                  </div>
                  <div class="auth__login-input-group">
                    <div class="c-input">
                      <label class="input-wrap large">
                        <input class="input" pattern="" type="text" placeholder="주소" id="loginAddr1" readonly>
                      </label>
                    </div>
                    <div class="c-input">
                      <label class="input-wrap large">
                        <input class="input" pattern="" type="text" placeholder="상세 주소를 입력해주세요." id="loginAddr2">
                      </label>
                    </div>
                  </div>
                </div>
              </div> -->
            </div>

            <div class="auth__btn-wrap">
              <button type="submit" class="c-button auth__btn-login default large">회원 정보 변경하기</button>
              <div class="auth__init">
                <a href="withdraw_view.do" class="auth__init-link auth__init-link--red">회원 탈퇴하기</a>
              </div>
            </div>
          </form>
        </article>
      </div>
    </main>
    
<%@ include file="/inc/footer.jsp" %>