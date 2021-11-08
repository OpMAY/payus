<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-10-27
  Time: 오후 2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>공급자 회원가입</title>
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
                                <div class="row" style="display: flex;align-content: center;flex-direction: column">
                                    <h3 class="d-block mb-2 dohyun-font" style="color: #8668d0">공급자 회원가입 페이지</h3>
                                    <span class="noto-font sub-title"><strong>회원 정보 (1 / 4)</strong></span>
                                </div>
                                <form class="forms-sample noto-font">
                                    <div class="col-12">
                                        <div class="form-group" style="position: relative">
                                            <label for="vendor-register-email">이메일</label>
                                            <input type="email" class="form-control" id="vendor-register-email"
                                                   placeholder="example@example.com" onkeyup="checkEmailValue(false)" onfocus="checkEmailValue(false)"
                                                   style="height: 8%">
                                            <button type="button" class="btn btn-password-find-button"
                                                    id="password-verification-button" onclick="validationEmail()" style="word-break: keep-all">
                                                인증
                                            </button>
                                        </div>
                                        <span class="vendor-input-warning" id="warning-email">이메일을 올바르게 입력해주세요.</span>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group" style="display: none; position: relative" id="email-validation-div">
                                            <label for="vendor-find-password-email-validation-code">인증코드</label>
                                            <input class="form-control" id="vendor-find-password-email-validation-code"
                                                   placeholder="인증 코드"
                                                   style="height: 60px">
                                            <button type="button" class="btn btn-email-validation-resend" style="word-break: keep-all"
                                                    id="email-verification-resend" onclick="validationResend()">
                                                재전송
                                            </button>
                                            <span class="validation-timer" id="timer">인증 만료 시간 - 5 : 00</span>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="button" class="btn btn-payus" style="display: none"
                                                id="email-verification-button" onclick="validationCode()">
                                            확인
                                        </button>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="vendor-register-password">비밀번호</label>
                                            <input type="password" class="form-control" id="vendor-register-password"
                                                   autocomplete="current-password" placeholder="비밀번호를 입력해주세요."
                                                   onkeyup="checkPasswordValue(false)"
                                                   onfocus="checkPasswordValue(false)"
                                                   style="height: 8%">
                                        </div>
                                        <span class="vendor-input-warning" id="warning-password">비밀번호는 영어 소문자와 숫자로 구성되어야
                                            하며 최소 8자입니다.</span>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="vendor-register-password-verify">비밀번호 확인</label>
                                            <input type="password" class="form-control"
                                                   id="vendor-register-password-verify"
                                                   autocomplete="current-password" placeholder="비밀번호를 확인해주세요."
                                                   onkeyup="checkPasswordMatches(false)"
                                                   onfocus="checkPasswordMatches(false)"
                                                   style="height: 8%">
                                        </div>
                                        <span class="vendor-input-warning" id="warning-password-check"
                                              style="display: none">비밀번호가 일치하지 않습니다.</span>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="vendor-register-name">이름</label>
                                            <input class="form-control" id="vendor-register-name"
                                                   onkeyup="checkNameValue(false)"
                                                   onfocus="checkNameValue(false)"
                                                   placeholder="이름을 입력해주세요."
                                                   style="height: 8%">
                                            <span class="vendor-input-warning" id="warning-name" style="margin-top: 10px">
                                                이름은 2자 이상 30자 이하로
                                                입력해주세요.</span>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group" style="margin-bottom: 30px">
                                            <label for="vendor-register-phone-1">연락처</label>
                                            <div class="row" style="display: flex;">
                                                <div class="col-4" style="display: flex">
                                                    <input class="form-control" id="vendor-register-phone-1"
                                                           onkeyup="checkPhoneValue(false)"
                                                           onfocus="checkPhoneValue(false)"
                                                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                           style="height: 150%">
                                                    <h3 style="color: black; position: absolute; top: 0; left: 100%; transform: translate(-45%, 35%)">
                                                        -</h3>
                                                </div>
                                                <div class="col-4" style="display: flex">
                                                    <input class="form-control" id="vendor-register-phone-2"
                                                           onkeyup="checkPhoneValue(false)"
                                                           onfocus="checkPhoneValue(false)"
                                                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                           style="height: 150%">
                                                    <h3 style="color: black; position: absolute; top: 0; left: 100%; transform: translate(-45%, 35%)">
                                                        -</h3>
                                                </div>
                                                <div class="col-4" style="display:flex;">
                                                    <input class="form-control" id="vendor-register-phone-3"
                                                           onkeyup="checkPhoneValue(false)"
                                                           onfocus="checkPhoneValue(false)"
                                                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                           style="height: 150%">
                                                </div>
                                            </div>
                                        </div>
                                        <span class="vendor-input-warning" id="warning-phone">연락처를 올바르게 입력해주세요.</span>
                                    </div>
                                    <div class="mt-3">
                                        <div class="col-12">
                                            <button type="button" class="btn btn-auth-sign-in d-block"
