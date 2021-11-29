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
    <title>공급자 회원 정보</title>
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
    <link rel="stylesheet" href="/css/sidebar.css">
    <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- partial:partials/_footer.jsp -->
<jsp:include page="partials/vendor_sidebar.jsp" flush="true"></jsp:include>
<!-- partial -->
<div class="main-wrapper sidemain">
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
                                <div class="row justify-content-center" style="margin-bottom: 3rem">
                                    <h3 class="d-block mb-2 dohyun-font" style="color: #8668d0">비밀번호 재설정</h3>
                                </div>
                                <form class="forms-sample noto-font">
                                    <div class="col-12" style="margin-bottom: 2rem">
                                        <div class="form-group">
                                            <label for="vendor-reset-password-id">아이디</label>
                                            <input class="form-control" id="vendor-reset-password-id" value="${id}"
                                                   disabled
                                                   style="height: 15%">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group" style="margin-bottom: 2rem">
                                            <label for="vendor-reset-password">새 비밀번호</label>
                                            <input class="form-control" id="vendor-reset-password"
                                                   placeholder="새로운 비밀번호를 입력하세요." type="password"
                                                   style="height: 15%">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group" style="margin-bottom: 2rem">
                                            <label for="vendor-reset-password-check">새 비밀번호 확인</label>
                                            <input class="form-control" id="vendor-reset-password-check"
                                                   placeholder="새로운 비밀번호를 입력하세요." type="password"
                                                   style="height: 15%">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="button" class="btn btn-payus"
                                                id="email-verification-button">
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
</body>
</html>
