// 유저프로필 변경 로직
// --> formData 방식으로 data에 const formData = new FormData();
// formData.append("file", );
// formData.append("userCode", ) -> data로 전송!
// $("#uploadThisProfile").click(() => {
//   // form data 객체 생성
//   let formData = new FormData();

//   // 파일 업로드를 위한 파일 입력란의 파일 추가
//   let fileInput = $("#userProfileUrl");
//   formData.append("userProfileUrl", fileInput.files[0]);

//   // 다른 데이터 추가 : userCode
//   let userCode = $("#userCode").val();
//   formData.append("userCode", userCode);

//   $.ajax({
//     type: "post",
//     url: "/changeProfile",
//     data: formData,
//     contentType: false, // 필수
//     processData: false, // 필수
//     success: function (picture) {
//       if (picture !== null) {
//         alert("일단 사진 잘 들어온듯?");
//         $("#userImage").html(
//           '<img src="/festTest/' + picture.userProfileUrl + '" />'
//         );
//       } else {
//         alert("망함.");
//       }
//     },
//   });
// });

// 유저 정보가 변경즉시 즉각적으로 변할수있도록 ajax로 update 로직 변경
// 닉네임 변경란 로직
$("#nicknameChange").click(() => {
  $.ajax({
    type: "post",
    url: "/updateUserNickname",
    data: $("#nicknameChangeForm").serialize(),

    success: function (user) {
      console.log(user);
      if (user !== null) {
        $("#nameChangeResult").html("이름 : " + `${user.nickname}`);
        $("#emailChangeResult").html("이메일 : " + `${user.email}`);
        location.reload();
      } else {
        alert("뭔가 잘못됐습니다. 다시 시도해주세요.");
      }
    },
  });
});

// 비밀번호 바꾸기
$("#pwdChangeFormButton").click(() => {
  $.ajax({
    type: "post",
    url: "/updateUserInfo",
    data: $("#pwdChangeForm").serialize(),
    success: function (user) {
      // console.log(user);
      if (user !== null) {
        //console.log($("#passwordChangeInner"));
        $(".current-pwd-check").slideDown(200);
        $("#pwdChangeForm").hide();
        $("#wrongTry")
          .text("성공적으로 패스워드를 변경하였습니다!")
          .css("color", "green");
        setTimeout(function () {
          alert(
            "비밀번호변경이 확인되었습니다. 개인정보 보호를 위해 자동 로그아웃됩니다. 다시 로그인해주세요."
          );
          location.href = "/logout";
        }, 1000);
        //console.log($("#accountPwdCheck").val($("#passwordChangeInner").val()));
        //$("#accountPwdCheck").val($("#passwordChangeInner").val());
      }
    },
  });
});

//default
$(".inneractive0").css("color", "rgb(255, 138, 157)");
$(".innercontent0").css("display", "block");
// 첫번째
$(".inneractive0").click(() => {
  $(".innercontent0").css("display", "block");
  $(".innercontent1").css("display", "none");
  $(".innercontent2").css("display", "none");

  $(".inneractive0").css("color", "rgb(255, 138, 157)");
  $(".inneractive1").css("color", "#888");
  $(".inneractive2").css("color", "#888");
});
//두번째
$(".inneractive1").click(() => {
  $(".innercontent1").css("display", "block");
  $(".innercontent0").css("display", "none");
  $(".innercontent2").css("display", "none");

  $(".inneractive1").css("color", "rgb(255, 138, 157)");
  $(".inneractive0").css("color", "#888");
  $(".inneractive2").css("color", "#888");
});
//세번째
$(".inneractive2").click(() => {
  $(".innercontent2").css("display", "block");
  $(".innercontent1").css("display", "none");
  $(".innercontent0").css("display", "none");

  $(".inneractive2").css("color", "rgb(255, 138, 157)");
  $(".inneractive1").css("color", "#888");
  $(".inneractive0").css("color", "#888");
});

// 개인정보 수정 regExp

function inputHandler(e, check, text) {
  if (check === 1) {
    $(e.target).next().text(text).css("color", "green");
  } else if (check === 2) {
    $(e.target).next().text(text).css("color", "grey");
  } else {
    $(e.target).next().text(text).css("color", "red");
  }
}
// -----------------------------------------
let nicknameCheckBool = true;
let userEmailCheckBool = true;

function nicknameCheck() {
  const regExp = /^.{1,}$/;
  let result = regExp.test($("#nicknameChangeInner").val());
  if (result === true) {
    return 1;
  } else if ($("#nicknameChangeInner").val() === "") {
    return 3;
  } else if (result === false) {
    return 3;
  }
}
function userEmailCheck() {
  const regExp = /^\w+@\w+\.\w+$/;
  let result = regExp.test($("#emailChange").val());
  if (result === true) {
    return 1;
  } else if ($("#emailChange").val() === "") {
    return 2;
  } else if (result === false) {
    return 3;
  }
}

