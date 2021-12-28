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
    <title>공급자 비밀번호 변경</title>
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
            <div class="row" style="width: 100%">
                <div class="col-xl-4 offset-xl-4 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12">
                    <div class="row">
                        <div class="col-12">
                            <div class="auth-form-wrapper px-4 py-5">
                                <div class="row justify-content-center">
                                    <h3 class="d-block mb-2" style="color: #8668d0">비밀번호 변경</h3>
                                </div>
                                <div class="forms-sample">
                                    <div class="col-12" style="display: flex; justify-content: center">
                                        <span class="pw-change-note">보안을 위해 비밀번호를 입력해주세요.</span>
                                    </div>
                                    <div class="col-12">
                                        <input type="password" class="payus-input" id="password-validation-input"
                                               style="margin: 1rem 0"
                                               placeholder="비밀번호를 입력하세요.">
                                    </div>
                                    <div class="col-12">
                                        <button type="button" class="btn btn-payus"
                                                id="password-validation-button">
                                            확인
                                        </button>
                                        <button type="button" class="btn btn-grey">
                                            취소
                                        </button>
                                    </div>
                                </div>
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
    $('#password-validation-input').keypress(function (e) {
        if (e.which === 13) {
            $("#password-validation-button").click();
        }
    });

    $(".btn-grey").on("click", function (){
        window.location.replace(document.referrer);
    })

    $("#password-validation-button").on("click", function () {
        let password = $("#password-validation-input").val();
        if (password.length === 0) {
            alert("비밀번호를 먼저 입력하세요.");
            return false;
        }
        let data = {"password": password};
        $.ajax({
            type: 'POST',
            url: '/vendor/mypage/password/validate',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            if (result) {
                alert("비밀번호 일치");
                window.location.replace("/vendor/mypage/password/change.do");
            } else {
                alert("비밀번호가 일치하지 않습니다.\n다시 확인해주세요.");
            }
        }).fail(function (error) {
            console.log(error);
        })
    })
</script>
</body>
</html>
