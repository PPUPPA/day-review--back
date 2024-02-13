<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/inc/header.jsp" %>


    <main id="main" class="main">
      <h2 class="blind">메인 컨텐츠</h2>
      <div class="dashboard">
        <article class="c-widget widget__calendar">
          <div class="c-widget__header">
            <div class="c-widget__title-wrap">
              <h3 class="c-widget__title c-calendar__month">2023년 11월</h3>
              <button type="button" class="c-button tertiary small btn--now">오늘</button>
            </div>
            <div class="c-widget__header-util">
              <button type="button" class="c-button icon medium c-calendar__month-btn c-calendar__month-btn--prev"><span class="blind">이전 달</span></button>
              <button type="button" class="c-button icon medium c-calendar__month-btn c-calendar__month-btn--next"><span class="blind">다음 달</span></button>
            </div>
          </div>

          <div class="c-widget__content">
            <div class="c-calendar-wrap">
              <div class="c-calendar">
                <div class="c-calendar__table-wrap">
                  <table class="c-calendar__table">
                    <caption class="blind">
                      캘린더
                    </caption>
                    <colgroup>
                      <col class="c-calendar__table-col" />
                      <col class="c-calendar__table-col" />
                      <col class="c-calendar__table-col" />
                      <col class="c-calendar__table-col" />
                      <col class="c-calendar__table-col" />
                      <col class="c-calendar__table-col" />
                      <col class="c-calendar__table-col" />
                    </colgroup>
                    <thead>
                      <tr>
                        <th scope="col">일</th>
                        <th scope="col">월</th>
                        <th scope="col">화</th>
                        <th scope="col">수</th>
                        <th scope="col">목</th>
                        <th scope="col">금</th>
                        <th scope="col">토</th>
                      </tr>
                    </thead>
                    <tbody>
                      <!-- JS DRAW AREA -->
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </article>

        <div class="dashboard__side">
          <article class="c-widget account-summary">
            <div class="c-widget__header">
              <div class="c-widget__title-wrap">
                <h3 class="c-widget__title">이달의 결산</h3>
              </div>
              <div class="c-widget__header-util">
                <button type="button" class="c-button tertiary small">내역 보기</button>
              </div>
            </div>
  
            <div class="c-widget__content">
              <div class="dashboard__account">
                <dl class="dashboard__account-def">
                  <dt class="dashboard__account-name">지출</dt>
                  <dd class="dashboard__account-price decrease">
                    <span class="price">123,456,789</span>
                    <span class="unit">원</span>
                  </dd>
                </dl>
                <dl class="dashboard__account-def">
                  <dt class="dashboard__account-name">수입</dt>
                  <dd class="dashboard__account-price increase">
                    <span class="price">123,456,789</span>
                    <span class="unit">원</span>
                  </dd>
                </dl>
              </div>
            </div>
          </article>

          <article class="c-widget account-category">
            <div class="c-widget__header">
              <div class="c-widget__title-wrap">
                <h3 class="c-widget__title">이달의 지출</h3>
              </div>
              <div class="c-widget__header-util">
                <button type="button" class="c-button tertiary small">전체 보기</button>
              </div>
            </div>
  
            <div class="c-widget__content">
              <div class="category-bar-wrap">
                <!-- <div class="widget-value">
                  <span class="font-value c-widget-number__value">
                    50<span class="unit">건</span>
                  </span>
                </div> -->

                <div class="category-bar">
                  <!-- TODO 카테고리별 노출, 카테고리별 클래스 / 퍼센트별 width -->
                  <!-- 식비: cg-food  카페/간식: cg-cafe 생활: cg-life  쇼핑: cg-shop
                  교통: cg-traffic  주거/통신: cg-home  의료/건강: cg-pharm
                  문화/여가: cg-culture 여행/숙박: cg-travel  교육/학습: cg-study -->
                  <div class="category-bar__bar cg-food" style="width:36%">
                    <div class="category-bar__tooltip">
                      <strong class="category-bar__tooltip-title">
                        <span class="category">식비</span>
                        <span class="proportion">36%</span>
                      </strong>
                      <ul class="category-bar__tooltip-list">
                        <li>
                          <span class="count">18건</span>
                        </li>
                      </ul>
                    </div>
                  </div>

                  <div class="category-bar__bar cg-shop" style="width:28%">
                    <div class="category-bar__tooltip">
                      <strong class="category-bar__tooltip-title">
                        <span class="category">쇼핑</span>
                        <span class="proportion">28%</span>
                      </strong>
                      <strong class="category"></strong>
                      <ul class="category-bar__tooltip-list">
                        <li class="count">
                          <span class="count">14건</span>
                        </li>
                      </ul>
                    </div>
                  </div>

                  <div class="category-bar__bar cg-cafe" style="width:16%">
                    <div class="category-bar__tooltip">
                      <strong class="category-bar__tooltip-title">
                        <span class="category">카페/간식</span>
                        <span class="proportion">16%</span>
                      </strong>
                      <ul class="category-bar__tooltip-list">
                        <li class="count">
                          <span class="count">8건</span>
                        </li>
                      </ul>
                    </div>
                  </div>

                  <div class="category-bar__bar cg-traffic" style="width:16%">
                    <div class="category-bar__tooltip">
                      <strong class="category-bar__tooltip-title">
                        <span class="category">교통/차량</span>
                        <span class="proportion">16%</span>
                      </strong>
                      <ul class="category-bar__tooltip-list">
                        <li class="count">
                          <span class="count">8건</span>
                        </li>
                      </ul>
                    </div>
                  </div>

                  <div class="category-bar__bar cg-culture" style="width:4%">
                    <div class="category-bar__tooltip">
                      <strong class="category-bar__tooltip-title">
                        <span class="category">문화/여가</span>
                        <span class="proportion">4%</span>
                      </strong>
                      <ul class="category-bar__tooltip-list">
                        <li class="count">
                          <span class="count">2건</span>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>

                <div class="category-legend">
                  <ul class="category-legend__list">
                    <!-- 식비: cg-food  카페/간식: cg-cafe 생활: cg-life  쇼핑: cg-shop
                    교통: cg-traffic  주거/통신: cg-home  의료/건강: cg-pharm
                    문화/여가: cg-culture 여행/숙박: cg-travel  교육/학습: cg-study -->
                    <li class="category-legend__item cg-food">
                      <span class="category-legend__name">
                        <strong class="category">식비</strong>
                        <span class="proportion">36%</span>
                        <span class="count">(18건)</span>
                      </span>
                      <span class="price">123,456원</span>
                    </li>
                    <li class="category-legend__item cg-shop">
                      <span class="category-legend__name">
                        <strong class="category">쇼핑</strong>
                        <span class="proportion">28%</span>
                        <span class="count">(14건)</span>
                      </span>
                      <span class="price">123,456원</span>
                    </li>
                    <li class="category-legend__item cg-cafe">
                      <span class="category-legend__name">
                        <strong class="category">카페/간식</strong>
                        <span class="proportion">16%</span>
                        <span class="count">(8건)</span>
                      </span>
                      <span class="price">123,456원</span>
                    </li>
                    <li class="category-legend__item cg-traffic">
                      <span class="category-legend__name">
                        <strong class="category">교통/차량</strong>
                        <span class="proportion">16%</span>
                        <span class="count">(8건)</span>
                      </span>
                      <span class="price">123,456원</span>
                    </li>
                    <li class="category-legend__item cg-culture">
                      <span class="category-legend__name">
                        <strong class="category">문화/여가</strong>
                        <span class="proportion">4%</span>
                        <span class="count">(2건)</span>
                      </span>
                      <span class="price">123,456원</span>
                    </li>
                    <li class="category-legend__item cg-life">
                      <span class="category-legend__name">
                        <strong class="category">생활</strong>
                        <span class="proportion">0%</span>
                        <span class="count">(-)</span>
                      </span>
                      <span class="price">0원</span>
                    </li>
                    <li class="category-legend__item cg-home">
                      <span class="category-legend__name">
                        <strong class="category">주거/통신</strong>
                        <span class="proportion">0%</span>
                        <span class="count">(-)</span>
                      </span>
                      <span class="price">0원</span>
                    </li>
                    <li class="category-legend__item cg-pharm">
                      <span class="category-legend__name">
                        <strong class="category">의료/건강</strong>
                        <span class="proportion">0%</span>
                        <span class="count">(-)</span>
                      </span>
                      <span class="price">0원</span>
                    </li>
                    <li class="category-legend__item cg-travel">
                      <span class="category-legend__name">
                        <strong class="category">여행/숙박</strong>
                        <span class="proportion">0%</span>
                        <span class="count">(-)</span>
                      </span>
                      <span class="price">0원</span>
                    </li>
                    <li class="category-legend__item cg-study">
                      <span class="category-legend__name">
                        <strong class="category">교육/학습</strong>
                        <span class="proportion">0%</span>
                        <span class="count">(-)</span>
                      </span>
                      <span class="price">0원</span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </article>
        </div>
      </div>
    </main>

<%@ include file="/inc/footer.jsp" %>
