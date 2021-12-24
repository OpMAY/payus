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
    <link rel="shortcut icon" href="/images/payus_logo.png"/>
    <link rel="stylesheet" href="/css/vendor_style.css">
    <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="main-wrapper">
    <div class="page-wrapper full-page">
        <div class="page-content d-flex align-items-center justify-content-center page-content-border"
             style="flex-direction: column;">
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
                                <div class="row justify-content-center" style="margin-bottom: 2rem">
                                    <h3 class="d-block mb-2" style="color: #8668d0">공급자 로그인 페이지</h3>
                                </div>
                                <form class="forms-sample">
                                    <div class="col-12" style="margin-bottom: 2rem">
                                        <div class="form-group">
                                            <label for="adminInputId" class="">아이디</label>
                                            <input class="form-control" id="adminInputId"
                                                   placeholder="아이디를 입력하세요."
                                                   style="height: 10%">
                                        </div>
                                    </div>
                                    <div class="col-12" style="margin-bottom: 2rem">
                                        <div class="form-group">
                                            <label for="adminInputPassword" class="">비밀번호</label>
                                            <input type="password" class="form-control" id="adminInputPassword"
                                                   autocomplete="current-password" placeholder="비밀번호를 입력하세요."
                                                   style="height: 10%">
                                        </div>
                                    </div>
                                    <div class="row mx-auto">
                                        <div class="col-12"
                                             style="display: flex; justify-content: flex-end; margin-bottom: 2rem">
                                            <a href="/vendor/find/identification.do"
                                               class="d-block vendor-identification-find"
                                               style="word-break: keep-all">아이디
                                                찾기</a>
                                            <a href="/vendor/find/password.do"
                                               class="d-block vendor-identification-find"
                                               style="margin-left: 5px; word-break: keep-all">비밀번호 찾기</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <button type="button" class="btn btn-auth-sign-in d-block"
                                                    id="login_btn" style="margin-bottom: 1rem">
                                                로그인
                                            </button>
                                            <button type="button" class="btn btn-auth-sign-up d-block"
                                                    onclick="window.location.href='/vendor/register.do'">
                                                회원가입
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
        <!-- partial:partials/_footer.jsp -->
        <jsp:include page="partials/vendor_footer.jsp" flush="true"></jsp:include>
        <!-- partial -->
    </div>
</div>
<script>
    $('#adminInputId').keypress(function (e) {
        if (e.which === 13) {
            loginVendor();
        }
    });
    $('#adminInputPassword').keypress(function (e) {
        if (e.which === 13) {
            loginVendor();
        }
    });
    $('#login_btn').click(function () {
        loginVendor();
    });

    function loginVendor() {
        const id = $("#adminInputId").val();
        const password = $("#adminInputPassword").val();
        if (id === '' || password === '') {
            alert('입력 값을 먼저 입력해주세요.');
            return false;
        }
        let data = {"id": id, "password": password};
        $.ajax({
            type: 'POST',
            url: '/vendor/login',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            if (result.vendor_no === 0) {
                alert("로그인에 실패했습니다.\n로그인 정보를 확인해주세요.")
            } else {
                if (result.valid_vendor && !result.vendor_penalty) {
                    // 세션에 vendor_no 값 저장
                    sessionStorage.setItem("vendor_no", result.vendor_no);
                    window.location.href = "/vendor/mypage/vendor.do"
                } else if (!result.valid_vendor) {
                    alert("아직 승인되지 않은 공급자입니다.");
                    window.location.href = "/vendor/login/fail/validation.do"
                    // TODO 미승인 페이지 이동
                } else if (result.vendor_penalty) {
                    alert("정지된 공급자 입니다.");
                    // TODO 정지 내역 표시
                } // TODO 반려된 공급자 페이지 이동
            }
        }).fail(function (error) {
            console.log(error);
        })
    }
</script>
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
