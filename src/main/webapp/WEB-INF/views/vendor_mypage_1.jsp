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

        <div class="page-content d-flex align-items-center " style="flex-direction: column">
            <jsp:include page="partials/vendor_nav.jsp" flush="true"/>
            <div class="row" style="width: 100%; margin-top: 3rem">
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1">
                    <div class="row" style="margin-bottom: 1rem">
                        <h3 class="d-block mb-2" style="color: #8668d0; padding-left: 10px">회원 정보</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row noto-font">
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-mypage-id">이메일 (ID)</label>
                                <textarea class="payus-textarea" id="vendor-mypage-id" rows="1"
                                          disabled>${vendor.id}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-mypage-name">이름 (대표자 명)</label>
                                <textarea class="payus-textarea" id="vendor-mypage-name" rows="1"
                                          disabled>${vendor.name}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-mypage-phone">연락처</label>
                                <textarea class="payus-textarea" id="vendor-mypage-phone" rows="1"
                                          disabled>${vendor.phone}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <button type="button" class="btn btn-payus"
                                    id="password-change-btn">
                                비밀번호 변경
                            </button>
                            <button type="button" class="btn btn-payus personal-edit">
                                수정
                            </button>
                            <button type="button" class="btn btn-grey personal-edit-cancel" style="display: none">
                                취소
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="width: 100%">
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1">
                    <div class="row" style="margin-bottom: 1rem">
                        <h3 class="d-block mb-2" style="color: #8668d0; padding-left: 10px">계좌 정보</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div style="margin-bottom: 1rem; display: none; justify-content: center" id="bank-message">
                        <span>계좌 정보를 올바르게 입력해주세요.</span>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-bank-name">은행 명</label>
                                <textarea class="payus-textarea" id="vendor-bank-name" rows="1"
                                          disabled>${vendor.bank_name}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-bank-account">계좌 번호</label>
                                <textarea class="payus-textarea" id="vendor-bank-account" rows="1"
                                          disabled>${vendor.bank_account}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-bank-owner">예금주 명</label>
                                <textarea class="payus-textarea" id="vendor-bank-owner" rows="1"
                                          disabled>${vendor.bank_owner}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <button type="button" class="btn btn-payus bank-info">
                                수정
                            </button>
                            <button type="button" class="btn btn-grey bank-info-cancel" style="display: none">
                                취소
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/common.js"></script>
<script>
    const originalName = $("#vendor-mypage-name").val();
    const originalPhone = $("#vendor-mypage-phone").val();
    const originalBankName = $("#vendor-bank-name").val();
    const originalBankAccount = $("#vendor-bank-account").val();
    const originalBankOwner = $("#vendor-bank-owner").val();



    $(".btn-grey.bank-info-cancel").on("click", function () {
        let bankBtn = $(".btn-payus.bank-info");
        bankBtn.removeClass("active");
        bankBtn.text("수정");
        $("#vendor-bank-name").attr("disabled", "true");
        $("#vendor-bank-name").val(originalBankName);
        $("#vendor-bank-account").attr("disabled", "true");
        $("#vendor-bank-account").val(originalBankAccount);
        $("#vendor-bank-owner").attr("disabled", "true");
        $("#vendor-bank-owner").val(originalBankOwner)
        $("#bank-message").css("display", "none");
        $(this).css("display", "none");
    });

    $(".btn-grey.personal-edit-cancel").on("click", function () {
        let personalBtn = $(".btn-payus.personal-edit");
        personalBtn.removeClass("active");
        personalBtn.text("수정");
        $("#vendor-mypage-name").attr("disabled", "true");
        $("#vendor-mypage-name").val(originalName);
        $("#vendor-mypage-phone").attr("disabled", "true");
        $("#vendor-mypage-phone").val(originalPhone);
        $("#password-change-btn").css("display", "block");
        $(this).css("display", "none");
    });

    $(".btn-payus.bank-info").on("click", function (){
        if($(this).hasClass("active")) {
            let bankName = $("#vendor-bank-name").val();
            let bankAccount = $("#vendor-bank-account").val();
            let bankOwner = $("#vendor-bank-owner").val();
            if (bankName === '' || bankName === undefined) {
                alert("은행 명을 입력해주세요.");
                return false;
            } else if (bankAccount === '' || bankAccount === undefined) {
                alert("계좌번호를 입력해주세요.");
                return false;
            } else if (bankOwner === '' || bankOwner === undefined) {
                alert("예금주명을 입력해주세요.");
                return false;
            }
            let data = {
                "bankName" : bankName,
                "bankAccount" : bankAccount,
                "bankOwner" : bankOwner
            };
            $.ajax({
                type: 'POST',
                url: '/vendor/mypage/change/bank',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
            }).done(function (result) {
                if (result) {
                    alert("계좌 정보가 변경되었습니다.");
                    window.location.reload();
                } else {
                    alert("알 수 없는 오류가 발생했습니다.");
                }
            }).fail(function (error) {
                console.log(error);
            })
        } else {
            $("#bank-message").css("display", "flex");
            $("#vendor-bank-name").removeAttr("disabled");
            $("#vendor-bank-account").removeAttr("disabled");
            $("#vendor-bank-owner").removeAttr("disabled");
            $(this).addClass("active");
            $(this).text("확인");
            $(".btn-grey.bank-info-cancel").css("display", "block");
        }
    });

    $("#password-change-btn").on("click", function () {
        window.location.href = "/vendor/mypage/password/validation.do";
    });

    $(".btn-payus.personal-edit").on("click", function () {
        if ($(this).hasClass("active")) {
            let name = $("#vendor-mypage-name").val();
            let phone = $("#vendor-mypage-phone").val();
            if (name === '' || name === undefined) {
                alert("이름을 입력해주세요.");
                return false;
            } else if (phone === '' || phone === undefined) {
                alert("전화번호를 입력해주세요.");
                return false;
            }
            let data = {
                "name": name,
                "phone": phone
            };
            $.ajax({
                type: 'POST',
                url: '/vendor/mypage/change/personal',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
            }).done(function (result) {
                if (result) {
                    alert("회원 정보가 변경되었습니다.");
                    window.location.reload();
                } else {
                    alert("알 수 없는 오류가 발생했습니다.");
                }
            }).fail(function (error) {
                console.log(error);
            })
        } else {
            $("#vendor-mypage-name").removeAttr("disabled");
            $("#vendor-mypage-phone").removeAttr("disabled");
            $("#password-change-btn").css("display", "none");
            $(this).addClass("active");
            $(this).text("확인");
            $(".btn-grey.personal-edit-cancel").css("display", "block");
        }
    });
</script>
</body>
</html>
