<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>하루사용기</title>
    <link rel="icon" href="assets/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/common.js"></script>
</head>
<body>
  <div id="root">
  	<c:if test="${not empty sessionScope.user_id}">
	    <header id="header" class="header">
	      <h1 class="logo"><a href="main.do" class="logo__img" title="메인으로 이동"><span class="blind">하루사용기</span></a></h1>
	
	      <nav class="gnb__wrap">
	        <h2 class="blind">주메뉴</h2>
	        <ul id="gnb" class="gnb">
	          <!-- TODO: is-active 선택된 메뉴 li에 클래스 추가
	          확인용 클래스 : first-child -->
	          <li class="gnb__item is-active"><a href="main.do" class="gnb__link">
	            <span>대시보드</span>
	          </a></li>
	          <!-- <li class="gnb__item"><a href="#" class="gnb__link">
	            <span>년별</span>
	          </a></li>
	          <li class="gnb__item"><a href="#" class="gnb__link">
	            <span>주별</span>
	          </a></li> -->
	          <li class="gnb__item"><a href="#" class="gnb__link">
	            <span>사용기</span>
	          </a></li>
	          <li class="gnb__item"><a href="#" class="gnb__link">
	            <span>가계분석</span>
	          </a></li>
	        </ul>
	      </nav>
	
	      <div class="header-util">
	        <button type="button" class="c-button tertiary small btn--add btn-modal" data-link="create-record">가계부 입력</button>
	        <div class="usermenu">
	          <button type="button" class="usermenu__button">
	            <strong class="blind">회원 메뉴</strong>
	            <span class="usermenu__account">
	              <span class="blind">현재 로그인 된 계정은 </span>
	              ${sessionScope.user_id}
	              <span class="blind">입니다.</span>
	            </span>
	          </button>
	
	          <ul class="usermenu__list">
	            <li class="usermenu__item">
	              <a href="userModify_view.do" class="usermenu__link" tabindex="-1">
	                <i class="ico ico--set"></i>
	                <span>정보수정</span>
	              </a>
	            </li>
	            <li class="usermenu__item">
	              <!-- TODO: 로그아웃 -->
	              <button type="button" onclick="logout();" class="usermenu__link" tabindex="-1">
	                <i class="ico ico--logout"></i>
	                <span>로그아웃</span>
	              </button>
	            </li>
	          </ul>
	        </div>
	      </div>
	    </header>
	    <script>
	    function logout() {
	       // 로그아웃
	       $.ajax({
	           type: "POST",
	           url: "logout.do",
	           success: function(data) {
	               console.log("로그아웃 성공");
	           },
	           error: function(xhr, status, error) {
	               console.error("로그아웃 실패\t"+textStatus + "(HTTP-" + xhr.status + ")");
	           }
	       });
	
	        // 쿠키 삭제 (예: user_id)
	        document.cookie = "user_id=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
	
	        // 로그아웃 후 리다이렉트 또는 추가적인 로직을 여기에 추가
	        window.location.href = 'login.do';
	    };
		</script>
    </c:if>