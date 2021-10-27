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
    <link rel="stylesheet" href="/css/vendor_style.css">
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
                                    <h3 class="d-block mb-2 dohyun-font" style="color: #8668d0">공급자 로그인 페이지</h3>
                                </div>
                                <form class="forms-sample noto-font">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="adminInputId" class="noto-font">아이디</label>
                                            <input class="form-control noto-font" id="adminInputId" placeholder="아이디를 입력하세요."
                                                   style="height: 10%">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="adminInputPassword" class="noto-font">비밀번호</label>
                                            <input type="password" class="form-control" id="adminInputPassword"
                                                   autocomplete="current-password" placeholder="비밀번호를 입력하세요."
                                                   style="height: 10%">
                                        </div>
                                    </div>
                                    <div class="row mx-auto">
                                        <div class="col-12" style="display: flex; justify-content: flex-end">
                                            <a href="/vendor/find/identification.do" class="d-block text-muted noto-font" style="word-break: keep-all">아이디 찾기</a>
                                            <a href="#" class="d-block text-muted noto-font" style="margin-left: 5px; word-break: keep-all">비밀번호 찾기</a>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-check form-check-flat form-check-primary">
                                            <label class="form-check-label noto-font">
                                                <input type="checkbox" class="form-check-input noto-font">
                                                아이디 기억하기
                                            </label>
                                        </div>
                                    </div>
                                    <hr/>
                                    <div class="mt-3">
                                        <div class="col-12">
                                            <button type="button" class="btn btn-auth-sign-in d-block">
                                                로그인
                                            </button>
                                            <button type="button" class="btn btn-auth-sign-up d-block" onclick="window.location.href='/vendor/register.do'">
                                                회원가입
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col-12" style="display: flex">
                                        <a href="#" class="text-muted noto-font" style="word-break: keep-all">개인정보 취급방침</a>
                                        <a href="#" class="text-muted ml-auto noto-font" style="word-break: keep-all;">서비스 이용약관</a>
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
