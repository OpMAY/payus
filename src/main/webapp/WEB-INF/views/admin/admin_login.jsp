<%--
  Created by IntelliJ IDEA.
  User: ws
  Date: 2021/12/24
  Time: 1:09 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String errMsg = (String)session.getAttribute("errMsg");
    if(errMsg == null) errMsg = "";
    session.invalidate();
%>
<html>
<head>
    <meta charset="utf-8" />
    <title>Log In | UBold - Responsive Admin Dashboard Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="/images/payus_logo.png">

    <!-- App css -->
    <link href="/css/admin/bootstrap.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
    <link href="/css/admin/app.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />

    <link href="/css/admin/bootstrap-dark.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
    <link href="/css/admin/app-dark.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />

    <!-- icons -->
    <link href="/css/admin/icons.css" rel="stylesheet" type="text/css" />

</head>

<body class="loading authentication-bg authentication-bg-pattern">

<div class="account-pages mt-5 mb-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6 col-xl-4">
                <div class="card bg-pattern">

                    <div class="card-body p-4">

                        <div class="text-center w-75 m-auto">
                            <div class="auth-logo">
                                <div class="logo logo-dark text-center">
                                            <span class="logo-lg">
                                                <img src="/images/payus_logo.png" alt="" height="64">
                                            </span>
                                </div>

                                <div class="logo logo-light text-center">
                                            <span class="logo-lg">
                                                <img src="/images/payus_logo.png" alt="" height="64">
                                            </span>
                                </div>
                            </div>
                            <p class="text-muted mb-4 mt-3">로그인 페이지</p>
                        </div>

                        <form action="/admin/login" method="post">

                            <div class="mb-3">
                                <label for="emailaddress" class="form-label">아이디</label>
                                <input class="form-control" type="" name="id" id="emailaddress" required placeholder="아이디를 입력하세요.">
                            </div>

                            <div class="mb-4">
                                <label for="password" class="form-label">비밀번호</label>
                                <div class="input-group input-group-merge">
                                    <input type="password" name="password" id="password" class="form-control" required placeholder="비밀번호를 입력하세요.">
                                    <div class="input-group-text" data-password="false">
                                        <span class="password-eye"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-4 text-center">
                                <label class="text-danger"><%=errMsg%></label>
                            </div>

                            <div class="text-center d-grid">
                                <button class="btn btn-primary" type="submit"> 로그인 </button>
                            </div>

                        </form>

                    </div> <!-- end card-body -->
                </div>

            </div> <!-- end col -->
        </div>
        <!-- end row -->
    </div>
    <!-- end container -->
</div>
<!-- end page -->


<footer class="footer footer-alt">
    2021 - <script>document.write(new Date().getFullYear())</script> &copy; <a href="" class="text-white-50">페이어스</a>
</footer>

<!-- Vendor js -->
<script src="/js/admin/vendor.js"></script>

<!-- App js -->
<script src="/js/admin/app.js"></script>

</body>
</html>
