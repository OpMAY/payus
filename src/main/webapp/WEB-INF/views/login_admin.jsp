<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-10-26
  Time: 오후 4:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PayUs 공급자 관리 페이지에 오신 것을 환영합니다.</title>
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
    <style>
        @import url(//fonts.googleapis.com/earlyaccess/hanna.css);

        .btn-auth-sign-in {
            color: white;
            background-color: #8668d0;
            border-color: #8668d0;
            font-size: large;
            width: 100%;
            height: 50px;
            margin-bottom: 10px;
        }

        .btn-auth-sign-in:hover {
            opacity: 0.7;
        }

        .btn-auth-sign-up {
            color: white;
            background-color: #8668d0;
            border-color: #8668d0;
            font-size: large;
            width: 100%;
            height: 50px;
            margin-bottom: 10px;
        }

        .btn-auth-sign-up:hover {
            opacity: 0.7;
        }

        .hanna-font {
            font-family: 'Hanna', sans-serif;
            color: #8668d0;
        }
    </style>
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
                <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-12">
                    <div class="row">
                        <div class="col-12">
                            <div class="auth-form-wrapper px-4 py-5">
                                <div class="row justify-content-center">
                                    <h3 class="noble-ui-logo d-block mb-2">공급자 로그인 페이지</h3>
                                </div>
                                <form class="forms-sample">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="adminInputId">아이디</label>
                                            <input class="form-control" id="adminInputId" placeholder="아이디를 입력하세요."
                                                   style="height: 10%">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="adminInputPassword">비밀번호</label>
                                        <input type="password" class="form-control" id="adminInputPassword"
                                               autocomplete="current-password" placeholder="비밀번호를 입력하세요."
                                               style="height: 10%">
                                    </div>
                                    <div class="row mx-auto" style="display: flex; justify-content: flex-end">
                                        <a href="#" class="d-block text-muted">아이디 찾기</a>
                                        <a href="#" class="d-block text-muted" style="margin-left: 5px">비밀번호 찾기</a>
                                    </div>
                                    <div class="form-check form-check-flat form-check-primary">
                                        <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input">
                                            아이디 기억하기
                                        </label>
                                    </div>
                                    <hr/>
                                    <div class="mt-3">
                                        <button type="button" class="btn btn-auth-sign-in d-block">
                                            로그인
                                        </button>
                                        <button type="button" class="btn btn-auth-sign-up d-block">
                                            회원가입
                                        </button>
                                    </div>
                                    <div class="row justify-content-between mx-auto">
                                        <a href="#" class="d-block text-muted">개인정보취급방침</a>
                                        <a href="#" class="d-block text-muted">서비스이용약관</a>
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

<!-- core:js -->
<script src="/vendors/core/core.js"></script>
<!-- endinject -->
<!-- plugin js for this page -->
<!-- end plugin js for this page -->
<!-- inject:js -->
<script src="/vendors/feather-icons/feather.min.js"></script>
<script src="/js/template.js"></script>
<!-- endinject -->
<!-- custom js for this page -->
<!-- end custom js for this page -->
</body>
</html>
