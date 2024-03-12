<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>FESTOPIA | Find Seoul's Beat, Dive into FESTOPIA!</title>
    <!-- 파비콘 -->
    <link
      rel="icon"
      href="resources/resources/favicon.png"
      type="image/x-icon"
    />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  </head>
  <body>
    <h1>로그인세션</h1>
    <form action="/login" method="post">
      <div>
        <input
          type="text"
          name="username"
          placeholder="아이디를 입력해주세요"
        />
      </div>
      <div>
        <input
          type="password"
          name="password"
          id="password"
          placeholder="패스워드를 입력해주세요"
        />
      </div>
      <div>
        <input type="submit" value="로그인" id="bindPwd" />
      </div>
    </form>
    <button type="button" id="passwordBind"></button>

    <script>
      $("#bindPwd").click(() => {
        $.ajax({
          type: "post",
          url: "/bindPwd",
          data: { "pwd" : `$("#password").val()` },

          success: function () {
            alert($("#password").val());
          },
          error: function () {
            alert("정보 받기 실패");
          },
        });
      });
    </script>
  </body>
</html>
