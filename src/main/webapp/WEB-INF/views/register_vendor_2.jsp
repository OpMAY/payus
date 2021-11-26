<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-10-27
  Time: 오후 6:43
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                                <div class="row" style="display: flex; align-content: center; flex-direction: column">
                                    <h3 class="d-block mb-2 noto-font" style="color: #8668d0">공급자 정보 등록</h3>
                                    <span class="noto-font sub-title"><strong>계좌 정보 (2 / 4)</strong></span>
                                </div>
                                <form class="forms-sample noto-font">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="vendor-register-store-bank-name">은행</label>
                                            <select class="form-control" id="vendor-register-store-bank-name"
                                                    style="color: black;height: 70px">
                                                <option disabled selected style="display: none">선택</option>
                                                <option>한국은행</option>
                                                <option>한국수출입은행</option>
                                                <option>IBK기업은행</option>
                                                <option>KDB산업은행</option>
                                                <option>NH농협은행</option>
                                                <option>SH수협은행</option>
                                                <option>KB국민은행</option>
                                                <option>우리은행</option>
                                                <option>신한은행</option>
                                                <option>하나은행</option>
                                                <option>SC제일은행</option>
                                                <option>한국씨티은행</option>
                                                <option>카카오뱅크</option>
                                                <option>케이뱅크</option>
                                                <option>BNK부산은행</option>
                                                <option>BNK경남은행</option>
                                                <option>광주은행</option>
                                                <option>DGB대구은행</option>
                                                <option>전북은행</option>
                                                <option>제주은행</option>
                                                <option>신협</option>
                                                <option>산림조합</option>
                                                <option>새마을금고</option>
                                                <option>상호저축은행</option>
                                                <option>종금사</option>
                                                <option>증권사</option>
                                                <option>한국증권금융</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="vendor-register-store-bank-account">계좌</label>
                                            <input class="form-control" id="vendor-register-store-bank-account"
                                                   oninput="this.value = this.value.replace(/[^0-9.-]/g, '').replace(/(\..*)\./g, '$1');"
                                                   style="color: black;height: 70px" placeholder="계좌 번호를 입력하세요."
                                                   autocomplete="off"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="vendor-register-store-bank-owner">예금주</label>
                                            <input class="form-control" id="vendor-register-store-bank-owner"
                                                   style="color: black;height: 70px" placeholder="예금주를 입력하세요."
                                                   autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <div class="col-12">
                                            <button type="button" class="btn btn-auth-sign-in d-block"
                                                    onclick="bankCheck()">
                                                다음
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
<script src="/js/common.js"></script>
<script>
    $(":input").keypress(function (e) {
        if (this.value === '')
            if (e.keyCode === 32)
                e.preventDefault();
    });

    $(document).ready(function () {
        let firstCookie = getCookie("first_step");
        if (firstCookie === "") {
            alert("올바르지 않은 접근입니다.\n로그인 페이지로 이동합니다.");
            window.location.href = '/vendor/login.do';
            return false;
        }
    });

    function getCookie(name) {
        let nameOfCookie = name + "=";
        let x = 0;
        while (x <= document.cookie.length) {
            let y = (x + nameOfCookie.length);
            if (document.cookie.substring(x, y) === nameOfCookie) {
                if ((endOfCookie = document.cookie.indexOf(";", y)) === -1)
                    endOfCookie = document.cookie.length;
                return unescape(document.cookie.substring(y, endOfCookie));
            }
            x = document.cookie.indexOf(" ", x) + 1;
            if (x === 0)
                break;
        }
        return "";
    }

    let deleteCookie = function (name) {
        document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
    };

    function bankCheck() {
        let first_cookie = getCookie('first_step');
        if (first_cookie === "") {
            alert("잘못된 접근입니다.");
            return false;
        }
        console.log(first_cookie);
        let bankSelect = $("#vendor-register-store-bank-name option:selected").val();
        let bankAccount = $("#vendor-register-store-bank-account").val();
        let bankOwner = $("#vendor-register-store-bank-owner").val();
        let data = {"bank_name": bankSelect, "bank_account": bankAccount, "bank_owner": bankOwner};
        setCookie("second_step", JSON.stringify(data), 99999);
        let second_cookie = getCookie("second_step");
        if(second_cookie === ""){
            alert("오류가 발생했습니다.");
            return false;
        }
        console.log(second_cookie);
        window.location.href = "/vendor/register/business.do";
    }

    function setCookie(cookie_name, value, seconds) {
        let exdate = new Date();
        exdate.setDate(exdate.getSeconds() + seconds);

        let cookie_value = escape(value) + ((seconds == null) ? '' : '; expires=' + exdate.toUTCString());
        document.cookie = cookie_name + '=' + cookie_value;
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
