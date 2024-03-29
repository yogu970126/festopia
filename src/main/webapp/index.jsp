<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>FESTOPIA | Find Seoul's Beat!</title>
    <!-- ========== 파비콘 ========== -->
    <link rel="icon" href="resources/resources/favicon.png" type="image/x-icon" />

    <!-- ========== 스타일 적용 ========== -->
    <link rel="stylesheet" href="../../resources/css/reset.css" />
    <link rel="stylesheet" href="./resources/css/index.css" />

    <!-- ========== 글꼴 ========== -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Lilita+One&family=Dongle&family=Poor+Story&family=Poor+Story&family=Sunflower:wght@300&display=swap"
      rel="stylesheet"
    />

    <!-- ========== Full Calendar ========== -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
  </head>

  <body>
    <jsp:include page="/header.jsp" />

    <!-- ========== 프로그레스 바 ==========
    <div class="progress-bar-container">
      <div class="progress-bar"></div>
    </div> -->

    <main id="main-wrap">
      <!-- ========== 섹션이동 버튼 ========== -->
      <div class="section-btn-container">
        <div class="section-btn">
          <a href="#section1">
            <img src="./resources/resources/favicon.png" />
          </a>
        </div>
        <div class="section-btn">
          <a href="#section2">
            <img src="./resources/resources/favicon.png" />
          </a>
        </div>
        <div class="section-btn">
          <a href="#section3">
            <img src="./resources/resources/favicon.png" />
          </a>
        </div>
      </div>

      <!-- ========== section1 ========== -->
      <div
        id="carouselExampleFade"
        class="carousel slide carousel-fade"
        data-bs-ride="carousel"
      >
        <div class="carousel-inner" id="section1">
          <div class="carousel-item active slider1">
            <div class="carousel-inner-text">
              <h1>FESTOPIA</h1>
              <p>Find Seoul's Beat, Dive into FESTOPIA!</p>
            </div>
            <img
              src="./resources/resources/bg-3d-balloons.jpeg"
              class="d-block w-100"
            />
          </div>

          <div class="carousel-item slider2">
            <div class="carousel-inner-text">
              <h1>FESTOPIA</h1>
              <p>Find Seoul's Beat, Dive into FESTOPIA!</p>
            </div>
            <img
              src="./resources/resources/bg-pink-blue-water.jpeg"
              class="d-block w-100"
            />
          </div>
          <div class="carousel-item slider3">
            <div class="carousel-inner-text">
              <h1>FESTOPIA</h1>
              <p>Find Seoul's Beat, Dive into FESTOPIA!</p>
            </div>
            <img
              src="././resources/resources/bg-pink-3d-balls.jpeg"
              class="d-block w-100"
            />
          </div>
        </div>
      </div>
      <!-- ========== section2 ========== -->
      <section class="popular" id="section2">
        <h2 id="section-title">
          <img id="section-title-img" src="./resources/resources/best.png" />
          THE 4 BEST Seoul Festivals
        </h2>
        <div class="popular-festival-list"></div>
      </section>

      <!-- ========== section3 ========== -->
      <section id="section3">
        <h2 id="section-title">
          <img id="section-title-img" src="./resources/resources/yellow-calendar.png" />
          The Month-by-Month Calendar
        </h2>
        <div id="calendar"></div>
      </section>
    </main>

    <!-- ========== footer ========== -->
    <footer class="footer">
      <div class="footer-section1">
        <p id="footer-logo">FESTOPIA</p>
        <p id="footer-slogan">Find Seoul's Beat!</p>
        <p id="footer-national">South Korea</p>
      </div>
      <div class="footer-section2">
        <div id="footer-addr-wrap">
          <i class="fa-solid fa-location-dot"></i>
          <p id="footer-addr">6, Teheran-ro 14-gil, Gangnam-gu, Seoul, Republic of Korea</p>
        </div>
        <div id="footer-phone-wrap">
          <i class="fa-solid fa-phone"></i>
          <p id="footer-phone">+82 2.6952.0337</p>
        </div>
        <div id="footer-email-wrap">
          <i class="fa-solid fa-envelope"></i>
          <p id="footer-email">support@festopia.co.kr</p>
        </div>
      </div>
      <div class="footer-section3">
        <div id="footer-policy-wrap">
          <p id="footer-policy">Privacy Policy</p>
          <p id="footer-policy">Terms of Use</p>
          <p id="footer-policy">Legal</p>
        </div>
      </div>
    </footer>


    <!-- ========== ajax : section2 & section3 ========= -->
    <script>
      $.ajax({
        type: "post",
        url: "/search",
        success: function (list) {
          let htmlCode = "";
          for (const item of list) {
            htmlCode +=
              '<a href="/detail?code=' + item.fesCode + ' "class="main-card">' +
              "<img src=" + item.poster + 'class="main-card-poster">' +
              '<div class="main-card-overlay">' +
              '<p class="main-card-name">' + item.name + "</p>" +
              '<p class="main-card-date">' + item.startDate + " ~ " + item.endDate + "</p>" +
              '<p class="main-card-place">' + item.place + "</p>" +
              "</div>" +
              "</a>";
          }
          $(".popular-festival-list").append(htmlCode);
        },
      });

      $.ajax({
        type: "get",
        url: "/calendar",
        success: function (list) {
          const calArr = [];
          for (const item of list) {
            const cal = {
              title: item.name,
              start: item.startDate,
              end: item.startDate,
            };
            calArr.push(cal);
          }

          var calendarEl = document.getElementById("calendar");

          var calendar = new FullCalendar.Calendar(calendarEl, {
            timeZone: "UTC",
            initialView: "dayGridMonth",
            events: calArr,
            editable: true,
            selectable: true,
            dateClick: function (info) {
              // alert(info.dateStr);
              location.href =
                "search?inputFesName=&checkDateSelect=targetStart" +
                "&checkStartDate=" +
                info.dateStr +
                "&checkEndDate=&checkFeeStatus=1&checkFeeStatus=2";
            },
          });
          calendar.render();
        },
      });
    </script>

    <script src="resources/js/index.js"></script>
  </body>
</html>