<%--                                                    onclick="submitRegister()">--%>
                                                onclick="window.location.href = '/vendor/register/bank.do'">
                                                다음
                                            </button>
                                            <button type="button" class="btn btn-back d-block"
                                                    onclick="window.location.href = '/vendor/login.do'">
                                                뒤로 가기
                                            </button>
                                        </div>
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

    let setTime = 299;
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
        setTime = 300;
        clearInterval(timerInstance);
        timerInstance = setInterval(timer, 1000);
        alert('인증코드가 재전송되었습니다.');
    }

    function validationEmail() {
        let email = document.getElementById("vendor-register-email");
        if (!checkValueEmpty(email))
            alert("입력 값을 먼저 입력해주세요.");
        else {
            alert("인증 메일이 발송되었습니다.");
            email.disabled = true;
            document.getElementById("email-validation-div").setAttribute("style", "display : block; position : relative");
            document.getElementById("email-verification-button").setAttribute("style", "display :block");
            document.getElementById("password-verification-button").setAttribute("disabled", "disabled");
            timerInstance = setInterval(timer, 1000);
        }
    }

    function checkValueEmpty(element) {
        if (element !== undefined) {
            return !(element.value === null || element.value === "");
        } else
            return false;
    }

    $(document).ready(function () {

    });

    // window.onbeforeunload = function (e) {
    //     return 0;
    // };

    $(":input").keypress(function (e) {
        if (this.value === '')
            if (e.keyCode === 32)
                e.preventDefault();
    }).on('paste', function (e) {
        e.preventDefault();
    });

    function submitRegister() {
        if (!checkNameValue(true)) {
            alert("이름을 확인해주세요.");
            return false;
        } else if (!checkPhoneValue(true)) {
            alert("연락처를 확인해주세요.");
            return false;
        } else if (!checkEmailValue(true)) {
            alert("이메일을 확인해주세요.");
            return false;
        } else if (!checkPasswordValue(true)) {
            alert("비밀번호를 확인해주세요.");
            return false;
        } else if (!checkPasswordMatches(true)) {
            alert("비밀번호을 확인해주세요.");
            return false;
        }
        window.location.href = "/vendor/register/business.do";
    }

    function checkNameValue(send) {
        let name = document.getElementById('vendor-register-name');
        let nameRegex = /^[가-힣a-zA-Z\s]{2,30}$/;
        if (nameRegex.test(name.value)) {
            if (send)
                return true;
            else
                document.getElementById('warning-name').setAttribute('style', 'display:none');
        } else {
            if (send)
                return false;
            else
                document.getElementById('warning-name').setAttribute('style', 'display:flex;margin-top:10px');
        }
    }

    function checkPhoneValue(send) {
        let phone1 = document.getElementById('vendor-register-phone-1');
        let phone2 = document.getElementById('vendor-register-phone-2');
        let phone3 = document.getElementById('vendor-register-phone-3');
        let phoneList = ['02', '031', '032', '033', '041', '042', '043', '044', '051', '052', '053', '054', '055', '061', '062', '063', '064',
            '010', '011', '016', '017', '018', '019', '070'];
        let phone1Valid = phoneList.includes(phone1.value);
        let phone2Valid = phone2.value.length >= 3 && phone2.value.length < 5;
        let phone3Valid = phone3.value.length === 4;

        if (phone1Valid && phone2Valid && phone3Valid) {
            if (send)
                return true;
            else
                document.getElementById('warning-phone').setAttribute('style', 'display:none');
        } else {
            if (send)
                return false;
            else
                document.getElementById('warning-phone').setAttribute('style', 'display:flex');
        }
    }

    function checkEmailValue(send) {
        let email = document.getElementById('vendor-register-email');
        let emailRegex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if (emailRegex.test(email.value)) {
            if (send)
                return true;
            else
                document.getElementById('warning-email').setAttribute('style', 'display:none');
        } else {
            if (send)
                return false;
            else
                document.getElementById('warning-email').setAttribute('style', 'display:flex');
        }
    }

    function checkPasswordValue(send) {
        let password = document.getElementById('vendor-register-password');
        let passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        if (passwordRegex.test(password.value)) {
            if (send)
                return true;
            else
                document.getElementById('warning-password').setAttribute('style', 'display:none');
        } else {
            if (send)
                return false;
            else
                document.getElementById('warning-password').setAttribute('style', 'display:flex');
        }
        if (password.value.length > 0) {
            document.getElementById('warning-password-check').setAttribute('style', 'display:flex');
        } else {
            document.getElementById('warning-password-check').setAttribute('style', 'display:none');
        }
    }

    function checkPasswordMatches(send) {
        let password = document.getElementById('vendor-register-password').value;
        let passwordVerify = document.getElementById('vendor-register-password-verify').value;
        if (password === passwordVerify) {
            if (send)
                return true;
            else
                document.getElementById('warning-password-check').setAttribute('style', 'display:none');
        } else {
            if (send)
                return false;
            else
                document.getElementById('warning-password-check').setAttribute('style', 'display:flex');
        }
    }
</script>
</body>
</html>