$("#nicknameChangeInner").keyup((e) => {
  inputHandler(e, nicknameCheck(), "* 닉네임은 최소 한글자 이상");
  console.log("namecheck : " + nicknameCheck());
  if (nicknameCheck() === 1) {
    nicknameCheckBool = true;
  } else {
    nicknameCheckBool = false;
  }
  
  checkBool();
});

$("#emailChange").keyup((e) => {
  inputHandler(e, userEmailCheck(), "* 정확한 이메일 양식을 작성해주세요");
  console.log("mailcheck : " + userEmailCheck());
  if (userEmailCheck() === 1) {
    userEmailCheckBool = true;
  } else {
    userEmailCheckBool = false;
  }
  checkBool();
});

function checkBool() {
  if(nicknameCheckBool && userEmailCheckBool) {
    $("#nicknameChange").attr("disabled", false).css("background-color","black");
  } else {
    $("#nicknameChange").attr("disabled", true).css("background-color","grey");
  }
}


// ------------------------------------------------
// 비밀번호 변경전 비번 한번 더 체크
$(".inneractive1").click(() => {
  $(".current-pwd-check").slideDown(1000);
  $("#pwdChangeForm").hide();
});

$("#checkThisAccount").click(() => {
  let inputPwd = $("#accountCheck").val();
  let defaultPwd = $("#accountPwdCheck").val();
  const result = inputPwd === defaultPwd;
  if (result) {
    $(".current-pwd-check").slideUp(200);
    setTimeout(function () {
      $("#pwdChangeForm").show();

      setTimeout(function () {
        $("#pwdChangeForm").hide();
        $(".current-pwd-check").slideDown(200);
        $("#accountCheck").val("");
        $("#wrongTry")
          .text(
            "제한시간 초과! 다시 시도해주세요."
          )
          .css("color", "red");
      }, 60000);
    }, 500);
  } else {
    $("#wrongTry").text("* 기존비밀번호를 입력해주세요").css("color", "red");
    $("#accountCheck").val("");
    // 비밀번호 틀리면 절레절레
    $( ".current-pwd-check" ).effect( "shake" );
    
  }
});
// 비밀번호 변경을 위한 regExp
function userPwdCheck() {
  const regExp = /^[a-zA-Z0-9]{5,20}$/;
  let result = regExp.test($("#passwordChangeInner").val());
  if (result === true) {
    return 1;
  } else if ($("#passwordChangeInner").val() === "") {
    return 2;
  } else if (result === false) {
    return 3;
  }
}
let pwdCheckBool = false;
let pwdDoubleCheckBool = false;
$("#passwordChangeInner").keyup((e) => {
  console.log(userPwdCheck());
  inputHandler(e, userPwdCheck(), "* 영어 대/소문자 5 ~ 20 글자까지 등록 가능");
  if(userPwdCheck() === 1){
    pwdCheckBool = true;
  } else{
    pwdCheckBool = false;
  }
  pwdChangeBool();
});

function userPwdDoubleCheck() {
  let result = $("#passwordChangeInner").val() === $("#passwordCheckInner").val();
  if (result === true) {
    return 1;
  } else if (result === false) {
    return 3;
  }
}
$("#passwordCheckInner").keyup((e) => {
  console.log(userPwdDoubleCheck());
  inputHandler(
    e,
    userPwdDoubleCheck(),
    "* 입력하신 비밀번호와 일치하지않습니다."
  );
  if(userPwdDoubleCheck() === 1){
    pwdDoubleCheckBool = true;
  } else{
    pwdDoubleCheckBool = false;
  }
  pwdChangeBool();
});
$("#pwdChangeFormButton").attr("disabled", true).css("background-color","grey");
function pwdChangeBool(){
  console.log("Boolfunction pwd: " + pwdCheckBool);
  console.log("Boolfunction double: " + pwdDoubleCheckBool);
  if(pwdCheckBool && pwdDoubleCheckBool){
    $("#pwdChangeFormButton").attr("disabled", false).css("background-color","black");
  } else{
    $("#pwdChangeFormButton").attr("disabled", true).css("background-color","grey");
  }
}
$("#deleteThisAccount").css("display", "none");
function userPwdDoubleCheck_delete() {
  let result = $("#accountCheck_delete").val() === $("#accountPwdCheck_delete").val();
  if (result === true) {
    return 1;
  } else if (result === false) {
    return 3;
  }
}
$("#accountCheck_delete").keyup((e) => {
  console.log(userPwdDoubleCheck_delete());
  inputHandler(e, userPwdDoubleCheck_delete(), "* 기존 비밀번호와 일치하지않습니다.");
    if(userPwdDoubleCheck_delete() == 1){
      $("#deleteThisAccount").css("display", "block");
    }else{
      $("#deleteThisAccount").css("display", "none");
    }
  });
// function pwdValidate() {
//   if (userPwdCheck() !== 1) {
//     $("#passwordChangeInner").focus();
//     return false;
//   } else if (userPwdDoubleCheck() !== 1) {
//     $("#passwordCheckInner").focus();
//     return false;
//   }
//   return true;
// }
