<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

  <!-- 스타일 적용 -->
<link rel="stylesheet" href="./resources/css/index.css"/>

<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&family=Lilita+One&display=swap" rel="stylesheet">

<script src="resources/js/index.js"></script>

  </head>
  <body>
    
    <jsp:include page="/header.jsp" />
    <main>
<div class="wrap">
      <section class="size" id="section1">
        <div class="slider">FESTOPIA
        
          <div class="slide">
            <h1>FESTOPIA</h1>
          </div>
          <div class="slide">
            <h1>FESTOPIA</h1>
          </div>
          <div class="slide">
            <h1>FESTOPIA</h1>
          </div>
        </div>
      </section>

      <section class="size" id="section2">
        <span style="background:rgb(255, 255, 255);font-size:2em">
          &#128293;
         
        </span>
        <h2>인기 축제</h2>
      </section>

      <section class="size" id="section3">
        <span style="background:rgb(255, 255, 255);font-size:2em">
          &#128197;
        </span>
        <h2>이번 달 축제 일정</h2>
      </section>
    </div>
    </main>
    <a href="#" class="top">TOP</a>
   
  </body>
</html>
