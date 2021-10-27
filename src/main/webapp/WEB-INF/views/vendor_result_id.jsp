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
    <title>공급자 아이디 찾기 결과</title>
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
                                    <h3 class="d-block mb-2 dohyun-font" style="color: #8668d0">아이디 찾기 결과</h3>
                                </div>
                                <form class="forms-sample noto-font">
                                    <div class="col-12">
                                        <div class="form-group" style="position: relative">
                                            <label for="vendor-result-id">아이디</label>
                                            <input class="form-control" id="vendor-result-id"
                                                   value="SampleId1234"
                                                   placeholder="이름을 입력해주세요."
                                                   style="height: 15%; text-align: center" disabled>
                                            <button type="button" class="btn btn-id-copy"
                                                    onclick="copyID()">
                                                복사하기
                                            </button>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <div class="col-12">
                                            <button type="button" class="btn btn-auth-sign-in d-block"
                                                    onclick="window.location.href = '/vendor/login.do';">
                                                로그인 하러가기
                                            </button>
                                            <button type="button" class="btn btn-auth-sign-in d-block"
                                                    onclick="window.location.href = '/vendor/find/password.do';">
                                                비밀번호 찾기
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
    function copyID() {
        let id = document.getElementById("vendor-result-id");
        navigator.clipboard.writeText(id.value);
        alert("복사되었습니다.");
    }
</script>
</body>
</html>
