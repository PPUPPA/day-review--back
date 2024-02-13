<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <footer id="footer" class="footer">
      <div class="footer__inner">
        <!-- <ul class="footer-util">
          <li class="footer-util__item"><a href="#" class="footer-util__link"><span>사이트맵</span></a></li>
        </ul> -->
        <p class="copy">&copy; 2023 Sunny. All rights reserved.</p>
      </div>
    </footer>
  </div>
  
  <div class="layer">
    <div class="dim">
      <!-- MODAL: read-record -->
      <div class="c-modal" data-modal="read-record">
        <button type="button" class="c-modal__btn--close">
          <span class="blind">닫기</span>
          <i class="ico ico--close"><svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 24 24" aria-hidden="true" style="opacity: 1;"><title lang="en"></title><rect data-name="사각형 1289" width="24" height="24" fill="none"></rect><path class="white" data-name="패스 668" d="M47.81,46.816l5.47-5.47a.75.75,0,0,0-1.061-1.06l-5.47,5.47-5.47-5.47a.75.75,0,0,0-1.061,1.06l5.47,5.47-5.47,5.47a.75.75,0,1,0,1.061,1.061l5.47-5.47,5.47,5.47a.75.75,0,1,0,1.061-1.061Z" transform="translate(-34.75 -34.766)"></path></svg></i>
        </button>
        <div class="c-modal__header">
          <h2 class="c-modal__title">2023년 12월 4일</h2>
          <p class="c-modal__sub-desc">
            <span class="read-record__count">총 4건</span>
            <span class="read-record__total">
              <span class="decrease">123,456원</span>
              <span class="increase">123,456원</span>
            </span>
          </p>
        </div>

        <div class="c-modal__content">
          <div class="read-record">
            <div class="read-record__inner">
              
              <ul class="read-record__list">
                <!-- TODO 지출/수입 구분 decrease / increase -->

                <!-- 식비: cg-food  카페/간식: cg-cafe 생활: cg-life  쇼핑: cg-shop
                교통: cg-traffic  주거/통신: cg-home  의료/건강: cg-pharm
                문화/여가: cg-culture 여행/숙박: cg-travel  교육/학습: cg-study -->

                <!-- 월급: cg-Isal  용돈: cg-Ipin 금융수입: cg-Ifin  기타수입: cg-Iother -->
                <li class="read-record__item cg-shop">
                  <button type="button" class="read-record__detail btn-modal" data-link="create-record">
                    <span class="read-record__name">
                      <strong class="desc">쿠팡 주식회사</strong>
                      <span class="category">쇼핑</span>
                    </span>
                    <span class="price decrease">123,456원</span>
                  </button>
                </li>
                <li class="read-record__item cg-shop">
                  <button type="button" class="read-record__detail btn-modal" data-link="create-record">
                    <span class="read-record__name">
                      <strong class="desc">쿠팡 주식회사</strong>
                      <span class="category">쇼핑</span>
                    </span>
                    <span class="price decrease">123,456원</span>
                  </button>
                </li>
                <li class="read-record__item cg-shop">
                  <button type="button" class="read-record__detail btn-modal" data-link="create-record">
                    <span class="read-record__name">
                      <strong class="desc">쿠팡 주식회사</strong>
                      <span class="category">쇼핑</span>
                    </span>
                    <span class="price decrease">123,456원</span>
                  </button>
                </li>
                <li class="read-record__item cg-shop">
                  <button type="button" class="read-record__detail btn-modal" data-link="create-record">
                    <span class="read-record__name">
                      <strong class="desc">쿠팡 주식회사</strong>
                      <span class="category">쇼핑</span>
                    </span>
                    <span class="price decrease">123,456원</span>
                  </button>
                </li>
                <li class="read-record__item cg-Isal">
                  <button type="button" class="read-record__detail btn-modal" data-link="create-record">
                    <span class="read-record__name">
                      <strong class="desc">주식회사 해바라기</strong>
                      <span class="category">월급</span>
                    </span>
                    <span class="price increase">123,456원</span>
                  </button>
                </li>
                <li class="read-record__item cg-shop">
                  <button type="button" class="read-record__detail btn-modal" data-link="create-record">
                    <span class="read-record__name">
                      <strong class="desc">쿠팡 주식회사</strong>
                      <span class="category">쇼핑</span>
                    </span>
                    <span class="price decrease">123,456원</span>
                  </button>
                </li>
                <li class="read-record__item cg-shop">
                  <button type="button" class="read-record__detail btn-modal" data-link="create-record">
                    <span class="read-record__name">
                      <strong class="desc">쿠팡 주식회사</strong>
                      <span class="category">쇼핑</span>
                    </span>
                    <span class="price decrease">123,456원</span>
                  </button>
                </li>
                <li class="read-record__item cg-shop">
                  <button type="button" class="read-record__detail btn-modal" data-link="create-record">
                    <span class="read-record__name">
                      <strong class="desc">쿠팡 주식회사</strong>
                      <span class="category">쇼핑</span>
                    </span>
                    <span class="price decrease">123,456원</span>
                  </button>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
	  <!-- // MODAL: read-record -->

	  <!-- MODAL: create-record -->
      <div class="c-modal" data-modal="create-record">
        <button type="button" class="c-modal__btn--close">
          <span class="blind">닫기</span>
          <i class="ico ico--close"><svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 24 24" aria-hidden="true" style="opacity: 1;"><title lang="en"></title><rect data-name="사각형 1289" width="24" height="24" fill="none"></rect><path class="white" data-name="패스 668" d="M47.81,46.816l5.47-5.47a.75.75,0,0,0-1.061-1.06l-5.47,5.47-5.47-5.47a.75.75,0,0,0-1.061,1.06l5.47,5.47-5.47,5.47a.75.75,0,1,0,1.061,1.061l5.47-5.47,5.47,5.47a.75.75,0,1,0,1.061-1.061Z" transform="translate(-34.75 -34.766)"></path></svg></i>
        </button>
        <div class="c-modal__header">
          <h2 class="c-modal__title">내역 추가</h2>
          <!-- <p class="c-modal__sub-desc"></p> -->
        </div>

        <div class="c-modal__content">
          <div class="create-record">
            <form class="record__form" name="record" action="#" method="post">
              <div class="create-record__switch">
                <div class="c-switch">
                  <ul class="c-switch__inner-list">
                    <li class="c-switch__inner-item">
                      <label class="c-switch__item-label">
                        <input
                          name="recordType"
                          type="radio"
                          value="decrease"
                          class="blind c-switch__radio"
                          checked
                        />
                        <span class="c-switch__item-text">지출</span>
                      </label>
                    </li>
                    <li class="c-switch__inner-item">
                      <label class="c-switch__item-label">
                        <input
                          name="recordType"
                          type="radio"
                          value="increase"
                          class="blind c-switch__radio"
                        />
                        <span class="c-switch__item-text">수입</span>
                      </label>
                    </li>
                  </ul>
                </div>
              </div>

              <div class="create-record__inner">
                <div class="create-record__item">
                  <label class="create-record__item-title required" for="recordDate">날짜</label>
                  <div class="c-input">
                    <div class="input-wrap large">
                      <input class="input" type="date" id="recordDate" required>
                    </div>
                  </div>
                </div>

                <div class="create-record__item">
                  <label class="create-record__item-title required" for="recordCate">분류</label>
                  <select hidden>
                    <option value="food">식비</option>
                    <option value="cafe">카페/간식</option>
                    <option value="life">생활</option>
                    <option value="shop">쇼핑</option>
                    <option value="traffic">교통</option>
                    <option value="home">주거/통신</option>
                    <option value="pharm">의료/건강</option>
                    <option value="culture">문화/여가</option>
                    <option value="travel">여행/숙박</option>
                    <option value="study">교육/학습</option>
                  </select>

                  <div class="c-select large">
                    <button type="button" class="c-select__button" id="recordCate">
                      <strong class="blind">분류 선택</strong>
                      <span class="c-select__label">
                        분류 선택
                      </span>
                    </button>
          
                    <ul class="c-select__opgroup">
                      <li class="c-select__option">
                        <button type="button" class="c-select__op-button">
                          <span>식비</span>
                        </button>
                      </li>
                      <li class="c-select__option">
                        <button type="button" class="c-select__op-button">
                          <span>카페/간식</span>
                        </button>
                      </li>
                      <li class="c-select__option">
                        <button type="button" class="c-select__op-button">
                          <span>생활</span>
                        </button>
                      </li>
                      <li class="c-select__option">
                        <button type="button" class="c-select__op-button">
                          <span>쇼핑</span>
                        </button>
                      </li>
                      <li class="c-select__option">
                        <button type="button" class="c-select__op-button">
                          <span>교통</span>
                        </button>
                      </li>
                      <li class="c-select__option">
                        <button type="button" class="c-select__op-button">
                          <span>주거/통신</span>
                        </button>
                      </li>
                      <li class="c-select__option">
                        <button type="button" class="c-select__op-button">
                          <span>의료/건강</span>
                        </button>
                      </li>
                      <li class="c-select__option">
                        <button type="button" class="c-select__op-button">
                          <span>문화/여가</span>
                        </button>
                      </li>
                      <li class="c-select__option">
                        <button type="button" class="c-select__op-button">
                          <span>여행/숙박</span>
                        </button>
                      </li>
                      <li class="c-select__option">
                        <button type="button" class="c-select__op-button">
                          <span>교육/학습</span>
                        </button>
                      </li>
                    </ul>
                  </div>
                </div>

                <div class="create-record__item">
                  <label class="create-record__item-title required" for="recordMoney">금액</label>
                  <div class="c-input">
                    <div class="input-wrap large">
                      <input class="input" type="text" id="recordMoney" placeholder="지출 금액을 입력해주세요." required>
                    </div>
                  </div>
                </div>

                <div class="create-record__item">
                  <label class="create-record__item-title required" for="recordDesc">내용</label>
                  <div class="c-input">
                    <div class="input-wrap large">
                      <input class="input" type="text" id="recordDesc" placeholder="내용을 입력해주세요." required>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>

        <div class="c-modal__footer">
          <button type="button" class="c-button secondary medium close">취소</button>
          <button type="button" class="c-button default medium">확인</button>
        </div>
      </div>
	  <!-- // MODAL: create-record -->

	  <!-- MODAL: auth-terms -->	  
      <div class="c-modal" data-modal="auth-terms">
        <button type="button" class="c-modal__btn--close">
          <span class="blind">닫기</span>
          <i class="ico ico--close"><svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 24 24" aria-hidden="true" style="opacity: 1;"><title lang="en"></title><rect data-name="사각형 1289" width="24" height="24" fill="none"></rect><path class="white" data-name="패스 668" d="M47.81,46.816l5.47-5.47a.75.75,0,0,0-1.061-1.06l-5.47,5.47-5.47-5.47a.75.75,0,0,0-1.061,1.06l5.47,5.47-5.47,5.47a.75.75,0,1,0,1.061,1.061l5.47-5.47,5.47,5.47a.75.75,0,1,0,1.061-1.061Z" transform="translate(-34.75 -34.766)"></path></svg></i>
        </button>
        <div class="c-modal__header">
          <h2 class="c-modal__title"></h2>
          <!-- <p class="c-modal__sub-desc"></p> -->
        </div>

        <div class="c-modal__content">
          <div class="terms-contents">
            <p class="terms-contents__textarea"></p>
          </div>
        </div>

        <div class="c-modal__footer">
          <!-- <button type="button" class="c-button secondary medium">취소</button> -->
          <button type="button" class="c-button default medium close">확인</button>
        </div>
      </div>
	  <!-- // MODAL: auth-terms -->
    </div>
  </div>
</body>
</html>