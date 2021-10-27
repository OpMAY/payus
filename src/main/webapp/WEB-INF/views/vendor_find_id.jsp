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
    <title>공급자 아이디 찾기</title>
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
    <link rel="shortcut icon" href="/images/favicon.png"/>
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
                                    <h3 class="d-block mb-2 dohyun-font" style="color: #8668d0">아이디 찾기</h3>
                                </div>
                                <form class="forms-sample noto-font">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="vendor-find-id-name">이름</label>
                                            <input class="form-control" id="vendor-find-id-name"
                                                   onkeyup="checkNameValue(false)"
                                                   onfocus="checkNameValue(false)"
                                                   placeholder="이름을 입력해주세요."
                                                   style="height: 15%">
                                            <h6 class="vendor-input-warning" id="warning-name" style="margin-top: 10px">
                                                이름은 2자 이상 30자 이하로
                                                입력해주세요.</h6>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group" style="margin-bottom: 30px">
                                            <label for="vendor-find-id-phone-1">연락처</label>
                                            <div class="row" style="display: flex;">
                                                <div class="col-4" style="display: flex">
                                                    <input class="form-control" id="vendor-find-id-phone-1"
                                                           onkeyup="checkPhoneValue(false)"
                                                           onfocus="checkPhoneValue(false)"
                                                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                           style="height: 135%">
                                                    <h3 style="color: black; position: absolute; top: 0; left: 100%; transform: translate(-45%, 18%)">
                                                        -</h3>
                                                </div>
                                                <div class="col-4" style="display: flex">
                                                    <input class="form-control" id="vendor-find-id-phone-2"
                                                           onkeyup="checkPhoneValue(false)"
                                                           onfocus="checkPhoneValue(false)"
                                                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                           style="height: 135%">
                                                    <h3 style="color: black; position: absolute; top: 0; left: 100%; transform: translate(-45%, 18%)">
                                                        -</h3>
                                                </div>
                                                <div class="col-4">
                                                    <input class="form-control" id="vendor-find-id-phone-3"
                                                           onkeyup="checkPhoneValue(false)"
                                                           onfocus="checkPhoneValue(false)"
                                                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                           style="height: 135%">
                                                </div>
                                            </div>
                                        </div>
                                        <h6 class="vendor-input-warning" id="warning-phone">연락처를 올바르게 입력해주세요.</h6>
                                    </div>
                                    <div class="mt-3">
                                        <div class="col-12">
                                            <button type="button" class="btn btn-auth-sign-in d-block"
                                                    onclick="alert('회원가입 완료')">
                                                아이디 찾기
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
    function checkNameValue(send) {
        let name = document.getElementById('vendor-find-id-name');
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
        let phone1 = document.getElementById('vendor-find-id-phone-1');
        let phone2 = document.getElementById('vendor-find-id-phone-2');
        let phone3 = document.getElementById('vendor-find-id-phone-3');
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
</script>
</body>
</html>
