<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-10-27
  Time: 오후 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>공급자 비밀번호 찾기</title>
    <!-- core:css -->
    <link rel="stylesheet" href="/vendors/core/core.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- end plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="/fonts/feather-font/css/iconfont.css">
    <link rel="stylesheet" href="/vendors/flag-icon-css/css/flag-icon.min.css">
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="/css/demo_5/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="/images/payus_logo.png"/>
    <!-- Custom layout style for vendor -->
    <link rel="stylesheet" href="/css/vendor_style.css">
    <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="main-wrapper">
    <div class="page-wrapper full-page">
        <div class="page-content d-flex align-items-center justify-content-center" style="flex-direction: column">
            <div class="row">
                <div class="col-md-12 col-xl-8 d-flex"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <img src="/images/payus_logo.png" width="64px" height="64px" style="margin-right: 8px" alt=""/>
                    <h1 class="hanna-font">PAYUS</h1>
                </div>
            </div>
            <div class="row" style="width: 100%">
                <div class="col-xl-4 offset-xl-4 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12">
                    <div class="row">
                        <div class="col-12">
                            <div class="auth-form-wrapper px-4 py-5">
                                <div class="row justify-content-center">
                                    <h3 class="d-block mb-2 dohyun-font" style="color: #8668d0">비밀번호 찾기</h3>
                                </div>
                                <form class="forms-sample noto-font">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="vendor-find-password-id">아이디</label>
                                            <input class="form-control" id="vendor-find-password-id"
                                                   placeholder="아이디를 입력해주세요."
                                                   style="height: 60px">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group" style="position: relative">
                                            <label for="vendor-find-password-email">이메일</label>
                                            <input class="form-control" id="vendor-find-password-email"
                                                   placeholder="example@example.com" onkeyup="checkEmailValue(false)"
                                                   onfocus="checkEmailValue(false)"
                                                   style="height: 60px">
                                            <button type="button" class="btn btn-password-find-button"
                                                    id="password-verification-button" onclick="validationEmail()">
                                                인증번호 받기
                                            </button>
                                            <h6 class="vendor-input-warning" id="warning-email"
                                                style="margin-top: 10px">
                                                이메일을 올바른 형태로 입력해주세요.</h6>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group" style="display: none; position: relative" id="email-validation-div">
                                            <label for="vendor-find-password-email-validation-code">인증코드</label>
                                            <input class="form-control" id="vendor-find-password-email-validation-code"
                                                   placeholder="인증 코드"
                                                   style="height: 60px">
                                            <button type="button" class="btn btn-email-validation-resend"
                                                    id="email-verification-resend" onclick="validationResend()">
                                                재전송
                                            </button>
                                            <span class="validation-timer" id="timer">인증 만료 시간 - 3 : 00</span>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="button" class="btn btn-payus" style="display: none"
                                                id="email-verification-button" onclick="validationCode()">
                                            확인
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script>
    let setTime = 179;
    let timeInstance;
    function timer(){
        let minute = Math.floor(setTime / 60);
        let second = setTime % 60;
        let m;
        if(second > 9){
            m = minute + " : " + second;
        } else {
            m = minute + " : 0" + second;
        }
        document.getElementById("timer").innerText = "인증 만료 시간 - " + m;
        setTime--;
        if(setTime < 0){
            document.getElementById("timer").innerText = "인증이 만료되었습니다.";
            clearInterval(timerInstance);
        }
    }

    function validationResend(){
        setTime = 180;
        clearInterval(timerInstance);
        timerInstance = setInterval(timer, 1000);
        alert('인증코드가 재전송되었습니다.');
    }

    function validationEmail() {
        let id = document.getElementById("vendor-find-password-id");
        let email = document.getElementById("vendor-find-password-email");
        if (!checkValueEmpty(id) || !checkValueEmpty(email))
            alert("입력 값을 먼저 입력해주세요.");
        else {
            alert("인증 메일이 발송되었습니다.");
            id.setAttribute("disabled", true);
            email.setAttribute("disabled", true);
            document.getElementById("email-validation-div").setAttribute("style", "display : block; position : relative");
            document.getElementById("email-verification-button").setAttribute("style", "display :block");
            document.getElementById("password-verification-button").setAttribute("disabled", true);
            timerInstance = setInterval(timer, 1000);
        }
    }

    function validationCode() {
        let validationCode = document.getElementById("vendor-find-password-email-validation-code");
        if (!checkValueEmpty(validationCode)) {
            alert("인증 번호를 먼저 입력해주세요.");
        } else {
            alert("인증이 완료되었습니다.\n비밀번호 재설정 페이지로 이동합니다.");
            window.location.href = "/vendor/find/password/result.do";
        }
    }

    function checkEmailValue(send) {
        let email = document.getElementById('vendor-find-password-email');
        let emailRegex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if (emailRegex.test(email.value)) {
            if (send)
                return true;
            else {
                document.getElementById('warning-email').setAttribute('style', 'display:none;margin-top: 10px');
                document.getElementById('password-verification-button').setAttribute('style', 'top : 50%');
            }
        } else {
            if (send)
                return false;
            else {
                document.getElementById('warning-email').setAttribute('style', 'display:flex;margin-top: 10px');
                document.getElementById('password-verification-button').setAttribute('style', 'top : 38%');
            }
        }
    }

    function checkValueEmpty(element) {
        if (element !== undefined) {
            return !(element.value === null || element.value === "");
        } else
            return false;
    }
</script>
</body>
</html>
