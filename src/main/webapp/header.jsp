<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>FESTOPIA | Find Seoul's Beat!</title>

    <!-- =============== Jquery =============== -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- Jquery UI JS파일 -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Jquery UI CSS파일 -->
    <link
      rel="stylesheet"
      href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
    />

    <!-- =============== favicon =============== -->
    <link
      rel="icon"
      href="resources/resources/favicon.png"
      type="image/x-icon"
    />

    <!-- =============== REMIXICONS =============== -->
    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
      rel="stylesheet"
    />

    <!-- =============== bootstrap =============== -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>

    <!-- ========== 스타일 적용 ========== -->
    <link rel="stylesheet" href="../../resources/css/reset.css" />
    <link rel="stylesheet" href="./resources/css/header.css" />

    <!-- ========== 글꼴 ========== -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Lilita+One&family=Dongle&family=Poor+Story&family=Poor+Story&family=Sunflower:wght@300&display=swap"
      rel="stylesheet"
    />

    <!-- ========== 아이콘 추가 ========== -->
    <script src="https://kit.fontawesome.com/cbb1359000.js" crossorigin="anonymous" ></script>
  </head>

  <body>
    <header>
      <div id="logo">
        <a href="/">FESTOPIA</a>
      </div>

      <div id="btnPac">
        <div class="container">
          <form
            action="search"
            class="search"
            id="search-bar"
            name="name"
            onsubmit="return OnClick()"
          >
            <input
              type="search"
              placeholder="Dive into FESTOPIA!"
              name="inputFesName"
              class="search__input"
              autocomplete="off"
            />
            <div class="cateFilter" style="display: none">
              <div class="searchFilter">
                <div class="category">
                  <h5 class="search-filter-title">카테고리</h5>
                  <input
                    type="checkbox"
                    class="btn-check"
                    id="btn-check-1"
                    name="checkFesCate"
                    value="1"
                    autocomplete="off"
                    checked="checked"
                  />
                  <label class="btn category-btn" for="btn-check-1"
                    >교육/체험</label
                  >
                  <input
                    type="checkbox"
                    class="btn-check"
                    id="btn-check-2"
                    name="checkFesCate"
                    value="2"
                    autocomplete="off"
                    checked="checked"
                  />
                  <label class="btn category-btn" for="btn-check-2">국악</label>
                  <input
                    type="checkbox"
                    class="btn-check"
                    id="btn-check-3"
                    name="checkFesCate"
                    value="3"
                    autocomplete="off"
                    checked="checked"
                  />
                  <label class="btn category-btn" for="btn-check-3">기타</label>
                  <input
                    type="checkbox"
                    class="btn-check"
                    id="btn-check-4"
                    name="checkFesCate"
                    value="4"
                    autocomplete="off"
                    checked="checked"
                  />
                  <label class="btn category-btn" for="btn-check-4"
                    >독주/독창회</label
                  >
                  <input
                    type="checkbox"
                    class="btn-check"
                    id="btn-check-5"
                    name="checkFesCate"
                    value="5"
                    autocomplete="off"
                    checked="checked"
                  />
                  <label class="btn category-btn" for="btn-check-5">무용</label>
                  <input
                    type="checkbox"
                    class="btn-check"
                    id="btn-check-6"
                    name="checkFesCate"
                    value="6"
                    autocomplete="off"
                    checked="checked"
                  />
                  <label class="btn category-btn" for="btn-check-6"
                    >뮤지컬/오페라</label
                  ><br />
                  <input
                    type="checkbox"
                    class="btn-check"
                    id="btn-check-7"
                    name="checkFesCate"
                    value="7"
                    autocomplete="off"
                    checked="checked"
                  />
                  <label class="btn category-btn" for="btn-check-7">연극</label>
                  <input
                    type="checkbox"
                    class="btn-check"
                    id="btn-check-8"
                    name="checkFesCate"
                    value="8"
                    autocomplete="off"
                    checked="checked"
                  />
                  <label class="btn category-btn" for="btn-check-8">영화</label>
                  <input
                    type="checkbox"
                    class="btn-check"
                    id="btn-check-9"
                    name="checkFesCate"
                    value="9"
                    autocomplete="off"
                    checked="checked"
                  />
                  <label class="btn category-btn" for="btn-check-9"
                    >전시/미술</label
                  >
                  <input
                    type="checkbox"
                    class="btn-check"
                    id="btn-check-10"
                    name="checkFesCate"
                    value="10"
                    autocomplete="off"
                    checked="checked"
                  />
                  <label class="btn category-btn" for="btn-check-10"
                    >축제</label
                  >
                  <input
                    type="checkbox"
                    class="btn-check"
                    id="btn-check-11"
                    name="checkFesCate"
                    value="11"
                    autocomplete="off"
                    checked="checked"
                  />
                  <label class="btn category-btn" for="btn-check-11"
                    >콘서트</label
                  >
                  <input
                    type="checkbox"
                    class="btn-check"
                    id="btn-check-12"
                    name="checkFesCate"
                    value="12"
                    autocomplete="off"
                    checked="checked"
                  />
                  <label class="btn category-btn" for="btn-check-12"
                    >클래식</label
                  >
                </div>

                <br>
                <br>

                <div class="search-option-2">
                  <div class="fesDate">
                    <h5 class="search-filter-title">기간</h5>
                    <div id="dateSetParty">
                      <div class="date-select-wrap">
                        <select name="checkDateSelect" id="checkDateSelect">
                          <option value="targetStart">시작일</option>
                          <option value="targetEnd">종료일</option>
                        </select>
                        &nbsp; &nbsp;
                        <input
                          type="text"
                          class="datepicker"
                          id="startDatepicker"
                          name="checkStartDate"
                          autocomplete="off"
                        />
                        &nbsp;~&nbsp;
                        <input
                          type="text"
                          class="datepicker"
                          id="endDatepicker"
                          name="checkEndDate"
                          autocomplete="off"
                        />
                      </div>
                      <div class="period-select-wrap">
                        <button type="button" class="dateSetBtn" id="totalDate">
                          전체
                        </button>
                        <button type="button" class="dateSetBtn" id="today">
                          오늘
                        </button>
                        <button type="button" class="dateSetBtn" id="1week">
                          일주일
                        </button>
                        <button type="button" class="dateSetBtn" id="1month">
                          한달
                        </button>
                        <button type="button" class="dateSetBtn" id="1year">
                          일년
                        </button>
                      </div>
                    </div>
                  </div>

                  <div class="checkfeeStatus">
                    <h5 class="search-filter-title">입장료</h5>
                    <div class="fee-chk-box">
                      <label class="fee-chk-box01"
                        ><input
                          type="checkbox"
                          name="checkFeeStatus"
                          value="1"
                          checked
                        />
                        유료</label
                      >
                      <label
                        ><input
                          type="checkbox"
                          name="checkFeeStatus"
                          value="2"
                          checked
                        />
                        무료</label
                      >
                    </div>
                  </div>
                </div>

                <div id="searchFilterButton">
                  <input type="submit" value="DIVE!!" id="diveButton" />
                  <i class="fa-solid fa-xmark closeSearchFilter"></i>
                </div>
              </div>
            </div>
            <div class="search__button" id="search-button">
              <i class="ri-search-2-line search__icon"></i>
              <i class="ri-close-line search__close closeAllSearchFilter"></i>
            </div>
          </form>

          <!-- ========== 로그인 ========== -->
          <button
            class="btn btn-secondary dropdown-toggle accountBtn"
            id="anonymousUser"
            type="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            <i class="fa-solid fa-circle-user"></i>
          </button>

          <!-- ========== 공지사항 ========== -->
          <sec:authentication property="principal" var="user" />

			<div style="display: none">
          <a href="/board" id="inform">
            <i class="fa-solid fa-circle-exclamation fa-2xl"></i
          ></a>
          </div>

          <ul class="dropdown-menu">
            <c:choose>
              <c:when test="${user == 'anonymousUser'}">
                <li>
                  <button
                    type="button"
                    class="dropdown-item"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                    id="login-trigger"
                  >
                    Log in
                  </button>
                </li>

                <li>
                  <button
                    type="button"
                    class="dropdown-item"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal2"
                    id="regi-trigger"
                  >
                    Sign up
                  </button>
                </li>
              </c:when>
              <c:otherwise>
                <sec:authorize
                  access="hasRole('ROLE_ADMIN') and isAuthenticated()"
                />
                <li id="currentNick">Welcome, ${user.nickname}</li>
                <li><a class="dropdown-item" href="/mypage">My page</a></li>
                <li><a class="dropdown-item" href="/logout">Log out</a></li>
              </c:otherwise>
            </c:choose>
          </ul>
        </div>
      </div>

      <!-- ========== 로그인 Modal ========== -->
      <div
        class="modal fade"
        id="exampleModal"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Hello!</h1>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body login-modal">
              <jsp:include page="/WEB-INF/views/login.jsp" />
            </div>
          </div>
        </div>
      </div>

      <!-- ========== 회원가입 Modal ========== -->
      <div
        class="modal fade"
        id="exampleModal2"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Welcome!</h1>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <jsp:include page="/WEB-INF/views/register.jsp" />
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- js 적용 -->
    <script src="resources/js/header.js"></script>
  </body>
</html>

